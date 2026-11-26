{
  plugins = {
    blink-cmp-git.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        keymap = {
          "<C-l>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
          "<C-e>" = [
            "hide"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"
          ];
          "<Tab>" = [
            "select_next"
            "snippet_forward"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "snippet_backward"
            "fallback"
          ];
          "<C-p>" = [
            "select_prev"
            "fallback"
          ];
          "<C-n>" = [
            "select_next"
            "fallback"
          ];
          "<C-up>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-down>" = [
            "scroll_documentation_down"
            "fallback"
          ];
        };
        signature.enabled = true;
        sources = {
          default = [
            "buffer"
            "lsp"
            "path"
            "snippets"
            "git"
          ];
          providers = {
            lsp.score_offset = 4;
            git = {
              name = "Git";
              module = "blink-cmp-git";
              enabled = true;
              score_offset = 100;
              should_show_items.__raw = ''
                function()
                  return vim.o.filetype == 'gitcommit' or vim.o.filetype == 'markdown'
                end
              '';
              opts.git_centers.github.issue.on_error.__raw = "function(_,_) return true end";
            };
          };
        };
        completion = {
          list.selection = {
            preselect = false;
            auto_insert = false;
          };
          trigger.show_in_snippet = false;
          documentation.auto_show = true;
          accept.auto_brackets.enabled = false;
        };
      };
    };
  };
}
