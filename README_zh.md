# Xuan 宣纸

> 宣纸质感，宋韵留白。

[English](README.md) | [中文](README_zh.md)

## 仓库结构

- **Obsidian 开发源（源码/构建）：** 根目录 `styles/*`, `scripts/*`, `tests/*`
- **Obsidian 发行入口：** `obsidian/theme.css`, `obsidian/manifest.json`
- **Zed：** `zed/xuan-light.json`、`zed/xuan-dark.json`
- **VS Code：** `vscode/package.json`、`vscode/xuan-light.json`、`vscode/xuan-dark.json`
- **官网：** `docs/index.html`、`docs/styles.css`

`obsidian/theme.css`、`obsidian/manifest.json` 是 Obsidian 的唯一发布入口。  
`zed/*` 与 `vscode/*` 是同色系导出，便于复用，不会影响 Obsidian 主题主入口。

## 素

- **留白** — 以纸为底，择墨而书
- **淡墨** — 浓淡之间，恰如其分
- **点朱** — 一抹印泥，醒神不争
- **无声** — 极简九成，留白九成

## 色

|   | 浅   | 深   |
|:--|:-----|:-----|
| 纸 | #F9F7F4 | #242424 |
| 墨 | #3C3C3C | #C9C6C1 |
| 灰 | #F2EFE9 | #2C2C2C |
| 朱 | #B13E36 | #D07B73 |

## 字体

推荐：思源宋体、霞鹜文楷、思源黑体、JetBrains Mono 等。

## 安装 / 构建

- **直接用（推荐）**：复制仓库中的 `obsidian/theme.css` 到 Obsidian 主题目录，在「设置 → 外观」里启用 Xuan。  
  （这是 Obsidian 主入口）
- **Zed**：导入 `zed/xuan-light.json` 或 `zed/xuan-dark.json`。
- **VS Code**：在仓库根目录执行 `cd vscode && code --install-extension .` 即可本地安装（无需打包）。
- **本地改样式**：克隆后执行 `npm install` 与 `npm run build`，修改 `styles/*.scss` 后重新 build 得到 `theme.css`。

- **官网预览**：打开 `docs/index.html`（GitHub Pages 建议发布到仓库的 `/docs` 目录）。

## VS Code 主题包

- 如需打包为 `.vsix`，先在 `vscode/` 执行 `npm install`，再运行：
  `npx @vscode/vsce package`

## 许可

[MIT](LICENSE)
