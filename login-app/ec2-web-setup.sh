#!/bin/bash
# =============================================================================
# TIER 1 – Web EC2 Setup Script (Nginx Reverse Proxy)
# Run this on your Web EC2 instance (Ubuntu 22.04)
# =============================================================================
set -euo pipefail

# ── Config ────────────────────────────────────────────────────────────────────
# 🔧 Replace with the private IP of your App EC2
APP_EC2_PRIVATE_IP="10.0.2.x"
APP_PORT="8080"
SERVER_NAME="_"   # Replace with your domain name if you have one

echo "========================================"
echo " Web EC2 Setup – Nginx Reverse Proxy"
echo "========================================"

# ── 1. Update & install Nginx ─────────────────────────────────────────────────
sudo apt-get update -y
sudo apt-get install -y nginx curl

# ── 2. Write Nginx config ──────────────────────────────────────────────────────
sudo tee /etc/nginx/sites-available/login-app > /dev/null <<EOF
# Login App – Nginx Reverse Proxy Config
upstream login_app_backend {
    server ${APP_EC2_PRIVATE_IP}:${APP_PORT};
    keepalive 32;
}

server {
    listen 80;
    server_name ${SERVER_NAME};

    # Security headers
    add_header X-Frame-Options          "SAMEORIGIN"   always;
    add_header X-XSS-Protection         "1; mode=block" always;
    add_header X-Content-Type-Options   "nosniff"      always;
    add_header Referrer-Policy          "no-referrer-when-downgrade" always;

    # Gzip compression
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml;
    gzip_min_length 1024;

    # Proxy to Spring Boot App
    location / {
        proxy_pass         http://login_app_backend;
        proxy_http_version 1.1;

        proxy_set_header   Host              \$host;
        proxy_set_header   X-Real-IP         \$remote_addr;
        proxy_set_header   X-Forwarded-For   \$proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto \$scheme;
        proxy_set_header   Connection        "";

        proxy_connect_timeout  60s;
        proxy_send_timeout     60s;
        proxy_read_timeout     60s;
        proxy_buffer_size      4k;
        proxy_buffers          8 4k;
    }

    # Health check endpoint
    location /health {
        access_log off;
        proxy_pass http://login_app_backend/actuator/health;
    }

    # Deny hidden files
    location ~ /\. {
        deny all;
    }
}
EOF

# ── 3. Enable site & remove default ───────────────────────────────────────────
sudo ln -sf /etc/nginx/sites-available/login-app /etc/nginx/sites-enabled/login-app
sudo rm -f /etc/nginx/sites-enabled/default

# ── 4. Test config & reload ────────────────────────────────────────────────────
sudo nginx -t
sudo systemctl enable nginx
sudo systemctl restart nginx

echo ""
echo "========================================"
echo " Web (Nginx) Setup Complete!"
echo " Forwarding: Port 80 → ${APP_EC2_PRIVATE_IP}:${APP_PORT}"
echo " Public IP:  $(curl -s ifconfig.me)"
echo " Status:     sudo systemctl status nginx"
echo " Logs:       sudo tail -f /var/log/nginx/error.log"
echo "========================================"
