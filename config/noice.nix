{
  plugins.noice = {
    enable = true;
    autoLoad = true;
    settings = {
      cmdline = {
        enabled = true;
        view = "cmdline_popup";
      };
      messages = {
        enabled = true;
        view = "mini";
        view_error = "mini";
        view_warn = "mini";
        view_search = "mini";
      };
      notify = {
        enabled = true;
        view = "mini";
      };
      lsp = {
        message = {
          enabled = true;
          view = "mini";
        };
        progress = {
          enabled = true;
          view = "mini";
        };
      };
    };
  };
}
