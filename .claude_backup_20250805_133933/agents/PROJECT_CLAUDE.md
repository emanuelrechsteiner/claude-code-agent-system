# React + TypeScript + Shadcn + Tailwind Project Claude.md

Import global agentic workflow: @CLAUDE.md

This file extends the global agentic workflow with specific best practices for building modern React applications using TypeScript, Shadcn/UI components, and TailwindCSS.

## Technology Stack Overview

### Core Technologies
- **React 19**: Modern React with hooks, concurrent features, and server components
- **TypeScript**: Strict type safety and enhanced developer experience
- **Shadcn/UI**: Open-code component system built on Radix UI + Tailwind
- **TailwindCSS v3**: Utility-first CSS framework with design constraints

### Key Principles
- **Component-driven development**: Build with reusable, composable components
- **Type-first development**: Define TypeScript types before implementation
- **Utility-first styling**: Use Tailwind classes over custom CSS
- **Open code philosophy**: Own and customize component code

## Project Structure Standards

### Recommended Directory Structure
```
src/
├── components/
│   ├── ui/              # Shadcn components (auto-generated)
│   ├── layout/          # Layout components (Header, Footer, Sidebar)
│   ├── forms/           # Form components with validation
│   └── features/        # Feature-specific components
├── lib/
│   ├── utils.ts         # Utility functions (includes cn())
│   ├── types.ts         # Global TypeScript types
│   └── constants.ts     # Application constants
├── hooks/               # Custom React hooks
├── pages/              # Page components
└── styles/             # Global styles and Tailwind config
```

## React Development Best Practices

### Component Patterns
- Use functional components with hooks
- Implement proper TypeScript prop interfaces
- Follow single responsibility principle
- Use composition over inheritance
- Implement proper error boundaries

### Hook Usage Guidelines
- **useState**: For simple component state
- **useEffect**: For side effects and lifecycle
- **useContext**: For theme, auth, and global state
- **useMemo/useCallback**: For performance optimization only when needed
- **useRef**: For DOM references and mutable values

### Custom Hook Patterns
```typescript
// Example: Custom hook for form handling
interface UseFormProps<T> {
  initialValues: T
  validationSchema: z.ZodSchema<T>
  onSubmit: (values: T) => void | Promise<void>
}

function useForm<T>({ initialValues, validationSchema, onSubmit }: UseFormProps<T>) {
  // Implementation using react-hook-form + zod
}
```

## TypeScript Standards

### Type Definition Practices
- Define interfaces for all component props
- Use discriminated unions for variant types
- Implement generic types for reusable components
- Export types from a central types file
- Use strict TypeScript configuration

### Example Type Patterns
```typescript
// Component props interface
interface ButtonProps {
  variant?: 'primary' | 'secondary' | 'destructive'
  size?: 'sm' | 'md' | 'lg'
  loading?: boolean
  children: React.ReactNode
  onClick?: () => void
}

// API response types
interface ApiResponse<T> {
  data: T
  status: 'success' | 'error'
  message?: string
}

// Form data types
interface UserFormData {
  name: string
  email: string
  role: 'admin' | 'user'
}
```

## Shadcn/UI Component Guidelines

### Installation and Usage
- Always use the CLI for component installation: `pnpm dlx shadcn@latest add [component]`
- Import components from `@/components/ui/[component]`
- Customize components in the ui folder when needed
- Follow the established component composition patterns

### Component Composition Patterns
```typescript
// Card composition
<Card>
  <CardHeader>
    <CardTitle>User Profile</CardTitle>
    <CardDescription>Manage your account settings</CardDescription>
  </CardHeader>
  <CardContent>
    {/* Content */}
  </CardContent>
  <CardFooter>
    {/* Actions */}
  </CardFooter>
</Card>

// Form composition
<Form {...form}>
  <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
    <FormField
      control={form.control}
      name="email"
      render={({ field }) => (
        <FormItem>
          <FormLabel>Email</FormLabel>
          <FormControl>
            <Input type="email" placeholder="Enter email" {...field} />
          </FormControl>
          <FormMessage />
        </FormItem>
      )}
    />
    <Button type="submit">Submit</Button>
  </form>
</Form>
```

### Theming and Customization
- Use CSS variables for theming: `--background`, `--foreground`, etc.
- Implement dark mode with `dark:` variants
- Customize components by editing source code, not overriding styles
- Use the `cn()` utility for conditional classes

## TailwindCSS Best Practices

### Styling Methodology
- Start mobile-first: use unprefixed utilities for mobile
- Add responsive breakpoints: `sm:`, `md:`, `lg:`, `xl:`, `2xl:`
- Use design system constraints over arbitrary values
- Group related utilities logically in class strings

### Common Utility Patterns
```typescript
// Flex layouts
"flex items-center justify-between"
"flex flex-col space-y-4"
"grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6"

// Interactive states
"hover:bg-gray-100 focus:ring-2 focus:ring-blue-500 active:bg-gray-200"

// Responsive visibility
"hidden md:block"
"block md:hidden"

// Card styling
"bg-white dark:bg-gray-800 rounded-lg shadow-md p-6"
```

### Performance Considerations
- Avoid arbitrary values when theme values exist
- Use semantic color names: `bg-background`, `text-foreground`
- Minimize complex filters and effects
- Use CSS variables for dynamic styling

## Form Handling Standards

### React Hook Form + Zod Pattern
```typescript
import { zodResolver } from "@hookform/resolvers/zod"
import { useForm } from "react-hook-form"
import { z } from "zod"

const formSchema = z.object({
  email: z.string().email("Invalid email address"),
  password: z.string().min(8, "Password must be at least 8 characters"),
})

type FormData = z.infer<typeof formSchema>

function LoginForm() {
  const form = useForm<FormData>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      email: "",
      password: "",
    },
  })

  async function onSubmit(values: FormData) {
    // Handle form submission
  }

  return (
    <Form {...form}>
      {/* Form implementation */}
    </Form>
  )
}
```

## State Management Patterns

### Local State
- Use `useState` for component-level state
- Use `useReducer` for complex state logic
- Implement custom hooks for reusable state logic

### Global State Options
- **React Context**: For theme, auth, simple global state
- **Zustand**: For client-side state management
- **TanStack Query**: For server state management
- **Jotai**: For atomic state management

### Example Context Pattern
```typescript
interface AppContextType {
  user: User | null
  theme: 'light' | 'dark'
  setTheme: (theme: 'light' | 'dark') => void
}

const AppContext = createContext<AppContextType | undefined>(undefined)

export function useAppContext() {
  const context = useContext(AppContext)
  if (!context) {
    throw new Error('useAppContext must be used within AppProvider')
  }
  return context
}
```

## Testing Strategy

### Testing Tools
- **Vitest**: Fast unit testing framework
- **Testing Library**: Component testing utilities
- **MSW**: API mocking for integration tests
- **Playwright**: End-to-end testing

### Testing Patterns
```typescript
// Component testing
import { render, screen } from '@testing-library/react'
import { Button } from '@/components/ui/button'

test('renders button with correct variant', () => {
  render(<Button variant="destructive">Delete</Button>)
  expect(screen.getByRole('button')).toHaveClass('bg-destructive')
})

// Hook testing
import { renderHook, act } from '@testing-library/react'
import { useCounter } from '@/hooks/useCounter'

test('increments counter', () => {
  const { result } = renderHook(() => useCounter(0))
  
  act(() => {
    result.current.increment()
  })
  
  expect(result.current.count).toBe(1)
})
```

## Performance Optimization

### React Performance
- Use `React.memo` for expensive components
- Implement `useMemo` and `useCallback` judiciously
- Use code splitting with `React.lazy`
- Optimize bundle size with dynamic imports

### Tailwind Performance
- Enable JIT compilation for development
- Use PurgeCSS in production builds
- Minimize arbitrary values usage
- Group similar utilities in components

## Accessibility Standards

### ARIA and Semantic HTML
- Use semantic HTML elements
- Implement proper ARIA labels
- Ensure keyboard navigation
- Maintain focus management

### Shadcn/UI Accessibility
- Components include built-in accessibility
- Test with screen readers
- Ensure color contrast compliance
- Implement focus visible indicators

## Development Workflow

### Setup Commands
```bash
# Install Shadcn components
pnpm dlx shadcn@latest add button input card form

# Development
npm run dev

# Type checking
npm run type-check

# Linting
npm run lint

# Testing
npm run test

# Build
npm run build
```

### Code Quality Tools
- **ESLint**: Code linting with React and TypeScript rules
- **Prettier**: Code formatting
- **TypeScript**: Static type checking
- **Husky**: Git hooks for quality gates

### Git Workflow
- Use conventional commits
- Run type checking before commits
- Execute tests in CI/CD pipeline
- Deploy only after all checks pass

## Agent Integration Patterns

### Frontend Agent Usage
- Use frontend-agent for component development
- Delegate UI/UX tasks to specialized agents
- Coordinate with control-agent for complex features
- Report progress to control-agent

### Task Delegation Examples
- **Component creation**: Use frontend-agent
- **Type definitions**: Use general-purpose agent
- **Testing**: Use testing-agent
- **Documentation**: Use documentation-agent

---

This project configuration extends the global agentic workflow with React/TypeScript/Shadcn/Tailwind specific patterns. Follow these guidelines for consistent, high-quality application development.