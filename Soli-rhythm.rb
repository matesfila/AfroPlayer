#############
### SOLI ####
#############

@PLAY_DUNDUN = true
@PLAY_SANGBAN = true
@PLAY_KENKEN = true
@PLAY_DJEMBE = true

@BPM = 115
@VARCYCLE_LEN = 4
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring 0.03,-0.03, 0)

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => ["dundun: X.bb.bb.XX.X"],
      "variations" =>   #["dundun: X.X.XXXX.XXX|.XX.X.X.XX.X"] +
                        ["dundun: X.bb.bb.b.XX|.X.X.X.bXX.X"] +
                        #["dundun: X.bb.bX.XX.X"] +
                        []
    },
    "sangban" => {
      "base" => ["sangban: X.b.I.I.bX.b"],
      "variations" => ["sangban: X.X.X.X.bX.b"]
    },
    "kenken" => {
      "base" => ["kenken: .bb.XX.bb.XX"],
      "variations" => []
    },
    "djembe" => {
      "base" => ["djembe: x.ox.Dx.ox.."],
      "variations" => []
    }
  }
}
