# Xuan

> Paper and ink, Song-dynasty inspired. A quiet Obsidian theme built on
> blank space, ink wash, and a single touch of cinnabar.

[![license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

[English](README.md) | [中文](README_zh.md)

## Quick start

- **Use as-is**: copy `theme.css` into your Obsidian themes folder
  (`<vault>/.obsidian/themes/Xuan/theme.css`), then enable **Xuan** under
  *Settings → Appearance*.
- **Build from source**: clone, `npm install`, `npm run build`. Edit
  `styles/*.scss` and rebuild to regenerate `theme.css`.

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

## License

[MIT](LICENSE)
