-- ──────────── hyprland.lua ────────────

local mainMod = "SUPER"

-- ──────────── MONITORS ────────────
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- ──────────── GENERAL ────────────
hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 12,
        border_size = 0,
        
        ["col.inactive_border"] = "rgba(595959aa)",
    },
})

-- ──────────── INPUT ────────────
hl.config({
    input = {
        kb_layout    = "us",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true,
        },
    },
})

-- ──────────── ANIMATIONS ────────────
hl.config({ animations = { enabled = true } })

hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "windows",    enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade",       enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6,  bezier = "myBezier", style = "slide" })

-- ──────────── KEYBINDS ────────────
hl.bind(mainMod .. " + Return", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + P",      hl.dsp.exit())
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + SPACE",  hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + T",      hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + F",      hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd("dolphin"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"), { locked = true, repeating = true })

hl.bind(mainMod .. " + TAB", hl.dsp.window.float({ action = "toggle" }))

hl.bind("Print",         hl.dsp.exec_cmd("grim - | swappy -f - -o ~/Pictures/Screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"))
hl.bind("SHIFT + Print",  hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f - -o ~/Pictures/Screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"))
hl.bind("CTRL + Print",   hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))

hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("clipman pick -t rofi"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("env QT_QPA_PLATFORM=wayland /usr/bin/sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/sddm-astronaut-theme/"))

hl.bind(mainMod .. " + R", hl.dsp.layout("togglesplit")) 


hl.bind(mainMod .. " + Z", hl.dsp.window.cycle_next())

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.local/bin/toggle-waybar"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("pkill wvkbd-mobintl || wvkbd-mobintl"))
hl.bind("CTRL + W", hl.dsp.exec_cmd("~/.local/bin/waybar-picker"))



hl.bind("ALT + A", hl.dsp.send_shortcut({ mods = "", key = "Z" }))
hl.bind("ALT + S", hl.dsp.send_shortcut({ mods = "", key = "X" }))
hl.bind("ALT + D", hl.dsp.send_shortcut({ mods = "", key = "C" }))
hl.bind("ALT + F", hl.dsp.send_shortcut({ mods = "", key = "V" }))
hl.bind("ALT + G", hl.dsp.send_shortcut({ mods = "", key = "B" }))
hl.bind("ALT + H", hl.dsp.send_shortcut({ mods = "", key = "N" }))
hl.bind("ALT + J", hl.dsp.send_shortcut({ mods = "", key = "M" }))
hl.bind("ALT + K", hl.dsp.send_shortcut({ mods = "", key = "L" }))
hl.bind("Page_Up", hl.dsp.send_shortcut({ mods = "", key = "Return" }))


hl.bind("SUPER + grave", function()
    if hl.plugin and hl.plugin.scrolloverview then
        hl.plugin.scrolloverview.overview("toggle")
    end
end)




for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,          hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i,  hl.dsp.window.move({ workspace = i }))
end


hl.bind(mainMod .. " + A",         hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + S",         hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + CTRL + A",  hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + CTRL + S",  hl.dsp.layout("colresize +0.1"))

hl.workspace_rule({ workspace = "2", layout = "scrolling", layout_opts = { direction = "right" } })
hl.workspace_rule({ workspace = "4", layout = "scrolling", layout_opts = { direction = "right" } })
hl.workspace_rule({ workspace = "6", layout = "scrolling", layout_opts = { direction = "right" } })
hl.workspace_rule({ workspace = "8", layout = "scrolling", layout_opts = { direction = "right" } })

-- ──────────── MOUSE ────────────
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ──────────── AUTOSTART ────────────
    hl.exec_cmd("~/.config/hypr/wall_loop.sh")
    hl.exec_cmd("NetworkManager")
    hl.exec_cmd("~/.local/bin/toggle-waybar")
--    hl.exec_cmd("dunst")
    hl.exec_cmd("swaync")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("polkit-gnome-authentication-agent-1")
    hl.exec_cmd("~/.local/bin/set-wallpaper ~/Pictures/wallpapers/current.jpg")

    hl.exec_cmd("swww init && swww img /usr/share/backgrounds/xfce/xfce-blue")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("waypaper --restore")
    hl.on("hyprland.start", function ()
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("wl-paste -t text --watch clipman store")
    hl.exec_cmd("hyprpm reload")
end)

-- ──────────── MISC ────────────
hl.config({
    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
    },
})

hl.config({
    decoration = {
        rounding = 10,
        blur = {
            enabled            = true,
            size               = 7,   
            passes             = 1,   
            new_optimizations  = true,
            ignore_opacity     = true,
            xray               = false,
            noise              = 0.02,
            brightness         = 1.0,
            contrast           = 1.0,
            vibrancy           = 0.0, 
            vibrancy_darkness  = 0.0,
        },
    },
})

hl.config({
    dwindle = {
        smart_split    = false,
        preserve_split = true,
    },
})

hl.config({
    scrolling = {
        column_width      = 0.8,
        direction         = "right",
        focus_fit_method  = 1,
        follow_focus      = true,
        follow_min_visible = 0.4,
    },
})

-- ──────────── PLUGIN: scrolloverview ────────────
--[[  hl.config({
    plugin = {
        scrolloverview = {
            scale         = 0.5,       
            workspace_gap = 50,
            layout        = "vertical", 
            wallpaper     = 0,          
            blur          = false,      
            shadow = {
                enabled       = false,
                range         = 50,
                render_power  = 3,
                color         = "rgba(1a1a1aee)",
            },
        },
    },
}) ]]

-- ──────────── WINDOW RULES ────────────
hl.window_rule({
    name  = "rmpc-popup",
    match = { initial_class = "^(rmpc)$" },
    float = true,
    center = true,
    size  = "900 600",
})

hl.window_rule({
    name  = "fastfetch-popup",
    match = { initial_class = "^(fastfetch)$" },
    float = true,
    center = true,
    size  = "493 270",
})

-- ──────────── THEME / GTK / QT ────────────


hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"') 

hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"') 

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct") 
