#############
### Kawa ####
#############

@KAWA = {
	"BPM" => 129,
	"TIME_SIGNATURE" => [12,8],
	"SWING" => (ring 0,0,0), #(ring -0.02, 0.06, -0.04)
	"patterns" => {
		"dundun" => {
			"base" => [".bb.XX.X.X.X|.XX.XX.bb.bb"],
			"variations" => [".bX.XX.X.X.b|.XX.XX.bb.bb"],
			"echauff" => [".XX.XX.X.X.X|.XX.XX.X.X.X"],
			"echauff-in" => [".XX.XX.X.X.X|.XX.XX.X.X.X"],
			"echauff-out" => [".XX.XX.X.X.X|.XX.XX.bb.bb"]
		},
		"sangban" => {
			"base" => ["I.b.X.b.XX.b|X.X.X.b.XX.b"],
			"variations" => ["I.b.X.b.XX.b|X.X.X.b.XX.b"],
			"echauff" => ["I.b.X.b.XX.b|.XX.X.b.XX.b"],
			"echauff-in" => ["I.b.X.b.XX.b|.XX.X.b.XX.b"],
			"echauff-out" => ["I.b.bX.X.X.b|.XX.X.b.XX.b"]
		},
		"kenken" => {
			"base" => ["X.bb.XX.bb.X"],
			"variations" => []
		},
		"djembe" => {
			"base" => ["x.ox..x.ox.."],
			"variations" => [],
			"echauff" => ["oooxxxxxxxxx"],
			"echauff-in" => ["oooxxxxxxxxx"],
			"echauff-out" => ["o...........|ooooo.oo.o.."]
		}
	},
	"dependencies" => {
		"sangban" => {"I.b.X.b.XX.b|X.X.X.b.XX.b" => {"dundun" => ".bX.XX.X.X.b|.XX.XX.bb.bb"}}
	}
}

@RHYTHM = @KAWA