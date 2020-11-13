
# SAMPLES = {
#   "dundun" => {"sample" => :drum_tom_lo_hard, "amp" => 1.2, "rate" => 0.75, "pan" => -0.5, "sustain" => 0.18, "release" => 0.02},
#   "dunclos" => {"sample" => :drum_tom_lo_hard, "amp" => 0.7, "rate" => 0.95, "pan" => -0.5,
#                 "attack" => 0, "sustain" => 0, "release" => 0.18},
#   "sangban" => {"sample" => :drum_tom_mid_hard, "amp" => 1.2, "rate" => 1, "pan" => 0.5},
#   "sanclos" => {"sample" => :drum_tom_mid _hard, "amp" => 0.7, "rate" => 1.15, "pan" => 0.5,
#                 "attack" => 0, "sustain" => 0, "release" => 0.025},
#   "kenken" => {"sample" => :drum_tom_hi_soft, "amp" => 4, "rate" => 1.55, "pan" => 0.2, "sustain" => 0.15, "release" => 0.03},
#   "kenclos" => {"sample" => :drum_tom_hi_hard, "amp" => 0.6, "rate" => 1.5, "pan" => 0.2,
#                "attack" => 0, "sustain" => 0, "release" => 0.13},
#   "dunbell" => {"sample" => :drum_cowbell, "amp" => 0.5, "rate" => 0.7, "pan" => -0.4},
#   "sanbell" => {"sample" => :drum_cowbell, "amp" => 0.5, "rate" => 1.18, "pan" => 0.4},
#   "kenbell" => {"sample" => :drum_cowbell, "amp" => 0.5, "rate" => 1.8, "pan" => 0.2},
#   "djbass" => {"sample" => :DJEMBEBASS2, "amp" => 1.5, "rate" => 1, "pan" => 0},
#   "djton" => {"sample" => :DJEMBE3, "amp" => 1.5, "rate" => 1, "pan" => 0},
#   "djslap" => {"sample" => :DJEMBESLAP3, "amp" => 1.5, "rate" => 1.1, "pan" => 0},
#   "djclos" => {"sample" => :DJEMBESLAP1, "amp" => 1.5, "rate" => 1, "pan" => 0}
# }

# Vytvorí pole s obsahom [sampleName1, sampleName2 ... sampleNameN] kde N = count
define :multiSample do |sampleName, count|
    Array.new(count) {|i| (sampleName + (i+1).to_s).to_sym }
end
  

SAMPLES = {
    "dundun" => {"sample" => multiSample("dundun_s2_v", 5), "amp" => 2.2, "rate" => 0.74, "pan" => -0.3},
    "dunclos" => {"sample" => multiSample("dundun_closed_v", 6), "amp" => 3, "rate" => 0.9, "pan" => -0.3},
    "sangban" => {"sample" => multiSample("sangban_s2_v", 6), "amp" => 2.5, "rate" => 0.9, "pan" => 0.1},
    "sanclos" => {"sample" => multiSample("sangban_closed_v", 6), "amp" => 3, "rate" => 0.9, "pan" => 0.1},
    "kenken" => {"sample" => multiSample("kenkeni_s2_v", 7), "amp" => 2, "rate" => 1.1, "pan" => 0.02},
    "kenclos" => {"sample" => multiSample("kenkeni_closed_v", 6), "amp" => 3, "rate" => 0.9, "pan" => 0.02},
    "dunbell" => {"sample" => multiSample("dundun_bell_open_v", 4), "amp" => 0.8, "rate" => 0.8, "pan" => -0.3},
    "sanbell" => {"sample" => multiSample("sangban_bell_open_v", 5), "amp" => 1, "rate" => 1, "pan" => 0.1},
    "kenbell" => {"sample" => multiSample("kenkeni_bell_open_v", 3), "amp" => 1.3, "rate" => 1.2, "pan" => 0.02},
    "djbass" => {"sample" => [:dj_tm_bass], "amp" => 1, "rate" => 1, "pan" => 0},
    "djton" => {"sample" => multiSample("dj_tm_ton_v", 6), "amp" => 2, "rate" => 1, "pan" => 0},
    "djslap" => {"sample" => multiSample("dj_tm_slap_v", 8), "amp" => 2, "rate" => 1, "pan" => 0},
    "djclos" => {"sample" => multiSample("dj_tm_tonclos_v", 3), "amp" => 2, "rate" => 1, "pan" => 0},
    "dj2_bass" => {"sample" => [:DJEMBEBASS2], "amp" => 0.5, "rate" => 1, "pan" => 0},
    "dj2_ton" => {"sample" => [:DJEMBE2,:DJEMBE3], "amp" => 0.5, "rate" => 1, "pan" => 0},
    "dj2_slap" => {"sample" => [:DJEMBESLAP2,:DJEMBESLAP3,:DJEMBESLAP4], "amp" => 0.5, "rate" => 1.1, "pan" => 0},
    "dj2_clos" => {"sample" => [:DJEMBESLAP1], "amp" => 0.5, "rate" => 1, "pan" => 0},
    "balafon_g0" => {"sample" => multiSample("balafamer_g0_dyn2_ver", 3), "amp" => 1, "rate" => 1, "pan" => 0},
    "balafon_a0" => {"sample" => multiSample("balafamer_a0_dyn2_ver", 3), "amp" => 1, "rate" => 1, "pan" => 0},
    "balafon_h0" => {"sample" => multiSample("balafamer_h0_dyn2_ver", 3), "amp" => 1, "rate" => 1, "pan" => 0},
    "balafon_c1" => {"sample" => multiSample("balafamer_c1_dyn2_ver", 3), "amp" => 1, "rate" => 1, "pan" => 0},
    "balafon_d1" => {"sample" => multiSample("balafamer_d1_dyn2_ver", 3), "amp" => 1, "rate" => 1, "pan" => 0},
    "balafon_e1" => {"sample" => multiSample("balafamer_e1_dyn2_ver", 3), "amp" => 1, "rate" => 1, "pan" => 0},
    "balafon_f1" => {"sample" => multiSample("balafamer_f1_dyn2_ver", 3), "amp" => 1, "rate" => 1, "pan" => 0}
  }
  
  INSTRUMENTS = {
      "dundun" => {
          "open" => SAMPLES["dundun"],
          "closed" => SAMPLES["dunclos"],
          "bell" => SAMPLES["dunbell"]
        },
      "sangban" => {
          "open" => SAMPLES["sangban"],
          "closed" => SAMPLES["sanclos"],
          "bell" => SAMPLES["sanbell"]
        },
      "kenken" => {
          "open" => SAMPLES["kenken"],
          "closed" => SAMPLES["kenclos"],
          "bell" => SAMPLES["kenbell"]
        },
      "djembe" => {
          "bass" => SAMPLES["djbass"],
          "ton" => SAMPLES["djton"],
          "slap" => SAMPLES["djslap"],
          "closed" => SAMPLES["djclos"]
        },
      "djembe2" => {
          "bass" => SAMPLES["dj2_bass"],
          "ton" => SAMPLES["dj2_ton"],
          "slap" => SAMPLES["dj2_slap"],
          "closed" => SAMPLES["dj2_clos"]
        },
      "balafon" => {
          "g0" => SAMPLES["balafon_g0"],
          "a0" => SAMPLES["balafon_a0"],
          "h0" => SAMPLES["balafon_h0"],
          "c1" => SAMPLES["balafon_c1"],
          "d1" => SAMPLES["balafon_d1"],
          "e1" => SAMPLES["balafon_e1"],
          "f1" => SAMPLES["balafon_f1"]
      }
  }

define :rand_around do |v,r|
	return rrand(v-r, v+r)
end

define :playSample do |instrument: {}, probability: 1|
	use_bpm @BPM
	
	s = instrument["sample"].choose
	if s != nil && rand <= probability
		if @OPTIMIZED
			sample s
		elsif
			sample s,
				amp: rand_around(instrument["amp"], HUMANIZE_DYNAMIC),
				pan: instrument["pan"],
				rate: rand_around(instrument["rate"], HUMANIZE_PITCH),
				attack: instrument["attack"],
				sustain: instrument["sustain"],
				release: instrument["release"]
		end
		return true
	else
		return false
	end
end



define :smplr_playNote do |note: "", instrument: {}, instrumentName: ""|

	case
		when ["dundun", "sangban", "kenken"].include?(instrumentName)
			drumOpen = instrument["open"]
			drumClosed = instrument["closed"]
			bell = instrument["bell"]
			case
				when note == 'X' || note == 'x'
					playSample(instrument: drumOpen, probability: 1)
					playSample(instrument: bell)
				when note == 'A'
					if playSample(instrument: drumOpen, probability: 0.12)
					playSample(instrument: bell)
					end
				when note == 'B'
					if playSample(instrument: drumOpen, probability: 0.4)
					playSample(instrument: bell)
					end
				when note == 'C'
					if playSample(instrument: drumOpen, probability: 0.8)
					playSample(instrument: bell)
					end
				when note == 'I' || note == 'i'
					playSample(instrument: drumClosed, probability: 1)
					playSample(instrument: bell)
				when note == 'b'
					playSample(instrument: bell)
				when note == '.'
			end
	
		when ["djembe", "djembe2"].include?(instrumentName)
			bass = instrument["bass"]
			ton = instrument["ton"]
			slap = instrument["slap"]
			closed = instrument["closed"]
			case
			when note == 'D'
				playSample(instrument: bass, probability: 1)
			when note == 'E'
				playSample(instrument: bass, probability: 0.6)
			when note == 'F'
				playSample(instrument: bass, probability: 0.12)
			when note == 'x'
				playSample(instrument: slap, probability: 1)
			when note == 'y'
				playSample(instrument: slap, probability: 0.6)
			when note == 'z'
				playSample(instrument: slap, probability: 0.12)
			when note == 'o'
				playSample(instrument: ton, probability: 1)
			when note == 'p'
				playSample(instrument: ton, probability: 0.6)
			when note == 'q'
				playSample(instrument: ton, probability: 0.12)
			when note == 'i'
				playSample(instrument: closed, probability: 1)
			when note == 'b'
				playSample(instrument: bell)
			when note == '.'
		end

		when instrumentName == "balafon"
			if note != ".."
				playSample(instrument: instrument[note], probability: 1)
			end
	end
end