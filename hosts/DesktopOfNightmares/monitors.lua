-- Left: ViewSonic VA2448
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
})

-- Right / primary: Acer XB241H
hl.monitor({
	output = "DP-3",
	mode = "1920x1080@143.98",
	position = "1920x0",
	scale = 1,
})

-- Primary monitor workspaces
hl.workspace_rule({
	workspace = "1",
	persistent = true,
	monitor = "DP-3",
	default = true,
})

hl.workspace_rule({ workspace = "2", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "3", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "4", persistent = true, monitor = "DP-3" })
hl.workspace_rule({ workspace = "5", persistent = true, monitor = "DP-3" })

-- Secondary monitor workspaces
hl.workspace_rule({
	workspace = "6",
	persistent = true,
	monitor = "HDMI-A-1",
	default = true,
})

hl.workspace_rule({ workspace = "7", persistent = true, monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "8", persistent = true, monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "9", persistent = true, monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "10", persistent = true, monitor = "HDMI-A-1" })
