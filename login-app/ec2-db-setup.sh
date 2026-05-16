#!/bin/bash
# =============================================================================
# TIER 3 – Database EC2 Setup Script
# Run this on your DB EC2 instance (Amazon Linux 2023 / Ubuntu 22.04)
# =============================================================================
set -euo pipefail

# ── Config ────────────────────────────────────────────────────────────────────
DB_ROOT_PASSWORD="RootPass123!"       # Change before use
DB_NAME="logindb"
DB_USER="appuser"
DB_PASSWORD="AppPass123!"            # Must match application.properties DB_PASSWORD
APP_EC2_PRIVATE_IP="10.0.2.x"       # Replace with your App EC2 private IP

echo "========================================"
echo " DB EC2 Setup – Installing MySQL 8"
echo "========================================"

# ── 1. Update packages ─────────────────────────────────────────────────────────
sudo apt-get update -y

# ── 2. Install MySQL Server ────────────────────────────────────────────────────
sudo apt-get install -y mysql-server

# ── 3. Start & enable MySQL ────────────────────────────────────────────────────
sudo systemctl start mysql
sudo systemctl enable mysql

# ── 4. Secure MySQL installation ───────────────────────────────────────────────
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${DB_ROOT_PASSWORD}';"
sudo mysql -u root -p"${DB_ROOT_PASSWORD}" -e "DELETE FROM mysql.user WHERE User='';"
sudo mysql -u root -p"${DB_ROOT_PASSWORD}" -e "DROP DATABASE IF EXISTS test;"
sudo mysql -u root -p"${DB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# ── 5. Create application database and user ────────────────────────────────────
sudo mysql -u root -p"${DB_ROOT_PASSWORD}" <<SQL
CREATE DATABASE IF NOT EXISTS ${DB_NAME}
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS '${DB_USER}'@'${APP_EC2_PRIVATE_IP}'
  IDENTIFIED WITH mysql_native_password BY '${DB_PASSWORD}';

GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'${APP_EC2_PRIVATE_IP}';
FLUSH PRIVILEGES;
SQL

echo "✅  Database '${DB_NAME}' and user '${DB_USER}' created."

# ── 6. Create the users table (Hibernate will also auto-create via ddl-auto=update,
#       but having it here gives you an explicit baseline)
sudo mysql -u root -p"${DB_ROOT_PASSWORD}" "${DB_NAME}" <<SQL
CREATE TABLE IF NOT EXISTS users (
  id       BIGINT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50)  NOT NULL UNIQUE,
  email    VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role     VARCHAR(30)  NOT NULL DEFAULT 'ROLE_USER',
  enabled  TINYINT(1)   NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
SQL

echo "✅  Table 'users' created."

# ── 7. Allow MySQL to listen on all interfaces (so App EC2 can connect) ─────────
sudo sed -i "s/^bind-address.*=.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

echo ""
echo "========================================"
echo " DB Setup Complete!"
echo " MySQL is listening on port 3306"
echo " DB Host (private IP): $(hostname -I | awk '{print $1}')"
echo "========================================"
