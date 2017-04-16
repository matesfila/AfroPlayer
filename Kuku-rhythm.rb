#############
### KUKU ####
#############

@PLAY_DUNDUN = true
@PLAY_SANGBAN = true
@PLAY_KENKEN = true
@PLAY_DJEMBE = true

@BPM = 110
@VARCYCLE_LEN = 4
@RHYTHM_TIME = [8,4] #osem štvrťový rytmus

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => Array.new(12, "dundun: b.bX.bb.|b.b.A.b.") + ["dundun: bX.X.bb.|b.b.A.b."],
      "variations" => Array.new(4, "dundun: b.bX.bb.|X.bX.bX.") +
                      Array.new(8, "dundun: b.AX.AX.|AX.AX.X.") +
                      Array.new(2, "dundun: b.bX.bb.|X.XX.XX.") +
                      Array.new(8, "dundun: B.BB.BB.|C.CC.CC.") +
                      Array.new(2, "dundun: X.bX.bB.|X.XX.XX.|XX.X.XX.|XX.XXXX.") +
                      []
    },
    "sangban" => {
      "base" => ["sangban: X.b.b.X.|X.b.b.X."],
      "variations" => []
    },
    "kenken" => {
      "base" => ["kenken: X.b.X.b.|X.b.X.b."],
      "variations" => []
    },
    "djembe" => {
      "base" => ["djembe: x.oo..x.|x.oo..x."],
      "variations" => []
    }
  }
}
