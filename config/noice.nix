{
  extraConfigLuaPre = ''
    package.preload["noice.view.backend.fidget"] = function()
      local noice_require = require("noice.util.lazy")
      local View = noice_require("noice.view")

      local defaults = {
        group = "default",
        merge = false,
        timeout = nil,
      }

      local FidgetView = View:extend("FidgetView")

      function FidgetView:is_available()
        return pcall(_G.require, "fidget.notification")
      end

      function FidgetView:update_options()
        self._opts = vim.tbl_deep_extend("force", defaults, self._opts)
      end

      local function normalize_level(level)
        if type(level) == "string" then
          return vim.log.levels[level:upper()] or level
        end
        return level
      end

      function FidgetView:_notify(msg)
        local ok, fidget = pcall(_G.require, "fidget.notification")
        if not ok then
          return
        end

        local opts = {
          group = self._opts.group,
          ttl = self._opts.ttl or (self._opts.timeout and self._opts.timeout / 1000),
          annote = msg.title or self._opts.annote,
          skip_history = self._opts.skip_history,
        }

        fidget.notify(msg.content, normalize_level(self._opts.level or msg.level), opts)
      end

      function FidgetView:show()
        if self._opts.merge then
          self:_notify({
            content = self:content(),
            messages = self._messages,
          })
        else
          for _, message in ipairs(self._messages) do
            self:_notify({
              content = message:content(),
              messages = { message },
              title = message.opts and message.opts.title or nil,
              level = message.level,
            })
          end
        end

        self:clear()
      end

      function FidgetView:hide() end

      function FidgetView.dismiss() end

      return FidgetView
    end
  '';

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
        view = "fidget";
        view_error = "fidget";
        view_warn = "fidget";
        view_search = "fidget";
      };
      notify = {
        enabled = false;
      };
      views = {
        fidget = {
          backend = "fidget";
          fallback = "mini";
          format = "notify";
        };
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
