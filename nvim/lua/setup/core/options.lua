vim.cmd("let g:netrw_banner = 0")

-- general
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

--  cursor
vim.opt.guicursor = {
  "n-v-c:block",       
  "i-ci-ve:ver25",     
  "r-cr:hor20",        
  "o:hor50",           
}

-- tab spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true

-- search
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- misc but important
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.backspace = {"start", "eol", "indent"}
vim.opt.updatetime = 50
vim.opt.clipboard:append("unnamedplus")

-- misc 
vim.opt.mouse = "a"
vim.g.editorconfig = true
