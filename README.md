# Xuan

> Paper and ink, Song-dynasty inspired. A quiet Obsidian theme built on
> blank space, ink wash, and a single touch of cinnabar.

[![license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

[English](README.md) | [中文](README_zh.md)

## Repository layout

- **Obsidian dev/build source:** root `styles/*.scss`, `scripts/*`, `tests/*`
- **Obsidian shipping entry:** `obsidian/theme.css`, `obsidian/manifest.json`
- **Website:** `docs/index.html`, `docs/styles.css`
- **Zed themes:** `zed/xuan-light.json`, `zed/xuan-dark.json`
- **VS Code themes:** `vscode/package.json`, `vscode/xuan-light.json`,
  `vscode/xuan-dark.json`

`obsidian/theme.css` and `obsidian/manifest.json` are canonical for Obsidian publishing.  
`zed/*` and `vscode/*` are synchronized brand exports, not Obsidian entry points.

## Quick start

- **Obsidian (single source of truth)**:
  copy `obsidian/theme.css` into your Obsidian theme folder
  (`<vault>/.obsidian/themes/Xuan/theme.css`), then enable **Xuan** under
  *Settings → Appearance*.
- **Zed**:
  import `zed/xuan-light.json` or `zed/xuan-dark.json` from Zed theme settings.
- **VS Code**:
  open a terminal at repo root and run:
  `cd vscode && code --install-extension .`  
  (local install from source, no build step needed)
- **Build from source (Obsidian CSS)**: clone, `npm install`, `npm run build`.
  Edit `styles/*.scss` and rebuild to regenerate `theme.css`.

- **Website**: open `docs/index.html` locally, or publish via GitHub Pages with the `/docs` folder.

## Design principles

- **Blank space** — paper as canvas, ink as words
- **Ink wash** — balanced between dark and light
- **Cinnabar** — one touch of red, never competing
- **Quiet** — minimal by default, whitespace everywhere

## Colors

|       | Light   | Dark    |
|:------|:--------|:--------|
| Paper | #F9F7F4 | #242424 |
| Ink   | #3C3C3C | #C9C6C1 |
| Gray  | #F2EFE9 | #2C2C2C |
| Red   | #B13E36 | #D07B73 |

## Fonts

The theme does not hardcode fonts; body and headings follow
*Settings → Appearance → Font* in Obsidian. To fix fonts in source, edit
`--xuan-font-sans` / `--xuan-font-serif` in `styles/_root.scss` and rebuild.
Recommended: Source Han Serif (思源宋体), LXGW WenKai (霞鹜文楷), JetBrains Mono.

## Development

```bash
npm install
npm run build         # styles/*.scss -> theme.css
npm run dev           # watch mode with source map
npm run test:switch   # light/dark switch regression (needs a Playwright CLI
                      # wrapper: PWCLI=/path/to/playwright_cli.sh)
```

## VS Code extension

- `npm` install in `vscode/` directory first if you want to package:
  `cd vscode && npm install`.
- Package to VSIX with the `vsce` tool if installed:
  `npx @vscode/vsce package`.

## License

[MIT](LICENSE)
