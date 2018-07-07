###################
### Bando Djei ####
###################

@BANDO_DJEI = {
	"BPM" => 120,
	"TIME_SIGNATURE" => [12,8],
	"SWING" => (ring -0.03,+0.03, 0),	
	"patterns" => {
		"dundun" => {
			"base" => [".bb.bb.XX.XX|.bb.XX.XX.XX"],
			"variations" => [".bb.bb.XX.XX|XX.XXX.XX.XX"],
			"echauff" => [".XX.XX.XX.XX"],
			"echauff-out" => [".XX.XX.XX.XX|.X.X.X.XX.XX"]
		},
		"sangban" => {
			"base" => ["b.bI.I.bX.X.|b.bb.X.bX.X."],
			"variations" => ["b.bI.I.bX.X.|bX.X.X.bX.X."],
			"echauff" => ["b.bI.I.bX.X.|bX.X.X.bX.X."],
			"echauff-in" => ["b.bI.I.bX.X.|bX.X.X.bX.X."],
			"echauff-out" => ["b.bI.I.bX.X.|X.bX.bX.X.X."]
		},
		"kenken" => {
			"base" => [".bX.XX.bX.XX"],
			"variations" => []
		},
		"djembe" => {
			"base" => ["x.ox..x.ox.."],
			"variations" => [],
			"echauff" => ["oxxoxxoxxoxx"],
			"echauff-in" => ["oxxoxxoxxoxx"],
			"echauff-out" => ["oooxxxx.....|xxx.x.x...ooo.o.o...x..."]
		}
	},
	"dependencies" => {
		"sangban" => {"b.bI.I.bX.X.|bX.X.X.bX.X." => {"dundun" => ".bb.bb.XX.XX|XX.XXX.XX.XX"}}
	}
}
@RHYTHM = @BANDO_DJEI