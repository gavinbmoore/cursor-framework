# Project Status

> **Purpose**: This file helps restore AI context when Cursor loses track of what we're working on.
> 
> **Usage**: Update this after completing each task. When context is lost, prompt:
> ```
> @docs/STATUS.md @docs/PRD.md @docs/TECHNICAL.md
> Let's continue where we left off.
> ```

## Project Info

**Project Name**: [Your Project Name]
**Started**: [Date]
**Current Phase**: [Setup / Development / Testing / Launch]

---

## Current Sprint

### Sprint Goal
[What you're trying to accomplish this sprint/week]

### Active Task
**Task ID**: TASK-001
**Description**: [What you're currently working on]
**Status**: 🏗️ In Progress
**Started**: [Date/Time]

**What's Been Done**:
- [x] Step 1 completed
- [x] Step 2 completed
- [ ] Step 3 (current)
- [ ] Step 4 (next)

**Blockers**: [None / Describe any blockers]

**Notes**:
[Any important context for continuing this task]

---

## Completed Tasks

### ✅ TASK-000: Project Setup
**Completed**: [Date]
**Summary**: Initial project setup with Next.js, Convex, and Clerk

**What was done**:
- Created Next.js 14 project with App Router
- Configured Convex database
- Set up Clerk authentication
- Created base layout

---

## Pending Tasks

### ⏳ TASK-002: [Task Name]
**Priority**: High
**Depends On**: TASK-001
**Notes**: [Brief description]

### ⏳ TASK-003: [Task Name]
**Priority**: Medium
**Depends On**: None
**Notes**: [Brief description]

---

## Recent Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| [Date] | [Decision made] | [Why we decided this] |
| [Date] | [Decision made] | [Why we decided this] |

---

## Known Issues

| Issue | Severity | Status | Notes |
|-------|----------|--------|-------|
| [Issue description] | Low/Medium/High | Open/Fixed | [Details] |

---

## Context for AI

### Current File Focus
> Files we're actively working on

- `src/app/[route]/page.tsx` - [What we're doing here]
- `convex/[function].ts` - [What we're doing here]

### Patterns We're Using
> Quick reference for consistent implementation

- Authentication: Clerk + Convex user sync via webhook
- State: Convex for server state, React state for UI
- Styling: Tailwind + cn() utility for conditional classes

### Things to Remember
> Important context that shouldn't be forgotten

1. [Important thing 1]
2. [Important thing 2]
3. [Important thing 3]

---

## Quick Reference

### Key Commands
```bash
npm run dev          # Start Next.js
npx convex dev       # Start Convex
npm run lint         # Check linting
npm run build        # Production build
```

### Environment Variables Needed
```
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=
CLERK_SECRET_KEY=
NEXT_PUBLIC_CONVEX_URL=
CONVEX_DEPLOY_KEY=
```

### Useful Links
- Convex Dashboard: [link]
- Clerk Dashboard: [link]
- Vercel Project: [link]

---

*Last Updated: [Date and Time]*
