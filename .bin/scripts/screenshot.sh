#!/bin/bash
activeWinLine=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)")
activeWinId=${activeWinLine:40}
import -window "$activeWinId" ~/Pictures/screenshots/$(date +%F_%H%M%S_%N).png
