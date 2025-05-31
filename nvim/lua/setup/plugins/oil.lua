return {
  'git@github.com:stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  lazy = false,
  config = function()
    require("oil").setup({
        default_file_explorer = true,
            -- Id is automatically added at the beginning, and name at the end
            -- See :help oil-columns
            columns = {
                "icon",
                "permissions",
                "size",
                -- "mtime",
            },
          
            keymaps = {
                ["-"] = { "actions.parent", mode = "n" },
            },

            delete_to_trash = true,
            skip_confirm_for_simple_edits = false,
            prompt_save_on_select_new_entry = true,
            cleanup_delay_ms = 2000,
            view_options = {
                show_parent = true,
            },
        })
        vim.keymap.set("n", "<leader>ef", "<CMD>Oil<CR>")
    end,
}
