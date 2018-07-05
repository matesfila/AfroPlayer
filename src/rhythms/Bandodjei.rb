###################
### Bando Djei ####
###################

@BPM = 115
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring -0.03,+0.03, 0)

dun_var1 = ".bb.bb.XX.XX|XX.XXX.XX.XX"
san_var1 = "b.bI.I.bX.X.|bX.X.X.bX.X."

@RHYTHM = {
	"patterns" => {
		"dundun" => {
			"base" => [".bb.bb.XX.XX|.bb.XX.XX.XX"],
			"variations" => [dun_var1]
		},
		"sangban" => {
			"base" => ["b.bI.I.bX.X.|b.bb.X.bX.X."],
			"variations" => [san_var1]
		},
		"kenken" => {
			"base" => [".bX.XX.bX.XX"],
			"variations" => []
		},
		"djembe" => {
			"base" => ["x.ox..x.ox.."],
			"variations" => []
		}
	},
	"dependencies" => {
		"sangban" => {san_var1 => {"dundun" => dun_var1}}
	}
}
