@BPM = 110

HUMANIZE_TIME = 0.012
HUMANIZE_DYNAMIC = 0.3
HUMANIZE_PITCH = 0.005

@PLAY_DUNDUN=true
@PLAY_SANGBAN=true
@PLAY_KENKEN=false

@rhythmTime = [24,8] #dvadsaťštyry osminový rytmus
@dundunBasePatterns = Array.new(1, "X-X-X-bb-b-X|X-b-b-bb-b-b")
@sangbanBasePatterns = ["b-b-b-bX-X-b|b-b-X-bX-X-b"]
@kenkenBasePatterns = ["XX-bb-XX-bb-|XX-bb-XX-bb-"]
@dundunVariations = [
  "X-XX-XX-XX-X|X-XX-XX-XX-X"
]

playWholeSong()