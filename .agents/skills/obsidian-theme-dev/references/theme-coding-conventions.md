# Theme Coding Conventions

## Variable-First SCSS

- Put shared design tokens in `:root`.
- Put light/dark values in `.theme-light` and `.theme-dark`.
- Bridge custom tokens to official Obsidian variables where possible.
- Keep component selectors thin; they should express layout or missing behavior, not duplicate the whole design system.

Example:

```scss
:root {
  --xuan-radius-control: 2px;
  --button-radius: var(--xuan-radius-control);
  --input-radius: var(--xuan-radius-control);
}

.theme-light {
  --background-primary: var(--xuan-paper-0);
  --interactive-accent: var(--xuan-accent);
}
```

## Specificity

- Prefer classes over element chains.
- Keep nesting shallow, ideally two levels or less.
- Do not use universal selectors for theme-wide styling.
- Use `!important` only when a plugin or Obsidian inline style makes it unavoidable; explain the reason in a short comment.

## Assets

- Do not load remote fonts/images in distributable themes.
- Prefer local font aliases or bundled font files.
- Use inline SVG data URLs for tiny UI icons only when a CSS variable cannot control the icon.

## Build And Review

- Use the repo's build command, commonly `npm run build`.
- Do not manually edit generated `theme.css` when SCSS sources exist.
- Scan for hardcoded large radii, stale colors, and accidental transparent surfaces after build.
- Test light and dark mode, desktop and mobile classes when the change touches layout.
