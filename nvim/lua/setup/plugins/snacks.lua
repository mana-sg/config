return {

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,

        opts = {
            bigfile = { enabled = true },
            dashboard = {
              preset = {
                pick = nil,
                keys = {
                  { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                  { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                  { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                  { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                  { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                  { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                  { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                  { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = [[
                                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
              ]],
              },
              sections = {
                { section = 'header' },
                {
                  section = "keys",
                  indent = 1,
                  padding = 1,
                },
                { section = 'recent_files', icon = ' ', title = 'Recent Files', indent = 3, padding = 2 },
                { section = "startup" },
              },
            },

            explorer = {
                enabled = true,
                layout = {
                    circle = false
                },
            },

            picker = {
                enabled = true,
                matchers = {
                    frecency = true,
                    cwd_bonus = true,
                },
                formatters = {
                    file = {
                        filename_first = false,
                        filename_only = false,
                        icon_width = 2,
                    },
                },

                layout = {
                    preset = "telescope",
                    cycle = false,
                },

                layouts = {
                    select = {
                        preview = false,
                        layout = {
                            backdrop = false,
                            width = 0.6,
                            min_width = 80,
                            height = 0.4,
                            min_height = 10,
                            box = "vertical",
                            border = "rounded",
                            title = "{title}",
                            title_pos = "center",
                            { win = "input", height = 1, border = "bottom" },
                            { win = "list", border = "none" },
                            { win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" }
                        },
                    },
                    telescope = {
                        reverse = true,
                        layout = {
                            box = "horizontal",
                            backdrop = false,
                            width = 0.8,
                            height = 0.9,
                            border = "none",
                            {
                                box = "vertical",
                                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                                { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
                            },
                            {
                                win = "preview",
                                title = "{preview:Preview}",
                                width = 0.50,
                                border = "rounded",
                                title_pos = "center",
                            },
                        },
                    },
                    ivy = {
                        layout = {
                            box = "vertical",
                            backdrop = false,
                            width = 0,
                            height = 0.4,
                            border = "top",
                            position = "top",
                            title = "{title} {live} {flags}",
                            { win = "input", height = 1, border = "bottom" },
                            {
                                box = "horizontal",
                                { win = "list", border = "none" },
                                { win = "preview",  border = "left", title = "{preview}", width = 0.5 },
                            },
                        },
                    },

                },
            },
        },

        keys = {
            { "<leader>gl", function() require("snacks").lazygit() end, desc = "Lazygit" },
            { "<leader>lg", function() require("snacks").lazygit.log() end, desc = "Lazygit logs" },
            { "<leader>es", function() require("snacks").explorer() end, desc = "Snacks file explorer" },
            { "<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Rename current file" },
            { "<leader>ff", function() require("snacks").picker.files() end, desc = "File search" },
            { "<leader>fg", function() require("snacks").picker.grep() end, desc = "Grep" },
            { "<leader>fwg", function() require("snacks").picker.grep_word() end, desc = "Grep Word" },
            { "<leader>fk", function() require("snacks").picker.keymaps({ layout = "ivy" }) end, desc = "Keymaps menu" },
            { "<leader>fh", function() require("snacks").picker.help() end, desc = "Help pages" },
        },
    },

    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            { "<leader>pt", function() require("snacks").picker.todo_comments() end, desc = "Todo" },
        },
    }
}
