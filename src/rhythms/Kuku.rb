#############
### KUKU ####
#############

@BPM = 110
@RHYTHM_TIME = [8,4] #osem štvrťový rytmus

@KUKU = {
	"BPM" => 110,
	"TIME_SIGNATURE" => [8,4],
	"SWING" => (ring 0,0,0),
	"patterns" => {
		"dundun" => {
			"base" => Array.new(12, "b.bX.bb.|b.b.B.b.") + ["bX.X.bb.|b.b.B.b."],
			"variations" => Array.new(4, "b.bX.bb.|X.bX.bX.") +
							Array.new(8, "b.AX.AX.|AX.AX.X.") +
							Array.new(2, "b.bX.bb.|X.XX.XX.") +
							Array.new(8, "B.BB.BB.|C.CC.CC.") +
							Array.new(2, "X.bX.bB.|XX.X.XX.|X.XX.XX.|XX.XXXX.")
		},
		"sangban" => {
			"base" => ["X.b.b.X.|X.b.b.X."],
			"variations" => ["X.bX.bX.|bX.bX.X."]
		},
		"kenken" => {
			#"base" => ["X.b.X.b.|X.b.X.b."],
			"base" => ["XX..XX..|XX..XX.."],
			"variations" => []
		},
		"djembe" => {
			"base" => ["x.oo..x.|x.oo..x."],
			"variations" => ["x.oxoox.|ox.xoox.", "x.oo..x.|ooxxooxx|x.oxoox.|ox.xoox."]
		},
		"djembe2" => {
			"base" => ["x.D.oo..|x.D.oo.."],
			"variations" => []
		}
	}
}

 @RHYTHM = @KUKU