# ADR-001: Tech Stack Selection

**Status**: Accepted

**Date**: [Project Start Date]

**Deciders**: [Your Name]

---

## Context

We need to select a technology stack for building web applications. The stack should:
- Enable rapid development with AI assistance
- Be suitable for someone learning to code
- Support real-time features
- Be cost-effective for small projects
- Have good documentation and community support

## Decision

We will use the following stack:

| Layer | Technology | Rationale |
|-------|------------|-----------|
| **Framework** | Next.js 14 (App Router) | Industry standard, excellent docs, Vercel integration |
| **Database** | Convex | Real-time, serverless, TypeScript-first, generous free tier |
| **Auth** | Clerk | Drop-in auth, handles complexity, great DX |
| **Styling** | Tailwind CSS | Utility-first, works well with AI code generation |
| **Deployment** | Vercel | Seamless Next.js integration, automatic deployments |
| **AI Tools** | Cursor + Claude | Best-in-class AI coding assistance |
| **Docs Search** | Ref.tools | Prevents AI hallucinations with accurate docs |
| **Code Review** | Bugbot | AI code review catches bugs before merge |

## Alternatives Considered

### Database: Supabase
**Pros**:
- PostgreSQL (familiar SQL)
- Built-in auth
- Good free tier

**Cons**:
- More setup complexity
- Less real-time friendly than Convex
- Requires more boilerplate

### Database: Firebase
**Pros**:
- Google backing
- Real-time database

**Cons**:
- Vendor lock-in concerns
- Complex pricing
- NoSQL limitations for some queries

### Auth: NextAuth.js
**Pros**:
- Open source
- Full control

**Cons**:
- More setup required
- Need to manage sessions
- Clerk is simpler for our needs

## Consequences

### Positive
- Fast development with integrated tooling
- Real-time features out of the box
- TypeScript end-to-end
- Minimal DevOps overhead
- Great AI assistance compatibility

### Negative
- Convex is newer (smaller community than Supabase/Firebase)
- Some vendor lock-in with Clerk and Convex
- Monthly costs if we exceed free tiers

### Risks
- Convex pricing changes could affect costs at scale
- Learning curve for Convex's reactive patterns
- Dependency on external services

## Implementation Notes

- Use Clerk webhooks to sync users to Convex
- Follow the cursor-framework patterns for consistency
- Keep an eye on usage to stay within free tiers

---

## References

- [Convex Docs](https://docs.convex.dev)
- [Clerk Docs](https://clerk.com/docs)
- [Next.js Docs](https://nextjs.org/docs)
- [Ray Fernando's methodology](https://github.com/RayFernando1337/llm-cursor-rules)
