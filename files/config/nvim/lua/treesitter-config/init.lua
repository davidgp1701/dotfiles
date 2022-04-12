local configs_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_status_ok then
   return
end

configs.setup {
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "c_sharp",
    "clojure",
    "cmake",
    "comment",
    "cpp",
    "css",
    "cuda",
    "dart",
    "dockerfile",
    "erlang",
    "glsl",
    "go",
    "graphql",
    "hcl",
    "help",
    "hjson",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json5",
    "kotlin",
    "latex",
    "llvm",
    "lua",
    "make",
    "ninja",
    "norg",
    "perl",
    "php",
    "python",
    "r",
    "regex",
    "rst",
    "ruby",
    "rust",
    "scala",
    "scheme",
    "sparql",
    "todotxt",
    "toml",
    "typescript",
    "vim",
    "vue",
    "wgsl",
    "yaml",
    "yang",
    "zig"
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
