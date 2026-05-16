#!/bin/bash
# =============================================================================
# TIER 2 – Application EC2 Setup & Deployment Script
# Run this on your App EC2 instance (Ubuntu 22.04)
# =============================================================================
set -euo pipefail

# ── Config ────────────────────────────────────────────────────────────────────
APP_USER="apprunner"
APP_DIR="/opt/login-app"
JAR_NAME="login-app.jar"
LOG_DIR="/var/log/login-app"
SERVICE_NAME="login-app"

# 🔧 Replace these with your actual values
DB_HOST="10.0.3.x"           # Private IP of your DB EC2
DB_USER="appuser"
DB_PASSWORD="AppPass123!"

echo "========================================"
echo " App EC2 Setup – Java Spring Boot"
echo "========================================"

# ── 1. Update & install Java 17 ───────────────────────────────────────────────
sudo apt-get update -y
sudo apt-get install -y openjdk-17-jre-headless curl wget

java -version

# ── 2. Create application user (non-root, no login shell) ─────────────────────
if ! id -u "${APP_USER}" &>/dev/null; then
    sudo useradd --system --no-create-home --shell /usr/sbin/nologin "${APP_USER}"
    echo "✅  User '${APP_USER}' created."
fi

# ── 3. Create directories ──────────────────────────────────────────────────────
sudo mkdir -p "${APP_DIR}"
sudo mkdir -p "${LOG_DIR}"
sudo chown "${APP_USER}:${APP_USER}" "${APP_DIR}" "${LOG_DIR}"

# ── 4. Copy JAR (assumes you SCP'd the JAR to /tmp first) ─────────────────────
#   scp -i your-key.pem target/login-app.jar ec2-user@<APP_EC2_IP>:/tmp/
if [ -f "/tmp/${JAR_NAME}" ]; then
    sudo cp /tmp/${JAR_NAME} "${APP_DIR}/${JAR_NAME}"
    sudo chown "${APP_USER}:${APP_USER}" "${APP_DIR}/${JAR_NAME}"
    echo "✅  JAR copied to ${APP_DIR}."
else
    echo "⚠️  /tmp/${JAR_NAME} not found. Upload the JAR before running this script."
    echo "    scp -i key.pem target/login-app.jar ec2-user@<APP_IP>:/tmp/"
fi

# ── 5. Write environment config file ──────────────────────────────────────────
sudo tee "${APP_DIR}/app.env" > /dev/null <<EOF
DB_HOST=${DB_HOST}
DB_USER=${DB_USER}
DB_PASSWORD=${DB_PASSWORD}
JAVA_OPTS=-Xms256m -Xmx512m
EOF
sudo chmod 600 "${APP_DIR}/app.env"
sudo chown "${APP_USER}:${APP_USER}" "${APP_DIR}/app.env"

# ── 6. Create systemd service ──────────────────────────────────────────────────
sudo tee /etc/systemd/system/${SERVICE_NAME}.service > /dev/null <<EOF
[Unit]
Description=Login App – Spring Boot
After=network.target

[Service]
Type=simple
User=${APP_USER}
Group=${APP_USER}
WorkingDirectory=${APP_DIR}
EnvironmentFile=${APP_DIR}/app.env
ExecStart=/usr/bin/java \${JAVA_OPTS} \\
          -Dspring.datasource.url=jdbc:mysql://\${DB_HOST}:3306/logindb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC \\
          -Dspring.datasource.username=\${DB_USER} \\
          -Dspring.datasource.password=\${DB_PASSWORD} \\
          -jar ${APP_DIR}/${JAR_NAME}
SuccessExitStatus=143
Restart=on-failure
RestartSec=10
StandardOutput=append:${LOG_DIR}/app.log
StandardError=append:${LOG_DIR}/error.log

[Install]
WantedBy=multi-user.target
EOF

# ── 7. Enable & start service ──────────────────────────────────────────────────
sudo systemctl daemon-reload
sudo systemctl enable "${SERVICE_NAME}"
sudo systemctl restart "${SERVICE_NAME}"

echo ""
echo "========================================"
echo " App Setup Complete!"
echo " Service:  ${SERVICE_NAME}"
echo " Status:   sudo systemctl status ${SERVICE_NAME}"
echo " Logs:     tail -f ${LOG_DIR}/app.log"
echo " App runs on: http://$(hostname -I | awk '{print $1}'):8080"
echo "========================================"
