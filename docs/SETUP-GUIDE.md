# New Project Setup Guide

Step-by-step instructions to set up a new project using this framework.

---

## Prerequisites

Make sure you have:
- [ ] Node.js 18+ installed
- [ ] npm or pnpm installed
- [ ] Git installed
- [ ] Cursor editor installed
- [ ] Accounts on: Clerk, Convex, Vercel, GitHub

---

## Step 1: Clone the Template

```bash
# Clone this template
git clone https://github.com/YOUR_USERNAME/cursor-framework.git my-new-project

# Enter the directory
cd my-new-project

# Remove old git history
rm -rf .git

# Initialize fresh repo
git init
git add .
git commit -m "Initial commit from cursor-framework template"
```

---

## Step 2: Install Dependencies

```bash
npm install
```

---

## Step 3: Set Up Clerk (Authentication)

1. Go to [clerk.com](https://clerk.com) and sign in
2. Click **Create Application**
3. Name it (e.g., "My New App")
4. Enable sign-in methods (Google recommended)
5. Go to **API Keys** in the sidebar
6. Copy your keys

Create `.env.local` in your project root:

```bash
# .env.local
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_xxxxx
CLERK_SECRET_KEY=sk_test_xxxxx
```

---

## Step 4: Set Up Convex (Database)

```bash
# This will prompt you to log in and create a project
npx convex dev
```

Follow the prompts:
1. Log in to Convex
2. Create a new project (or link existing)
3. The CLI will add `CONVEX_DEPLOYMENT` to `.env.local`

---

## Step 5: Connect Clerk to Convex

1. In your Convex dashboard, go to **Settings → Authentication**
2. Add Clerk as a provider
3. Enter your Clerk domain (found in Clerk dashboard → API Keys)

---

## Step 6: Create Project Documentation

Copy the templates to your docs folder:

```bash
cp docs/templates/PRD-TEMPLATE.md docs/PRD.md
cp docs/templates/TECHNICAL-TEMPLATE.md docs/TECHNICAL.md
cp docs/templates/STATUS-TEMPLATE.md docs/STATUS.md
```

Now fill out the PRD with your project details!

---

## Step 7: Configure Cursor

### Add Global Rules (One-time setup)
1. Open Cursor Settings (Cmd/Ctrl + ,)
2. Go to **General → Rules for AI**
3. Paste the content from `docs/GLOBAL-USER-RULES.md`

### Configure MCP for Ref.tools
1. Open Cursor Settings
2. Go to **MCP** section
3. Add this configuration:

```json
{
  "mcpServers": {
    "ref-tools": {
      "command": "npx",
      "args": ["-y", "@anthropic/ref-tools-mcp"]
    }
  }
}
```

### Enable Bugbot (Optional)
1. Go to [cursor.com/bugbot](https://cursor.com/bugbot)
2. Install the GitHub app
3. Select your repository

---

## Step 8: Push to GitHub

```bash
# Create repo on GitHub first, then:
git remote add origin https://github.com/YOUR_USERNAME/my-new-project.git
git branch -M main
git push -u origin main
```

---

## Step 9: Deploy to Vercel

1. Go to [vercel.com](https://vercel.com)
2. Click **Add New Project**
3. Import your GitHub repository
4. Add environment variables:
   - `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY`
   - `CLERK_SECRET_KEY`
   - `CONVEX_DEPLOY_KEY` (get from Convex dashboard → Settings → Deploy Keys)
5. Deploy!

---

## Step 10: Start Development

```bash
# Terminal 1: Start Next.js
npm run dev

# Terminal 2: Start Convex
npx convex dev
```

Open http://localhost:3000 in your browser.

---

## Checklist Summary

- [ ] Template cloned and git initialized
- [ ] Dependencies installed
- [ ] Clerk account set up and keys added
- [ ] Convex initialized and connected
- [ ] Clerk-Convex integration configured
- [ ] PRD.md filled out
- [ ] TECHNICAL.md filled out
- [ ] STATUS.md initialized
- [ ] Global Cursor rules added
- [ ] Ref.tools MCP configured
- [ ] Repository pushed to GitHub
- [ ] Vercel deployment configured

---

## Common Issues

### "Convex types aren't updating"
```bash
# Restart the Convex dev server
npx convex dev
```

### "Clerk auth not working"
- Check `.env.local` has correct keys
- Make sure keys don't have extra spaces
- Restart Next.js dev server

### "AI isn't following project rules"
- Check rules are in `.cursor/rules/` with `.mdc` extension
- Verify frontmatter has correct `globs` patterns
- For always-on rules, set `alwaysApply: true`

---

## Next Steps

1. Fill out your PRD with Claude's help (use prompts from `docs/playbook/AI-PROMPTS.md`)
2. Generate your technical design
3. Create your implementation plan
4. Start building with the Plan → Act → Verify loop!

Good luck! 🚀
