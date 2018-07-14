#############
### SOLI ####
#############

dun_var1 = "X.X.XXXX.XXX|.XX.X.X.XX.X"
san_var1 = "XX.XX.XX.XX.|X.X.X.X.bX.b"

dun_var2 = "X.bb.bb.b.XX|.X.X.X.bXX.X"
san_var2 = "X.b.I.I.bX.X|X.X.X.X.bX.b"

dun_var3 = "X.bb.bX.XX.X"

@SOLI = {
	"BPM" => 115,
	"TIME_SIGNATURE" => [12,8],
	"SWING" => (ring 0.03,-0.03, 0),
	"patterns" => {
		"dundun" => {
			"base" => ["X.XX.bb.XX.X"],
			"variations" => [dun_var1] + [dun_var2] + [dun_var3],
			"echauff-in" => ["X.XX.X.X.X.X"],
			"echauff" => [".XX.XX.X.X.X"],
			"echauff-out" => [".XX.XX.X.X.X"]
		},
		"sangban" => {
			"base" => ["X.b.I.I.bX.b"],
			"variations" => [san_var1, san_var2],
			"echauff-in" => ["X.b.X.b.X.b."],
			"echauff" => ["X.b.X.X.b.X."],
			"echauff-out" => ["X.b.X.X.b.bX|.X.X.X.bX.X."]
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


createSolibaSong = Proc.new do
	initSong()
	initRhythm(@SOLI)
	
	#TRACKS["kenkenTrack"]["solo"] = 1
	#basePattern(count: 4)
	#TRACKS["kenkenTrack"]["solo"] = 0

	8.times do
		@RHYTHM = @SOLI;
			basePattern(count: [2,4].choose);
			#variation;
			echauffement(count: [2,4].choose);
		@RHYTHM = @SOLI_MASI;
			echauffement(count: 2);
	end
	@song
end

@RHYTHM = @SOLI
@CREATE_SONG = createSolibaSong