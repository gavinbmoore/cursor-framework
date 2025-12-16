# Bugbot Rules

Custom rules for AI-powered code review. Bugbot will check for these patterns on every PR.

## Security Rules (Critical)

### Authentication
- All Convex mutations MUST check `ctx.auth.getUserIdentity()` before modifying data
- Protected routes MUST use Clerk middleware or auth checks
- Never trust client-provided user IDs — always derive from auth token

### Secrets & Environment
- NEVER commit API keys, secrets, or credentials
- All secrets MUST be in `.env.local` or Vercel environment variables
- `NEXT_PUBLIC_` prefixed vars are exposed to client — no secrets there

### Data Access
- Users should only be able to access/modify their own data
- Verify ownership before update/delete operations
- Filter queries by userId where applicable

## TypeScript Rules

### Type Safety
- No `any` type without explicit justification comment
- No `@ts-ignore` without explanation comment
- Prefer `unknown` over `any` for truly unknown types
- All function parameters must have types

### Strict Mode Patterns
```typescript
// ❌ BAD
function process(data: any) { ... }

// ✅ GOOD  
function process(data: UserData) { ... }
```

## React/Next.js Rules

### Server vs Client Components
- Only add `'use client'` when actually needed (hooks, events, browser APIs)
- Don't fetch data in client components when server-side is possible
- Don't pass non-serializable props from server to client

### Performance
- Use `next/image` for images (not `<img>`)
- Large components should be dynamically imported
- Avoid unnecessary re-renders (check useEffect dependencies)

## Convex Rules

### Query Safety
- All queries that filter by user MUST use an index
- Don't use `.collect()` on large tables without limits
- Always handle the case where a query returns undefined/null

### Mutation Safety
- Check auth at the start of every mutation
- Validate all input arguments
- Use transactions for multi-step operations

## Code Quality

### Error Handling
- All async operations must have try/catch or .catch()
- Provide user-friendly error messages
- Log errors with context for debugging

### Naming
- Components: PascalCase
- Functions/variables: camelCase
- Constants: SCREAMING_SNAKE_CASE
- Files: kebab-case

### Testing
- Critical paths should have tests
- Test edge cases, not just happy paths
- Mock external services in tests

## Accessibility

- Interactive elements must be keyboard accessible
- Images must have alt text
- Form inputs must have associated labels
- Color must not be the only indicator of state

## Pull Request Standards

- PR title should describe the change
- Breaking changes must be called out
- Large PRs should be broken into smaller ones
- Include testing instructions for manual review
