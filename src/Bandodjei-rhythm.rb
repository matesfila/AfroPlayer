###################
### Bando Djei ####
###################

@BPM = 115
@VARCYCLE_LEN = [4,8]
@RHYTHM_TIME = [12,8] #dvanásť osminový rytmus
@RHYTHM_SWING = (ring -0.03,+0.03, 0)

dun_base = ".bb.bb.XX.XX|.bb.XX.XX.XX"
san_base = "b.bI.I.bX.X.|b.bb.X.bX.X."

dun_var1 = ".bb.bb.XX.XX|XX.XXX.XX.XX"
san_var1 = "b.bI.I.bX.X.|bX.X.X.bX.X."

ken_base = ".bX.XX.bX.XX"

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
