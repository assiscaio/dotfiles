#!/bin/sh
set -eu
mode=${1:?usage: wayfreeze-region.sh save|copy}
case "$mode" in save|copy) ;; *) exit 2 ;; esac
fifo=$(mktemp -u "${TMPDIR:-/tmp}/wayfreeze-region.XXXXXX")
mkfifo "$fifo"
freeze_pid=
cleanup() {
  if [ -n "$freeze_pid" ]; then
    kill "$freeze_pid" 2>/dev/null || true
    wait "$freeze_pid" 2>/dev/null || true
  fi
  rm -f "$fifo"
}
trap cleanup EXIT HUP INT TERM
wayfreeze --hide-cursor --after-freeze-timeout 100 --after-freeze-cmd "echo ready > '$fifo'" &
freeze_pid=$!
read -r _ < "$fifo"
geometry=$(slurp -d) || exit 1
[ -n "$geometry" ] || exit 0
case "$mode" in
  save)
    title=$(mmsg get focusing-client | jq -r .title | sed 's#[/:]#_#g')
    grim -g "$geometry" "$HOME/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S)_${title:-janela}.png"
    ;;
  copy) grim -g "$geometry" - | wl-copy ;;
esac
