## Relevant Files

### Frontend Components
- `src/pages/index.tsx` - Public landing page with auth CTAs
- `src/pages/auth/login.tsx` - Login page component
- `src/pages/auth/register.tsx` - Registration page component
- `src/pages/auth/forgot-password.tsx` - Password reset flow
- `src/pages/auth/verify-email.tsx` - Email verification page
- `src/pages/auth/reset-password.tsx` - Password reset form
- `src/pages/dashboard/index.tsx` - Protected dashboard page
- `src/pages/_app.tsx` - App wrapper with auth provider
- `src/components/auth/LoginForm.tsx` - Login form component
- `src/components/auth/RegisterForm.tsx` - Registration form component
- `src/components/auth/SocialAuthButtons.tsx` - Social login buttons
- `src/components/auth/AuthProvider.tsx` - Auth context provider
- `src/components/auth/ProtectedRoute.tsx` - Route protection component
- `src/components/layout/Header.tsx` - Navigation with auth state
- `src/components/layout/Footer.tsx` - Footer with auth links
- `src/components/ui/Button.tsx` - Reusable button component
- `src/components/ui/Input.tsx` - Reusable input component
- `src/components/ui/Alert.tsx` - Alert/notification component
- `src/components/ui/LoadingSpinner.tsx` - Loading indicator

### Hooks & Utilities
- `src/hooks/useAuth.ts` - Authentication hook
- `src/hooks/useUser.ts` - User data hook
- `src/hooks/useForm.ts` - Form handling hook
- `src/lib/supabase.ts` - Supabase client configuration
- `src/lib/auth.ts` - Auth utility functions
- `src/lib/validators.ts` - Form validation utilities
- `src/constants/auth.ts` - Auth-related constants

### Types & Interfaces
- `src/types/auth.ts` - TypeScript types for auth
- `src/types/supabase.ts` - Supabase database types

### Styles
- `src/styles/globals.css` - Global styles
- `src/styles/auth.css` - Auth-specific styles
- `tailwind.config.js` - Tailwind configuration
- `postcss.config.js` - PostCSS configuration

### API Routes
- `src/pages/api/auth/[...nextauth].ts` - NextAuth.js API route
- `src/pages/api/auth/[...supabase].ts` - Supabase auth API route
- `src/pages/api/auth/session.ts` - Session management
- `src/pages/api/auth/csrf.ts` - CSRF protection

### Configuration
- `.env.local` - Environment variables
- `.env.example` - Example environment variables
- `next.config.js` - Next.js configuration
- `tsconfig.json` - TypeScript configuration
- `package.json` - Project dependencies

### Tests
- `src/__tests__/auth.test.tsx` - Auth component tests
- `src/__tests__/utils/auth-utils.test.ts` - Auth utility tests
- `src/__tests__/pages/auth/login.test.tsx` - Login page tests
- `src/__tests__/pages/auth/register.test.tsx` - Register page tests
- `jest.config.js` - Jest configuration
- `jest.setup.js` - Jest setup

