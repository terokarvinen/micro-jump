-- jumptag - Jump to any function, class or heading with F4. Go, Python, C...
-- Copyright 2020-2023 Tero Karvinen http://TeroKarvinen.com
-- https://github.com/terokarvinen/micro-jump
-- MIT license

-- Requires exuberant-ctags:	sudo apt-get -y install exuberant-ctags
-- Does not work with emacs ctags, which is in default 
-- install of Debian 12-bookworm: "ctags: unrecognized option '--sort=no'"

local config = import("micro/config")
local shell = import("micro/shell")
local micro = import("micro")

function init()
	config.MakeCommand("jumptag", jumptagCommand, config.NoComplete)
	config.TryBindKey("F4", "command:jumptag", true)
	config.AddRuntimeFile("jump", config.RTHelp, "help/jump.md")
end

function jumptagCommand(bp) -- bp BufPane
		local filename = bp.Buf.Path
		local cmd = string.format("bash -c \"ctags -f - --sort=no --fields=n '%s'|fzf --layout=reverse|tr ':' '\n'|tail -1\"", filename)
		-- --sort=no shows symbols in file order, creating a TOC for Markdown files
		local out, err = shell.RunInteractiveShell(cmd, false, true)
		if tonumber(out) == nil then
			local msg = "Jump cancelled."
			-- msg = string.format("%s Command '%s', out: '%s', err: '%s' ", msg, cmd, out, err) -- stderr shown on terminal after closing micro
			micro.InfoBar():Message(msg)
			return
		end
		local linenum = tonumber(out)-1
		bp.Cursor.Y = linenum
		micro.InfoBar():Message(string.format("Jumped to line %i", linenum))
end
