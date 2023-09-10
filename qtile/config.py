# Sebastián Lévano config - lecav
# Inspiried at DistroTube & Antonio Sarosi

from libqtile import qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget
from libqtile.lazy import lazy
import colors

mod = 'mod4'  # Super
myTerminal = 'alacritty'  # My terminal
myBrowser = 'firefox'  # My browser
myFont = 'hack'  # My nerd font

myColor = [["#282c34", "#282c34"],
           ["#1c1f24", "#1c1f24"],
           ["#dfdfdf", "#dfdfdf"],
           ["#ff6c6b", "#ff6c6b"],
           ["#98be65", "#98be65"],
           ["#da8548", "#da8548"],
           ["#51afef", "#51afef"],
           ["#c678dd", "#c678dd"],
           ["#46d9ff", "#46d9ff"],
           ["#a9a1e1", "#a9a1e1"]]

# Keys #
keys = [
    # Essentials
    # Browser
    Key([mod], "b",
        lazy.spawn(myBrowser),
        desc='Qutebrowser'
        ),
    # Run Launcher
    Key([mod, "shift"], "Return",
        lazy.spawn("rofi -show drun"),
        desc='Run Launcher'
        ),
    # Terminal
    Key([mod], "Return",
        lazy.spawn(myTerminal),
        desc="Launch terminal"
        ),
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 2 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key(
    #     [mod, "shift"],
    #     "Return",
    #     lazy.layout.toggle_split(),
    #     desc="Toggle between split and unsplit sides of stack",
    #     ),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

# Workspaces / Groups #
# Icons at: https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# My font: mononoki nerd font
groups = [Group(i) for i in [
    "   ", "   ", "   ", "   ", "   "
]]
for i, group in enumerate(groups):
    # Numbers
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])

# Layouts #

colors = colors.DoomOne

layout_theme = {
    "border_width": 2,
    "margin": 8,
    "border_focus": colors[8],
    "border_normal": colors[0]
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.Columns(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.TreeTab(
        font=myFont,
        fontsize=20,
        sections=["FIRST", "SECOND", "THIRD", "FOURTH"],
        section_fontsize=20,
        border_width=2,
        bg_color=colors[0],
        active_bg=colors[8],
        active_fg=colors[2],
        inactive_bg=colors[1],
        inactive_fg=colors[0],
        section_fg=colors[7],
        padding_left=0,
        padding_x=0,
        padding_y=5,
        section_top=20,
        section_bottom=20,
        level_shift=8,
        vspace=3,
        panel_width=200
    ),
    layout.Floating(**layout_theme)
]

# Screens #


def separator():
    return widget.Sep(
        foreground=colors[1],
        linewidth=0,
        padding=6
    )


# Widget #
widget_defaults = dict(
    font=myFont,
    fontsize=18,
    padding=5,
)
extension_defaults = widget_defaults.copy()

screens = [
        Screen(
            wallpaper="~/Pictures/rolling.jpg",
            wallpaper_mode='fill',
            top=bar.Bar(
    [

        separator(),

        widget.Image(
            filename="~/.config/qtile/icons/bulldog.svg",
            scale="True",
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(myTerminal)}
        ),

        separator(),

        widget.GroupBox(
            font=myFont,
            fontsize=21,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=2,
            rounded=False,
            active=colors[8],
            inactive=colors[1],
            highlight_color=colors[2],
            highlight_method="block",
            this_current_screen_border=colors[7],
            this_screen_border=colors[4],
            other_current_screen_border=colors[7],
            other_screen_border=colors[4],
            disable_drag=True
        ),

        separator(),

        widget.Spacer(length=8),

        widget.CurrentLayoutIcon(
            foreground=colors[1],
            padding=5,
            scale=0.7
        ),

        widget.CurrentLayout(
            foreground=colors[1],
            padding=5
        ),

        widget.Spacer(length=8),

        widget.WindowName(
            foreground=colors[6],
            padding=5,
            max_chars=40
        ),

        separator(),

        widget.Spacer(length=8),

        widget.CheckUpdates(
            foreground=colors[3],
            no_update_string='No updates',
            update_interval=2800,
            distro="Arch",
            display_format="Updates: {updates} ",
        ),

        widget.Spacer(length=8),

        widget.CapsNumLockIndicator(
            foreground=colors[4],
        ),

        widget.Spacer(length=8),

        widget.KeyboardLayout(
            foreground=colors[8],
            configured_keyboards=['latam', 'us'],
            fmt='⌨  Kbd: {}',
            padding=5
        ),

        widget.Spacer(length=8),

        widget.Volume(
            foreground=colors[6],
            fmt='🕫  Vol: {}',
        ),

        widget.Spacer(length=8),

        widget.Clock(
            foreground=colors[5],
            format="⏱  %a, %b %d - %H:%M",
        ),

        widget.Spacer(length=8),

        widget.Battery(
            foreground=colors[7],
            discharge_char='↓',
            charge_char='↑',
            format='{char} {percent:2.0%}',
        ),

        widget.Spacer(length=8),

        widget.QuickExit(
            foreground=colors[4],
            default_text='Ciao',
            countdown_format=' {} '
        ),

    ],
    size=30,
),
),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG4D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
