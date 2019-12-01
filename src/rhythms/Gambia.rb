###############
### GAMBIA ####
###############

@GAMBIA = {
	"BPM" => 240,
	"TIME_SIGNATURE" => [8,4], #osem štvrťový rytmus
	"SWING" => (ring 0,0,0,0),
	"patterns" => {
		"dundun" => {
			"base" => ["b|b"],
#			"variations" => ["XX.XXX.X|XX.XX.X."],
#			"echauff" => ["X.XX.XX.|X.XX.XX."]
		},
		"sangban" => {
			"base" => ["........|........."],
#			"variations" => ["..X...X.|..X..X.X"],
#			"echauff" => ["X.b.X.X.|X.b.X.X."]
		},
		"kenken" => {
			"base" => ["........|........."],
#			"variations" => [],
#			"echauff" => []
		},
		"djembe" => {
			"base" => [
				"D.oo|.x..|..oo|.x..|D.oo|.x..|..oo|.x..|"+
				"D.oo|.x..|..oo|.x..|D.oo|.x..|..oo|.x..|"+
				"..xx|.o.o|....|....|...x|.x.x|....|....|"+
				"..xx|.D.D|....|....|..xx|...x|.x..|....|"+
				"..xx|.D.D|....|....|...x|.x.x|....|....|"+
				"..xx|.D.D|....|....|xx..|xx..|xx..|x.x.|"+
				"....|....|xo.o|.oo.|xo.o|.oo.|xo..|xo..|"+
				"xo.o|.oo.|xo.o|.oo.|xx..|xx..|xx..|xx..|"+
				"xo.o|.oo.|xo.o|.oo.|xx..|....|xooooo|x.x.|"
				"....|...x|ooxo|oxoo|xoox|ooxo|oxoo|x...|"+
				"......|......|...ooo|x.x...|...ooo|x.x...|"+
				"x.....|oooooo|......|......|......|......|""
			],
			"variations" => [],
			"echauff" => ["oooxxxxx|xxxxxxxx"]
		},
#		"djembe2" => {
#			"base" => ["D.xxD.oo|D.xxD.oo"],
#			"variations" => [],
#			"echauff" => []
#		}
	}
}

@RHYTHM = @GAMBIA
