#!/bin/bash

# Update package list
sudo apt update -y

# Install MySQL server
sudo apt install -y mysql-server

# Start and enable MySQL service
sudo systemctl start mysql
sudo systemctl enable mysql