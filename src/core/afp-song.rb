##################################################################
# Engine na hranie danej štruktúry skladby.
##################################################################


define :playBasePattern do |instrumentName: ""|
	playPattern(pattern: @RHYTHM["patterns"][instrumentName]["base"].choose, instrumentName: instrumentName)
end

define :playVariationPattern do |instrumentName: ""|
	playPattern(pattern: @RHYTHM["patterns"][instrumentName]["variations"].choose, instrumentName: instrumentName)
end

define :playSong do

	in_thread() do
		#2.times do playPattern(pattern: @RHYTHM["patterns"]["sangban"]["base"].choose, instrumentName: "sangban") end
		2.times do playBasePattern(instrumentName: "sangban") end
	end
	
	in_thread() do
		2.times do playBasePattern(instrumentName: "dundun") end
	end
	
	playDirigent
end

with_fx :reverb, room:0.2, damp:0.5 do
	playSong()
end