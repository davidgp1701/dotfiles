{
  programs.nixvim.plugins = {
    gitsigns = {
      enable =  true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "]h";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({']h', bang = true})
          else
            gs.nav_hunk('next')
          end
        end
      '';
      options.desc = "Go to next Git Hunk";
    }
    {
      mode = "n";
      key = "[h";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({'[h', bang = true})
          else
            gs.nav_hunk('prev')
          end
        end
      '';
      options.desc = "Go to previous Git Hunk";
    }
    {
      mode = "n";
      key = "<leader>hs";
      action = "gs.stage_hunk";
      options.desc = "Stage Hunk";
    }
    {
      mode = "n";
      key = "<leader>hr";
      action = "gs.reset_hunk";
      options.desc = "Reset the actaul hunk";
    }
    {
      mode = "v";
      key = "<leader>hs";
      action.__raw = ''
        function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end
      '';
      options.desc = "Stage selected text in the hunk";
    }
    {
      mode = "v";
      key = "<leader>hr";
      action.__raw = ''
        function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end
      '';
      options.desc = "Reset the changes in the actual hung";
    }
    {
      mode = "n";
      key = "<leader>hS";
      action = "gs.stage_buffer";
      options.desc = "Stage buffer";
    }
    {
      mode = "n";
      key = "<leader>hu";
      action = "gs.undo_stage_hunk";
      options.desc = "Undo the staged hunk";
    }
    {
      mode = "n";
      key = "<leader>hR";
      action = "gs.reset_buffer";
      options.desc = "Reset all hunks in the buffer";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action = "gs.preview_hunk";
      options.desc = "Preview hunk";
    }
    {
      mode = "n";
      key = "<leader>hb";
      action.__raw = ''
        function() gs.blame_line{full=true} end
      '';
      options.desc = "See the current hunk line blame";
    }
    {
      mode = "n";
      key = "<leader>tb";
      action = "gs.toggle_current_line_blame";
      options.desc = "See the current line blame";
    }
    {
      mode = "n";
      key = "<leader>hd";
      action = "gs.diffthis";
      options.desc = "See a diff view of the actual hunk";
    }
    {
      mode = "n";
      key = "<leader>hD";
      action.__raw = ''
        function() gs.diffthis('~') end
      '';
      options.desc = "See a diff view of the actual hunk";
    }
    {
      mode = "n";
      key = "<leader>td";
      action = "gs.toggle_deleted";
      options.desc = "Toggle deleted hunk";
    }
  ];
}
