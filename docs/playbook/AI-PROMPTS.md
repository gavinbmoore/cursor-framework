# AI Development Playbook

Copy-paste prompts for common development workflows.

---

## 🚀 Starting a New Project

### Generate PRD from Idea

```
I want to build [DESCRIBE YOUR APP IDEA].

Help me create a comprehensive PRD by asking me questions about:
1. Target users and their pain points
2. Core features for MVP (keep it minimal)
3. User journeys
4. Success metrics
5. What's explicitly OUT of scope

After our Q&A, generate the PRD following the template structure at @docs/templates/PRD-TEMPLATE.md
```

### Generate Technical Design from PRD

```
Based on @docs/PRD.md, create a technical design document.

Our stack:
- Next.js 14 with App Router
- Convex for database
- Clerk for authentication
- Tailwind CSS for styling
- Vercel for deployment

Include:
1. System architecture diagram (mermaid)
2. Database schema with all tables and indexes
3. API design (Convex functions)
4. File structure
5. Authentication flow
6. Implementation phases

Follow @docs/templates/TECHNICAL-TEMPLATE.md
```

### Generate Implementation Plan

```
Based on @docs/PRD.md and @docs/TECHNICAL.md, create a step-by-step implementation plan.

Use vertical slice approach:
- Each slice delivers end-to-end functionality
- Start with the most critical user journey
- Each step should be completable in 1-2 hours
- Include what to test after each step

Format as a numbered checklist I can work through.
```

---

## 🏗️ During Development

### Starting a Feature

```
I want to implement [FEATURE NAME] from the PRD.

Before coding:
1. Read @docs/PRD.md for requirements
2. Read @docs/TECHNICAL.md for architecture
3. Check @docs/STATUS.md for current progress
4. Propose a step-by-step implementation plan
5. Wait for my approval before writing code
```

### Plan Mode (Before Coding)

```
I want to [DESCRIBE WHAT YOU WANT TO DO].

Please:
1. Explain your approach
2. List the files you'll create or modify
3. Describe any database changes
4. Identify potential edge cases
5. Wait for my approval before implementing
```

### Act Mode (Implement Approved Plan)

```
Proceed with the plan we discussed.

For each step:
1. Show me the code
2. Explain any non-obvious decisions
3. Tell me how to test it
4. Wait for confirmation before the next step
```

### Context Recovery

```
@docs/STATUS.md @docs/PRD.md @docs/TECHNICAL.md

I need to continue where we left off. 

1. What task were we working on?
2. What's been completed?
3. What's the next step?

Let's continue.
```

### Update STATUS.md

```
We just completed [DESCRIBE WHAT WAS DONE].

Please update @docs/STATUS.md:
1. Move the completed task to "Completed Tasks"
2. Update "Active Task" to the next item
3. Add any important decisions to "Recent Decisions"
4. Update "Last Updated" timestamp
```

---

## 🐛 Debugging

### Error Investigation

```
I'm getting this error:

[PASTE ERROR HERE]

Please:
1. Search Convex/Next.js/Clerk docs for this error (use Ref)
2. Check our code patterns in @.cursor/rules/
3. Explain what's causing it
4. Propose a fix with explanation
```

### Code Review Request

```
Please review this code:

@[file-path]

Check for:
1. Security issues (auth, data access)
2. TypeScript type safety
3. Error handling
4. Performance concerns
5. Adherence to our patterns in @.cursor/rules/
```

### Debug Session

```
Help me debug [DESCRIBE THE ISSUE].

Expected behavior: [WHAT SHOULD HAPPEN]
Actual behavior: [WHAT'S HAPPENING]

Let's work through this step by step. Don't just give me a solution — explain your reasoning so I learn.
```

---

## 📦 Common Tasks

### Add a New Database Table

```
I need to add a new table for [DESCRIBE DATA].

Please:
1. Propose the schema (fields, types, indexes)
2. Show the schema.ts code
3. Create the basic CRUD Convex functions
4. Explain any design decisions
```

### Create a New Page/Route

```
I need to create a new page at [ROUTE PATH].

Requirements:
[DESCRIBE WHAT THE PAGE DOES]

Please:
1. Determine if it needs auth protection
2. Create the page component
3. Add any needed layouts
4. Include loading and error states
```

### Add a New Component

```
I need a [COMPONENT NAME] component that:
[DESCRIBE REQUIREMENTS]

Please:
1. Create the component following @.cursor/rules/components.mdc
2. Include TypeScript props interface
3. Add proper accessibility attributes
4. Show example usage
```

### Add Authentication to Feature

```
I need to protect [FEATURE/ROUTE] with authentication.

Please:
1. Add Clerk auth checks
2. Update Convex functions to verify user
3. Handle unauthorized access gracefully
4. Update any related components
```

---

## 🚢 Deployment

### Pre-Deployment Check

```
I'm about to deploy to production.

Please help me verify:
1. Environment variables needed for Vercel
2. Any hardcoded dev values to change
3. Database indexes are created
4. Error handling is in place
5. Loading states exist for all async operations
```

### Post-Deployment Issue

```
After deploying, I'm seeing [DESCRIBE ISSUE].

It works locally but not in production.

Please help me:
1. Identify likely causes (env vars, API differences, etc.)
2. Check what to look for in Vercel logs
3. Propose debugging steps
```

---

## 💡 Tips for Better AI Assistance

### Be Specific
❌ "Make this better"
✅ "Refactor this function to reduce nesting and improve readability"

### Provide Context
❌ "Why isn't this working?"
✅ "This query returns undefined even when data exists. Here's the Convex function and how I'm calling it..."

### Ask for Explanation
❌ "Fix it"
✅ "Fix it and explain why this was happening so I understand"

### Verify Before Implementing
❌ Let AI write code immediately
✅ "First, explain your approach. I'll approve before you implement."

### Update Your Docs
After every session, update STATUS.md so you (and the AI) can pick up where you left off.
