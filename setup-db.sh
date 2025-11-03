#!/bin/bash
echo "🗄️ Setting up database..."

read -s -p "Enter MySQL root password: " ROOT_PASS
echo

# Create Database and User
sudo mariadb -u root -p$ROOT_PASS <<EOF
CREATE DATABASE IF NOT EXISTS expense_tracker;
CREATE USER IF NOT EXISTS 'expense_user'@'localhost' IDENTIFIED BY 'expense_pass123';
GRANT ALL PREVILIGES ON expense_tracker.* TO 'expense_user'@'localhost';
FLUSH PREVILIGES;
EOF

# Setup tables using our SQL file
mariadb -u expense_user -pexpense_pass123 expense_tracker <sql/setup_tables.sql

echo "✅ Database setup complete!"
