#############
### SOLI ####
#############

@PLAY_DUNDUN = true
@PLAY_SANGBAN = true
@PLAY_KENKEN = true
@PLAY_DJEMBE = true

@BPM = 115
@VARCYCLE_LEN = [4,8]
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring -0.03,+0.03, 0)

dun_base = ".bb.bb.XX.XX"
san_base = "I.bb.bb.XX.b"

dun_var1 = ".bb.bb.XX.XX|.X.X.X.XX.XX"
san_var1 = "I.bb.bb.X.bX|.X.X.X.bXX.b"

ken_base = ".bX.XX.bX.XX"

dj_base = "x.ox.Dx.ox.."

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => [dun_base],
      "variations" => [dun_var1] +
      []
    },
    "sangban" => {
      "base" => [san_base],
      "variations" => [san_var1]
    },
    "kenken" => {
      "base" => [ken_base],
      "variations" => []
    },
    "djembe" => {
      "base" => [dj_base],
      "variations" => []
    }
  },
  "dependencies" => {
    "sangban" => {san_var1 => {"dundun" => dun_var1}}
  }
}
