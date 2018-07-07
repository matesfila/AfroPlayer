##################################################################
# Engine skladanie konkretneho songu.
##################################################################

define :addPattern do |patternType: "", song: {}|

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
	getTracksToPlay(TRACKS).each do |trackName, trackProperties|
		pattern = choosePattern(instrument: trackProperties["instrumentName"], patternType: patternType)
		patternBarCount = barCount(pattern)
		patternsToAdd[trackName] = pattern
		if patternBarCount > maxBarCount
			maxBarCount = patternBarCount
		end
	end

	#patterny sa pridajú do reálnych trackov. Patterny o dĺžke 1 sa pridajú toľko krát, aby
	#sa zarovnali na najdlší pattern.
	TRACKS.each do |trackName, trackProperties|
		pattern = patternsToAdd[trackName]
		if barCount(pattern) == 1
			maxBarCount.times do
				song[trackName] << patternsToAdd[trackName]
			end
		elsif
			song[trackName] << patternsToAdd[trackName]
		end
	end	

end

define :playSong do |song|

	define :playSongTrack do |trackName, trackLine|
		in_thread(name: trackName) do
			while !trackLine.empty? do
				playPattern(pattern: trackLine.pop, instrumentName: TRACKS[trackName]["instrumentName"])
			end
		end
	end

	getTracksToPlay(TRACKS).each do |trackName, trackProperties|
		playSongTrack(trackName, song[trackName])
	end
	
	playDirigent
end

song = {}

define :basePattern do |count: 1|
	count.times do addPattern(patternType: "base", song: song) end
end

define :variation do
	addPattern(patternType: "variations", song: song)
end

define :echauffement do |count: 1|
	addPattern(patternType: "echauff-in", song: song)
	count.times do addPattern(patternType: "echauff", song: song) end
	addPattern(patternType: "echauff-out", song: song)
end

define :echauffement_direct do |count: 1|
	count.times do addPattern(patternType: "echauff", song: song) end
	addPattern(patternType: "echauff-out", song: song)
end

define :initSong do
	song = {}
	TRACKS.each do |trackName, trackProperties|
		song[trackName] = Queue.new
	end
end

define :createEchauffSong do
	initSong()
	initRhythm(@RHYTHM)
	10.times do
		basePattern(count: 4)
		variation
		echauffement(count: [1,3,5,7].choose)
	end
	return song
end

define :createBaradasaSong do
	initSong()
	
	initRhythm(@KON)
	TRACKS["kenkenTrack"]["solo"] = 1
	basePattern(count: 4)
	TRACKS["kenkenTrack"]["solo"] = 0

	8.times do
		@RHYTHM = @KON;
			basePattern(count: [2,4].choose); variation; echauffement(count: [2,4].choose);
		@RHYTHM = @KON_MASI;
			echauffement(count: 2);
		@RHYTHM = @KON;
			basePattern(count: 2); echauffement(count: 2);
		@RHYTHM = @KON_MAJA;
			basePattern(count: 1);
		@RHYTHM = @KON;
			echauffement_direct(count: [2,4].choose);
		@RHYTHM = @BANDO_DJEI;
			basePattern(count: [4,6,8].choose); variation; echauffement(count: [2,4].choose);
		@RHYTHM = @BOLOKONONDO;
			basePattern(count: [2,4].choose); variation; echauffement(count: 1);
	end
	return song
end

define :createKonSong do
	initSong()
	initRhythm(@KON)
	
	TRACKS["kenkenTrack"]["solo"] = 1
	basePattern(count: 4)
	TRACKS["kenkenTrack"]["solo"] = 0
	
	
	8.times do
		@RHYTHM = @KON;
			basePattern(count: [2,4].choose); variation; echauffement(count: [2,4].choose);
		@RHYTHM = @KON_MASI;
			echauffement(count: 2);
		@RHYTHM = @KON;
			basePattern(count: 2); echauffement(count: 2);
		@RHYTHM = @KON_MAJA;
			basePattern(count: 1);
		@RHYTHM = @KON;
			echauffement_direct(count: [2,4].choose);
	end
	return song
end


define :playDirigent do
#  cue :tick
  in_thread(name: :dirigent) do
    loop do
      use_bpm @BPM
      #sample  :drum_cymbal_closed #metronom
      cue :tick
      sleep @DELAY * @RHYTHM_TIME[0] + HUMANIZE_TIME + 0.025
    end
  end
end

with_fx :reverb, room:0.2, damp:0.5 do
	playSong(createBaradasaSong())
end
