##############
### DJOLE ####
##############

@BPM = 115
@RHYTHM_TIME = [8,4] #osem štvrťový rytmus
@RHYTHM_SWING = (ring 0,0,0,0)

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => ["X.b.b.b.|X.X.b.b."],
      "variations" => ["XX.XXX.X|XX.XX.X."],
	  "echauff" => ["X.XX.XX.|X.XX.XX."]
    },
    "sangban" => {
      "base" => ["X.b.X.b.|X.b.X.b."],
      "variations" => ["..X...X.|..X..X.X"],
	  "echauff" => ["X.b.X.X.|X.b.X.X."]
    },
    "kenken" => {
      "base" => ["b.XXb.XX|b.XXb.XX"],
      "variations" => [],
	  "echauff" => []
    },
    "djembe" => {
      "base" => ["Dyoo..xy|D.oopyx."],
      "variations" => [],
	  "echauff" => ["oooxxxxx|xxxxxxxx"]
    },
    "djembe2" => {
      "base" => ["D.xxD.oo|D.xxD.oo"],
      "variations" => [],
	  "echauff" => []
    }
  }
}

