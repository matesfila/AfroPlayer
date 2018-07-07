###############
#### MAANE ####
###############

@MAANE = {
	"BPM" => 115,
	"TIME_SIGNATURE" => [12,8],
	"SWING" => (ring 0,0,0),
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
		},
		"balafon" => {
			#"base" => ["c1 .. g0 .. g0 .. c1 .. a0 .. a0 ..",".. e1 .. c1 .. c1 .. e1 .. d1 .. d1"]
			"base" => ["c1 e1 g0 c1 g0 c1 c1 e1 a0 d1 a0 d1"],
			"variations" => []
		}
	},
		"dependencies" => {
	}
}

@RHYTHM = @MAANE