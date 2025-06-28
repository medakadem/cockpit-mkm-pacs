#!/bin/bash

# Build script for MKM PACS Cockpit Application
set -e

VERSION=$(node -p "require('./package.json').version")
NAME="cockpit-mkm-pacs"
RELEASE_DIR="release"
DIST_DIR="dist"

echo "Building MKM PACS Cockpit Application v$VERSION"

# Clean previous builds
rm -rf $RELEASE_DIR
rm -rf $DIST_DIR

# Install dependencies
npm install

# Build the application
npm run build

# Create release directory
mkdir -p $RELEASE_DIR

# Copy built files
cp -r $DIST_DIR $RELEASE_DIR/$NAME

# Copy additional files
cp README.md $RELEASE_DIR/$NAME/
cp manifest.json $RELEASE_DIR/$NAME/

# Create installation script
cat > $RELEASE_DIR/install.sh << 'EOF'
#!/bin/bash
set -e

echo "Installing MKM PACS Cockpit Application..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (use sudo)"
    exit 1
fi

# Copy files to Cockpit directory
cp -r cockpit-mkm-pacs /usr/share/cockpit/mkm-pacs

# Set proper permissions
chown -R root:root /usr/share/cockpit/mkm-pacs
chmod -R 755 /usr/share/cockpit/mkm-pacs

# Restart Cockpit service
systemctl restart cockpit

echo "Installation completed successfully!"
echo "Access Cockpit at https://localhost:9090"
echo "Look for 'MKM PACS' in the menu"
EOF

chmod +x $RELEASE_DIR/install.sh

# Create uninstall script
cat > $RELEASE_DIR/uninstall.sh << 'EOF'
#!/bin/bash
set -e

echo "Uninstalling MKM PACS Cockpit Application..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (use sudo)"
    exit 1
fi

# Remove files
rm -rf /usr/share/cockpit/mkm-pacs

# Restart Cockpit service
systemctl restart cockpit

echo "Uninstallation completed successfully!"
EOF

chmod +x $RELEASE_DIR/uninstall.sh

# Create tarball
cd $RELEASE_DIR
tar -czf "${NAME}-${VERSION}.tar.gz" *
cd ..

echo "Release package created: $RELEASE_DIR/${NAME}-${VERSION}.tar.gz"
echo "Contents:"
ls -la $RELEASE_DIR/ 