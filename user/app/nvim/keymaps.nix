{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<C-s>";
        action = ":w<CR>";
        options.desc = "Saves actual buffer to file";
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Moves to the window on the left";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Moves to cursor down a window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Moves the cursor up a window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Moves to the window on the right";
      }
      {
        mode = "n";
        key = "<M-k>";
        action = ":resize +2<CR>";
        options.desc = "Resizes the window from the top side";
      }
      {
        mode = "n";
        key = "<M-j>";
        action = ":resize -2<CR>";
        options.desc = "Resizes the window from the button side";
      }
      {
        mode = "n";
        key = "<M-h";
        action = ":vertical resize -2<CR>";
        options.desc = "Resizes the window from the left side";
      }
      {
        mode = "n";
        key = "<M-l>";
        action = ":vertical resize +2<CR>";
        options.desc = "Resizes the window from the right side";
      }
      {
        mode = "n";
        key = "<S-l>";
        action = ":bnext<CR>";
        options.desc = "Moves to the next buffer";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = ":bprevious<CR>";
        options.desc = "Moves to the previous buffer";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options.desc = "Moves half page down and centers the cursor in the middle of the screen";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options.desc = "Moves half page up and centers the cursor in the middle of the screen";
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options.desc = "Searchs item an centers the cursor in the middle of the screen";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options.desc = "Back searchs item and cetners cursor in the middle of the screen";
      }
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options.desc = "Moves selected text indentation to the left";
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options.desc = "Moves selected text indentation to the right";
      }
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options.desc = "Moves selected line down";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options.desc = "Moves selected line up";
      }
      {
        mode = "v";
        key = "<leader>p";
        action = "\"_dp";
        options.desc = "Pastes test without overwritting the clipboard";
      }
      {
        mode = "n";
        key = "<leader>y";
        action = "\"+y";
        options.desc = "Copies to the OS clipboard";
      }
      {
        mode = "v";
        key = "<leader>y";
        action = "\"+y";
        options.desc = "Copies to the OS clipboard";
      }
      {
        mode = "n";
        key = "<leader>d";
        action = "\"_d";
        options.desc = "Deletes text without copying it to the clipboard";
      }
      {
        mode = "v";
        key = "<leader>d";
        action = "\"_d";
        options.desc = "Deletes text without copying it to the clipboard";
      }
      {
        mode = "n";
        key = "<leader>se";
        action = ":setlocal spell spelllang=en_us<CR>";
        options.desc = "Enables the English spellcheck for the actual buffer";
      }
      {
        mode = "n";
        key = "<leader>sd";
        action = ":set nospell<CR>";
        options.desc = "Disables the spellchecker for the actual buffer";
      }
      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>!chmod +x %<CR>";
        options.desc = "Makes the actual file executable";
      }
    ];
  };
}
