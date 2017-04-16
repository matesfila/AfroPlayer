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
      "base" => ["X.bb.bb.XX.X"],
      "variations" =>   #["dundun: X.X.XXXX.XXX|.XX.X.X.XX.X"] +
                        ["X.bb.bb.b.XX|.X.X.X.bXX.X"] +
                        #["dundun: X.bb.bX.XX.X"] +
                        []
    },
    "sangban" => {
      "base" => ["X.b.I.I.bX.b"],
      "variations" => ["X.X.X.X.bX.b"] #+ Array.new(10, "XX.XX.XX.XX.")
    },
    "kenken" => {
      "base" => [".bb.XX.bb.XX"],
      "variations" => []
    },
    "djembe" => {
      "base" => ["x.ox.Dx.ox.."],
      "variations" => ["x.oxoox.oxoo|xooxooxoox.."]
    }
  }
  # ,
  # "dependencies" => {
  #   "dundun" => {
  #     "sangban" => {1 => 1}
  #   }
  # }
}
