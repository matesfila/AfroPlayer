####################
### Test rhythm ####
####################

#Tento rytmus je niečo ako test unit - slúži na testovanie. Jeho podstatou je,
#že by mali byť dobre poučiť všetky zvuky, aby človek vedel hneď skontrolovať,
#či naozaj všetko, čo má hrať, aj hrá.

dun_base = "X.......|X......."
san_base = "....X...|....X..."
ken_base = "..X...X.|..X...X."
dj1_base = "Dyoo..xy|o.oopyx."
dj2_base = "D.xxD.oo|D.xxD.oo"

dun_var1 = "X..X..X.|.X..X..X"
san_var1 = ".X..X..X|..X..X.."
ken_var1 = "..X..X..|X..X..X."

dun_var2 = "XX....XX|....XX.."
san_var2 = "..XX....|XX....XX"
ken_var2 = "....XX..|..XX...."

dun_var3 = "XXX.....|.XXX...."
san_var3 = "...XXX..|....XXX."
ken_var3 = "......XX|X......X"

TESTRHYTHM = {
	"BPM" => 115,
	"TIME_SIGNATURE" => [8,4],
	"SWING" => (ring 0,0,0),
  "patterns" => {
    "dundun" => {
      "base" => [dun_base],
      "variations" => [dun_var1, dun_var2, dun_var3]
    },
    "sangban" => {
      "base" => [san_base],
      "variations" => [san_var1, san_var2, san_var3]
    },
    "kenken" => {
      "base" => [ken_base],
      "variations" => [ken_var1, ken_var2, ken_var3]
    },
    "djembe" => {
      "base" => [dj1_base],
      "variations" => []
    },
    "djembe2" => {
      "base" => [dj2_base],
      "variations" => []
    }
  },
  "dependencies" => {
    "dundun" => {
      dun_var1 => {"sangban" => san_var1, "kenken" => ken_var1},
      dun_var2 => {"sangban" => san_var2, "kenken" => ken_var2},
      dun_var3 => {"sangban" => san_var3, "kenken" => ken_var3}
    }
  }
}

 @RHYTHM = TESTRHYTHM