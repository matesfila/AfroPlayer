#############
### SOLI ####
#############


@BPM = 110

@PLAY_DUNDUN=true
@PLAY_SANGBAN=true
@PLAY_KENKEN=false

@VARCYCLE_LEN=4

@rhythmTime = [24,8] #dvadsaťštyry osminový rytmus

@dundunBasePatterns = Array.new(1, "X bb bb XX X|X bb bb XX X")
@dundunVariations = ["X X XXXX XXX| XX X X XX X"]

@sangbanBasePatterns = ["X b b b bX b|X b b b bX b"]

@kenkenBasePatterns = [" bb XX bb XX| bb XX bb XX"]

playWholeSong()
