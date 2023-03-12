--- 
--- tt.setup{
---   -- size can be a number or function which is passed the current terminal
---   size = 20 | function(term)
---     if term.direction == "horizontal" then
---       return 15
---     elseif term.direction == "vertical" then
---       return vim.o.columns * 0.4
---     end
---   end,
--- }
--- 
--- keymap.set("n", "<leader>QE", function() ui.nav_file(1) end)
--- keymap.set("n", "<leader>q", tt.toggleterm)
local nvim = vim
local keymap = nvim.keymap


function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
nvim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
