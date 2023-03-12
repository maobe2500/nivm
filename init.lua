require("configs.packer")
require("configs.remap")
require("configs.lsp")
require("configs.undotree")
require("configs.harpoon")
require("configs.fugitive")
require("configs.dashboard")
require("configs.zoxide")


vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()

vim.cmd [[colorscheme catppuccin]]
vim.cmd [[set number]]
vim.cmd [[set nowrap]]
vim.cmd [[set tabstop=2]]
vim.cmd [[set shiftwidth=2]]
vim.cmd [[set expandtab]]
vim.cmd [[set relativenumber]]

--- vim.cmd [[lua ColorMyPencils()]]
