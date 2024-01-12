
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    'nvim-lua/plenary.nvim',
    'ThePrimeagen/harpoon',
    { 'nvim-treesitter/nvim-treesitter' },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'}, 
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig",
    "eandrju/cellular-automaton.nvim",
    "williamboman/mason.nvim"
})
