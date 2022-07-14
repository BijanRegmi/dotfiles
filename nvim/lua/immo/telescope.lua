local telescope = require("telescope")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local Job = require("plenary.job")

local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Can't preview binary file" })
        end)
      end
    end
  }):sync()
end

telescope.setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    prompt_prefix = " ",
    selection_caret = " ",
    buffer_previewer_maker = new_maker, -- Dont preview binaries
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<C-f>"] = actions.close,

        ["<C-j>"] = actions.preview_scrolling_down,
        ["<C-k>"] = actions.preview_scrolling_up,

        ["<C-\\>"] = actions.select_vertical,
        ["<C-->"] = actions.select_horizontal,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = false, -- C-u clears the prompt

        -- Cycle previewer for git commits to show full message
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
      },

      n = {
        ["esc"] = actions.close,

        ["<C-\\>"] = actions.select_vertical,
        ["<C-->"] = actions.select_horizontal,
        ["<C-t>"] = actions.select_tab,

        ["H"] = actions.move_to_top,
        ["J"] = actions.move_selection_next,
        ["K"] = actions.move_selection_previous,
        ["L"] = actions.move_to_bottom,
        ["M"] = actions.move_to_middle,

        ["<C-j>"] = actions.preview_scrolling_down,
        ["<C-k>"] = actions.preview_scrolling_up,
      }
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      theme = "dropdown",
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
})
