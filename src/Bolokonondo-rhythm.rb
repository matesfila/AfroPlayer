# Welcome to Sonic Pi v2.11.1

#####################
#### Bolokonondo ####
#####################

@BPM = 120
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring -0.03,+0.04, -0.01)

dun_base =  "b.bb.bb.bb.b|b.XX.X.XX.X.|" +
  "b.bb.bb.bb.b|b.XX.X.XX.X.|" +
  "XX.X.X.XX.X.|X.XX.X.XX.XX|" +
  ".X.X.X.XX.X."

san_base =  "I.bI.bI.bI.b|I.bX.X.bb.X.|" +
  "I.bI.bI.bI.b|I.bX.X.bb.X.|" +
  "b.bX.b.bX.b.|b.XX.Xb.bb.X|" +
  "b.bb.Xb.b.X."

dun_var1 =  "b.bb.bb.bb.b|b.XX.X.XX.X.|" +
  "b.bb.bb.bb.b|b.XX.X.XX.XX|" +
  ".X.X.X.XX.XX|.X.X.X.XX.XX|" +
  ".X.X.X.XX.X."


dun_var2 =  "b.bb.bb.bb.b|b.XX.X.XX.X.|" +
  "b.bb.bb.bb.b|b.XX.X.XX.XX|" +
  ".X.X.X.X.X.X|.X.X.X.X.X.X|" +
  ".X.X.X.XX.X."


ken_base = ".bX.XX.bX.XX"

dj_base =  ["x.ox..x.ox.."].cycle(7).to_a.join('|')
dj_base2 = ["x..xoox..xoo"].cycle(7).to_a.join('|')
dj_base3 = ["............"].cycle(7).to_a.join('|')

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => [dun_base],
      "variations" => [dun_var1, dun_var2] +
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
      "base" => [dj_base, dj_base, dj_base2, dj_base3, dj_base3, dj_base3],
      "variations" => []
    }
  },
  "dependencies" => {
    #"sangban" => {san_var1 => {"dundun" => dun_var1}}
  }
}
