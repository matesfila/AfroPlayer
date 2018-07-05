#############
### Kawa ####
#############

@BPM = 123
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING =  (ring 0,0,0) #(ring -0.02, 0.06, -0.04)

dun_var1 = ".bX.XX.X.X.b|.XX.XX.bb.bb"
san_var1 = "I.b.X.b.XX.b|X.X.X.b.XX.b"

@RHYTHM = {
	"patterns" => {
		"dundun" => {
			"base" => [".bb.XX.X.X.X|.XX.XX.bb.bb"],
			"variations" => [dun_var1],
			"echauff" => [".XX.XX.X.X.X|.XX.XX.X.X.X"],
			"echauff-in" => [".XX.XX.X.X.X|.XX.XX.X.X.X"],
			"echauff-out" => [".XX.XX.X.X.X|.XX.XX.bb.bb"]
		},
		"sangban" => {
			"base" => ["I.b.X.b.XX.b|X.X.X.b.XX.b"],
			"variations" => [san_var1],
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
			"echauff-out" => ["oooxxxxxxxxx|ooooo.oo.o.."]
		}
	},
	"dependencies" => {
		"sangban" => {san_var1 => {"dundun" => dun_var1}}
	}
}
