#!/bin/bash

list_apps() {
  find /usr/share/applications ~/.local/share/applications -name "*.desktop" 2>/dev/null |
    while read -r desktop; do
      name=$(grep "^Name=" "$desktop" | head -1 | cut -d= -f2)
      [[ -n "$name" ]] && printf "%-50s | app:%s\n" " $name" "$desktop"
    done | sort
}

list_files_dirs() {
  {
    find "$PWD" -maxdepth 5 \( -type f -o -type d \) -not -path "$PWD" 2>/dev/null | head -30
    find "$HOME" -maxdepth 5 \( -type f -o -type d \) \
      -not -path "*/node_modules/*" \
      -not -path "*/.git/*" \
      2>/dev/null | head -300
  } | sort -u | while read -r item; do
    name=$(basename "$item")
    dir_path=$(dirname "$item")
    if [[ "$dir_path" == "$HOME" ]]; then
      location="~"
    elif [[ "$dir_path" =~ $HOME ]]; then
      location="~${dir_path#$HOME}"
    else
      location="$dir_path"
    fi
    if [[ ${#location} -gt 25 ]]; then
      location="...${location: -22}"
    fi
    if [[ -d "$item" ]]; then
      printf "%-50s | dir:%s\n" "📁 $name  ·  $location" "$item"
    else
      # File type icons
      case "${name##*.}" in
      sh | bash) icon="🔧" ;;
      py) icon="🐍" ;;
      js | json) icon="📜" ;;
      css) icon="🎨" ;;
      html) icon="🌐" ;;
      md | txt) icon="📝" ;;
      jpg | png | gif) icon="🖼️" ;;
      mp3 | wav) icon="🎵" ;;
      pdf) icon="📄" ;;
      zip | tar | gz) icon="📦" ;;
      conf | config) icon="⚙️" ;;
      *) icon="📄" ;;
      esac
      printf "%-50s | file:%s\n" "$icon $name  ·  $location" "$item"
    fi
  done
}

query=""
while true; do
  if [[ "$query" == file:* || "$query" == dir:* ]]; then
    filter="${query#*:}"
    list=$(list_files_dirs | grep -i -- "$filter")
  else
    filter="$query"
    list=$(list_apps | grep -i -- "$filter")
  fi

  selection=$(echo "$list" | wofi --dmenu --allow-images --prompt="Search: $query > ")

  [[ -z "$selection" ]] && exit 0

  if ! grep -q '|' <<<"$selection"; then
    query="$selection"
    continue
  fi

  action=$(echo "$selection" | sed 's/.*| //')

  case "$action" in
  app:*)
    gtk-launch "$(basename "${action#app:}" .desktop)" 2>/dev/null &
    exit 0
    ;;
  file:*)
    ghostty -e nvim "${action#file:}" &
    exit 0
    ;;
  dir:*)
    ghostty -e nvim "${action#dir:}" &
    exit 0
    ;;
  *)
    # Unknown action - ignore or break
    exit 0
    ;;
  esac
done
