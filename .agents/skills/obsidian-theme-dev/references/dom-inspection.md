# Obsidian DOM Inspection Workflow

Obsidian has no complete official class-name API for themes. CSS variables are the stable layer; DOM classes must be verified against the running app or current app CSS.

## When To Inspect DOM

Inspect before writing selectors for:

- Menus, popovers, modals, prompts, dropdowns, settings panes.
- CodeMirror editor internals.
- Workspace tabs, ribbons, file explorer, sidebars.
- Plugin UIs that do not expose documented theme variables.
- Any selector longer than two classes.

## DevTools Workflow

1. Open Obsidian desktop.
2. Open Developer Tools:
   - macOS: `Cmd+Option+I`
   - Windows/Linux: `Ctrl+Shift+I`
3. Use the element picker and click the affected UI.
4. In the Elements panel, copy only the minimal stable wrapper and target class.
5. In the Styles/Computed panel, check whether a CSS variable already controls the property.
6. If a variable exists, override the variable instead of the class.
7. If a class selector is required, keep it scoped:
   - Theme-owned wrapper, e.g. `.xuan-*`
   - Obsidian component wrapper, e.g. `.modal`, `.menu`, `.workspace-tab-header`
   - Plugin wrapper, e.g. `.notebook-navigator`

## Selector Quality Rules

Prefer:

```css
.modal {
  border-radius: var(--modal-radius);
}

.notebook-navigator .nn-file {
  background-color: var(--background-modifier-hover);
}
```

Avoid:

```css
body .workspace .workspace-split .workspace-tabs .workspace-leaf .view-content div div button span {
  color: #999;
}
```

## Local Search Workflow

Before editing, search both source and generated CSS:

```bash
rg -n "modal|prompt|popover|dropdown|suggestion|menu" styles theme.css
rg -n "--modal-|--popover-|--input-|--button-|--toggle-|--tab-" styles theme.css
```

After editing, rebuild and scan:

```bash
npm run build
rg -n "9999px|border-radius:\\s*[0-9]{2,}px|rgba\\([^)]*,\\s*0\\.[0-8]" theme.css
```

Adjust the scans for the specific complaint. Do not mechanically remove transparency where it is used only for hover/selection state.
