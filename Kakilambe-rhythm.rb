#############
# KAKILAMBE #
#############

@PLAY_DUNDUN = true
@PLAY_SANGBAN = true
@PLAY_KENKEN = true
@PLAY_DJEMBE = true

@BPM = 130
@VARCYCLE_LEN = 4
@RHYTHM_TIME = [24,8] #dvadsaťštyry osminový rytmus

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => ["dundun: X.X.X.bb.b.X|X.b.b.bb.b.b"],
      "variations" => ["dundun: X.XX.XX.XX.X|X.XX.XX.XX.X"]
    },
    "sangban" => {
      "base" => ["sangban: b.b.b.bX.X.b|b.b.X.bX.X.b"],
      "variations" => []
    },
    "kenken" => {
      "base" => ["kenken: XX.bb.XX.bb.|XX.bb.XX.bb."],
      "variations" => []
    },
    "djembe" => {
      "base" => ["djembe: x.ox..x.ox..|x.ox..x.ox.."],
      "variations" => []
    }
  }
}
