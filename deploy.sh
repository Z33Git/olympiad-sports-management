#!/bin/bash
# Olympiad Sports Management System - GitHub Pages Deployment Script
# Run this script on your LOCAL PC after downloading the backup

echo "=========================================="
echo "Olympiad Sports Management - GitHub Deploy"
echo "=========================================="

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed. Please install git first."
    exit 1
fi

# Get repository name
REPO_NAME=${1:-"olympiad-sports-management"}
echo "Repository name: $REPO_NAME"

# Get GitHub username
read -p "Enter your GitHub username: " GITHUB_USER

echo ""
echo "1. Creating GitHub repository..."
echo "   Go to: https://github.com/new"
echo "   Repository name: $REPO_NAME"
echo "   Make it: PUBLIC"
echo "   Don't initialize with README"
echo ""
read -p "Press Enter after creating the repository..."

echo ""
echo "2. Initializing git and pushing..."
cd "$(dirname "$0")"
git init
git add .
git commit -m "Initial commit - Olympiad Sports Management System

Features:
- Dashboard with statistics
- Participant management with CSV upload
- VIP / Guests of Honor management
- Sports tracking
- Team management
- Attendance tracking
- Shield awards
- Shield assignment portal
- MC Panel
- Event Day overview
- Players profile
- Participant attendance portal

Login: admin / admin123"

echo ""
echo "3. Adding remote and pushing..."
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
git branch -M main
git push -u origin main

echo ""
echo "=========================================="
echo "4. Enabling GitHub Pages..."
echo "   Go to: https://github.com/$GITHUB_USER/$REPO_NAME/settings/pages"
echo "   Source: Deploy from a branch"
echo "   Branch: main (or master)"
echo "   Folder: / (root)"
echo "   Click Save"
echo ""
echo "=========================================="
echo "Your app will be available at:"
echo "https://$GITHUB_USER.github.io/$REPO_NAME/"
echo "=========================================="
