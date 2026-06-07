---
name: obsidian-theme-dev
description: Use when developing, debugging, or reviewing Obsidian app themes, theme.css, CSS snippets, SCSS theme tokens, Obsidian CSS variables, or Obsidian DOM selectors/classes. Prefer official Obsidian CSS variables first, then verify actual DOM classes with DevTools before writing selector-heavy CSS.
---

# Obsidian Theme Development

Use this skill for Obsidian app theme work: `theme.css`, SCSS partials, CSS snippets, plugin compatibility styles, light/dark palettes, typography, radius systems, layout fixes, and DOM selector debugging.

## Operating Rule

Obsidian theme work has two evidence levels:

1. **Official CSS variables are the stable API.** Prefer overriding documented variables over targeting deep DOM selectors.
2. **DOM classes are implementation details.** Use selectors only after verifying the actual element/class in the running Obsidian app or existing theme source.

When there is a conflict, choose this order:

1. User's requested visual direction
2. Official Obsidian CSS variables
3. Existing theme architecture and tokens
4. Verified DOM classes
5. Plugin-specific variables/classes

## Workflow

1. Identify the affected surface: foundation, component, editor, core plugin, workspace, or third-party plugin.
2. Read `references/official-sources.md` if you need the official source map or variable category.
3. Search the local theme first with `rg`:
   - `rg -n "--variable-name|class-name|component-name" styles theme.css`
   - `rg -n "radius|dropdown|modal|popover|background-modifier|color-base" styles`
4. Prefer a variable-level change:
   - Root/shared token in `:root`
   - Light/dark value in `.theme-light` / `.theme-dark`
   - Component variable such as `--modal-radius`, `--input-radius`, `--nav-item-background-hover`
5. Use DOM selectors only when variables cannot express the fix. Read `references/dom-inspection.md` before selector-heavy changes.
6. Keep plugin fixes isolated to plugin wrapper classes when possible.
7. Build and verify:
   - For SCSS themes, run the repo's build command, commonly `npm run build`.
   - Scan the generated CSS for unwanted hardcoded values or stale selectors.

## Design Constraints For Obsidian Themes

- Keep CSS specificity low; avoid `!important` unless overriding plugin styles that cannot be reached otherwise.
- Theme both `.theme-light` and `.theme-dark`.
- Use `body:not(.is-mobile)`, `.is-mobile`, `.is-phone`, and `.is-tablet` for platform-specific behavior only after checking the DOM.
- Avoid transparent modals/menus unless deliberately requested; opaque surfaces are more readable.
- Avoid remote assets for distributable themes. Bundle fonts/images or use local font aliases.
- Do not assume a class is stable because it appears in one screenshot. Verify it in DevTools or current source before relying on it.

## Bundled References

- `references/official-sources.md`: Official Obsidian source links, variable categories, and common variable families.
- `references/dom-inspection.md`: Practical workflow for finding actual Obsidian DOM classes and validating selectors.
- `references/theme-coding-conventions.md`: Local coding conventions for CSS/SCSS changes.
