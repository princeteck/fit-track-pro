#!/bin/bash

# FitTrack Pro - Release APK Copy Script
# This script builds the release APK and copies it to the releases directory

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 FitTrack Pro - Release Build Script${NC}"
echo "======================================"

# Get version from pubspec.yaml
VERSION=$(grep "^version:" pubspec.yaml | cut -d' ' -f2 | cut -d'+' -f1)
echo -e "${YELLOW}📋 Building version: $VERSION${NC}"

# Build release APK
echo -e "${BLUE}🔨 Building release APK...${NC}"
flutter build apk --release

# Check if build was successful
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Build successful!${NC}"
else
    echo -e "${RED}❌ Build failed!${NC}"
    exit 1
fi

# Create releases directory if it doesn't exist
mkdir -p releases

# Copy APK to releases directory
echo -e "${BLUE}📁 Copying APK to releases directory...${NC}"

# Copy as latest release
cp build/app/outputs/flutter-apk/app-release.apk releases/app-release.apk
echo -e "${GREEN}✅ Copied: releases/app-release.apk${NC}"

# Copy with version number
cp build/app/outputs/flutter-apk/app-release.apk "releases/fittrack-pro-v$VERSION.apk"
echo -e "${GREEN}✅ Copied: releases/fittrack-pro-v$VERSION.apk${NC}"

# Show file sizes
echo -e "${YELLOW}📊 APK File Sizes:${NC}"
ls -lh releases/*.apk | awk '{print "   " $9 " - " $5}'

# Show success message
echo ""
echo -e "${GREEN}🎉 Release APK ready!${NC}"
echo -e "${YELLOW}📍 Location: releases/app-release.apk${NC}"
echo -e "${YELLOW}📍 Versioned: releases/fittrack-pro-v$VERSION.apk${NC}"
echo ""
echo -e "${BLUE}💡 Next steps:${NC}"
echo "   1. Test the APK on a device"
echo "   2. Update CHANGELOG.md with release notes"
echo "   3. Commit and push the APK to the repository"
echo "   4. Create a Git tag: git tag v$VERSION"
