# CLAUDE.md

このファイルは、リポジトリ内のコードを扱う際に Claude Code (claude.ai/code) へ提供するガイダンスです。

## 概要

Neovim / WezTerm / clangd のミニマルな dotfiles で、直接シンボリックリンクで管理しています：
- `~/.config/nvim` → `./nvim`
- `~/.config/wezterm` → `./wezterm`
- `~/.config/clangd` → `./clangd`

インストールスクリプト・ビルドシステム・dotfile マネージャーは存在せず、シンボリックリンクは手動で設定します。

## セットアップ

新しい環境では以下を手動で行います。

```bash
ln -s ~/dotfiles/nvim    ~/.config/nvim
ln -s ~/dotfiles/wezterm ~/.config/wezterm
ln -s ~/dotfiles/clangd  ~/.config/clangd
```

Neovim を起動すると lazy.nvim が自動でブートストラップし、LSP サーバ（`lua_ls` / `clangd`）は mason-lspconfig の `ensure_installed` で自動導入されます。ただし**フォーマッタは自動導入されないため、手動でインストールが必要です**。

```vim
:MasonInstall stylua
```

## Neovim (`nvim/`)

プラグインマネージャー：**Lazy.nvim**（`lua/config/lazy.lua` で自動ブートストラップ、`checker` による更新チェック有効）。プラグインは `lua/plugins/` 内に個別ファイルとして配置し、各ファイルが Lazy のプラグイン spec テーブルを返す構成です。

- エントリーポイント：`init.lua` — leader（`<Space>`）と localleader（`\`）を設定し、netrw を無効化してから `config.options` / `config.autocmds` / `config.keymaps` / `config.lazy` / `config.lsp` を require
- `lua/config/options.lua` — スペース4つのタブ、相対行番号、`cursorline`/`cursorcolumn`、`undofile`、`clipboard = unnamedplus`、`list` 表示
- `lua/config/autocmds.lua` — colorscheme は `default` を使用し、`ColorScheme` イベントで背景を透過（WezTerm 側の透明度を活かすため）
- `lua/config/keymaps.lua` — `<Esc><Esc>` で `nohlsearch`、`<Leader>l` で Lazy
- `lua/config/lsp.lua` — 診断フロートの見た目、`<Leader>d` で診断表示、`LspAttach` で `gd`（定義ジャンプ）
- プラグイン追加方法：`lua/plugins/` に Lazy spec を返す新規ファイルを作成

### 導入済みプラグイン

| 領域 | プラグイン |
|---|---|
| LSP | `mason.nvim` / `mason-lspconfig.nvim`（`lua_ls`, `clangd`）、`nvim-lspconfig`、`lazydev.nvim` |
| 補完 | `blink.cmp`（preset = `enter`、`<C-j>`/`<C-k>` で候補移動）、`friendly-snippets` |
| フォーマット | `conform.nvim`（下記参照） |
| ファイラ | `nvim-tree.lua`（netrw 無効化済み） |
| 検索 | `telescope.nvim`、`flash.nvim`、`nvim-hlslens` |
| Git | `gitsigns.nvim`、`diffview.nvim` |
| UI | `bufferline.nvim`、`lualine.nvim`（theme = dracula）、`which-key.nvim`、`nvim-web-devicons` |
| 編集 | `vim-sandwich`、`nvim-autopairs`、`in-and-out.nvim` |
| カラースキーム | catppuccin / kanagawa / gruvbox / rose-pine / tokyonight（全て `lazy = true`。実際に適用しているのは `default`） |

`smear-cursor.nvim` は vim-sandwich と競合するため `enabled = false` で無効化しています。

### フォーマッタ

- `conform.nvim` が保存時に整形（`timeout_ms = 500`、失敗時は `lsp_format = "fallback"` で LSP に委譲）
- Lua は **stylua**（mason で導入。`:MasonInstall stylua` を手動実行する運用）
- **注意**：mason.nvim には `ensure_installed` 相当の設定が存在しないため、LSP サーバと違ってフォーマッタは自動導入されません。stylua が無い環境では conform が `lsp_format = "fallback"` に従い、エラーを出さずに lua_ls の整形へ切り替わります（インデントやクォートのスタイルだけが変わるため気づきにくい）。自動化したい場合は `mason-tool-installer.nvim` の導入を検討してください
- スタイル設定はリポジトリ直下の `stylua.toml`：Unix 改行 / 幅 120 / スペース4 / `AutoPreferSingle` / `call_parentheses = "Always"`
- `nvim/stylua.toml` と `wezterm/stylua.toml` は、そこへの**相対シンボリックリンク**（`../stylua.toml`）です。実体は 1 つで、git も symlink として記録するため clone 時に自動復元されます
- **この構成の理由**：stylua は整形対象ファイルの**祖先ディレクトリを遡って**設定を探します。リポジトリ直下に置くだけでは `~/.config/wezterm/...` 経由で開いたときに探索経路（`~/.config/wezterm` → `~/.config` → `~`）へ現れず、設定が見つからないまま stylua のデフォルト（**タブ・ダブルクォート**）で整形されてしまいます。Neovim は symlink を解決せず、開いたときのパスをそのまま保持するためです。各ディレクトリにリンクを置くことで、実パス・symlink 経由のどちらでも確実に効きます
- 設定を変更するときは実体（`stylua.toml`）を編集します。新しいディレクトリを追加した場合は、そこにも `ln -s ../stylua.toml <dir>/stylua.toml` が必要です
- Neovim の `expandtab` は無関係（conform は stylua の出力でバッファを置換するため）

### 主なキーバインド（leader = `<Space>`）

- `<Leader>ff` / `fg` / `fb` / `fh` / `fc` — Telescope：ファイル / grep / バッファ / ヘルプ / カラースキーム
- `<Leader>e` / `<Leader>E` — NvimTree にフォーカス / 開閉（ツリー内で `g?` がヘルプ）
- `<C-h>` / `<C-l>` — バッファ切り替え、`<C-S-h>` / `<C-S-l>` で並べ替え
- `<Leader>bp` / `bP` / `bc` — バッファの pick / pin / 他を閉じる
- `<Leader>gd` / `gh` / `gc` — Diffview の起動 / ファイル履歴 / 終了
- `<Leader>gp` / `gr` / `gs` / `gu` / `gb`、`]c` / `[c` — gitsigns の hunk 操作と移動
- `<Leader>s` / `<C-s>` — Flash モーション
- `<Leader>d` — 診断表示、`gd` — 定義ジャンプ
- `<Leader>l` / `<Leader>m` — Lazy / Mason
- `<Leader>?` — Which-key ヘルプ

## WezTerm (`wezterm/`)

- メイン設定：`wezterm.lua` — フォント UDEV Gothic 35NF 20pt（タブバーのみ JetBrains Mono Bold 14pt）、カラースキーム MaterialDesignColors、透明度 70%、IME 有効、`front_end = "OpenGL"`（フリッカー対策）、設定の自動リロード有効
- タブタイトルは `format-tab-title` イベントで独自描画（アクティブタブは `#ae8b2d`）
- キーバインド：`keybinds.lua`。leader は **`Ctrl+Space`**、`disable_default_key_bindings = true` で全て手動定義
  - `Leader+d` / `Leader+r` — ペインを垂直 / 水平分割、`Leader+x` で閉じる、`Leader+z` でズーム
  - `Cmd+hjkl` — ペイン移動、`Alt+hjkl` — ペインサイズ調整
  - `Leader+[` — コピーモード、`Leader+p` — コマンドパレット、`Ctrl+q` — QuickSelect
  - `Cmd+t` / `Cmd+w` / `Cmd+1..9` — タブ操作
- **注意**：`keybinds.lua` は `key_tables`（copy_mode / search_mode）も定義していますが、`wezterm.lua` 側の `config.key_tables = ...` はコメントアウトされているため未適用です。コピーモード内の操作は WezTerm のデフォルトになります。

## clangd (`clangd/`)

`config.yaml` — Homebrew の g++-13 を参照し、`-std=gnu++20` と Homebrew の include パスを付与。`-W*` を除去し、`pp_file_not_found` の診断を抑制しています。
