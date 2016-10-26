#!/bin/bash

set -x

screenshot() {
  path="$(mktemp -d)"
  file="$path/screen.png"
  scrot "$file"
  echo $file
}

icon_dimensions() {
  declare lock_image="$1"
  file "$lock_image" | grep -o '[0-9]* x [0-9]*' | sed -e 's/ x / /g'
}

icon_locations() {
  declare lock_image="$1"
  read -r -a icon_size <<< "$(icon_dimensions "$lock_image")"
  xrandr --query | \
    grep -o '[0-9]\+x[0-9]\++[0-9]\++[0-9]\+' | \
    awk -vw="${icon_size[0]}" -vh="${icon_size[1]}" -F'x|+' '{ print (($1 / 2) + $3) - (w / 2), (($2 / 2) + $4) - (h / 2) }'
}

main() {
  declare lock_image="$1"

  local icons=""
  local file="$(screenshot)"

  if [[ "$lock_image" != "" ]]; then
    icons=$(icon_locations "$lock_image" | while IFS= read -r screen; do
      read -r -a screen <<< "$screen"
      echo -n "$lock_image -geometry +${screen[0]}+${screen[1]} -composite -matte "
    done)
  fi

  local tint="-fill black -colorize 50%"
  local pixelate="-scale 5% -scale 2000%"

  convert "$file" $tint $pixelate $icons "$file"

  i3lock -e -u -n -i "$file"
  rm -rf "$file"
}

main $@
