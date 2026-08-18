# Obsidian 目录（主入口）

这里是 Obsidian 的发布入口文件。  
核心入口为：

- `theme.css`：Obsidian 主题主文件（唯一官方入口）
- `manifest.json`：主题元信息

说明：

- 根目录的 `theme.css` 与 `styles/*` 仍是源码/构建入口，方便继续在仓库里改样式并产出主题。
- 需要和网站/文档对齐时，建议手动同步：
  - `theme.css` -> `obsidian/theme.css`
  - `manifest.json` -> `obsidian/manifest.json`

