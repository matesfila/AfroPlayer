
# Vytvorí pole s obsahom [sampleName1, sampleName2 ... sampleNameN] kde N = count
define :multiSample do |sampleName, count|
    Array.new(count) {|i| (sampleName + (i+1).to_s).to_sym }
end
  

SAMPLES = {
    "dundun_open" => {"sample" => multiSample("dundun_s2_v", 5), "amp" => 2.2, "rate" => 0.74, "pan" => -0.3},
    "dundun_clos" => {"sample" => multiSample("dundun_closed_v", 6), "amp" => 3, "rate" => 0.9, "pan" => -0.3},
    "sangban_open" => {"sample" => multiSample("sangban_s2_v", 6), "amp" => 2.5, "rate" => 0.9, "pan" => 0.1},
    "sangban_clos" => {"sample" => multiSample("sangban_closed_v", 6), "amp" => 3, "rate" => 0.9, "pan" => 0.1},
    "kenken_open" => {"sample" => multiSample("kenkeni_s2_v", 7), "amp" => 2, "rate" => 1.1, "pan" => 0.02},
    "kenken_clos" => {"sample" => multiSample("kenkeni_closed_v", 6), "amp" => 3, "rate" => 0.9, "pan" => 0.02},
    "bell_dun" => {"sample" => multiSample("dundun_bell_open_v", 4), "amp" => 0.8, "rate" => 0.8, "pan" => -0.3},
    "bell_san" => {"sample" => multiSample("sangban_bell_open_v", 5), "amp" => 1, "rate" => 1, "pan" => 0.1},
    "bell_ken" => {"sample" => multiSample("kenkeni_bell_open_v", 3), "amp" => 1.3, "rate" => 1.2, "pan" => 0.02},
    "dj1_bass" => {"sample" => [:dj_tm_bass], "amp" => 1, "rate" => 1, "pan" => 0},
    "dj1_ton" => {"sample" => multiSample("dj_tm_ton_v", 6), "amp" => 2, "rate" => 1, "pan" => 0},
    "dj1_slap" => {"sample" => multiSample("dj_tm_slap_v", 8), "amp" => 2, "rate" => 1, "pan" => 0},
    "dj1_clos" => {"sample" => multiSample("dj_tm_tonclos_v", 3), "amp" => 2, "rate" => 1, "pan" => 0},
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
        'X' => {"samples" => SAMPLES["dundun_open"], "probability" => 1},
        'A' => {"samples" => SAMPLES["dundun_open"], "probability" => 0.12},
        'B' => {"samples" => SAMPLES["dundun_open"], "probability" => 0.4},
        'C' => {"samples" => SAMPLES["dundun_open"], "probability" => 0.8},
        'I' => {"samples" => SAMPLES["dundun_clos"], "probability" => 1},
        'i' => {"samples" => SAMPLES["dundun_clos"], "probability" => 1},
        'b' => {"samples" => SAMPLES["bell_dun"], "probability" => 1}
        },
      "sangban" => {
        'X' => {"samples" => SAMPLES["sangban_open"], "probability" => 1},
        'A' => {"samples" => SAMPLES["sangban_open"], "probability" => 0.12},
        'B' => {"samples" => SAMPLES["sangban_open"], "probability" => 0.4},
        'C' => {"samples" => SAMPLES["sangban_open"], "probability" => 0.8},
        'I' => {"samples" => SAMPLES["sangban_clos"], "probability" => 1},
        'i' => {"samples" => SAMPLES["sangban_clos"], "probability" => 1},
        'b' => {"samples" => SAMPLES["bell_san"], "probability" => 1}
        },
      "kenken" => {
        'X' => {"samples" => SAMPLES["kenken_open"], "probability" => 1},
        'A' => {"samples" => SAMPLES["kenken_open"], "probability" => 0.12},
        'B' => {"samples" => SAMPLES["kenken_open"], "probability" => 0.4},
        'C' => {"samples" => SAMPLES["kenken_open"], "probability" => 0.8},
        'I' => {"samples" => SAMPLES["kenken_clos"], "probability" => 1},
        'i' => {"samples" => SAMPLES["kenken_clos"], "probability" => 1},
        'b' => {"samples" => SAMPLES["bell_ken"], "probability" => 1}
        },
      "djembe" => {
        'D' => {"samples" => SAMPLES["dj1_bass"], "probability" => 1},
        'E' => {"samples" => SAMPLES["dj1_bass"], "probability" => 0.6},
        'F' => {"samples" => SAMPLES["dj1_bass"], "probability" => 0.12},
        'x' => {"samples" => SAMPLES["dj1_slap"], "probability" => 1},
        'y' => {"samples" => SAMPLES["dj1_slap"], "probability" => 0.6},
        'z' => {"samples" => SAMPLES["dj1_slap"], "probability" => 0.12},
        'o' => {"samples" => SAMPLES["dj1_ton"], "probability" => 1},
        'p' => {"samples" => SAMPLES["dj1_ton"], "probability" => 0.6},
        'q' => {"samples" => SAMPLES["dj1_ton"], "probability" => 0.12},
        'i' => {"samples" => SAMPLES["dj1_clos"], "probability" => 1}
        },
      "djembe2" => {
        'D' => {"samples" => SAMPLES["dj2_bass"], "probability" => 1},
        'E' => {"samples" => SAMPLES["dj2_bass"], "probability" => 0.6},
        'F' => {"samples" => SAMPLES["dj2_bass"], "probability" => 0.12},
        'x' => {"samples" => SAMPLES["dj2_slap"], "probability" => 1},
        'y' => {"samples" => SAMPLES["dj2_slap"], "probability" => 0.6},
        'z' => {"samples" => SAMPLES["dj2_slap"], "probability" => 0.12},
        'o' => {"samples" => SAMPLES["dj2_ton"], "probability" => 1},
        'p' => {"samples" => SAMPLES["dj2_ton"], "probability" => 0.6},
        'q' => {"samples" => SAMPLES["dj2_ton"], "probability" => 0.12},
        'i' => {"samples" => SAMPLES["dj2_clos"], "probability" => 1}
        },
      "balafon" => {
          "g0" => {"samples" => SAMPLES["balafon_g0"], "probability" => 1}, 
          "a0" => {"samples" => SAMPLES["balafon_a0"], "probability" => 1},
          "h0" => {"samples" => SAMPLES["balafon_h0"], "probability" => 1},
          "c1" => {"samples" => SAMPLES["balafon_c1"], "probability" => 1},
          "d1" => {"samples" => SAMPLES["balafon_d1"], "probability" => 1},
          "e1" => {"samples" => SAMPLES["balafon_e1"], "probability" => 1},
          "f1" => {"samples" => SAMPLES["balafon_f1"], "probability" => 1}
      }
    }

define :rand_around do |v,r|
	return rrand(v-r, v+r)
end

define :playSample do |sample: {}, probability: 1|
	use_bpm @RHYTHM["BPM"]
	
	s = sample["sample"].choose
	if s != nil && rand <= probability
		if @OPTIMIZED
			sample s
		elsif
			sample s,
				amp: rand_around(sample["amp"], HUMANIZE_DYNAMIC),
				pan: sample["pan"],
				rate: rand_around(sample["rate"], HUMANIZE_PITCH),
				attack: sample["attack"],
				sustain: sample["sustain"],
				release: sample["release"]
		end
		return true
	else
		return false
	end
end



define :smplr_playNote do |note: "", instrumentName: ""|

    instrument = INSTRUMENTS[instrumentName]
            
    noteInfo = instrument[note]
    if note != '.' && note != ".."
        notePlayed = playSample(sample: noteInfo["samples"], probability: noteInfo["probability"])
        if notePlayed && ["dundun", "sangban", "kenken"].include?(instrumentName)
          playSample(sample: instrument['b']["samples"])
        end
    end

end