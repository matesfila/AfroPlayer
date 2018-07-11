#################
### Ginefare ####
#################

@GINEFARE = {
	"BPM" => 190,
	"TIME_SIGNATURE" => [12,8],
	"SWING" => (ring -0.04,0.0, 0.04),
	"patterns" => {
		"dundun" => {
			"base" => ["X..b..b..b..|b.Bb.Bb.Bb.B"],
			"variations" => ["X..b..b..b..|b.Xb.Xb.Xb.."],
		"echauff" => ["X..b..b.X.X.|X.X.X.X.X.b."],
		"echauff-out" => ["x.b..xb..x.b|..xb..x..x.."]
		},
		"sangban" => {
			"base" => ["b..X..b..X..|b..X..b..X.."],
			"variations" => []
		},
		"kenken" => {
			"base" => ["b.b.X.X..X..|b.b.X.X..X.."],
			"variations" => []
		},
		"djembe" => {
			"base" => ["x..oo.x..oo.|x..oo.x..oo."],
			"variations" => [],
		"echauff" => ["o.xx.xx.xx.o"],
		"echauff-out" => ["ooo xxx..ooo|o.o.o.xxxx.o"]
		}
	},
	"dependencies" => {}
}

 @RHYTHM = @GINEFARE