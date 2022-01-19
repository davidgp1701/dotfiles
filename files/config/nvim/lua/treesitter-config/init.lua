local configs_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_status_ok then
   return
end

configs.setup {
  ensure_installed = "maintained",
  ignore_install = { 
    "devicetree", 
    "elixir", 
    "gdscript", 
    "godotResource", 
    "ocamllex", 
    "teal" 
  },
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { 
    enable = true, 
    disable = { 
      "python",
      "ruby",
      "yaml" 
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}
