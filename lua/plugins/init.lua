local ok, packer = pcall(require, "packer")

if not ok then
    local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        packer_bootstrap = vim.fn.system {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        }
    end

    vim.cmd "packadd packer.nvim"
    packer = require "packer"
    print "Packer cloned successfully."
end

packer.init {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
        prompt_border = "single",
    },
    git = {
        clone_timeout = 600,
    },
    auto_clean = true,
    compile_on_sync = false,
}

return packer.startup(function()
    use { "wbthomason/packer.nvim" }

    -- UI
    use { "rmehri01/onenord.nvim" }
    use { "kyazdani42/nvim-web-devicons", config = require "plugins.config.devicons" }
    use {
        "nvim-lualine/lualine.nvim",
        config = require "plugins.config.lualine",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }
    use {
        "akinsho/bufferline.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = require "plugins.config.bufferline",
    }
    use { "karb94/neoscroll.nvim", config = require "plugins.config.neoscroll" }

    -- Syntax
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "windwp/nvim-ts-autotag",
            "p00f/nvim-ts-rainbow",
        },
        run = ":TSUpdate",
        config = require "plugins.config.treesitter",
    }

    -- Utilities
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = require "plugins.config.nvimtree",
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = require "plugins.config.telescope",
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "windwp/nvim-autopairs", config = require "plugins.config.autopair" }
    use { "tpope/vim-surround" }

    -- LSP
    use {
        "williamboman/nvim-lsp-installer",
        requires = {
            "neovim/nvim-lspconfig",
        },
    }

    use {"folke/lsp-colors.nvim", config = require "plugins.lsp.colors" }
    use {"tami5/lspsaga.nvim", config = require "plugins.lsp.saga" }

    -- -- Lint
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }
    use { "folke/trouble.nvim", config = require "plugins.lsp.trouble" }

    -- -- Completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        config = require "plugins.lsp.cmp",
    }

    -- Git
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = require "plugins.config.gitsigns",
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
