#############
### SOLI ####
#############


@BPM = 115

@PLAY_DUNDUN=true
@PLAY_SANGBAN=true
@PLAY_KENKEN=true

@VARCYCLE_LEN=4
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring 0.03,-0.03, 0)

@dundunBasePatterns = Array.new(1, "dundun: X.bb.bb.XX.X")
@dundunVariations =
  #["dundun: X.X.XXXX.XXX|.XX.X.X.XX.X"] +
  ["dundun: X.bb.bb.b.XX|.X.X.X.bXX.X"] +
  #["dundun: X.bb.bX.XX.X"] +
  []

@sangbanBasePatterns = ["sangban: X.b.b.b.bX.b"]
@sangbanVariations = ["sangban: X.X.X.X.bX.b"]

@kenkenBasePatterns = ["kenken: .bb.XX.bb.XX"]
