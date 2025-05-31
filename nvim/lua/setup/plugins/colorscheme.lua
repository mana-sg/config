return {
    {
        "git@github.com:catppuccin/nvim.git",
        name = "catppuccin",
        priority = 1000,
        
        config = function()
            -- vim.cmd("colorscheme catppuccin-mocha")
        end,
    },
    {
        "git@github.com:nyoom-engineering/oxocarbon.nvim.git",
        name = "oxocarbon",
        priority = 1000,

        config = function()
            vim.opt.background = "dark"
            vim.cmd("colorscheme oxocarbon")
        end,
    }
}
