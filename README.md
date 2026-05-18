# AWS Multi-VPC Application Architecture

## Overview

This document describes a production-grade, multi-VPC AWS architecture that separates administrative access from application traffic using two isolated VPCs connected via a Transit Gateway. The design follows a strict 4-tier layout — frontend, load balancing, backend, and database — with all application compute running in private subnets.

---

## Architecture Diagram

```
PUBLIC INTERNET
      │                        ┌──────────────────────────────────────────────────────────────────────┐
      │   BASTION VPC          │  APPLICATION VPC  (10.2.0.0/16)                                      │
      │   (10.0.0.0/16)        │                                                                      │
      │  ┌─────────────────┐   │  ┌─────────────┐ ┌──────────────┐ ┌────────────┐ ┌───────────────┐ │
      │  │ Public Subnet   │   │  │ Public Sub  │ │ Private Sub  │ │ Private Sub│ │ Private Sub   │ │
      │  │ 10.0.1.0/24     │   │  │ 10.2.1.0/24 │ │ (Front-End)  │ │ (NLB-Back) │ │ (Backend)     │ │
      ├──► IGW ► Bastion ──┼───►  │ NLB-Frontend│ │ 10.2.2.0/24  │ │ 10.2.3.0/24│ │ 10.2.4.0/24   │ │
      │  │  (EIP)          │TGW│  │ NAT Gateway │ │ Front-end    │ │ NLB-Backend│ │ Backend ASG   │ │
      │  │  Transit GW     │   │  │ IGW         │ │ Instances    │ │            │ │ Instances     │ │
      │  └─────────────────┘   │  └─────────────┘ └──────────────┘ └────────────┘ └───────────────┘ │
      │                        │                                                                      │
 ADMIN (SSH/RDP)               │                                       ┌────────────────────────────┐ │
 PUBLIC USERS (HTTPS)          │                                       │ Private Sub (Database)     │ │
                               │                                       │ 10.2.5.0/24                │ │
                               │                                       │ Database Instance          │ │
                               │                                       └────────────────────────────┘ │
                               └──────────────────────────────────────────────────────────────────────┘
```

---

## VPC Summary

| VPC | CIDR | Purpose |
|-----|------|---------|
| Bastion VPC | `10.0.0.0/16` | Secure administrative access only |
| Application VPC | `10.2.0.0/16` | Hosts all application workloads |

---

## Subnet Layout

### Bastion VPC

| Subnet | CIDR | AZ | Components |
|--------|------|----|------------|
| Public Subnet | `10.0.1.0/24` | AZ-1 | Internet Gateway, Bastion Server (EIP), Transit Gateway |

### Application VPC

| Subnet | CIDR | AZ | Type | Route | Components |
|--------|------|----|------|-------|------------|
| Public Subnet | `10.2.1.0/24` | AZ-1 | Public | IGW | NLB-Frontend, NAT Gateway (EIP), IGW |
| Front-End Subnet | `10.2.2.0/24` | AZ-1/2 | Private | NAT Gateway | Front-end EC2 Instances |
| NLB-Backend Subnet | `10.2.3.0/24` | AZ-1/2 | Private | NAT Gateway | NLB-Backend |
| Backend Subnet | `10.2.4.0/24` | AZ-1/2 | Private | NAT Gateway | Backend EC2 Instances (Auto Scaling Group) |
| Database Subnet | `10.2.5.0/24` | AZ-1/2 | Private | Local only | Database Instance |

---

## Components

### Bastion VPC

**Internet Gateway (IGW)**
Allows administrators to reach the Bastion Server from the public internet over SSH or RDP.

**Bastion Server**
A hardened jump host with an Elastic IP (EIP). Administrators connect here first, then tunnel into the Application VPC's private subnets via the Transit Gateway. No application traffic passes through this server.

**Transit Gateway**
Provides the private, high-bandwidth network bridge between the Bastion VPC and the Application VPC. Used exclusively for administrative traffic (SSH/RDP from the Bastion into private application subnets).

---

### Application VPC

**Internet Gateway (IGW)**
Accepts inbound HTTPS traffic from public users and routes it to the NLB-Frontend.

**NLB-Frontend** *(Internet-facing Network Load Balancer)*
Sits in the public subnet and distributes incoming HTTPS traffic across Front-end EC2 instances in the private Front-End subnet. Being a Network Load Balancer, it operates at Layer 4 (TCP/UDP), providing high throughput and low latency.

**NAT Gateway**
Provides outbound-only internet access for all private subnet resources (front-end instances, backend instances, and the database) — used primarily for OS package updates and dependency downloads. Inbound connections from the internet cannot reach private resources through the NAT Gateway.

**Front-end Instances**
EC2 instances running the web/presentation layer (e.g. Nginx + React or similar). They receive traffic from NLB-Frontend and forward application API calls to the NLB-Backend. Spread across two Availability Zones for high availability.

**NLB-Backend** *(Internal Network Load Balancer)*
An internal-only load balancer that distributes requests from front-end instances to backend EC2 instances. It is not reachable from the internet. Sits in a dedicated private subnet to isolate load balancer traffic.

**Backend Instances (Auto Scaling Group)**
EC2 instances running the application/business logic layer (e.g. Spring Boot). They are managed by an Auto Scaling Group (ASG) that adjusts capacity based on load. They talk directly to the Database Instance over port 3306. Spread across two Availability Zones.

**Database Instance**
A single database server in the most restricted subnet. Its route table allows local VPC traffic only — there is no route to the NAT Gateway or the internet. Only the Backend Instances can reach it.

---

## Security Groups

### 1. Bastion Security Group *(Bastion VPC)*

| Direction | Protocol | Port | Source / Destination |
|-----------|----------|------|----------------------|
| Inbound | SSH / RDP | 22 / 3389 | Administrator IP only |
| Outbound | SSH / RDP | 22 / 3389 | Application VPC private subnets |

### 2. APP-Frontend Security Group *(Front-end Instances)*

| Direction | Protocol | Port | Source / Destination |
|-----------|----------|------|----------------------|
| Inbound | TCP | App port | NLB-Frontend security group |
| Inbound | SSH | 22 | Bastion Server (via Transit Gateway) |
| Outbound | All | All | NAT Gateway (software updates) |

### 3. Internal-LB Security Group *(NLB-Backend)*

| Direction | Protocol | Port | Source / Destination |
|-----------|----------|------|----------------------|
| Inbound | TCP | App port | Front-end Instances security group |
| Outbound | TCP | App port | Backend Instances security group |

### 4. APP-Backend Security Group *(Backend Instances)*

| Direction | Protocol | Port | Source / Destination |
|-----------|----------|------|----------------------|
| Inbound | TCP | App port | APP-Frontend security group |
| Inbound | SSH | 22 | Bastion Server (via Transit Gateway) |
| Outbound | All | All | NAT Gateway (software updates) |
| Outbound | TCP | 3306 | Database Instance security group |

### 5. DB Security Group *(Database Instance)*

| Direction | Protocol | Port | Source / Destination |
|-----------|----------|------|----------------------|
| Inbound | TCP | 3306 | APP-Backend security group only |
| Outbound | — | — | None |

---

## Traffic Flows

### 1. Public User Request (HTTPS)

```
Public Internet
  → IGW (Application VPC)
    → NLB-Frontend (public subnet, port 443)
      → Front-end Instance (private subnet 10.2.2.0/24)
        → NLB-Backend (private subnet 10.2.3.0/24)
          → Backend Instance (private subnet 10.2.4.0/24)
            → Database Instance (private subnet 10.2.5.0/24)
```

### 2. Administrator Access (SSH/RDP)

```
Administrator
  → IGW (Bastion VPC)
    → Bastion Server (10.0.1.0/24, EIP)
      → Transit Gateway
        → Application VPC private subnets
          → Front-end / Backend instances (SSH port 22)
```

### 3. Outbound Internet (Software Updates)

```
Private Instance (any tier)
  → NAT Gateway (public subnet, EIP)
    → IGW (Application VPC)
      → Internet (e.g. apt/yum repositories, Docker Hub)
```

---

## High Availability

| Component | AZ Coverage | Mechanism |
|-----------|-------------|-----------|
| NLB-Frontend | AZ-1 (public subnet) | AWS-managed redundancy |
| Front-end Instances | AZ-1 and AZ-2 | Multi-AZ deployment |
| NLB-Backend | AZ-1 and AZ-2 | Multi-AZ deployment |
| Backend Instances | AZ-1 and AZ-2 | Auto Scaling Group across 2 AZs |
| Database | AZ-1 and AZ-2 | Multi-AZ subnet group (RDS or self-managed) |
| NAT Gateway | AZ-1 (public subnet) | Deploy one per AZ to eliminate cross-AZ dependency |

---

## Network Isolation Summary

| Can reach → | Internet | Front-end | NLB-Backend | Backend | Database |
|---|---|---|---|---|---|
| Public Internet | — | ✅ via NLB-Frontend | ❌ | ❌ | ❌ |
| Front-end Instances | ✅ via NAT (outbound) | — | ✅ | ❌ | ❌ |
| Backend Instances | ✅ via NAT (outbound) | ❌ | — | — | ✅ port 3306 |
| Database Instance | ❌ | ❌ | ❌ | ✅ | — |
| Bastion Server | ✅ via IGW | ✅ SSH via TGW | ❌ | ✅ SSH via TGW | ❌ |

---

## Prerequisites

- AWS account with permissions for VPC, EC2, ELB, NAT Gateway, and Transit Gateway
- AWS CLI configured (`aws configure`)
- An EC2 key pair for SSH access to the Bastion Server
- At minimum: 2 public subnets (AZ-a, AZ-b) and 4 private subnet pairs in the Application VPC

---

## Deployment Order

1. Create VPCs and subnets (CIDR blocks as per the table above)
2. Attach Internet Gateways to both VPCs
3. Create and attach the Transit Gateway; set up VPC attachments and route table entries
4. Provision the NAT Gateway in the public subnet of the Application VPC; assign an EIP
5. Create all five security groups and configure rules
6. Update subnet route tables (private subnets → NAT Gateway; public subnets → IGW)
7. Launch the Bastion Server in the Bastion VPC public subnet
8. Provision the Database Instance in `10.2.5.0/24`
9. Create the NLB-Backend and its target group (backend instances, port 8080)
10. Launch Backend Instances; attach them to the NLB-Backend target group and the Auto Scaling Group
11. Launch Front-end Instances; configure them to forward API calls to the NLB-Backend DNS
12. Create the NLB-Frontend and its target group (front-end instances, port 80/443)

---

## Key Design Decisions

**Two VPCs instead of one** separates the blast radius of a security incident. A compromise of the Bastion VPC cannot directly reach application data; an attacker must also pass through the Transit Gateway and the application security groups.

**NLB instead of ALB** at both load balancing tiers provides ultra-low latency and preserves the client's source IP natively, which is useful for logging and rate limiting at the application layer.

**No internet route on the Database subnet** means even a fully compromised database EC2 cannot exfiltrate data over the internet — there is simply no route available.

**NAT Gateway with EIP** (not internet-facing instances) ensures outbound traffic for updates is centralised and auditable, without exposing any private instance directly.
