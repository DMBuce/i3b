
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

Requirements: perl, xrandr, xdotool

Documentation: https://dmbuce.github.io/i3b/i3move.1.html

Quick Start: https://dmbuce.github.io/i3b/i3move.1.html#EXAMPLES

## i3scratchmark

Manage i3 scratchpad windows with marks.

Requirements: bash, jq

Documentation: https://github.com/DMBuce/i3b/blob/master/doc/i3scratchmark.1.txt

## rofi-blezz

Run [rofi's blezz module](https://github.com/davatorium/rofi-blezz)
with a different starting menu.
Similar to [blezz's](https://github.com/Blezzing/blezz) `-d` option,
this is a workaround for rofi's blezz module not having such functionality.

Requirements: bash, rofi, rofi-blezz, sed

Documentation :https://github.com/DMBuce/i3b/blob/master/doc/rofi-blezz.1.txt

