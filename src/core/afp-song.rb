##################################################################
# Engine skladanie konkretneho songu.
##################################################################

define :addPattern do |patternType: "", song: {}|

	define :choosePattern_old do |instrument: "", patternType: ""|
		
		patterns = @RHYTHM["patterns"][instrument][patternType]
		if patterns != nil
			p = patterns.choose
		elsif
			p = nil
		end
		
		case
			when ["base"].include?(patternType)
				return p
			when ["variations"].include?(patternType)
				if (p != nil)
					return p
				elsif (p == nil)
					return @RHYTHM["patterns"][instrument]["base"].choose
				end
			when ["echauff", "echauff-in", "echauff-out"].include?(patternType)
				if (p != nil)
					return p
				elsif (p == nil)
					return @RHYTHM["patterns"][instrument]["echauff"].choose
				end
		end
	end

	define :choosePattern do |instrument: "", patternType: ""|
		
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

	patternsToAdd = {}
	maxBarCount = 0
	getTracksToPlay(TRACKS).each do |trackName, trackProperties|
		pattern = choosePattern(instrument: trackProperties["instrumentName"], patternType: patternType)
		patternBarCount = barCount(pattern)
		patternsToAdd[trackName] = pattern
		if patternBarCount > maxBarCount
			maxBarCount = patternBarCount
		end
	end
	
	getTracksToPlay(TRACKS).each do |trackName, trackProperties|
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

define :playDirigent do
  in_thread(name: :dirigent) do
    loop do
      use_bpm @BPM
      cue :tick
      sleep DELAY * @RHYTHM_TIME[0] + HUMANIZE_TIME + 0.025
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


define :createTestSong do
	song = {}
	
	define :basePattern do
		addPattern(patternType: "base", song: song)
	end

	define :variation do
		addPattern(patternType: "variations", song: song)
	end

	define :echauffement do
		addPattern(patternType: "echauff-in", song: song)
		3.times do addPattern(patternType: "echauff", song: song) end
		addPattern(patternType: "echauff-out", song: song)
	end

	define :initSong do
		TRACKS.each do |trackName, trackProperties|
			song[trackName] = Queue.new
		end
	end

	initSong()
	
	#echauffement
	#return song
	
	10.times do
		2.times do basePattern end
		variation
		echauffement
	end
	
	return song
end

with_fx :reverb, room:0.2, damp:0.5 do
	playSong(createTestSong())
end
