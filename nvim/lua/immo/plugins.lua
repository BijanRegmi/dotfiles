local fn = vim.fn

-- Install packer if it is not installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path})
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Reload packer whenever this file is changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Using protected calls to prevent errors 
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Failed to require packer.")
    return
end

-- Use popup display for packer window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({
                border = "rounded"
            })
        end
    }
})

return packer.startup(function(use)

    use("wbthomason/packer.nvim") -- Manage packer
    use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

    -- Bars
    use("vim-airline/vim-airline")
    use("vim-airline/vim-airline-themes")
    use({
        'akinsho/bufferline.nvim',
        tag = "v2.*"
    })

    -- Explorer
    use({"kyazdani42/nvim-tree.lua",requires = {"kyazdani42/nvim-web-devicons"},tag = 'nightly'})
    use({'nvim-telescope/telescope.nvim', tag = '0.1.0'})

    -- Styling
    use('arcticicestudio/nord-vim')
    use('ryanoasis/vim-devicons')
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }) -- Syntax highlighting
    use('lewis6991/gitsigns.nvim')

    -- LSP
    use('neovim/nvim-lspconfig')
    use('williamboman/nvim-lsp-installer')

    -- Formatter
    use('jose-elias-alvarez/null-ls.nvim')

    -- Autocompletion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('L3MON4D3/LuaSnip')
    use('onsails/lspkind-nvim')

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
