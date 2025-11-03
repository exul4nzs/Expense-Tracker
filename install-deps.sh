#!/bin/bash
echo "📦 Installing dependencies..."

# Install MariaDB Database
sudo pacman -S mariadb

# Install MariaDB JDBC Driver -- Java to Database Connector
sudo pacman -S mariadb-jdbc

# Initialize Database System
sudo mariadb-install-db --user=mysql --basedir=usr/ --datadir=/var/lib/mysql

# Start Database Service
sudo systemctl start mariadb
sudo systemctl enable mariadb

echo "✅ Dependencies installed!"
