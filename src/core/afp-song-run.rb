
if @CREATE_SONG == nil
	@CREATE_SONG = @createEchauffSong
end

set_volume! 3

if @OPTIMIZED
	playSong(@CREATE_SONG.call())
elsif
	with_fx :reverb, room:0.2, damp:0.5 do
		playSong(@CREATE_SONG.call())
	end
end
