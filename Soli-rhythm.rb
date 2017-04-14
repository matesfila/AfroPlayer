#############
### SOLI ####
#############


@BPM = 110

@PLAY_DUNDUN=true
@PLAY_SANGBAN=true
@PLAY_KENKEN=false

@VARCYCLE_LEN=4

@rhythmTime = [12,8] #dvanásť osminový rytmus

@dundunBasePatterns = Array.new(1, "X bb bb XX X")
@dundunVariations =
  #["X X XXXX XXX| XX X X XX X"] +
  ["X bb bb b XX| X X X bXX X"] +
  #["X bb bX XX X"] +
  []

@sangbanBasePatterns = ["X b b b bX b"]
@sangbanVariations = ["X X X X bX b"]

@kenkenBasePatterns = [" bb XX bb XX"]
