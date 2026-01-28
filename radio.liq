#!/usr/bin/liquidsoap

set("log.stdout", true)
set("log.level", 3)

# قراءة الأغاني
music = playlist(
  mode="randomize",
  reload=1,
  "/music"
)

# البث
output.icecast(
  %mp3(bitrate=128),
  host="localhost",
  port=8000,
  password="hackme123",
  mount="radio",
  music
)
