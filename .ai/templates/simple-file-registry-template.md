# {PROJECT_NAME} - File Registry

## 📋 File Registry (One Line Per File)

**Core Application Files:**
- `src/app/layout.tsx` - Root layout with theme provider and SEO meta tags
- `src/app/page.tsx` - Main currency converter interface with state management
- `src/app/globals.css` - Global styles with AWS color scheme and Tailwind config

**Component Files:**
- `src/components/theme-provider.tsx` - Theme management wrapper using next-themes
- `src/components/theme-toggle.tsx` - Dark/light mode toggle button with animations

**Library Files:**
- `src/lib/conversion.ts` - Currency conversion logic and API integration
- `src/lib/currencies.ts` - Currency data management and utilities
- `src/lib/utils.ts` - Utility functions for shadcn/ui and class merging

**Type Definition Files:**
- `src/types/currency.ts` - TypeScript interfaces for currency operations

**Configuration Files:**
- `jest.config.js` - Jest testing framework configuration with TypeScript
- `package.json` - Project dependencies, scripts, and metadata

**Documentation Files:**
- `README.md` - Project documentation, setup, and deployment guide

**Test Files:**
- `src/lib/__tests__/conversion.test.ts` - Unit tests for conversion logic and API

## 🔗 Key Relationships
- **UI Flow**: `page.tsx` → `conversion.ts` → `currencies.ts` → API
- **Theme System**: `theme-toggle.tsx` → `theme-provider.tsx` → `layout.tsx`
- **Styling**: All components → `globals.css` (CSS variables)

## 📝 Usage Guidelines
- **Check registry** before creating new files to avoid duplicates
- **Update registry** immediately when adding/modifying files
- **Document purpose** and relationships for each new file

**Last Updated**: {CURRENT_DATE}
**Project Version**: {PROJECT_VERSION}