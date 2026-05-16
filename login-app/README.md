# 3-Tier Java Login App – AWS EC2 Deployment Guide

## Architecture Overview

```
Internet
    │
    ▼
┌─────────────────────────┐
│  Tier 1 – Web EC2       │  Public Subnet
│  Nginx (port 80)        │  Security Group: allow 80 inbound
└───────────┬─────────────┘
            │ proxy_pass (port 8080, private)
            ▼
┌─────────────────────────┐
│  Tier 2 – App EC2       │  Private Subnet
│  Spring Boot (port 8080)│  Security Group: allow 8080 from Web EC2 only
└───────────┬─────────────┘
            │ JDBC (port 3306, private)
            ▼
┌─────────────────────────┐
│  Tier 3 – DB EC2        │  Private Subnet
│  MySQL 8 (port 3306)    │  Security Group: allow 3306 from App EC2 only
└─────────────────────────┘
```

---

## Prerequisites

- AWS account with EC2 access
- A VPC with at least one public and one private subnet
- An EC2 key pair for SSH
- Java 17+ and Maven installed locally (to build the JAR)

---

## Step 1 – Launch 3 EC2 Instances

| Role     | Instance Type | AMI               | Subnet  | Public IP |
|----------|---------------|-------------------|---------|-----------|
| Web      | t3.micro      | Ubuntu 22.04 LTS  | Public  | Yes       |
| App      | t3.small      | Ubuntu 22.04 LTS  | Private | No        |
| Database | t3.small      | Ubuntu 22.04 LTS  | Private | No        |

### Security Groups

**Web EC2 SG:**
| Type  | Protocol | Port | Source    |
|-------|----------|------|-----------|
| HTTP  | TCP      | 80   | 0.0.0.0/0 |
| SSH   | TCP      | 22   | Your IP   |

**App EC2 SG:**
| Type        | Protocol | Port | Source        |
|-------------|----------|------|---------------|
| Custom TCP  | TCP      | 8080 | Web SG / Web private IP |
| SSH         | TCP      | 22   | Your IP / Bastion |

**DB EC2 SG:**
| Type        | Protocol | Port | Source     |
|-------------|----------|------|------------|
| MySQL/Aurora | TCP     | 3306 | App SG / App private IP |
| SSH          | TCP     | 22   | Your IP / Bastion |

---

## Step 2 – Build the Application

```bash
# On your local machine
cd login-app
mvn clean package -DskipTests

# JAR is created at:
ls target/login-app.jar
```

---

## Step 3 – Deploy the Database EC2 (Tier 3)

```bash
# SSH into DB EC2 via bastion or Session Manager
ssh -i your-key.pem ubuntu@<DB_EC2_PRIVATE_IP>

# Upload and run the script
scp -i your-key.pem deploy/ec2-db-setup.sh ubuntu@<DB_EC2_PRIVATE_IP>:/tmp/

# Edit the config at the top of the script first:
#   APP_EC2_PRIVATE_IP="10.0.2.x"  ← set to your App EC2 private IP
#   DB_ROOT_PASSWORD, DB_PASSWORD   ← change to secure values

chmod +x /tmp/ec2-db-setup.sh
sudo /tmp/ec2-db-setup.sh
```

---

## Step 4 – Deploy the Application EC2 (Tier 2)

```bash
# Upload JAR to App EC2
scp -i your-key.pem target/login-app.jar ubuntu@<APP_EC2_PRIVATE_IP>:/tmp/

# Upload setup script
scp -i your-key.pem deploy/ec2-app-setup.sh ubuntu@<APP_EC2_PRIVATE_IP>:/tmp/

# SSH into App EC2
ssh -i your-key.pem ubuntu@<APP_EC2_PRIVATE_IP>

# Edit the config at the top of the script:
#   DB_HOST="10.0.3.x"    ← set to your DB EC2 private IP
#   DB_PASSWORD            ← must match what you set in Step 3

chmod +x /tmp/ec2-app-setup.sh
sudo /tmp/ec2-app-setup.sh

# Verify the app started
sudo systemctl status login-app
curl http://localhost:8080/login
```

---

## Step 5 – Deploy the Web EC2 (Tier 1)

```bash
# Upload and run Nginx setup script
scp -i your-key.pem deploy/ec2-web-setup.sh ubuntu@<WEB_EC2_PUBLIC_IP>:/tmp/

ssh -i your-key.pem ubuntu@<WEB_EC2_PUBLIC_IP>

# Edit the config at the top:
#   APP_EC2_PRIVATE_IP="10.0.2.x"  ← set to your App EC2 private IP

chmod +x /tmp/ec2-web-setup.sh
sudo /tmp/ec2-web-setup.sh
```

---

## Step 6 – Access the Application

Open your browser and go to:

```
http://<WEB_EC2_PUBLIC_IP>
```

You should see the Login page. Register a new account and sign in!

---

## Useful Commands

```bash
# App EC2 – check service status
sudo systemctl status login-app

# App EC2 – view logs
sudo tail -f /var/log/login-app/app.log

# App EC2 – restart app
sudo systemctl restart login-app

# Web EC2 – test Nginx config
sudo nginx -t

# Web EC2 – reload Nginx
sudo systemctl reload nginx

# DB EC2 – connect to MySQL
sudo mysql -u root -p logindb
```

---

## Project Structure

```
login-app/
├── pom.xml
├── src/
│   └── main/
│       ├── java/com/myapp/loginapp/
│       │   ├── LoginApplication.java
│       │   ├── config/SecurityConfig.java
│       │   ├── controller/AuthController.java
│       │   ├── model/User.java
│       │   ├── repository/UserRepository.java
│       │   └── service/
│       │       ├── CustomUserDetailsService.java
│       │       └── UserService.java
│       └── resources/
│           ├── application.properties
│           ├── templates/
│           │   ├── login.html
│           │   ├── register.html
│           │   └── dashboard.html
│           └── static/css/style.css
└── deploy/
    ├── ec2-db-setup.sh      ← Tier 3: MySQL setup
    ├── ec2-app-setup.sh     ← Tier 2: Spring Boot deploy
    └── ec2-web-setup.sh     ← Tier 1: Nginx setup
```
