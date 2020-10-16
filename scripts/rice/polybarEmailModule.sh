#!/bin/sh

# i3blocks mail module.
# Displays number of unread mail and an loading icon if updating.
# When clicked, brings up `neomutt`.

case $BLOCK_BUTTON in
	1) "$TERMINAL" -e mutt ;;
	2) imapoffline -o  >/dev/null & ;;
	3) pgrep -x dunst >/dev/null && notify-send "📬 Mail module" "\- Shows unread mail
- Shows 🔃 if syncing mail
- Left click opens neomutt
- Middle click syncs mail" ;;
#esac

imapoffline -o  >/dev/null

unread="$(find /hdd/Mail/Gmail/INBOX/new/ -type f | wc -l 2>/dev/null)"

echo "$unread"

#icon="$(cat "/tmp/imapsyncicon_$USER")"

#[ "$unread" = "0" ] || echo "$unread"
