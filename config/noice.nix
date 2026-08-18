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
        enabled = false;
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
