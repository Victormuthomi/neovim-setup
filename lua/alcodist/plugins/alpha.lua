return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		---------------------------------------------------------------------
		-- ASCII HEADER
		---------------------------------------------------------------------
		dashboard.section.header.val = {
			"    _    _     ____ ___  ____ ___ ____ _____",
			"   / \\  | |   / ___/ _ \\|  _ \\_ _/ ___|_   _|",
			"  / _ \\ | |  | |  | | | | | | | |\\___ \\ | |",
			" / ___ \\| |__| |__| |_| | |_| | | ___) || |",
			"/_/   \\_\\_____\\____\\___/|____/___|____/ |_|",
		}

		---------------------------------------------------------------------
		-- QUOTE (SINGLE COLOR)
		---------------------------------------------------------------------
		dashboard.section.quote = {
			type = "group",
			val = {
				{
					type = "text",
					val = "As above, so below, as within, so without,",
					opts = { position = "center", hl = "String" },
				},
				{ type = "text", val = "As the universe, so the soul.", opts = { position = "center", hl = "String" } },
			},
		}

		---------------------------------------------------------------------
		-- SYSTEM INFO (TIME + OS + NVIM VERSION)
		---------------------------------------------------------------------
		local os_info = vim.loop.os_uname()
		local nvim_version =
			string.format("NVIM %d.%d.%d", vim.version().major, vim.version().minor, vim.version().patch)
		local time = os.date("%H:%M • %A, %d %B %Y")
		local sysinfo = string.format(" %s • %s %s • %s", time, os_info.sysname, os_info.release, nvim_version)

		dashboard.section.subheader = {
			type = "text",
			val = sysinfo,
			opts = { position = "center", hl = "Comment" },
		}

		---------------------------------------------------------------------
		-- FOOTER (WELCOME)
		---------------------------------------------------------------------
		dashboard.section.footer = {
			type = "text",
			val = "󱎫  Welcome back, Alcodist",
			opts = { position = "center", hl = "Comment" },
		}

		---------------------------------------------------------------------
		-- MINIMAL BUTTONS
		---------------------------------------------------------------------
		dashboard.section.buttons.val = {}

		---------------------------------------------------------------------
		-- SETUP DASHBOARD
		---------------------------------------------------------------------
		alpha.setup({
			layout = {
				{ type = "padding", val = 2 },
				dashboard.section.header,
				{ type = "padding", val = 1 },
				dashboard.section.quote,
				{ type = "padding", val = 1 },
				dashboard.section.subheader,
				{ type = "padding", val = 2 },
				dashboard.section.footer,
			},
		})

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		---------------------------------------------------------------------
		-- SHOW ALPHA ON PLAIN NVIM OR FOLDER OPEN
		---------------------------------------------------------------------
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local arg = vim.fn.argv(0)
				if arg == "" or vim.fn.isdirectory(arg) == 1 then
					if arg ~= "" then
						vim.cmd("cd " .. arg) -- set cwd if folder
					end
					require("alpha").start(true)
				end
			end,
		})
	end,
}
