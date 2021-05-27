-- jumptag - Jump to any function, class or heading with F4. Go, Python, C...
-- Copyright 2020-2021 Tero Karvinen http://TeroKarvinen.com
-- https://github.com/terokarvinen/micro-jump

local config = import("micro/config")
local shell = import("micro/shell")

function init()
	config.MakeCommand("jumptag", jumptagCommand, config.NoComplete)
	config.TryBindKey("F4", "command:jumptag", true)
end

function jumptagCommand(bp) -- bp BufPane
		local filename = bp.Buf.Path
		local cmd = string.format("bash -c \"ctags -f - --fields=n '%s'|fzf|tr ':' '\n'|tail -1\"", filename)
		local out = shell.RunInteractiveShell(cmd, false, true)
		local linenum = tonumber(out)-1
		bp.Cursor.Y = linenum
end
