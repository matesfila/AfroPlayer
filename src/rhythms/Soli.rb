#############
### SOLI ####
#############

dun_var1 = "X.X.XXXX.XXX|.XX.X.X.XX.X"
san_var1 = "XX.XX.XX.XX.|X.X.X.X.bX.b"

dun_var2 = "X.bb.bb.b.XX|.X.X.X.bXX.X"
san_var2 = "X.b.I.I.bX.X|X.X.X.X.bX.b"

dun_var3 = "X.bb.bX.XX.X"

@SOLI = {
	"BPM" => 135,
	"TIME_SIGNATURE" => [12,8],
	"SWING" => (ring 0.03,-0.03, 0),
	"patterns" => {
		"dundun" => {
			"base" => ["X.XX.bb.XX.X"],
			"variations" => [dun_var1] + [dun_var2] + [dun_var3]
		},
		"sangban" => {
			"base" => ["X.b.I.I.bX.b"],
			"variations" => [san_var1, san_var2]
		},
		"kenken" => {
			"base" => [".bb.XX.bb.XX"],
			"variations" => []
		},
		"djembe" => {
			"base" => ["x.ox.Dx.ox.."],
			"variations" => ["x.oxoox.oxoo|xooxooxoox.."]
		}
	},
	"dependencies" => {
		"dundun" => {dun_var1 => {"sangban" => san_var1}, dun_var2 => {"sangban" => san_var2}}
	}
}

@SOLI_MASI = {
	"BPM" => 135,
	"TIME_SIGNATURE" => [12,8],
	"SWING" => (ring 0.03,-0.03, 0),
	"patterns" => {
		"dundun" => {
			"base" => [],
			"variations" => [],
			"echauff-in" => ["X.X.b.b.b.XX"],
			"echauff" => [".X.X.X.XX.X.|X.XX.b.bb.XX"],
			"echauff-out" => [".X.X.X.bX.X."]
		},
		"sangban" => {
			"base" => [],
			"variations" => [],
			"echauff-in" => ["X.b.I.b.I.bX"],
			"echauff" => [".X.X.X.bX.X.|b.b.b.b.b.bX"],
			"echauff-out" => [".X.X.X.bX.X."]
			
		},
		"kenken" => {
			"base" => [".bb.XX.bb.XX"],
			"variations" => []
		},
		"djembe" => {
			"base" => ["x.ox.Dx.ox.."],
			"variations" => []
		}
	},
	"dependencies" => {}
}

@RHYTHM = @SOLI