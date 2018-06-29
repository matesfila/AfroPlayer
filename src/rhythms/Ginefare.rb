#################
### Ginefare ####
#################

@BPM = 185
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring -0.04,0.0, 0.04)

dun_base = "X..b..b..b..|b.Ab.Ab.Ab.B"
san_base = "b..X..b..X..|b..X..b..X.."

dun_var1 = "X..b..b..b..|b.Xb.Xb.Xb.."

ken_base = "b.b.X.X..X..|b.b.X.X..X.."

dj_base = "x..oo.x.Foo.|x..oo.x.Foo."

dj_echauff =  ["o.xx.xx.xx.o"].cycle(5).to_a.join('|') + "|o.xx.xx.xx..|ooo xxx..ooo|o.o.o.xxxx.o" #"|o.xx.xx.xx..|x.xxyxxxxxyo"
dun_echauff = ["X..b..b.X.X.|X.X.X.X.X.b."].cycle(3).to_a.join('|') + "|x.b..xb..x.b|..xb..x..x.."

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => [dun_base],
      "variations" => [dun_echauff]
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
      "base" => [dj_base],
      "variations" => [dj_echauff]
    }
  },
  "dependencies" => {
    "djembe" => {dj_echauff => {"dundun" => dun_echauff}},
    "dundun" => {dun_echauff => {"djembe" => dj_echauff}}
  }
}
