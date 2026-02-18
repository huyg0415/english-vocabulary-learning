#!/bin/bash

# Create GitHub Repository Script
# This script will guide you through creating a GitHub repository

echo "🚀 GitHub Repository Creation Script"
echo "===================================="
echo

# Check if GitHub CLI is installed
if command -v gh >/dev/null 2>&1; then
    echo "✅ GitHub CLI is installed"
    echo
    
    # Create GitHub repository
    echo "📝 Creating GitHub repository 'english-vocabulary-learning'..."
    
    # Create the repository
    gh repo create huyg0415/english-vocabulary-learning --public --description "English vocabulary learning with interactive cards and daily exercises" --source=. --remote=origin --push
    
    if [ $? -eq 0 ]; then
        echo "✅ Repository created successfully!"
        echo "📱 GitHub Pages URL: https://huyg0415.github.io/english-vocabulary-learning/"
        echo
        echo "⚠️  Next steps:"
        echo "1. Go to your GitHub repository settings"
        echo "2. Enable GitHub Pages"
        echo "3. Select 'main' branch and '/' folder"
        echo "4. Save the settings"
        echo "5. Wait a few minutes for the page to be published"
    else
        echo "❌ Failed to create repository"
    fi
else
    echo "❌ GitHub CLI is not installed"
    echo
    echo "📋 Manual Setup Instructions:"
    echo "1. Go to: https://github.com/new"
    echo "2. Repository name: english-vocabulary-learning"
    echo "3. Description: English vocabulary learning with interactive cards and daily exercises"
    echo "4. Make it Public"
    echo "5. Initialize with README: ✗"
    echo "6. Click 'Create repository'"
    echo
    echo "After creating the repository, run this script again or run the following commands:"
    echo
    echo "cd /Users/huyg-macmini/.openclaw/workspace"
    echo "git remote add origin https://github.com/huyg0415/english-vocabulary-learning.git"
    echo "git push -u origin main"
    echo
fi

echo
echo "🔧 GitHub Pages Setup Guide:"
echo "1. After pushing the repository, go to: https://github.com/huyg0415/english-vocabulary-learning"
echo "2. Click 'Settings' tab"
echo "3. Scroll to 'GitHub Pages' section"
echo "4. Under 'Source', select: Deploy from a branch"
echo "5. Branch: main"
echo "6. Folder: /"
echo "7. Click 'Save'"
echo "8. Your site will be available at: https://huyg0415.github.io/english-vocabulary-learning/"
echo
echo "⏱️  Note: GitHub Pages may take 1-5 minutes to be available after setting it up."