return {
  -- Mason: installs and manages external tools like LSP servers
  {
    'mason-org/mason.nvim',
    opts = {},
  },

  -- Mason-LSPConfig: tells Mason which servers to install and links them to lspconfig
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'lua_ls', -- Lua (great for editing Neovim config)
        'pyright', -- Python
	      'ruff', -- Python linter
        'ts_ls', -- TypeScript / JavaScript
        'rust_analyzer', -- Rust
        'clangd', -- C / C++
      },
    },
  },

  -- nvim-lspconfig: connects Neovim to installed LSP servers
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config('*',{}) -- Default config for all lsps
      vim.lsp.config('pyright', {
		settings = {
	      pyright = {
	        -- Using Ruff's import organizer
	        disableOrganizeImports = true,
	      },
	      python = {
	        analysis = {
		      -- Ignore all files for analysis to exclusively use Ruff for linting
		      ignore = { '*' },
	        },
	      },
	    },
      })
    end
  },
}

