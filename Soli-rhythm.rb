#############
### SOLI ####
#############


@BPM = 130

@PLAY_DUNDUN=true
@PLAY_SANGBAN=true
@PLAY_KENKEN=true

@VARCYCLE_LEN=4

@rhythmTime = [12,8] #dvanásť osminový rytmus

@dundunBasePatterns = Array.new(1, "dundun: X.bb.bb.XX.X")
@dundunVariations =
  #["X.X.XXXX.XXX|.XX.X.X.XX.X"] +
  ["dundun: X.bb.bb.b.XX|.X.X.X.bXX.X"] +
  #["X.bb.bX.XX.X"] +
  []

@sangbanBasePatterns = ["sangban: X.b.b.b.bX.b"]
@sangbanVariations = ["sangban: X.X.X.X.bX.b"]

@kenkenBasePatterns = ["kenken: .bb.XX.bb.XX"]
