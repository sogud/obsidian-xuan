# Official Obsidian Theme Sources

Use these sources before relying on memory or third-party examples.

## Primary Official Docs

- Obsidian Developer Docs home: https://docs.obsidian.md/Home
  - States that the official developer docs cover building plugins and themes.
  - Theme entry points: Build a theme, Submit your theme, CSS variables.
- About styling: https://docs.obsidian.md/Reference/CSS%20variables/About%20styling
  - Obsidian uses CSS for the UI.
  - Obsidian includes hundreds of CSS variables for consistent interfaces.
  - For themes/snippets, overriding CSS variables can avoid complex selectors.
- CSS variables index: https://docs.obsidian.md/Reference/CSS%20variables/CSS%20variables
  - Main official reference for app, component, editor, core plugin, workspace, and Publish variables.
- Colors: https://docs.obsidian.md/Reference/CSS%20variables/Foundations/Colors
  - Defines `--color-base-*`, semantic background/text variables, interactive variables, and accent variables.
- CSS snippets help: https://obsidian.md/help/snippets
  - Official user-facing guidance for snippets, reload behavior, `cssclasses`, and links to styling docs.
- Embed fonts and images: https://docs.obsidian.md/Themes/App%20themes/Embed%20fonts%20and%20images%20in%20your%20theme
  - Use when bundling fonts/images or avoiding remote assets.

## Variable Categories To Check First

The CSS variables index is organized into:

- Foundations: borders, colors, cursor, icons, layers, radiuses, spacing, typography.
- Components: button, checkbox, dialog, modal, multi-select, navigation, popover, slider, tabs, text input, toggle.
- Editor: blockquote, callout, code, embed, headings, link, list, properties, table, tag.
- Core plugins: Canvas, file explorer, graph, search.
- Window/workspace: divider, ribbon, scrollbar, status bar, window frame, workspace.

## Common Variable Families

Prefer these before custom selectors:

```css
/* Base and semantic surfaces */
--color-base-00
--color-base-05
--color-base-10
--color-base-20
--color-base-25
--color-base-30
--color-base-35
--color-base-40
--color-base-50
--color-base-60
--color-base-70
--color-base-100
--background-primary
--background-primary-alt
--background-secondary
--background-secondary-alt
--background-modifier-hover
--background-modifier-active-hover
--background-modifier-border
--background-modifier-border-hover
--background-modifier-border-focus
--background-modifier-form-field

/* Text and interaction */
--text-normal
--text-muted
--text-faint
--text-on-accent
--text-accent
--text-accent-hover
--text-selection
--interactive-normal
--interactive-hover
--interactive-accent
--interactive-accent-hover
--accent-color
--accent-color-hover
--accent-color-translucent

/* Radius and controls */
--radius-s
--radius-m
--radius-l
--radius-xl
--button-radius
--input-radius
--modal-radius
--tag-radius
--checkbox-radius
--toggle-radius
--tab-radius
```

## Source Discipline

- Treat docs.obsidian.md and obsidian.md/help as official.
- Treat forum posts and community themes as examples, not authoritative API.
- Treat DOM classes as current implementation evidence, not a guaranteed stable API.
