#############
### KUKU ####
#############


@BPM = 110

@PLAY_DUNDUN=true
@PLAY_SANGBAN=true
@PLAY_KENKEN=false

@VARCYCLE_LEN=4

@rhythmTime = [8,4] #osem štvrťový rytmus

@dundunBasePatterns = Array.new(12, "b-bX-bb-|b-b-A-b-") + ["bX-X-bb-|b-b-A-b-"]
@dundunVariations =
  Array.new(4, "b-bX-bb-|X-bX-bX-") +
  Array.new(8, "b-AX-AX-|AX-AX-X-") +
  Array.new(2, "b-bX-bb-|X-XX-XX-") +
  Array.new(8, "B-BB-BB-|C-CC-CC-")# +
  #Array.new(2, "X-bX-bB-|X-XX-XX-|XX-X-XX-|XX-XXXX-")

@sangbanBasePatterns = ["X-b-b-X-|X-b-b-X-"]

@kenkenBasePatterns = ["X-b-X-b-|X-b-X-b-"]
  
playWholeSong()
