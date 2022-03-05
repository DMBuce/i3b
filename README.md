
# i3b

Buce's window manager scripts and configs.

## Install

There's an [AUR package](https://aur.archlinux.org/packages/i3b) for Arch Linux
and a Makefile for other distros.
In addition, many of the scripts can be installed standalone
by dropping them in your $PATH and making them executable.

## i3move

Move a floating i3 window.

Demo: https://i.imgur.com/IVnZ9fS.mp4

Features:

* Variable movement distance based on window size and screen size
* Different movement behavior if window size exceeds threshold
* Snap to screen edges, bar, gaps
* Hide window when moving past screen edges, bar, gaps
* Prevent window from moving beyond screen edges, bar, gaps
* All behavior highly configurable

Requirements: perl, xrandr, xdotool

See [the man page](https://dmbuce.github.io/i3b/i3move.1.html)
for extensive documentation.
To get up and running quickly with i3move,
refer to [the examples](https://dmbuce.github.io/i3b/i3move.1.html#EXAMPLES).

## i3scratchmark

Manage i3 scratchpad windows with marks.

Requirements: bash, jq

See [i3scratchmark --help output](https://github.com/DMBuce/i3b/blob/master/doc/i3scratchmark.1.txt) output for usage and example bindsyms.

## rofi-blezz

Run [rofi's blezz module](https://github.com/davatorium/rofi-blezz)
with a different starting menu.
Similar to [blezz's](https://github.com/Blezzing/blezz) `-d` option,
this is a workaround for rofi's blezz module not having such functionality.

Requirements: bash, rofi, rofi-blezz, sed

See [rofi-blezz --help output](https://github.com/DMBuce/i3b/blob/master/doc/rofi-blezz.1.txt) for usage.

