#############
#### Dji ####
#############

@BPM = 120
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring -0.03,+0.04, -0.01)

dun_base = ".X.X.X.XX.X.|X.bb.b.bb.XX"
san_base = "b.bb.X.bb.b.|X.bI.I.Ib.X."

dun_var1 = dun_base +               "|.X.XXX.XX.X.|X.bb.b.bb.XX"
san_var1 = "b.bb.X.bb.b.|X.bI.I.Ib.bX|X.XX.bb.XX.X|X.bI.I.Ib.X."

dun_var2 = dun_base +               "|XX.XXX.XX.XX|XX.X.b.bb.XX"
san_var2 = san_base +               "|b.bb.X.bb.b.|XX.I.I.Ib.X."

dun_var3 = dun_base +               "|.X.X.X.XX.X.|XX.X.X.XX.XX"
san_var3 = san_base +               "|I.bI.X.bI.I.|XX.I.I.Ib.X."

ken_base = ".bX.XX.bX.XX"

dj_base =  ["x.ox..x.ox.."].cycle(4).to_a.join('|')
dj_base2 = ["x..xoox..xoo"].cycle(4).to_a.join('|')
dj_base3 = ["............"].cycle(4).to_a.join('|')

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => [dun_base],
      "variations" => [dun_var1, dun_var2, dun_var3] +
      []
    },
    "sangban" => {
      "base" => [san_base],
      "variations" => [san_var1,san_var2,san_var3]
    },
    "kenken" => {
      "base" => [ken_base],
      "variations" => []
    },
    "djembe" => {
      "base" => [dj_base, dj_base, dj_base2, dj_base3, dj_base3],
      "variations" => []
    }
  },
  "dependencies" => {
    #"sangban" => {san_var1 => {"dundun" => dun_var1}}
  }
}
