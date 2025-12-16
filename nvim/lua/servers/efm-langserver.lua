return function(on_attach)
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	local flake8 = {
		lintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
		lintStdin = true,
		lintFormats = { "%f:%l:%c: %m" },
	}

	local black = require("efmls-configs.formatters.black")

	local prettier = require("efmls-configs.formatters.prettier")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local eslint = require("efmls-configs.linters.eslint")

	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local gofmt = require("efmls-configs.formatters.gofmt")

	local config = {
		on_attach = on_attach,
		filetypes = {
			"lua",
			"python",
			"javascript",
			"java",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"html",
			"css",
			"json",
			"jsonc",
			"markdown",
			"sh",
			"zsh",
			"cpp",
			"c",
			"java",
			"cmake",
			"go",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },

				javascript = { eslint, prettier },
				typescript = { eslint, prettier },
				javascriptreact = { eslint, prettier },
				typescriptreact = { eslint, prettier },

				html = { prettier },
				css = { prettier },
				json = { fixjson, eslint },
				jsonc = { fixjson, eslint },
				markdown = { prettier },

				sh = { shellcheck, shfmt },
				zsh = { shellcheck, shfmt },
				go = { gofmt },
			},
		},
	}
	local name = "efm"
	return { name, config }
end
