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

dun_var1 =  ".XX.bb.bb.XX|.XX.bb.XX.XX|" +
            ".XX.bb.bb.XX|XX.XXX.XX.XX|" +
            "XX.XXX.XX.XX"
			
dun_var2 =  ".XX.bb.bb.XX|.XX.bb.XX.XX|" +
            ".XX.bb.bb.XX|XX.XXX.XX.XX|" +
            "XXXXXX.XX.XX"
			
dun_var3 =  ".XX.bb.bb.XX|.XX.bb.XX.XX|" +
            ".XX.bb.bb.X.|b.bX.b.Xb.XX|" +
            ".bb.bb.XX.bb"

dun_var4 =  ".XX.bb.bb.XX|.XX.bb.XX.XX|" +
            ".XX.bb.bb.XX|.X.X.b.Xb.XX|" +
            ".b.XXX.XX.bb"
			

dj_base =  ["x.ox..x.ox.."].cycle(5).to_a.join('|')
dj_base2 = ["x..xoox..xoo"].cycle(5).to_a.join('|')
dj_base3 = ["............"].cycle(5).to_a.join('|')

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => [dun_base],
      "variations" => [dun_var1, dun_var2, dun_var3, dun_var4]
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
      "base" => [dj_base, dj_base, dj_base2, dj_base3, dj_base3],
      "variations" => []
    }
  },
  "dependencies" => {
    #"sangban" => {san_var1 => {"dundun" => dun_var1}}
  }
}
