require'nvim-treesitter.configs'.setup {
   -- A list of parser names, or "all" (the four listed parsers should always be installed)
   ensure_installed = { "javascript", "rust", "c", "lua", "vim", "python", "help" },
   -- Install parsers synchronously (only applied to `ensure_installed`)
   sync_install = false,
   -- Automatically install missing parsers when entering buffer
   -- Recommendation: set to false if you dööö:::Öon't have `tree-sitter` CLI installed locally
   auto_install = true,
   highlight = {
     enable = true,
     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
     -- Using this option may slow down your editor, and you may see some duplicate highlights.
     -- Instead of true it can also be a list of languages
     additional_vim_regex_highlighting = false,
   },
 }
