
# i3b

Buce's window manager scripts and configs.

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

Requirements: perl, xwininfo, xdotool, xprop

See [the man page](https://dmbuce.github.io/i3b/i3move.html)
for extensive documentation.

## rofi-blezz

Run rofi's [blezz](https://github.com/davatorium/rofi-blezz) module
with a different starting menu.
Similar to blezz's `-d` option,
this is a workaround for rofi's blezz module not having such functionality.

