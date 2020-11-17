
if @CREATE_SONG_FUNC == nil
	@CREATE_SONG_FUNC = @createEchauffSong
end

set_volume! 3

if @OPTIMIZED
	song_play(@CREATE_SONG_FUNC.call())
elsif
	with_fx :reverb, room:0.2, damp:0.5 do
		song_play(@CREATE_SONG_FUNC.call())
	end
end
