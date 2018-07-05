############
#### KON ###
############

@BPM = 110
@RHYTHM_TIME = [12,8] #dvanásťosminovýrytmus
@RHYTHM_SWING = (ring -0.03, +0.03, 0)

dun_var1 = ".bb.bb.XX.XX|.X.X.X.XX.XX"
san_var1 = "I.bb.bb.X.bX|.X.X.X.bXX.b"

@RHYTHM = {
	"patterns" => {
		"dundun" => {
			"base" => [".bb.bb.XX.XX"],
			"variations" => [dun_var1],
			"echauff" => [".XX.XX.XX.XX"]
		},
		"sangban" => {
			"base" => ["I.bb.bb.XX.b"],
			"variations" => [san_var1],
			"echauff" => ["b.XX.bb.XX.b"],
			"echauff-in" => ["I.bb.bb.XX.b"],
			"echauff-out" => ["b.XX.bb.X.bX|.X.X.X.bXX.b"]
		},
		"kenken" => {
			"base" => [".bX.XX.bX.XX"],
			"variations" => [],
			"echauff" => []
		},
		"djembe" => {
			"base" => ["x.ox..x.ox.."],
			"variations" => [],
			"echauff" => ["oooxxxxxxxxx"],
			"echauff-in" => ["oooxxxxxxxxx"],
			"echauff-out" => ["oooxxxx.....|xxx.x.x...ooo.o.o...x..."]
		}
	},
	"dependencies" => {
		"sangban" => {san_var1 => {"dundun" => dun_var1}}
	}
}
