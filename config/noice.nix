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
        enabled = false;
      };
      lsp = {
        message = {
          enabled = false;
        };
        progress = {
          enabled = false;
        };
      };
    };
  };
}
