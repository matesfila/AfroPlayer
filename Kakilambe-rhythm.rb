#############
# KAKILAMBE #
#############

@BPM = 110

@PLAY_DUNDUN=true
@PLAY_SANGBAN=true
@PLAY_KENKEN=false

@VARCYCLE_LEN=4

@rhythmTime = [24,8] #dvadsaťštyry osminový rytmus

@dundunBasePatterns = Array.new(1, "X-X-X-bb-b-X|X-b-b-bb-b-b")
@dundunVariations = ["X-XX-XX-XX-X|X-XX-XX-XX-X"]

@sangbanBasePatterns = ["b-b-b-bX-X-b|b-b-X-bX-X-b"]

@kenkenBasePatterns = ["XX-bb-XX-bb-|XX-bb-XX-bb-"]

playWholeSong()