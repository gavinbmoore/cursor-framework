#!/bin/bash

# ============================================
# 🚀 Project Setup Script
# ============================================
# This script helps you configure a new project
# created from the cursor-framework template.
# ============================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_step() { echo -e "${BLUE}==>${NC} $1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}!${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }

# Header
echo ""
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${NC}     🚀 Project Setup Wizard            ${BLUE}║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Get project name
FOLDER_NAME=$(basename "$PWD")
print_step "Current folder: ${FOLDER_NAME}"
read -p "Project name (press Enter to use '${FOLDER_NAME}'): " PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-$FOLDER_NAME}

# Get project description
read -p "One-line project description: " PROJECT_DESCRIPTION

echo ""
print_step "Setting up: ${PROJECT_NAME}"
echo ""

# ============================================
# Step 1: Update package.json
# ============================================
print_step "Updating package.json..."

if [ -f "package.json" ]; then
  # Use sed to replace the name (works on both Mac and Linux)
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/\"name\": \"cursor-framework-project\"/\"name\": \"${PROJECT_NAME}\"/" package.json
  else
    sed -i "s/\"name\": \"cursor-framework-project\"/\"name\": \"${PROJECT_NAME}\"/" package.json
  fi
  print_success "Updated package.json"
else
  print_warning "package.json not found, skipping..."
fi

# ============================================
# Step 2: Update STATUS.md with project name
# ============================================
print_step "Updating STATUS.md..."

if [ -f "docs/STATUS.md" ]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/\[Your Project Name\]/${PROJECT_NAME}/" docs/STATUS.md
    sed -i '' "s/\[Date\]/$(date '+%Y-%m-%d')/" docs/STATUS.md
    sed -i '' "s/\[Today's Date\]/$(date '+%Y-%m-%d')/" docs/STATUS.md
  else
    sed -i "s/\[Your Project Name\]/${PROJECT_NAME}/" docs/STATUS.md
    sed -i "s/\[Date\]/$(date '+%Y-%m-%d')/" docs/STATUS.md
    sed -i "s/\[Today's Date\]/$(date '+%Y-%m-%d')/" docs/STATUS.md
  fi
  print_success "Updated STATUS.md"
else
  print_warning "docs/STATUS.md not found, skipping..."
fi

# ============================================
# Step 3: Create .env.local from example
# ============================================
print_step "Setting up environment variables..."

if [ -f ".env.example" ] && [ ! -f ".env.local" ]; then
  cp .env.example .env.local
  print_success "Created .env.local from .env.example"
  print_warning "Remember to fill in your API keys!"
else
  if [ -f ".env.local" ]; then
    print_warning ".env.local already exists, skipping..."
  else
    print_warning ".env.example not found, skipping..."
  fi
fi

# ============================================
# Step 4: Install dependencies
# ============================================
echo ""
read -p "Install npm dependencies now? (y/N): " INSTALL_DEPS

if [[ $INSTALL_DEPS =~ ^[Yy]$ ]]; then
  print_step "Installing dependencies..."
  npm install
  print_success "Dependencies installed"
else
  print_warning "Skipping npm install. Run 'npm install' when ready."
fi

# ============================================
# Step 5: Initialize Convex
# ============================================
echo ""
read -p "Initialize Convex database now? (y/N): " INIT_CONVEX

if [[ $INIT_CONVEX =~ ^[Yy]$ ]]; then
  print_step "Initializing Convex..."
  echo ""
  print_warning "This will open Convex setup. Follow the prompts."
  echo ""
  npx convex dev --once
  print_success "Convex initialized"
else
  print_warning "Skipping Convex. Run 'npx convex dev' when ready."
fi

# ============================================
# Step 6: Open service dashboards
# ============================================
echo ""
read -p "Open service dashboards in browser? (y/N): " OPEN_DASHBOARDS

if [[ $OPEN_DASHBOARDS =~ ^[Yy]$ ]]; then
  print_step "Opening dashboards..."
  
  # Detect OS and use appropriate open command
  if [[ "$OSTYPE" == "darwin"* ]]; then
    OPEN_CMD="open"
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OPEN_CMD="xdg-open"
  else
    OPEN_CMD="start"
  fi
  
  $OPEN_CMD "https://dashboard.clerk.com/" 2>/dev/null || true
  $OPEN_CMD "https://dashboard.convex.dev/" 2>/dev/null || true
  $OPEN_CMD "https://vercel.com/dashboard" 2>/dev/null || true
  
  print_success "Opened Clerk, Convex, and Vercel dashboards"
fi

# ============================================
# Step 7: Initialize Git (if needed)
# ============================================
if [ ! -d ".git" ]; then
  echo ""
  read -p "Initialize git repository? (y/N): " INIT_GIT
  
  if [[ $INIT_GIT =~ ^[Yy]$ ]]; then
    print_step "Initializing git..."
    git init
    git add .
    git commit -m "Initial commit from cursor-framework"
    print_success "Git repository initialized"
  fi
fi

# ============================================
# Summary
# ============================================
echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${NC}     ✅ Setup Complete!                 ${GREEN}║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo "Next steps:"
echo "  1. Fill in your API keys in .env.local"
echo "  2. Create your PRD: docs/PRD.md"
echo "  3. Start development:"
echo ""
echo "     npm run dev        # Terminal 1: Next.js"
echo "     npx convex dev     # Terminal 2: Convex"
echo ""
echo "  4. Open http://localhost:3000"
echo ""
echo -e "Happy coding! 🎉"
echo ""
