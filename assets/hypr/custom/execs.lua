-- ~/.config/hyprland/custom/execs.lua

hl.on("hyprland.start", function()
    -- Start Fcitx daemon
    hl.exec_cmd("fcitx5 -d --replace")
    hl.exec_cmd("fcitx5-remote -r")
    -- Start vorta daemon
    hl.exec_cmd("systemctl --user start app-vorta@autostart.service")
    -- Connect bluetooth headphones. WH-1000XM4
    hl.exec_cmd("bluetoothctl connect 88:C9:E8:86:FA:94")
end)
