#!/usr/bin/env bash

# Function to log the song name and current time to the log file
log_song() {
  local song_name=$1
  local current_time=$(date '+%Y-%m-%d %H:%M:%S')
  echo "[$current_time] $song_name" >> ~/Music/logs.txt
}

# Get the name of the song to be downloaded
name=$(yt-dlp --get-filename $(brotab list | grep youtube | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*"))

# Notify that the download is about to start
notify-send "Downloading $name"

# Downloads youtube videos from the youtube tab whichever are opened at the moment in firefox
yt-dlp --audio-format best --audio-format flac --split-chapters -x -o "chapter:%(section_title)s.%(ext)s" $(brotab list | grep youtube | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*") -o "/home/bzhsf/Music/%(title)s.%(ext)s"

# Log the downloaded song with the current time
log_song "$name"

# Notify that the download is complete
notify-send "Finished downloading $name"
