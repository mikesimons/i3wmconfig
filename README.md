# i3 dotfiles
These are my i3 dotfiles.
Here is a screenshot:
![screenshot](https://github.com/mikesimons/i3wmconfig/raw/master/screenshot.png "Screenshot")


If you'd like to try it out, here are the tools directly used:

| Tool | Purpose | Source | Url |
|------|---------|--------|-----|
|rofi|Menus|compiled|https://davedavenport.github.io/rofi/|
|i3-gaps|WM|compiled|https://github.com/Airblader/i3/tree/gaps|
|compton|Composite effects|`apt-get install compton`|https://github.com/chjj/compton|
|i3lock|Lock screen|`apt-get install i3lock`|https://github.com/i3/i3lock|
|scrot|Screenshots for lock screen|`apt-get install scrot`||
|imagick|Image manip for lock screen|`apt-get install imagemagick`||
|awk|Scripting for lock screen|`apt-get install awk`||
|nm-applet|Network manager in tray|`apt-get install nm-applet`||
|unity-settings-daemon|Initializes unity settings / keychains / GTK opts etc|Preinstalled||
|variety|Wallpaper downloader / switcher|`apt-get install variety`|http://peterlevi.com/variety/|
|pactl|Volume keys binding|`apt-get install pulseaudio-utils`||
|xbacklight|Backlight keys|`apt-get install xbacklight`||

Keybindings are slightly tweaked from defaults because I'm an ex WMII monkey:
- $mod - Mod4 (Windows key)
- Program menu: $mod+p
- Close window: $mod+shift+c
- $mod-space: Rofi mode (usually toggle between float + tile focus)
- Reload config: $mod+shift+z
- $mod-Pause: Power menu mode (logoff, lock, suspend etc)
- $mod-shift-bracketleft - (Square bracket) Move workspace to output to left
- $mod-shift-bracketright - (Square bracket) Move workspace to output to right

## Better font rendering
I'd also strongly recommend you try out infinality. See http://www.webupd8.org/2013/06/better-font-rendering-in-linux-with.html
```
sudo add-apt-repository ppa:no1wantdthisname/ppa
sudo apt-get update
sudo apt-get install fontconfig-infinality
sudo bash /etc/fonts/infinality/infctl.sh setstyle # linux is my preference
```
