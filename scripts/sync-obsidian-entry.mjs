import { mkdirSync, copyFileSync } from "node:fs";

mkdirSync("obsidian", { recursive: true });
copyFileSync("theme.css", "obsidian/theme.css");
copyFileSync("manifest.json", "obsidian/manifest.json");
