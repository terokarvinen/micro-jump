-- jumptag - Jump to any function, class or heading with F4. Go, Python, C...
-- Copyright 2020-2022 Tero Karvinen http://TeroKarvinen.com
-- https://github.com/terokarvinen/micro-jump
-- MIT license

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
		local out = shell.RunInteractiveShell(cmd, false, true)
		if tonumber(out) == nil then
			micro.InfoBar():Message("Jump cancelled.")
			return
		end
		local linenum = tonumber(out)
		bp.Cursor.Y = linenum-1
		micro.InfoBar():Message("Jumped to line ", linenum)
end
