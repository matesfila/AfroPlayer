#############
# KAKILAMBE #
#############

@BPM = 130

@PLAY_DUNDUN=true
@PLAY_SANGBAN=true
@PLAY_KENKEN=false

@VARCYCLE_LEN=4
@RHYTHM_TIME = [24,8] #dvadsaťštyry osminový rytmus

@dundunBasePatterns = Array.new(1, "dundun: X.X.X.bb.b.X|X.b.b.bb.b.b")
@dundunVariations = ["dundun: X.XX.XX.XX.X|X.XX.XX.XX.X"]

@sangbanBasePatterns = ["sangban: b.b.b.bX.X.b|b.b.X.bX.X.b"]
@sangbanVariations = []

@kenkenBasePatterns = ["kenken: XX.bb.XX.bb.|XX.bb.XX.bb."]
