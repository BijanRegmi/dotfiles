local options = {
    noremap = true,
    silent = true
}
local keymap = vim.api.nvim_set_keymap

-- Assing space as leader key
keymap("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Input Manipulation
keymap('n', "<A-j>", ":m .+1<CR>==", options) -- Move line down
keymap('n', "<A-k>", ":m .-2<CR>==", options) -- Move line up
keymap('i', "<A-j>", "<Esc>:m .+1<CR>==gi", options) -- Move line down
keymap('i', "<A-k>", "<Esc>:m .-2<CR>==gi", options) -- Move line up
keymap('v', "<A-j>", ":m '>+1<CR>gv=gv", options) -- Move block of lines down
keymap('v', "<A-k>", ":m '<-2<CR>gv=gv", options) -- Move block of lines up
keymap('n', 'xx', '"_dd', options) -- Delete without copying to register
keymap('v', 'x', '"_d', options)

-- Buffer
keymap('n', "<C-n>", ":BufferLineCycleNext<CR>", options) -- Go to next buffer
keymap('n', "<C-p>", ":BufferLineCyclePrev<CR>", options) -- Go to previous buffer
keymap('n', "<leader>n", ":BufferLineMoveNext<CR>", options) -- Move current buffer to right
keymap('n', "<leader>p", ":BufferLineMovePrev<CR>", options) -- Move current buffer to left
keymap('n', "<leader>w", ":bd<CR>", options) -- Close current buffer
keymap('n', "<leader>g", ":BufferLinePick<CR>", options) -- Pick a buffer to go to
keymap('n', "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", options)
keymap('n', "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", options)
keymap('n', "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", options)
keymap('n', "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", options)
keymap('n', "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", options)
keymap('n', "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", options)
keymap('n', "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", options)
keymap('n', "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", options)
keymap('n', "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", options)

-- Window   
keymap('n', "<leader>\\", ":vsp<CR>", options) -- Open vertical split
keymap('n', "<leader>-", ":sp<CR>", options) -- Open horizontal split
keymap('n', "<leader>j", "<C-W><C-J>", options) -- Move to left  split window
keymap('n', "<leader>k", "<C-W><C-K>", options) -- Move to below split window
keymap('n', "<leader>l", "<C-W><C-L>", options) -- Move to right split window
keymap('n', "<leader>h", "<C-W><C-H>", options) -- Move to above split window
keymap('n', "re", ":resize<CR>", options) -- Max number of rows
keymap('n', "rs", ":resize 0<CR>", options) -- 0 rows
keymap('n', "ce", ":vertical resize<CR>", options) -- Max number of columns
keymap('n', "cs", ":vertical resize 0<CR>", options) -- 0 columns
keymap("n", "<C-Up>", ":resize +2<CR>", options) -- Expand row size
keymap("n", "<C-Down>", ":resize -2<CR>", options) -- Reduce row size
keymap("n", "<C-Left>", ":vertical resize -2<CR>", options) -- Expand column size
keymap("n", "<C-Right>", ":vertical resize +2<CR>", options) -- Reduce column size

-- Explorer
keymap('n', "<C-e>", ":NvimTreeFocus<CR>", options)
keymap('n', "<C-b>", ":NvimTreeToggle<CR>", options)
keymap('n', "<C-f>", ":Telescope find_files<CR>", options)
keymap('n', "<C-g>", ":Telescope live_grep<CR>", options)

-- Git
keymap('n', "gbl", ":Gitsigns blame_line<CR>", options)
keymap('n', "ghp", ":Gitsigns preview_hunk<CR>", options)
keymap('n', "gnh", ":Gitsigns next_hunk<CR>", options)
keymap('n', "gph", ":Gitsigns prev_hunk<CR>", options)
keymap('n', "gdt", ":Gitsigns diffthis<CR>", options)
keymap('n', "gsh", ":Gitsigns stage_hunk<CR>", options)
keymap('n', "grh", ":Gitsigns reset_hunk<CR>", options)
keymap('n', "grb", ":Gitsigns reset_buffer<CR>", options)
keymap('n', "guh", ":Gitsigns undo_stage_hunk<CR>", options)
keymap('n', "gsb", ":Gitsigns stage_buffer<CR>", options)

-- Formatter
keymap('n', "<leader>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>", options)
keymap('v', "<leader>f", "<Cmd>lua vim.lsp.buf.range_formatting()<CR>", options)
