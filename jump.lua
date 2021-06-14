-- jumptag - Jump to any function, class or heading with F4. Go, Python, C...
-- Copyright 2020-2021 Tero Karvinen http://TeroKarvinen.com
-- https://github.com/terokarvinen/micro-jump
-- MIT license

local config = import("micro/config")
local shell = import("micro/shell")
local micro = import("micro")

function init()
	config.MakeCommand("jumptag", jumptagCommand, config.NoComplete)
	config.TryBindKey("F4", "command:jumptag", true)
end

function jumptagCommand(bp) -- bp BufPane
		local filename = bp.Buf.Path
		local cmd = string.format("bash -c \"ctags -f - --fields=n '%s'|fzf --layout=reverse|tr ':' '\n'|tail -1\"", filename)
		local out = shell.RunInteractiveShell(cmd, false, true)
		if tonumber(out) == nil then
			micro.InfoBar():Message("Jump cancelled.")
			return
		end
		local linenum = tonumber(out)-1
		bp.Cursor.Y = linenum
		micro.InfoBar():Message(string.format("Jumped to line ", linenum))
end
