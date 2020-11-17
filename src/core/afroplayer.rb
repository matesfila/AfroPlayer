#Afroplayer.rb obsahuje definície všeobecných funkcií, ktoré sa potom
#využívajú na konkrétne hranie ako jam, skladba a podobne.

##################################################################
#Používateľská časť - premenné, s ktorými sa používateľ môže hrať#
##################################################################

HUMANIZE_TIME = 0.0133
HUMANIZE_DYNAMIC = 0.07
HUMANIZE_PITCH = 0.005
@OPTIMIZED = false #optimalizacia pre raspberry pi: vypnutie efektov a na procesor narocnejsich veci

TRACKS = {
  #pre solo a mute: 0 = false, 1 = true, skrateny zapis
  "dundunTrack" => {"instrumentName" => "dundun", "solo" => 0, "mute" => 0},
  "sangbanTrack" => {"instrumentName" => "sangban", "solo" => 0, "mute" => 0},
  "kenkenTrack" => {"instrumentName" => "kenken", "solo" => 0, "mute" => 0},
  "djembeTrack" => {"instrumentName" => "djembe", "solo" => 0, "mute" => 0},
  "djembe2Track" => {"instrumentName" => "djembe2", "solo" => 0, "mute" => 1},
  "balafonTrack" => {"instrumentName" => "balafon", "solo" => 0, "mute" => 1}
}


####################################################
#Systémová časť - core (bežne sa do nej nezasahuje)#
####################################################

# Čistá štruktúra pre vytvorenie nového rytmu:
# @RHYTHM = {
#   "patterns" => {
#     "dundun" => {
#       "base" => [],
#       "variations" => []
#     },
#     "sangban" => {
#       "base" => [],
#       "variations" => []
#     },
#     "kenken" => {
#       "base" => [],
#       "variations" => []
#     },
#     "djembe" => {
#       "base" => [],
#       "variations" => []
#     }
#   },
#   "dependencies" => {}
# }

#regulárny výraz na hodnotu patternu, príklad: "kenken: x.b.x.b.|x.b.x.b."
#RGXP_PATTERN = /^(\w+):\s+([\.\|bXABCDEFIixyzopq]+)$/

define :countNoteDelay do |note|
  #definuje dĺžku sleepu: pre štvrťové rytmy sa hrajú šestnástinové noty, pre trojkové sa hrajú osminové
	case
		when note == 2
			return 1.0 / 2
		when note == 3
			return 1.0 / 3
		when note == 4
			return 1.0 / 4
		when note == 6
			return 1.0 / 3
		when note == 8
			return 1.0 / 4
		when note == 12
			return 1.0 / 3
		when note == 16
			return 1.0 / 4
	end
end


# Rozparsuje vstupný pattern, ktorý je na vstupe v surovom stave.
# +return+ Vráti mapu s kľúčmi instrumentName a pattern
# define :patternParse do |pattern|
#   m = pattern.match(RGXP_PATTERN)
#   return {"instrumentName" => m[1], "pattern" => m[2]}
# end

define :seqn_patternSize do |pattern|
	return pattern.delete("|").length()
end

define :seqn_barCount do |pattern|
	count = 1
	pattern.each_char { |c|
		if c == "|"
			count = count + 1
		end
	}
	return count
end

define :seqn_playBar do |bar: "", instrumentName: ""|

	use_bpm @RHYTHM["BPM"]
	h = 0
	sync :tick

	if instrumentName == "balafon"
		bar.split.each { |c|
			puts "balafon #{c}"
			smplr_playNote(note: c, instrumentName: instrumentName)
			sleep h
			h = rrand(0, HUMANIZE_TIME)
			#sleep @RHYTHM["TIME_SIGNATURE"][0]* 1.0 / bar.length + @RHYTHM["SWING"].tick - h
			sleep @DELAY * (1.0*@RHYTHM["TIME_SIGNATURE"][0] / bar.split.length) + @RHYTHM["SWING"].tick - h
			#sleep @DELAY + @RHYTHM["SWING"].tick - h
		}
	else
		bar.each_char { |c|
			smplr_playNote(note: c, instrumentName: instrumentName)
			sleep h
			h = rrand(0, HUMANIZE_TIME)
			#sleep @RHYTHM["TIME_SIGNATURE"][0]* 1.0 / bar.length + @RHYTHM["SWING"].tick - h
			sleep @DELAY * (1.0*@RHYTHM["TIME_SIGNATURE"][0] / bar.length) + @RHYTHM["SWING"].tick - h
			#sleep @DELAY + @RHYTHM["SWING"].tick - h
		}
	end
end

define :seqn_playPattern do |pattern: "", instrumentName: ""|
	#pattern = patternParse(pattern)
	pattern.split(/\|/).each do |b|
		seqn_playBar(bar: b, instrumentName: instrumentName)
	end
end

#seqn_tracksToPlay vrati zoznam trackov so zohladnenim parametrov solo a mute
define :seqn_tracksToPlay do |tracks|
	soloTracks = tracks.select{|t| tracks[t]["solo"] == 1}
	tracksToPlay = (soloTracks.size > 0 ? soloTracks : tracks).select{|t| tracks[t]["mute"] == 0}
end

define :seqn_initialize do |rhythm|
	@RHYTHM = rhythm
	@DELAY = countNoteDelay(@RHYTHM["TIME_SIGNATURE"][0])
end

# prehrá všetky patterny zadané v mape patterns
# patterns je mapa prvkov instrumentName -> pattern
#define :seqn_playPatterns do |patterns: {}|
#	patterns.each do |instrumentName, pattern|
#		puts instrumentName + " => " + pattern
#		in_thread() do
#			seqn_playPattern(pattern: pattern, instrumentName: instrumentName)
#			cue :p
#		end
#	end
#	patterns.each do |instrumentName, pattern|
#		sync :p
#		#sync :tick
#	end
#end


seqn_playPattern(pattern: ["X.X.X.X.X.X.X.X"], instrumentName: "sangban")