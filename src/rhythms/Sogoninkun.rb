###################
### SOGONINKUN ####
###################

#|x       x       x             x             |

@SOGONINKUN = {
	"BPM" => 100,
	"TIME_SIGNATURE" => [16,8], 
	"SWING" => (ring -0.02, -0.02, 0.02, 0.02),
	"patterns" => {
		"dundun" => {
			"base" => ["."],
			"variations" => [],
			"echauff" => []
		},
		"sangban" => {
			"base" => ["I..I...xx.xx...."],
			"variations" => ["I..I...xx.x.x.x."],
			"echauff" => ["x.xx.x.xx.x.xx.x|.x.x.x.xx.x.x.x."],
			"echauff-out" => ["x.xx.x.xx.x.xx.x|x.xx.x.xx.x.x..."],
		},
		"kenken" => {
			"base" => [""],
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

@RHYTHM = @SOGONINKUN