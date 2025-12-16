# Quick Reference Card

Print this or keep it handy!

---

## ⌨️ Cursor Keyboard Shortcuts

| Action | Mac | Windows |
|--------|-----|---------|
| **AI Chat** | `Cmd + L` | `Ctrl + L` |
| **Inline Edit** | `Cmd + K` | `Ctrl + K` |
| **Accept Suggestion** | `Tab` | `Tab` |
| **Reject Suggestion** | `Esc` | `Esc` |
| **Command Palette** | `Cmd + Shift + P` | `Ctrl + Shift + P` |
| **Quick Open File** | `Cmd + P` | `Ctrl + P` |
| **Toggle Sidebar** | `Cmd + B` | `Ctrl + B` |
| **Toggle Terminal** | `Cmd + `` ` | `Ctrl + `` ` |
| **New Cursor Rule** | `Cmd + Shift + P` → "New Cursor Rule" | Same |
| **Format Document** | `Shift + Option + F` | `Shift + Alt + F` |
| **Go to Definition** | `Cmd + Click` or `F12` | `Ctrl + Click` or `F12` |
| **Find References** | `Shift + F12` | `Shift + F12` |
| **Rename Symbol** | `F2` | `F2` |

---

## 🖥️ Terminal Commands

### Development
```bash
npm run dev          # Start Next.js dev server
npx convex dev       # Start Convex dev server (separate terminal)
npm run build        # Production build
npm run lint         # Run ESLint
```

### Convex
```bash
npx convex dev       # Start dev server
npx convex deploy    # Deploy to production
npx convex dashboard # Open Convex dashboard
npx convex logs      # View function logs
```

### Git
```bash
git status           # Check changes
git add .            # Stage all changes
git commit -m "msg"  # Commit with message
git push             # Push to remote
git pull             # Pull latest changes
```

### Debugging
```bash
npm run build        # Check for build errors
npx tsc --noEmit     # TypeScript check only
npm audit            # Security audit
```

---

## 📁 File Reference

| File | Purpose |
|------|---------|
| `docs/PRD.md` | Product requirements |
| `docs/TECHNICAL.md` | Technical design |
| `docs/STATUS.md` | Progress tracking |
| `docs/CHECKLISTS.md` | All checklists |
| `.cursor/rules/*.mdc` | AI coding rules |
| `BUGBOT.md` | Code review rules |
| `convex/schema.ts` | Database schema |
| `.env.local` | Environment variables |

---

## 🔗 Important URLs

| Service | URL |
|---------|-----|
| **Clerk Dashboard** | https://dashboard.clerk.com |
| **Convex Dashboard** | https://dashboard.convex.dev |
| **Vercel Dashboard** | https://vercel.com/dashboard |
| **Next.js Docs** | https://nextjs.org/docs |
| **Convex Docs** | https://docs.convex.dev |
| **Clerk Docs** | https://clerk.com/docs |
| **Tailwind Docs** | https://tailwindcss.com/docs |

---

## 📝 Common AI Prompts

### Start a Feature
```
I want to implement [FEATURE]. 
Read @docs/PRD.md and @docs/TECHNICAL.md first,
then give me a step-by-step plan.
```

### Context Recovery
```
@docs/STATUS.md @docs/PRD.md @docs/TECHNICAL.md
Let's continue where we left off.
```

### Debug Help
```
I'm getting this error: [ERROR]
Search the docs, then explain what's causing it
and how to fix it.
```

### Code Review
```
Review @[file] for security, performance, 
and adherence to our patterns.
```

---

## ✅ Daily Workflow

```
1. Check STATUS.md for current task
2. Work on task using Plan → Act → Verify
3. Update STATUS.md when done
4. Commit changes
5. Repeat
```

---

## 🚨 When Stuck

1. **Check TROUBLESHOOTING.md**
2. **Search docs** (use Ref.tools)
3. **Ask Claude** with full context
4. **Check GitHub issues** for the tool
5. **Nuclear option**: `rm -rf node_modules .next && npm install`

---

## 📊 Code Patterns

### Server Component (Default)
```tsx
export default async function Page() {
  const data = await fetchData();
  return <div>{data}</div>;
}
```

### Client Component
```tsx
'use client';
import { useState } from 'react';
export function Button() {
  const [x, setX] = useState(0);
  return <button onClick={() => setX(x+1)}>{x}</button>;
}
```

### Convex Query
```tsx
const data = useQuery(api.table.list);
```

### Convex Mutation
```tsx
const create = useMutation(api.table.create);
await create({ field: "value" });
```

### Auth Check (Convex)
```typescript
const identity = await ctx.auth.getUserIdentity();
if (!identity) throw new Error("Not authenticated");
```

---

*Keep this handy while coding!*
