#############
# KAKILAMBE #
#############

@BPM = 130
@RHYTHM_TIME = [12,8] #dvadsaťštyry osminový rytmus

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => ["X.X.X.bb.b.C|X.b.B.bA.b.C"],
      "variations" => ["XAXXAXXAXXAX|XAXXAXXAXXAX"]
    },
    "sangban" => {
      "base" => ["b.b.b.bX.X.b|b.b.X.bX.X.b"],
      "variations" => []
    },
    "kenken" => {
      "base" => ["XX.bb.XX.bb.|XX.bb.XX.bb."],
      "variations" => []
    },
    "djembe" => {
      "base" => ["D.oox.Do.ox.|D.oox.Do.ox."],
      "variations" => ["ooxooxooxoox|ooxooxooxoox", "ooxooxooxoox|x.ooooxD.D.D"]
    }
  }
}
