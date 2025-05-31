-- Constants
opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Delete without copy
vim.keymap.set("n", "<leader>d", '"_d', opts)
vim.keymap.set("n", "<leader>dd", '"_dd', opts)
vim.keymap.set("v", "<leader>d", '"_d', opts)
vim.keymap.set("n", "x", '"_x', opts)

-- Moving lines up and down
vim.keymap.set("v", "mk", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "mj", ":m '>+1<CR>gv=gv", opts)

-- Incremental search with `n` and `N`
vim.keymap.set("n", "<C-n>", "/\\v", opts)
vim.keymap.set("n", "<C-N>", "?\\v", opts)
vim.keymap.set("n", "<Esc>", ":nohl<CR>", opts)

-- Save the file
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Save and quit
vim.keymap.set("n", "<C-q>", ":wq<CR>", opts)

-- Quit without saving
vim.keymap.set("n", "<C-c>", ":q!<CR>", opts)

-- Search current word
vim.keymap.set("n", "<leader>fw", "*", { noremap = true })
vim.keymap.set("n", "<leader>bw", "#", { noremap = true })

-- Center screen after search
vim.keymap.set("n", "N", "nzzzv", { noremap = true })
vim.keymap.set("n", "n", "Nzzzv", { noremap = true })

-- Selection rules on indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Replacing words in file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], {desc =  "replace word globally in a file"})

-- Make current buffer executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "highlights text being yanked",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function() 
        vim.highlight.on_yank()
    end,
})

-- Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", opts)         -- Open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", opts)       -- Close tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts)           -- Next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts)           -- Previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", opts)       -- Open current tab in a new tab

-- Splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts)                  -- Split vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts)                  -- Split horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)                  -- Create split windows of equal dimensions
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts)          -- Close split

-- Copy file path to clipboard
vim.keymap.set("n", "<leader>fp", function()
    local filePath = vim.fn.expand("%:~")
    vim.fn.setreg("+", filePath)
    print("Filepath copied to clipboard: " .. filePath)
end, {
    desc = "copies file path to clipboard"
})
