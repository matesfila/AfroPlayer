##################################################################
# Engine skladanie konkretneho songu.
##################################################################

@BASE_PATTERN_COUNT = [2]
@PLAY_VARIATION = TRUE
@ECHAUFF_PATTERN_COUNT = [2]

@CREATE_SONG_FUNC = nil

define :song_addPattern do |patternType: "", song: {}|

	define :choosePattern do |instrument: "", patternType: ""|

		#pomocná funkcia na výber patternu ktorá zohladnuje možnosť
		#prázdnej množiny patternov
		define :choosePrimitive do |patternType: ""|
			patterns = @RHYTHM["patterns"][instrument][patternType]
			if patterns != nil
				return patterns.choose
			else
				return nil
			end
		end
		
		p = choosePrimitive(patternType: patternType)
		
		if p != nil
			return p
		elsif p == nil
			case
				when patternType == "base"
					return nil
				when patternType == "variations"
					return @RHYTHM["patterns"][instrument]["base"].choose
				when patternType == "echauff"
					return @RHYTHM["patterns"][instrument]["base"].choose
				when patternType == "echauff-in"
					return @RHYTHM["patterns"][instrument]["base"].choose
				when patternType == "echauff-out"
					p = choosePrimitive(patternType: "echauff")
					if p != nil
						return p
					else
						return @RHYTHM["patterns"][instrument]["base"].choose
					end
			end
		end
	end

	patternsToAdd = {} #patterny, ktorá sa pridajú do fronty, pre každý nástroj jeden pattern
	
	TRACKS.each do |trackName, trackProperties|
		patternsToAdd[trackName] = "."
	end
	
	maxBarCount = 0 #zároveň sa odpamätá dĺžka najdlhšie patternu, ktorý sa pridal do fronty
	seqn_tracksToPlay(TRACKS).each do |trackName, trackProperties|
		pattern = choosePattern(instrument: trackProperties["instrumentName"], patternType: patternType)
		patternBarCount = seqn_barCount(pattern)
		patternsToAdd[trackName] = pattern
		if patternBarCount > maxBarCount
			maxBarCount = patternBarCount
		end
	end

	#patterny sa pridajú do reálnych trackov. Patterny o dĺžke 1 sa pridajú toľko krát, aby
	#sa zarovnali na najdlší pattern.
	TRACKS.each do |trackName, trackProperties|
		pattern = patternsToAdd[trackName]
		if seqn_barCount(pattern) == 1
			maxBarCount.times do
				song[trackName] << patternsToAdd[trackName]
			end
		elsif
			song[trackName] << patternsToAdd[trackName]
		end
	end	

end

define :song_play do |song|

	define :playSongTrack do |trackName, trackLine|
		in_thread(name: trackName) do
			while !trackLine.empty? do
				seqn_playPattern(pattern: trackLine.pop, instrumentName: TRACKS[trackName]["instrumentName"])
			end
		end
	end

	seqn_tracksToPlay(TRACKS).each do |trackName, trackProperties|
		playSongTrack(trackName, song[trackName])
	end
	
	song_playDirigent
end

@song = {}

define :song_basePattern do |count: 1|
	count.times do song_addPattern(patternType: "base", song: @song) end
end

define :variation do
	song_addPattern(patternType: "variations", song: @song)
end

define :song_echauffement do |count: 1|
	song_addPattern(patternType: "echauff-in", song: @song)
	count.times do song_addPattern(patternType: "echauff", song: @song) end
	song_addPattern(patternType: "echauff-out", song: @song)
end

define :song_echauffementDirect do |count: 1|
	count.times do song_addPattern(patternType: "echauff", song: @song) end
	song_addPattern(patternType: "echauff-out", song: @song)
end

define :song_initialize do
	@song = {}
	TRACKS.each do |trackName, trackProperties|
		@song[trackName] = Queue.new
	end
end

define :song_playDirigent do
#  cue :tick
  in_thread(name: :dirigent) do
    loop do
      use_bpm @RHYTHM["BPM"]
      #sample  :drum_cymbal_closed #metronom
      cue :tick
      sleep @DELAY * @RHYTHM["TIME_SIGNATURE"][0] + HUMANIZE_TIME + 0.025
    end
  end
end

@createEchauffSong = Proc.new do
	song_initialize()
	seqn_initialize(@RHYTHM)
	10.times do
		song_basePattern(count: @BASE_PATTERN_COUNT.choose)
		if @PLAY_VARIATION
			variation;
		end
		song_echauffement(count: @ECHAUFF_PATTERN_COUNT.choose)
		#TRACKS["djembeTrack"]["mute"] = 1
		#song_basePattern(count: 1)
		#TRACKS["djembeTrack"]["mute"] = 0
	end
	@song
end