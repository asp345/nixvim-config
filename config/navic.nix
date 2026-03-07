{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    nvim-navic
  ];

  extraConfigLua = ''
    local ok, navic = pcall(require, "nvim-navic")
    if ok then
      navic.setup({
        highlight = true,
        separator = " > ",
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client_id = args.data and args.data.client_id
          if not client_id then
            return
          end

          local client = vim.lsp.get_client_by_id(client_id)
          if client and client.server_capabilities.documentSymbolProvider then
            navic.attach(client, args.buf)
          end
        end,
      })
    end
  '';
}
