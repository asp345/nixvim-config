{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "lake-dweller.nvim";
      version = "v1.3.2";
      src = pkgs.fetchFromGitHub {
        owner = "yonatanperel";
        repo = "lake-dweller.nvim";
        rev = "v1.3.2";
        sha256 = "0c5ndvjn6gqw6fg8qh8mxadwrijbb3g23qccvfispgq5ydvvxwyb";
      };
    })
  ];

  extraConfigLua = ''
    require("lake-dweller").setup({
      variant = "ocean-dweller",
      transparent = true,
      italics = false,
      float_background = false,
    })

    vim.cmd.colorscheme("lake-dweller")
  '';
}
