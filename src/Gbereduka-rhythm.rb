###################
#### Gbereduka ####
###################

@BPM = 110
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring -0.04,+0.04, 0)

dun_base =  "X.XX.b.bb.b.|b.bb.b.XX.X.|" +
            "X.XX.b.bb.b.|b.bb.b.XX.X.|" +
            "X.XX.X.XX.X.|XX.X.X.XX.X.|" +
            "X.XX.X.XX.XX|.XX.XX.XX.X.|"
san_base =  "XX.b.I.bI.b.|b.I.bI.bb.X.|" +
            "X.bb.I.bI.b.|b.I.bI.bb.X.|" +
            "X.bb.X.bb.X.|b.bX.b.bX.X.|" +
            "X.bb.X.bb.bX|X.XX.X.bX.X."

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
