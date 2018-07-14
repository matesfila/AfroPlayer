###################
### N'Nagnalen ####
###################

@NNagnalen = {
	"BPM" => 100,
	"TIME_SIGNATURE" => [16,8], 
	"SWING" => (ring 0,0,0,0),
	"patterns" => {
		"dundun" => {
			"base" => [".X.X.b.bb.bb.b.b|b.bb.b.bb.XX.X.X"],
			"variations" => ["X.XX.b.bb.bb.b.b|b.bb.b.bb.X.X.X.", "X.XX.b.bb.b.b.XX|.X.XXX.XX.X.X.X."], # 2=>"X.XX.b.bb.bb.b.b"
			"echauff" => []
		},
		"sangban" => {
			"base" => ["X.b.b.X.b.I.b.b.|b.XX.bI.b.b.X.X."],
			"variations" => ["X.b.b.X.b.I.b.b.|b.XX.bI.b.b.XX.X"], # pokracovanie variacie => "X.bb.bX.b.I.b.b."
			"echauff" => ["X.bX.bX.bX.bX.b."],
			"echauff-out" => ["X.bX.bX.bX.bX.b.|.X.X.X.XX.b.X.X."]
		},
		"kenken" => {
			"base" => ["X.b.X.b.X.b.X.b."],
			"variations" => [],
			"echauff" => []
		},
		"djembe" => {
			"base" => ["oo.x..x.oo.x..x.", "ooyx..x.ooyxy.x."],
			"variations" => ["oo.x..x.ooxxx.x.", "ooxx..x.ooxxx.x."],
			"echauff" => ["oooxxxxxxxxxxxxx"],
			"echauff-out" => ["oooxxxxxx.......|o.oo.o.oo.o.x..."]
		},
		"djembe2" => {
			"base" => [""],
			"variations" => [],
			"echauff" => []
		}
	}
}

@RHYTHM = @NNagnalen