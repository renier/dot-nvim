local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	colored = false,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = "+", modified = "±", removed = "-" }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
  icons_enabled = true,
	fmt = function(str)
		return " " .. str .. " "
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
  colored = true,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 1,
}

local filename = {
  "filename",
  path = 1,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "solarized_dark",
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = '' },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
    ignore_focus = { "NvimTree", "alpha", "dashboard", "Outline", "TelescopePrompt" },
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diff },
		lualine_c = { filename },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { "encoding", filetype },
		lualine_y = { spaces },
		-- lualine_z = { progress },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { branch, diff },
		lualine_c = { filename },
		lualine_x = { "encoding", filetype },
		lualine_y = { spaces },
		lualine_z = { "location" },
	},
	tabline = {
    lualine_a = {
      {
        "buffers",
        show_filename_only = true,   -- Shows shortened relative path when set to false.
        hide_filename_extension = false,   -- Hide filename extension when set to true.
        show_modified_status = true, -- Shows indicator when the buffer is modified.
		    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "TelescopePrompt" },

        mode = 0, -- 0: Shows buffer name
                  -- 1: Shows buffer index
                  -- 2: Shows buffer name + buffer index
                  -- 3: Shows buffer number
                  -- 4: Shows buffer name + buffer number

        max_length = vim.o.columns, -- Maximum width of buffers component,
                                    -- it can also be a function that returns
                                    -- the value of `max_length` dynamically.
        filetype_names = {
          TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
          packer = 'Packer',
          fzf = 'FZF',
          alpha = 'Alpha',
          NvimTree = 'NvimTree',
        }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

        buffers_color = {
          -- Same values as the general color option can be used here.
          -- active = 'lualine_a_normal',     -- Color for active buffer.
          -- inactive = 'lualine_a_inactive', -- Color for inactive buffer.
          active = nil,     -- Color for active buffer.
          inactive = nil, -- Color for inactive buffer.
        },

        symbols = {
          modified = ' ●',      -- Text to show when the buffer is modified
          alternate_file = ' ', -- Text to show to identify the alternate file
          directory =  '',     -- Text to show when the buffer is a directory
        },

        fmt = function(name, self) -- Hide buffers for disabled file types
          for _, v in ipairs(self.options.disabled_filetypes) do
            if (v == self.filetype) then
              return ' '
            end
          end
          return name
        end,
      },
    },
    lualine_b = {},
    lualine_c = {},
		lualine_x = {},
    lualine_y = {},
    lualine_z = { diagnostics },
  },
	extensions = { 'nvim-tree', 'fugitive', 'nvim-dap-ui', 'quickfix', 'toggleterm' },
})

-- local nvim_tree_events = require('nvim-tree.events')
--
-- nvim_tree_events.subscribe('TreeOpen', function()
--   require('lualine').hide({
--     place = {'tabline', 'winbar'},
--     unhide = false,
--   })
-- end)
--
-- nvim_tree_events.subscribe('TreeClose', function()
--   require('lualine').hide({
--     place = {'tabline', 'winbar'},
--     unhide = true,
--   })
-- end)
