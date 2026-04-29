# CLAUDE.md

このファイルは、リポジトリ内のコードを扱う際に Claude Code (claude.ai/code) へ提供するガイダンスです。

## 概要

Neovim と WezTerm のミニマルな dotfiles で、直接シンボリックリンクで管理しています：
- `~/.config/nvim` → `./nvim`
- `~/.config/wezterm` → `./wezterm`

インストールスクリプト・ビルドシステム・dotfile マネージャーは存在せず、シンボリックリンクは手動で設定します。

## Neovim (`nvim/`)

プラグインマネージャー：**Lazy.nvim**（`lua/config/lazy.lua` で自動ブートストラップ）。プラグインは `lua/plugins/` 内に個別ファイルとして配置し、各ファイルが Lazy のプラグイン spec テーブルを返す構成です。

- エントリーポイント：`init.lua`（`config.lazy` と `config.options` を require）
- エディタ設定：`lua/config/options.lua` — スペース4つのタブ、相対行番号、`<Space>` をリーダーキーに設定
- プラグイン追加方法：`lua/plugins/` に Lazy spec を返す新規ファイルを作成

主なキーバインド（leader = Space）：
- `<leader>ff/fg/fb/fh` — Telescope でファイル検索 / grep / バッファ / ヘルプ
- `<leader>s` / `<C-s>` — Flash モーション
- `<leader>?` — Which-key ヘルプ

## WezTerm (`wezterm/`)

- メイン設定：`wezterm.lua` — フォント（JetBrains Mono 20pt）、Tokyo Night / MaterialDesignColors カラースキーム、透明度 70%、IME 有効
- キーバインド：`keybinds.lua` — `Ctrl+Leader+d/r` でペイン分割、`Ctrl+hjkl` でペイン移動、`Leader+[` でコピーモード
