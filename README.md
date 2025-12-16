# 🚀 Gavin's Cursor Coding Framework

A structured framework for AI-assisted development using Cursor, Claude, and the modern web stack.

## Tech Stack

| Tool | Purpose |
|------|---------|
| **Cursor** | AI-powered code editor |
| **Claude** | AI assistant (via Cursor + Claude.ai) |
| **Next.js 14+** | React framework with App Router |
| **Convex** | Real-time serverless database |
| **Clerk** | Authentication |
| **Vercel** | Deployment |
| **Ref.tools** | MCP server for documentation access |
| **Exa.ai** | AI-powered semantic search |
| **Bugbot** | AI code review on PRs |

---

## 🎯 The Framework Philosophy

This framework follows Ray Fernando's "vibe coding" methodology:

1. **Plan before you code** — Always generate a PRD and technical plan first
2. **Teach your AI** — Use cursor rules to give Claude context about your project
3. **Vertical slices** — Build features end-to-end in small increments
4. **Track progress** — Use status.md to restore AI context when it forgets
5. **Review with AI** — Let Bugbot catch bugs before merge

---

## 📁 Project Structure

```
your-project/
├── .cursor/
│   └── rules/                    # Project-specific AI rules
│       ├── global.mdc            # Always-on rules
│       ├── nextjs.mdc            # Next.js patterns
│       ├── convex.mdc            # Database patterns
│       └── components.mdc        # UI component rules
├── .github/
│   ├── PULL_REQUEST_TEMPLATE.md  # PR template
│   └── ISSUE_TEMPLATE/           # Bug & feature templates
├── docs/
│   ├── PRD.md                    # Product Requirements Document
│   ├── TECHNICAL.md              # Technical Design Document
│   ├── STATUS.md                 # Progress tracking (AI context restore)
│   ├── CHECKLISTS.md             # All development checklists
│   ├── QUICK-REFERENCE.md        # Keyboard shortcuts & commands
│   ├── TROUBLESHOOTING.md        # Common issues & solutions
│   ├── GLOBAL-USER-RULES.md      # Copy to Cursor Settings
│   ├── SETUP-GUIDE.md            # New project setup guide
│   ├── templates/                # Blank templates to copy
│   ├── playbook/                 # AI prompts for common tasks
│   └── decisions/                # Architecture Decision Records
├── scripts/
│   └── setup.sh                  # Interactive project setup
├── src/
│   └── app/                      # Next.js App Router
├── convex/                       # Convex schema & functions
├── BUGBOT.md                     # Custom rules for Bugbot reviews
├── .env.local                    # Environment variables
└── package.json
```

---

## 🚦 Quick Start (New Project)

### Option A: Use the Setup Script (Recommended)

```bash
# After cloning or using the template
cd my-new-project
chmod +x scripts/setup.sh
./scripts/setup.sh
```

The script will:
- Update project name in files
- Create `.env.local` from template
- Optionally install dependencies
- Optionally initialize Convex
- Open service dashboards

### Option B: Manual Setup

#### Step 1: Clone this template
```bash
git clone https://github.com/YOUR_USERNAME/cursor-framework.git my-new-project
cd my-new-project
rm -rf .git
git init
```

#### Step 2: Install dependencies
```bash
npm install
```

### Step 3: Set up services

**Clerk (Authentication):**
1. Go to [clerk.com](https://clerk.com) → Create application
2. Copy your keys to `.env.local`:
   ```
   NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_...
   CLERK_SECRET_KEY=sk_test_...
   ```

**Convex (Database):**
1. Run `npx convex dev` → Follow prompts to create project
2. Keys are auto-configured

**Vercel (Deployment):**
1. Push to GitHub
2. Import to Vercel → Add environment variables

### Step 4: Start development
```bash
npm run dev          # Start Next.js
npx convex dev       # Start Convex (in separate terminal)
```

---

## 🧠 The Workflow

### Phase 1: Planning (CRITICAL - Don't Skip!)

Before writing ANY code, do this in Claude/Cursor Chat:

```
I want to build [FEATURE]. Before we code anything:

1. Read my PRD at @docs/PRD.md
2. Read my technical spec at @docs/TECHNICAL.md
3. Create a step-by-step implementation plan using vertical slices
4. Show me the plan before we start coding
```

### Phase 2: Plan Mode → Act Mode Loop

For each feature:

1. **Plan Mode**: Ask AI to outline what it will do
2. **Review**: You approve or adjust the plan
3. **Act Mode**: AI implements the approved step
4. **Verify**: Test that step works
5. **Update STATUS.md**: Track progress
6. **Repeat**: Move to next step

### Phase 3: Context Recovery

When Cursor loses context (it will!), run this prompt:

```
@docs/STATUS.md @docs/PRD.md @docs/TECHNICAL.md

Let's continue where we left off. What was our last completed task 
and what's the next step?
```

### Phase 4: Code Review

Before merging any PR:
1. Bugbot runs automatically (if configured)
2. Review its findings
3. Click "Fix in Cursor" for quick fixes

---

## 📝 Using the Templates

### Creating a PRD

Copy `docs/templates/PRD-TEMPLATE.md` to `docs/PRD.md` and fill it out.

**Pro tip**: Use this prompt to help generate it:

```
I want to build [APP IDEA]. Help me create a comprehensive PRD.

Ask me clarifying questions about:
- Target users
- Core features (MVP only)
- User journeys
- Success metrics

Then generate the PRD following the template at @docs/templates/PRD-TEMPLATE.md
```

### Creating a Technical Design

After the PRD is done:

```
Based on @docs/PRD.md, create a technical design document.

Consider:
- Our stack: Next.js 14, Convex, Clerk, Tailwind
- File structure and component breakdown
- Database schema
- API contracts
- Authentication flows

Follow the template at @docs/templates/TECHNICAL-TEMPLATE.md
```

---

## ⚙️ Cursor Rules Explained

### Global Rules (Always On)
File: `.cursor/rules/global.mdc`

These are your baseline coding standards that apply everywhere.

### Pattern-Specific Rules (Auto-Attached)
These activate when you're working on matching files:

| Rule | Triggers When |
|------|--------------|
| `nextjs.mdc` | Editing `src/app/**/*.tsx` |
| `convex.mdc` | Editing `convex/**/*.ts` |
| `components.mdc` | Editing `src/components/**/*` |

### How to Add New Rules

1. Create a new `.mdc` file in `.cursor/rules/`
2. Add the frontmatter:
   ```yaml
   ---
   description: When to use this rule
   globs:
     - "src/path/**/*.ts"
   alwaysApply: false
   ---
   ```
3. Write your instructions in markdown below

---

## 🔧 MCP Configuration (Ref.tools)

To enable Ref.tools for documentation access:

1. Open Cursor Settings → MCP
2. Add this server:
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

Now Claude can search documentation for Convex, Next.js, Clerk, etc. without hallucinating!

---

## 🐛 Bugbot Configuration

Edit `BUGBOT.md` to teach Bugbot your team's rules:

```markdown
# Bugbot Rules

## Security
- Never commit API keys or secrets
- Always validate user input

## Convex Specific
- All mutations must check authentication
- Use `ctx.auth.getUserIdentity()` for auth checks

## TypeScript
- No `any` types without explicit justification
- Prefer `unknown` over `any`
```

---

## 📚 Playbook: Common Prompts

### Starting a New Feature
```
I want to add [FEATURE] to my app.

First, update @docs/STATUS.md with a new task.
Then, create a mini-PRD for this feature.
Finally, give me a step-by-step implementation plan.
```

### Debugging
```
I'm getting this error: [ERROR]

1. Search the relevant docs using Ref
2. Check @docs/TECHNICAL.md for our patterns
3. Propose a fix with explanation
```

### Code Review (Manual)
```
Review this code for:
- Security issues
- Performance problems
- Adherence to our patterns in @.cursor/rules/
- TypeScript best practices
```

### Refactoring
```
I want to refactor [COMPONENT/FUNCTION].

1. First, explain what it currently does
2. Propose improvements
3. Show me the plan before making changes
```

---

## 🎓 Learning Path

If you're new to this stack:

1. **Next.js**: [nextjs.org/learn](https://nextjs.org/learn)
2. **Convex**: [docs.convex.dev](https://docs.convex.dev)
3. **Clerk**: [clerk.com/docs](https://clerk.com/docs)
4. **Cursor**: [cursor.com/docs](https://cursor.com/docs)
5. **Ray Fernando's Videos**: [youtube.com/@RayFernando1337](https://youtube.com/@RayFernando1337)

---

## 🆘 Troubleshooting

### "Cursor forgot what we were doing"
→ Use the context recovery prompt with STATUS.md

### "AI is hallucinating APIs"
→ Make sure Ref.tools MCP is configured
→ Tell Claude: "Search the Convex docs for [topic] before answering"

### "Bugbot isn't running"
→ Check GitHub app is installed
→ Verify BUGBOT.md exists in repo root

### "Convex types aren't updating"
→ Run `npx convex dev` to regenerate types
→ Restart TypeScript server (Cmd+Shift+P → "Restart TS Server")

**For more solutions, see `docs/TROUBLESHOOTING.md`**

---

## 📋 Checklists

The framework includes comprehensive checklists in `docs/CHECKLISTS.md`:

- ✅ **Pre-Launch Checklist** — Everything before going live
- ✅ **Code Review Checklist** — Self-review before PRs
- ✅ **Pull Request Checklist** — Before merging
- ✅ **Security Checklist** — Periodic security review
- ✅ **Mobile Testing Checklist** — Responsive design
- ✅ **Performance Checklist** — Speed optimization

---

## 📖 Architecture Decision Records

Track *why* you made technical decisions in `docs/decisions/`:

```bash
# Copy template
cp docs/decisions/000-template.md docs/decisions/002-my-decision.md

# Fill it out and commit with your code
```

This helps future-you (and others) understand the reasoning behind choices.

---

## 📄 License

MIT — Use freely for your projects!

---

*Built with ❤️ using the Ray Fernando methodology*
