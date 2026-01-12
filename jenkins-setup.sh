#!/bin/bash

# Exit immediately if a command fails
set -e

echo "======================================"
echo " Jenkins LTS Installation - Ubuntu 24 "
echo "======================================"

# Check for root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run this script as root (use sudo)"
  exit 1
fi

echo "🔄 Updating system packages..."
apt update -y

echo "☕ Installing Java 21 (OpenJDK)..."
apt install -y fontconfig openjdk-21-jre

echo "✅ Java version installed:"
java -version

echo "🔑 Adding Jenkins GPG key..."
mkdir -p /etc/apt/keyrings
wget -q -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "📦 Adding Jenkins LTS repository..."
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" \
> /etc/apt/sources.list.d/jenkins.list

echo "🔄 Updating repositories..."
apt update -y

echo "🚀 Installing Jenkins (LTS)..."
apt install -y jenkins

echo "🔧 Enabling Jenkins service..."
systemctl enable jenkins

echo "▶️ Starting Jenkins service..."
systemctl start jenkins

echo "📊 Jenkins service status:"
systemctl status jenkins --no-pager

echo "======================================"
echo " 🎉 Jenkins LTS Installed Successfully "
echo "======================================"
echo ""
echo "🌐 Access Jenkins at:"
echo "    http://<YOUR_SERVER_IP>:8080"
echo ""
echo "🔐 Initial Admin Password:"
echo "    sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
echo ""
