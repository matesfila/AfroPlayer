
if @CREATE_SONG == nil
	@CREATE_SONG = @createEchauffSong
end

with_fx :reverb, room:0.2, damp:0.5 do
	playSong(@CREATE_SONG.call())
end
