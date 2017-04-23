##################
#### Takosaba ####
##################

@BPM = 120
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring -0.03,+0.04, -0.01)

dun_base =  ".XX.bb.bb.XX|.XX.bb.XX.XX|" +
            ".XX.bb.bb.XX|.X.X.X.XX.XX|" +
            ".X.X.X.XX.XX"
san_base =  "I.I.b.b.b.X.|I.I.b.X.X.X.|" +
            "I.I.b.I.I.b.|X.b.X.b.X.bb|" +
            ".X.X.X.bb.X."

ken_base = ".bX.XX.bX.XX"

dj_base = "x.ox..x.ox..|x.ox..x.ox..|x.ox..x.ox..|x.ox..x.ox.."
dj_base2 = "x..xoox..xoo|x..xoox..xoo|x..xoox..xoo|x..xoox..xoo"

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => [dun_base],
      "variations" => [] +
      []
    },
    "sangban" => {
      "base" => [san_base],
      "variations" => []
    },
    "kenken" => {
      "base" => [ken_base],
      "variations" => []
    },
    "djembe" => {
      "base" => [dj_base, dj_base2],
      "variations" => []
    }
  },
  "dependencies" => {
    #"sangban" => {san_var1 => {"dundun" => dun_var1}}
  }
}
