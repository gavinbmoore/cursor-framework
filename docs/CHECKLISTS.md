# Development Checklists

Copy these checklists into your STATUS.md or use them as needed.

---

## 🚀 Pre-Launch Checklist

### Core Functionality
- [ ] All MVP features working as specified in PRD
- [ ] User authentication flow complete (sign up, sign in, sign out)
- [ ] All database operations tested
- [ ] Error states handled gracefully
- [ ] Loading states show for all async operations

### Security
- [ ] All API keys in environment variables (not in code)
- [ ] Convex mutations check authentication
- [ ] Users can only access their own data
- [ ] No console.log statements with sensitive data
- [ ] HTTPS enforced (Vercel does this automatically)
- [ ] Input validation on all forms

### Performance
- [ ] Images optimized and using next/image
- [ ] No unnecessary re-renders (check React DevTools)
- [ ] Database queries use proper indexes
- [ ] Large lists are paginated
- [ ] Code splitting for large components

### SEO & Meta
- [ ] Page titles set for all routes
- [ ] Meta descriptions added
- [ ] Open Graph tags for social sharing
- [ ] Favicon configured
- [ ] robots.txt configured (if needed)

### Accessibility
- [ ] All images have alt text
- [ ] Form inputs have labels
- [ ] Keyboard navigation works
- [ ] Color contrast is sufficient
- [ ] Focus states visible

### Testing
- [ ] Critical user paths manually tested
- [ ] Tested on mobile viewport
- [ ] Tested in different browsers (Chrome, Safari, Firefox)
- [ ] Error scenarios tested
- [ ] Edge cases handled

### Deployment
- [ ] Environment variables set in Vercel
- [ ] Convex production deployment configured
- [ ] Domain configured (if custom)
- [ ] Analytics set up (if using)
- [ ] Error monitoring set up (Sentry, etc.)

### Documentation
- [ ] README updated with project info
- [ ] API documentation (if public API)
- [ ] STATUS.md reflects current state

---

## 📝 Code Review Checklist

Use this when reviewing your own code or PRs.

### Functionality
- [ ] Code does what the PR description says
- [ ] Edge cases handled
- [ ] No obvious bugs or logic errors
- [ ] Error handling in place

### Code Quality
- [ ] No TypeScript errors or warnings
- [ ] No ESLint errors
- [ ] Variable names are descriptive
- [ ] No dead code or commented-out code
- [ ] Functions are reasonably sized (<50 lines)
- [ ] No code duplication

### Security
- [ ] No secrets or API keys in code
- [ ] Auth checks present where needed
- [ ] User input is validated
- [ ] No SQL injection risks (Convex handles this, but verify)

### Performance
- [ ] No unnecessary database queries
- [ ] No N+1 query patterns
- [ ] Large operations are optimized
- [ ] Proper use of React hooks (deps arrays correct)

### Testing
- [ ] Changes are testable
- [ ] Manual testing done
- [ ] Edge cases considered

### Documentation
- [ ] Complex logic is commented
- [ ] Public functions have JSDoc comments
- [ ] README updated if needed

---

## 🔄 Pull Request Checklist

Before creating a PR:

- [ ] Branch is up to date with main
- [ ] All tests pass locally
- [ ] No TypeScript errors
- [ ] No ESLint errors
- [ ] Self-reviewed the diff
- [ ] Removed debug code and console.logs
- [ ] PR has a descriptive title
- [ ] PR description explains what and why
- [ ] Screenshots included (for UI changes)
- [ ] Breaking changes documented

---

## 🆕 New Feature Checklist

When starting a new feature:

### Before Coding
- [ ] Feature defined in PRD
- [ ] Technical approach documented
- [ ] Database schema changes identified
- [ ] UI/UX considered
- [ ] Edge cases identified
- [ ] STATUS.md updated with new task

### During Development
- [ ] Following cursor rules
- [ ] Committing in small increments
- [ ] Testing as you go
- [ ] Updating STATUS.md

### After Completing
- [ ] Feature works end-to-end
- [ ] Error handling in place
- [ ] Loading states implemented
- [ ] Mobile responsive
- [ ] STATUS.md updated

---

## 🔐 Security Checklist

Run through this periodically:

### Authentication
- [ ] All protected routes require authentication
- [ ] Session management is secure
- [ ] Password requirements enforced (if using passwords)
- [ ] Rate limiting on auth endpoints

### Authorization
- [ ] Users can only access their own data
- [ ] Admin functions properly protected
- [ ] API endpoints check permissions

### Data Protection
- [ ] Sensitive data encrypted at rest
- [ ] No PII in logs
- [ ] GDPR/privacy compliance (if applicable)
- [ ] Data backup strategy in place

### Infrastructure
- [ ] All secrets in environment variables
- [ ] Dependencies up to date
- [ ] No known vulnerabilities (npm audit)
- [ ] HTTPS everywhere

---

## 📱 Mobile Testing Checklist

- [ ] Responsive layout at 320px width
- [ ] Responsive layout at 375px width (iPhone)
- [ ] Responsive layout at 768px width (tablet)
- [ ] Touch targets are at least 44x44px
- [ ] No horizontal scrolling
- [ ] Forms usable on mobile keyboard
- [ ] Navigation accessible on mobile
- [ ] Images scale properly
- [ ] Text readable without zooming

---

## ⚡ Performance Checklist

- [ ] Lighthouse score > 90
- [ ] First Contentful Paint < 2s
- [ ] Time to Interactive < 3s
- [ ] No layout shifts (CLS < 0.1)
- [ ] Images properly sized
- [ ] Fonts optimized
- [ ] JavaScript bundle reasonable size
- [ ] Database queries optimized

---

## 🎯 Sprint Review Checklist

At the end of each sprint/week:

- [ ] STATUS.md updated
- [ ] Completed tasks documented
- [ ] Blockers identified and addressed
- [ ] Next sprint planned
- [ ] Technical debt noted
- [ ] Lessons learned captured

---

*Copy the relevant checklist into your STATUS.md or PR description as needed.*
