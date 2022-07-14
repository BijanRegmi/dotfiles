local settings = {
    backup = false,                         -- Create backup file
    swapfile = false,                       -- Disable creating swap file
    fileformat = "unix",                    -- File format
    encoding = "utf-8",                     -- Encoding type
    fileencoding = "utf-8",                 -- File encoding type

    number = true,                          -- Set numbered lines
    relativenumber = true,                  -- Display line nr relative to current line

    autoindent = true,                      -- Automatice indentation
    smartindent = true,
    shiftwidth = 4,                         -- Number of spaces inserted for each indentation
    expandtab = true,                       -- Convert tabs to spaces
    tabstop = 4,                            -- Number of spaces for tab
    showtabline = 2,                        -- Always show tabs
    softtabstop = 4,

    splitright = true,                      -- Opens horizontal split to right
    splitbelow = true,                      -- Opens vertical split to down

    pumheight = 10,                         -- Pop up menu height
    cmdheight = 2,                          -- Command height
    scrolloff = 8,                          -- Number of lines to leave at end
    updatetime = 100,                       -- Faster completion
    
    showmode = false,                       -- Hide the mode we are in
    clipboard = "unnamedplus",              -- Copy paste between vim and everything
    backspace = {"indent", "eol", "start"},
    cursorline = false,                     -- Disbale cursor line
    signcolumn = "yes",                     -- Enable sign column everytime
    termguicolors = true,                   -- Enable terminal colors
}

for key, value in pairs(settings) do
    vim.opt[key] = value
end

vim.cmd [[
try
  colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
