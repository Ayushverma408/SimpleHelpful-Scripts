#!/usr/bin/env bash
name=$(youtube-dl --get-filename $(brotab list | grep youtube | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*"))
notify-send "Downloading $name"
#Downloads youtube videos from the youtube tab whichever are opened at the moment in firefox
youtube-dl -x --audio-format mp3 $(brotab list | grep youtube | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*") -o "/home/bzhsf/Music/%(title)s.%(ext)s"
$name >> ~/Music/logs.txt
notify-send "Finished downloading $name"


