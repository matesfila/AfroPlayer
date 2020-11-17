############
#### KON ###
############

@DUNUNBE_FAMILY = {
	"SWING" => (ring -0.03, +0.03, 0),
	"patterns" => {
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
	}	
}

@KON = {
	"BPM" => 115,
	"TIME_SIGNATURE" => [12,8],
	"SWING" => @DUNUNBE_FAMILY["SWING"],
	"patterns" => {
		"dundun" => {
			"base" => [".bb.bb.XX.XX"],
			"variations" => [".bb.bb.XX.XX|.X.X.X.XX.XX"],
			"echauff" => [".XX.XX.XX.XX"],
			"echauff-out" => [".XX.XX.XX.XX|.X.X.X.XX.XX"]
		},
		"sangban" => {
			"base" => ["I.bb.bb.XX.b"],
			"variations" => ["I.bb.bb.X.bX|.X.X.X.bXX.b"],
			"echauff" => ["b.XX.bb.XX.b"],
			"echauff-in" => ["I.bb.bb.XX.b"],
			"echauff-out" => ["b.XX.bb.X.bX|.X.X.X.bXX.b"]
		},
		"kenken" => @DUNUNBE_FAMILY["patterns"]["kenken"],
		"djembe" => @DUNUNBE_FAMILY["patterns"]["djembe"]
	},
	"dependencies" => {
		"sangban" => {"I.bb.bb.X.bX|.X.X.X.bXX.b" => {"dundun" => ".bb.bb.XX.XX|.X.X.X.XX.XX"}}
	}
}

@KON_MASI = {
	"BPM" => @KON["BPM"],
	"TIME_SIGNATURE" => [12,8],
	"SWING" => @DUNUNBE_FAMILY["SWING"],
	"patterns" => {
		"dundun" => {
			"echauff-in" => [".bb.bb.XX.XX"],
			"echauff" => [".XX.bb.XX.XX"],
			"echauff-out" => [".XX.bb.XX.XX|.X.X.X.XX.XX"]
		},
		"sangban" => {
			"echauff" => [".bX.bb.bX.bb"],
			"echauff-in" => ["I.bb.bb.X.bb"],
			"echauff-out" => [".bX.bb.bX.bX|.X.X.X.bXX.b"]
		},
		"kenken" => @DUNUNBE_FAMILY["patterns"]["kenken"],
		"djembe" => {
			"base" => ["x.ox..x.ox.."],
			"echauff" => ["x.ox..x.ox.."]
		}
	},
	"dependencies" => {}
}

@KON_MAJA = {
	"BPM" => @KON["BPM"],
	"TIME_SIGNATURE" => [12,8],
	"SWING" => @DUNUNBE_FAMILY["SWING"],
	"patterns" => {
		"dundun" => {
			"base" => [".bb.bb.bb.bb|.bb.bb.bb.XX|.XX.bb.bb.bb|.bb.bb.bb.XX|.XX.bb.bb.XX|.XX.bb.XX.XX|.XX.bb.bb.XX|.X.X.X.XX.XX"]
		},
		"sangban" => {
			"base" => ["I.bb.bI.bb.b|I.bb.bI.bb.X|X.bb.bI.bb.b|I.bb.bI.bb.X|X.bb.bI.bb.X|X.bb.bI.XX.X|X.bb.bI.bb.b|X.X.X.X.XX.b"]
		},
		"kenken" => @DUNUNBE_FAMILY["patterns"]["kenken"],
		"djembe" => {
			"base" => ["x.ox..x.ox.."]
		}
	},
	"dependencies" => {}
}

createKonSong = Proc.new do
	song_initialize()
	seqn_initialize(@KON)
	
	#TRACKS["kenkenTrack"]["solo"] = 1
	#song_basePattern(count: 4)
	#TRACKS["kenkenTrack"]["solo"] = 0
	
	
	8.times do
		@RHYTHM = @KON;
			song_basePattern(count: @BASE_PATTERN_COUNT.choose); variation; song_echauffement(count: @ECHAUFF_PATTERN_COUNT.choose);
		@RHYTHM = @KON_MASI;
			song_echauffement(count: 2);
		@RHYTHM = @KON;
			song_basePattern(count: @BASE_PATTERN_COUNT.choose); song_echauffement(count: @ECHAUFF_PATTERN_COUNT.choose);
		@RHYTHM = @KON_MAJA;
			song_basePattern(count: 1);
		@RHYTHM = @KON;
			song_echauffementDirect(count: @ECHAUFF_PATTERN_COUNT.choose);
	end
	@song
end

createBaradasaSong = Proc.new do
	song_initialize()
	seqn_initialize(@KON)
	
	TRACKS["kenkenTrack"]["solo"] = 1
	song_basePattern(count: 4)
	TRACKS["kenkenTrack"]["solo"] = 0

	8.times do
		@RHYTHM = @KON;
			song_basePattern(count: @BASE_PATTERN_COUNT.choose); variation; song_echauffement(count: @ECHAUFF_PATTERN_COUNT.choose);
		@RHYTHM = @KON_MASI;
			song_echauffement(count: 2);
		@RHYTHM = @KON;
			song_basePattern(count: 2); song_echauffement(count: 2);
		@RHYTHM = @KON_MAJA;
			song_basePattern(count: 1);
		@RHYTHM = @KON;
			song_echauffementDirect(count: [2,4].choose);
		@RHYTHM = @BANDO_DJEI;
			song_basePattern(count: @BASE_PATTERN_COUNT.choose); variation; song_echauffement(count: @ECHAUFF_PATTERN_COUNT.choose);
		@RHYTHM = @BOLOKONONDO;
			song_basePattern(count: @BASE_PATTERN_COUNT.choose / 2); variation; song_echauffement(count: @ECHAUFF_PATTERN_COUNT.choose / 2);
	end
	@song
end

@RHYTHM = @KON
@CREATE_SONG_FUNC = createBaradasaSong
