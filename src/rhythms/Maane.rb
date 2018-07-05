###############
#### MAANE ####
###############

@BPM = 115
@RHYTHM_TIME = [12,8] #dvanast osminový rytmus
@RHYTHM_SWING = (ring 0,0,0)

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => ["X.b.b.b.b.b.|b.b.b.XXX.X."],
      "variations" => ["X.b.b.b.b.b.|b.b.b.X.bX.b"]
    },
    "sangban" => {
      "base" => ["b.X.X.b.X.X.|b.X.X.b.X.X."],
      "variations" => []
    },
    "kenken" => {
      "base" => ["X.bb.XX.bb.X|X.bb.XX.bb.X"],
      "variations" => []
    },
    "djembe" => {
      "base" => ["xDo.xxx.o.xx|x.o.xxx.ooxD"],
      "variations" => []
    },
    "djembe2" => {
      "base" => ["x.o.xx.xo...|i.o.xx.xo..D"],
      "variations" => []
    }
  },
  "dependencies" => {
  }
}

