-- version 1.0 mb. Mon 04 Nov 2024 16:01:51 CET 
-- Adding closing
-- Adding '-' to cmd.Ex

vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "-", vim.cmd.Ex)

-- With J you can move up the selected area
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Amikor <leader>y nyomunk, akkor a system clipboard-ba
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")

-- Amikor megnyomod a <leader>s akkor azt a szót ahol vagy mindenhol a fájlban kicseréli
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")
vim.keymap.set("n", "<leader><F1>", "<cmd>!uptime<CR>")

vim.keymap.set('n', '<leader>time', [=[
  :normal! i]=]..os.date()..[=[<CR>
]=], {noremap = true, silent = true})

-- auto add closing {, [, (, ', ", <
vim.keymap.set('i', '{<cr>', '{<cr>}<ESC>kA<CR>', {})
closing_pairs = {'}', ')', ']', '"', "'"}
opening_pairs = {'{', '(', '[', '"', "'"}
for key, chr in pairs(opening_pairs)
do
  vim.keymap.set('i', chr, chr..closing_pairs[key]..'<esc>i', {})
end

-- use U for redo :))
vim.keymap.set('n', 'U', '<C-r>', {})

-- Toggle see whitespace characters like: eol, space, ...
vim.opt.lcs = 'tab:>-,eol:$,nbsp:X,trail:#'

-- Set enter character visible
vim.keymap.set('n', '<F6>', ':set list!<cr>')

-- Alt/Meta + c to capitalize the inner word
vim.keymap.set('n', '<M-c>', 'guiw~w', defaults)

-- Using H/L to go to the begining and the end of line
-- Note: H will map to _ (the first non-whitespace character of a line)
-- It would be helpful if it is a indent line in some languages like Python, Ruby, YAML, ...
vim.keymap.set('n', 'H', '_', defaults)
vim.keymap.set('n', 'L', '$', defaults)

