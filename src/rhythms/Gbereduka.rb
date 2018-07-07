###################
#### Gbereduka ####
###################

dun_base =  "X.XX.b.bb.b.|b.bb.b.XX.X.|" +
            "X.XX.b.bb.b.|b.bb.b.XX.X.|" +
            "X.XX.X.XX.X.|XX.X.X.XX.X.|" +
            "X.XX.X.XX.XX|.XX.XX.XX.X.|"
san_base =  "XX.b.I.bI.b.|b.I.bI.bb.X.|" +
            "X.bb.I.bI.b.|b.I.bI.bb.X.|" +
            "X.bb.X.bb.X.|b.bX.b.bX.X.|" +
            "X.bb.X.bb.bX|X.XX.X.bX.X."

ken_base = ".bX.XX.bX.XX"

dj_base =  ["x.ox..x.ox.."].cycle(4).to_a.join('|') + "|" + ["oqoqoqxyxyxyxyxyxyxyxyxy"].cycle(4).to_a.join('|')
dj_base2 = ["x..xoox..xoo"].cycle(4).to_a.join('|') + "|" + ["oyxyxyoyxyxyoyxyxyoyxyxy"].cycle(4).to_a.join('|')
#dj_base3 = ["............"].cycle(8).to_a.join('|')

@GBEREDUKA = {
	"BPM" => 120,
	"TIME_SIGNATURE" => [12,8],
	"SWING" => (ring -0.04,+0.04, 0),
	"patterns" => {
		  "dundun" => {
			"base" => [dun_base],
			"variations" => [] + []
		  },
		  "sangban" => {
			"base" => [san_base],
			"variations" => []
		  },
		  "kenken" => {
			"base" => [ken_base],
			"variations" => []
		  },
		  "djembe" => {
			"base" => [dj_base2, dj_base2],
			"variations" => []
		  }
	},
	"dependencies" => {
		#"sangban" => {san_var1 => {"dundun" => dun_var1}}
	}
}

 @RHYTHM = @GBEREDUKA