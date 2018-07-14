###################
#### SANKARANBA ###
###################

@SANKARANBA = {
	"BPM" => 125,
	"TIME_SIGNATURE" => [6,8],
	"SWING" => @DUNUNBE_FAMILY["SWING"],
	"patterns" => {
		"dundun" => {
			"base" => ["b.XX.X|X.XX.b|b.b.XX|.X.X.X|.X.X.X|X.XX.b|b.bb.b"],
			"variations" => ["b.Xb.X|b.Xb.b|b.b.XX|.X.X.X|.X.X.X|X.XX.b|b.bb.b",
							 "b.Xb.X|b.Xb.b|b.b.XX|.X.XXX|.XX.X.|X.XX.b|b.bb.b",
							 "b.XX.X|X.XX.b|b.b.XX|.X.XXX|.X.XXX|.X.XXX|.X.XXX|.X.XXX|.X.XXX|.X.XXX|.X.X.X|.X.X.X|X.XX.b|b.bb.b"],
			"echauff-in" =>  ["b.XX.X|X.XX.b|b.b.XX|.XX.XX|.XX.XX|.XX.XX|.XX.XX"],
			"echauff" =>     [".XX.XX|.XX.XX|.XX.XX|.XX.XX|.XX.XX|.XX.XX|.XX.XX"],
			"echauff-out" => [".XX.XX|.XX.XX|.XX.XX|.X.X.X|.X.X.X|X.XX.b|b.bb.b"]
		},
		"sangban" => {
			"base" => ["b.bX.b|X.b.b.|I.b.b.|X.X.X.|X.bX.b|X.b.b.|I.b.b."],
			"variations" => ["b.bX.b|X.b.b.|I.b.b.|X.b.X.|b.XX.b|X.b.b.|I.b.b.",
							 "b.bX.b|X.b.b.|I.b.b.|X.b.X.|b.bX.b|X.b.b.|I.b.b.",
							 "b.bX.b|X.b.b.|I.b.b.|XX.bXX|.bXX.b|X.b.b.|I.b.b."],
			"echauff" => [],
			"echauff-in" => [],
			"echauff-out" => []
		},
		"kenken" => {"base" => ["..X.XX"]},
		"djembe" => {"base" => ["x.ox.."]}
	},
	"dependencies" => {}
}

@RHYTHM = @SANKARANBA