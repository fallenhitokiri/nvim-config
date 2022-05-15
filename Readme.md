# Base install
required: neovim 0.7, exuberant-ctags, python3, python3-pip

install `pynvim` via pip

install rust `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

ripgrep & bat: best install via cargo
`cargo install ripgrep bat`

keybindings: lua/mapping.lua
LSP keybindings: lua/plugins/lsp/init.lua

LSP servers: lua/plugins/lsp/init.lua:servers

Install language servers: https://github.com/kabouzeid/nvim-lspinstall
Install Syntax https://github.com/nvim-treesitter/nvim-treesitter

