#############
### Kawa ####
#############

@BPM = 115
@VARCYCLE_LEN = [4,8]
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring -0.03,+0.03, 0)

dun_base = ".bb.XX.X.X.X|.XX.XX.bb.bb"
san_base = "I.b.X.b.XX.b|X.X.X.b.XX.b"

dun_var1 = ".bX.XX.X.X.b|.XX.XX.bb.bb"
san_var1 = "I.b.X.b.XX.b|X.X.X.b.XX.b"

ken_base = "X.bb.XX.bb.X"

dj_base = "x.ox..x.ox.."

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
