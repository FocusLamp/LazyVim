-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

---- 4 spaces for java files
-- Autocommand for Java files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    -- You might also want to set softtabstop if you use it for smart tab behavior
    vim.opt_local.softtabstop = 4
  end,
})

-- Autocommand for Java files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "c",
--   callback = function()
--     vim.opt_local.tabstop = 4
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.expandtab = true
--     -- You might also want to set softtabstop if you use it for smart tab behavior
--     vim.opt_local.softtabstop = 4
--   end,
-- })

-- Autocommand for Lua files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt_local.softtabstop = 4
  end,
})

-- Disable markdown linting in plugin directories
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*/lazy/*",
    "*/.local/state/nvim/lazy/*",
    "*/.local/share/nvim/lazy/*",
  },
  callback = function()
    local lint = require("lint")
    if lint.linters_by_ft.markdown then
      lint.linters_by_ft.markdown = {}
    end
  end,
})
