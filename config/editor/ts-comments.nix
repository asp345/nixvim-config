{
  plugins.ts-comments = {
    enable = true;
    settings.lang = {
      astro = "";
      axaml = "";
      cs_project = "";
      fsharp_project = "";
      html = "";
      kdl = "// %s";
      svelte = "";
      templ = {
        __default = "// %s";
        component_block = "";
      };
      tsx = {
        "/* %s */" = null;
        __default = "// %s";
      };
      vue = "";
      xaml = "";
    };
  };
}
