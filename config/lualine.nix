{ ... }:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
        theme = "auto";
      };
      sections = {
        lualine_x = [
          "encoding"
          {
            __unkeyed-1 = "fileformat";
            symbols = {
              dos = "CRLF";
              mac = "CR";
              unix = "LF";
            };
          }
          "filetype"
        ];
      };
    };
  };
}
