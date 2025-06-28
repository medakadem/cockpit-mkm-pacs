#!/bin/bash

# MKM PACS Cockpit Application Installer
set -e

echo "=== MKM PACS Cockpit Application Installer ==="
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "❌ This script must be run as root (use sudo)"
    echo "Usage: sudo ./install.sh"
    exit 1
fi

# Check if Cockpit is installed
if ! systemctl is-active --quiet cockpit; then
    echo "❌ Cockpit is not running. Please install and start Cockpit first."
    echo "   On Ubuntu/Debian: sudo apt install cockpit"
    echo "   On CentOS/RHEL: sudo yum install cockpit"
    exit 1
fi

echo "✅ Cockpit is running"

# Check if dist directory exists
if [ ! -d "dist" ]; then
    echo "❌ Build files not found. Please run 'npm run build' first."
    exit 1
fi

echo "✅ Build files found"

# Create Cockpit directory if it doesn't exist
mkdir -p /usr/share/cockpit

# Copy files
echo "📁 Installing MKM PACS to /usr/share/cockpit/mkm-pacs..."
cp -r dist /usr/share/cockpit/mkm-pacs

# Set proper permissions
echo "🔐 Setting permissions..."
chown -R root:root /usr/share/cockpit/mkm-pacs
chmod -R 755 /usr/share/cockpit/mkm-pacs

# Restart Cockpit
echo "🔄 Restarting Cockpit service..."
systemctl restart cockpit

echo ""
echo "✅ Installation completed successfully!"
echo ""
echo "🌐 Access Cockpit at: https://localhost:9090"
echo "📋 Look for 'MKM PACS' in the menu"
echo ""
echo "📖 Default API endpoint: http://localhost:7070"
echo "⚙️  You can change server settings in the web interface"
echo ""
echo "🔄 To uninstall, run: sudo rm -rf /usr/share/cockpit/mkm-pacs && sudo systemctl restart cockpit" 