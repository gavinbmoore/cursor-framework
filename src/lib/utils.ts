import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

/**
 * Merge Tailwind CSS classes with proper precedence
 * Usage: cn('base-class', condition && 'conditional-class', { 'object-class': true })
 */
export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
