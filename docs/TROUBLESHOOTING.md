# Troubleshooting Guide

Common issues and their solutions.

---

## 🔴 Cursor / AI Issues

### "Cursor forgot what we were doing"

**Solution**: Use the context recovery prompt:
```
@docs/STATUS.md @docs/PRD.md @docs/TECHNICAL.md
Let's continue where we left off.
```

**Prevention**: Update STATUS.md after every completed task.

---

### "AI is hallucinating APIs or making things up"

**Solution**: 
1. Make sure Ref.tools MCP is configured
2. Explicitly ask: "Search the [Convex/Next.js/Clerk] docs for [topic] before answering"

**Check MCP is working**:
- Cursor Settings → MCP → Verify "ref-tools" is listed and connected

---

### "Cursor rules aren't being applied"

**Check**:
1. Rules are in `.cursor/rules/` directory
2. Files have `.mdc` extension
3. Frontmatter has correct `globs` pattern
4. For always-on rules: `alwaysApply: true`

**Test**: Open a file that should trigger the rule, then ask Claude about the project context.

---

## 🟠 Next.js Issues

### "Module not found" error

**Common causes**:
1. Missing dependency: `npm install <package>`
2. Wrong import path: Check relative paths
3. TypeScript path alias issue: Check `tsconfig.json`

```bash
# Clear cache and reinstall
rm -rf node_modules .next
npm install
npm run dev
```

---

### "'use client' issues"

**Error**: "You're importing a component that needs useState..."

**Solution**: Add `'use client'` at the top of the file that uses hooks or browser APIs.

**Error**: "Props must be serializable for components in the Server Components tree"

**Solution**: Don't pass functions or non-serializable objects from server to client components.

---

### "Hydration mismatch"

**Common causes**:
1. Different content on server vs client (e.g., using `Date.now()`)
2. Browser extensions modifying HTML
3. Invalid HTML nesting (e.g., `<p>` inside `<p>`)

**Solution**: Use `useEffect` for client-only content:
```tsx
const [mounted, setMounted] = useState(false);
useEffect(() => setMounted(true), []);
if (!mounted) return null;
```

---

### "404 on refresh" (dynamic routes)

**Check**:
1. File is named correctly: `[slug]/page.tsx`
2. `generateStaticParams` is exported (if using static generation)

---

## 🟡 Convex Issues

### "Types aren't updating"

```bash
# Restart Convex dev server
npx convex dev
```

Then restart TypeScript server in VS Code/Cursor:
- `Cmd+Shift+P` → "TypeScript: Restart TS Server"

---

### "Query returns undefined"

**Check**:
1. Is the query being called with correct arguments?
2. Does the data exist in the database?
3. Is the index being used correctly?

**Debug**:
```typescript
// Add logging in your query
console.log("Query args:", args);
const result = await ctx.db.query("table").collect();
console.log("Result:", result);
return result;
```

---

### "Not authenticated" error

**Check**:
1. User is signed in (Clerk)
2. Convex auth is configured with Clerk
3. `ctx.auth.getUserIdentity()` is being called correctly

**Verify Clerk-Convex connection**:
- Convex Dashboard → Settings → Authentication → Check Clerk is configured

---

### "Document not found" after insert

**Cause**: Convex mutations are eventually consistent.

**Solution**: Use the returned ID to fetch, or use optimistic updates:
```typescript
const id = await ctx.db.insert("table", data);
return await ctx.db.get(id); // Get the created document
```

---

## 🟢 Clerk Issues

### "Clerk not working / blank screen"

**Check `.env.local`**:
```
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_xxx  # Must start with pk_
CLERK_SECRET_KEY=sk_test_xxx                    # Must start with sk_
```

**Common mistakes**:
- Extra spaces in keys
- Wrong keys (test vs production)
- Missing `NEXT_PUBLIC_` prefix

---

### "User exists in Clerk but not in Convex"

**Cause**: Webhook not set up, or user was created before webhook.

**Solution**: 
1. Set up Clerk webhook to sync users to Convex
2. Or manually create user record in Convex

---

### "Sign-in redirects to wrong page"

**Check `.env.local`**:
```
NEXT_PUBLIC_CLERK_AFTER_SIGN_IN_URL=/dashboard
NEXT_PUBLIC_CLERK_AFTER_SIGN_UP_URL=/dashboard
```

---

## 🔵 Vercel / Deployment Issues

### "Works locally but not on Vercel"

**Check**:
1. All environment variables are set in Vercel dashboard
2. Environment variable names match exactly
3. Convex deployment URL is for production (not dev)

**Get Convex production URL**:
```bash
npx convex deploy
```

---

### "Build fails on Vercel"

**Common causes**:
1. TypeScript errors (ignored locally with `--noEmit`)
2. Missing environment variables
3. Different Node version

**Debug locally**:
```bash
npm run build
```

---

### "Function timeout"

**Cause**: Serverless function taking too long.

**Solutions**:
1. Optimize the operation
2. Move to background job
3. Increase timeout in `vercel.json`:
```json
{
  "functions": {
    "api/**/*.ts": {
      "maxDuration": 30
    }
  }
}
```

---

## 🟣 General Development Issues

### "npm install fails"

```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and lock file
rm -rf node_modules package-lock.json

# Reinstall
npm install
```

---

### "Port 3000 already in use"

```bash
# Find and kill the process
lsof -i :3000
kill -9 <PID>

# Or use a different port
npm run dev -- -p 3001
```

---

### "Git push rejected"

```bash
# Pull latest changes first
git pull --rebase origin main

# Then push
git push origin main
```

---

### "TypeScript path aliases not working"

**Check `tsconfig.json`**:
```json
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

---

## 🆘 Still Stuck?

1. **Search the docs**: Use Ref.tools or official documentation
2. **Check GitHub issues**: Search for your error message
3. **Ask Claude**: Provide the full error message and context
4. **Start fresh**: Sometimes `rm -rf node_modules .next && npm install` fixes mysterious issues

---

## Quick Diagnostic Commands

```bash
# Check Node version
node -v

# Check npm version  
npm -v

# Check for outdated packages
npm outdated

# Check for vulnerabilities
npm audit

# Verify TypeScript compiles
npx tsc --noEmit

# Verify ESLint passes
npm run lint

# Test production build locally
npm run build && npm start
```
