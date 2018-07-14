#####################
#### Bolokonondo ####
#####################


dun_base =  "b.bb.bb.bb.b|b.XX.X.XX.X.|" +
  "b.bb.bb.bb.b|b.XX.X.XX.X.|" +
  "XX.X.X.XX.X.|X.XX.X.XX.XX|" +
  ".X.X.X.XX.X."

san_base =  "I.bI.bI.bI.b|I.bX.X.bb.X.|" +
  "I.bI.bI.bI.b|I.bX.X.bb.X.|" +
  "b.bX.b.bX.b.|b.XX.Xb.bb.X|" +
  "b.bb.Xb.b.X."

dun_var1 =  "b.bb.bb.bb.b|b.XX.X.XX.X.|" +
  "b.bb.bb.bb.b|b.XX.X.XX.XX|" +
  ".X.X.X.XX.XX|.X.X.X.XX.XX|" +
  ".X.X.X.XX.X."


dun_var2 =  "b.bb.bb.bb.b|b.XX.X.XX.X.|" +
  "b.bb.bb.bb.b|b.XX.X.XX.XX|" +
  ".X.X.X.X.X.X|.X.X.X.X.X.X|" +
  ".X.X.X.XX.X."

@BOLOKONONDO = {
	"BPM" => 120,
	"TIME_SIGNATURE" => [12,8],
	"SWING" => (ring -0.03,+0.04, -0.01),
	"patterns" => {
		"dundun" => {
			"base" => [dun_base],
			"variations" => [dun_var1, dun_var2],
			"echauff" => [".XX.XX.XX.XX|.XX.XX.XX.XX|.XX.XX.XX.XX|.XX.XX.XX.XX|.XX.XX.XX.XX|.XX.XX.XX.XX|.XX.XX.XX.XX"],
			"echauff-out" => [dun_base]
		},
		"sangban" => {
			"base" => [san_base],
			"variations" => []
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
	"dependencies" => {}
}

@RHYTHM = @BOLOKONONDO