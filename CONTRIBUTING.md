# Contributing

Thank you for helping improve Xuan.

## How to contribute

### 1) Quick start

```bash
npm install
npm run build
npm run dev
```

- `npm run build`: generate `theme.css` from `styles/*.scss`.
- `npm run dev`: watch mode for local style tuning.

For editor exports:

- `zed/*`: theme JSON for Zed import.
- `vscode/*`: theme assets for VS Code extension style usage.
- `docs/*`: brand website assets and install guides.

### 2) Pull request flow

1. Open an issue first if you change behavior.
2. Keep PRs small and single-purpose.
3. Add clear before/after screenshots for UI-impacting changes if possible.
4. If you touch build output, ensure `npm run build` is updated.

### 3) Code style

- Prefer editing SCSS source in `styles/` first, then run build.
- Avoid unnecessary selector-heavy rules; prefer token/variable updates when possible.
- Keep cross-editor exports in sync with `theme-tokens.json` and update related files together.

### 4) Commit message

- Use concise English with scope first, e.g.:
  - `feat: align zed palette tokens`
  - `fix: adjust markdown list spacing in editor`

---

中文说明：

- 提交前建议本地运行构建：`npm run build`
- 若改动涉及界面视觉，尽量附带 `before/after` 说明
- 尽量保持一次 PR 只改一个方向，减少回归风险

