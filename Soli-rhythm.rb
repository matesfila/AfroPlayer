#############
### SOLI ####
#############

@PLAY_DUNDUN = true
@PLAY_SANGBAN = true
@PLAY_KENKEN = true
@PLAY_DJEMBE = false

@BPM = 130
@VARCYCLE_LEN = 4
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring 0.03,-0.03, 0)

dun_base = "X.bb.bb.XX.X"
san_base = "X.b.I.I.bX.b"

dun_var1 = "X.X.XXXX.XXX|.XX.X.X.XX.X"
san_var1 = "XX.XX.XX.XX.|X.X.X.X.bX.b"

dun_var2 = "X.bb.bb.b.XX|.X.X.X.bXX.X"
san_var2 = "X.b.I.I.bX.X|X.X.X.X.bX.b"

dun_var3 = "X.bb.bX.XX.X"

ken_base = ".bb.XX.bb.XX"

dj_base = "x.ox.Dx.ox.."
dj_var1 = "x.oxoox.oxoo|xooxooxoox.."

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => [dun_base],
      "variations" => [dun_var1] +
      [dun_var2] +
      [dun_var3] +
      []
    },
    "sangban" => {
      "base" => [san_base],
      "variations" => [san_var1, san_var2]
    },
    "kenken" => {
      "base" => [ken_base],
      "variations" => []
    },
    "djembe" => {
      "base" => [dj_base],
      "variations" => [dj_var1]
    }
  },
  "dependencies" => {
    "dundun" => {dun_var1 => {"sangban" => san_var1}, dun_var2 => {"sangban" => san_var2}}
  }
}
