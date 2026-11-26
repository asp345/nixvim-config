{ pkgs, ... }:
{
  extraPackagesAfter = with pkgs; [
    curl
    grpcurl
    libxml2
    openssl
    websocat
    jq
  ];

  plugins.kulala = {
    enable = true;
    settings = {
      contenttypes = {
        "application/json" = {
          formatter = [
            "jq"
            "."
          ];
          ft = "json";
        };
        "application/xml" = {
          formatter = [
            "xmllint"
            "--format"
            "-"
          ];
          ft = "xml";
          pathresolver = [
            "xmllint"
            "--xpath"
            "{{path}}"
            "-"
          ];
        };
        "text/html" = {
          formatter = [
            "xmllint"
            "--format"
            "--html"
            "-"
          ];
          ft = "html";
          pathresolver = [ ];
        };
      };
      debug = false;
      default_env = "dev";
    };
  };
  keymaps = [
    {
      key = "<leader>Rs";
      mode = [
        "n"
        "v"
      ];
      action.__raw = "function() require('kulala').run() end";
      options.desc = "Send request";
    }
    {
      key = "<leader>Ra";
      mode = [
        "n"
        "v"
      ];
      action.__raw = "function() require('kulala').run_all() end";
      options.desc = "Send all requests";
    }
    {
      key = "<leader>Rb";
      mode = [
        "n"
        "v"
      ];
      action.__raw = "function() require('kulala').scratchpad() end";
      options.desc = "Open scratchpad";
    }
  ];
}
