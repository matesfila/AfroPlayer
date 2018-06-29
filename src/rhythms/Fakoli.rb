###############
### Fakoli ####
###############

@BPM = 97
@RHYTHM_TIME = [8,4] #osem štvrťový rytmus
@RHYTHM_SWING = (ring 0,0,0,0)

dun_base = "x.b.x.b.|x.b.x.b."
san_base = "x.bx.bb.|x.x.i.b."
ken_base = "b.xx.bi.|b.xx.bi."
dj1_base =  "ooxx.xx.|ooxxD.x."
dj2_base =  "D.xxD.oo|D.xxD.oo"

dj1_break1 = ["x.x.x.x.|x.x.x...|" + dj1_base].cycle(2).to_a.join('|') +  "|x.x.x.x.|x.x.x...|x..oo.x.|o.x.o.x.|oo.xx...|x.xxx..."
dj2_break1 = ["x.x.x.x.|x.x.x...|" + dj2_base].cycle(2).to_a.join('|') +  "|x.x.x.x.|x.x.x...|x..oo.x.|o.x.o.x.|oo.xx...|x.xxx..."
dun_break1 = ["x.x.x.x.|x.x.x...|" + dun_base].cycle(2).to_a.join('|') + "|x.x.x.x.|x.x.x...|...xx...|x.b.x.b.|xx.bb.b.|x.xxx..."
san_break1 = ["x.x.x.x.|x.x.x...|" + san_base].cycle(2).to_a.join('|') + "|x.x.x.x.|x.x.x...|...xx...|x.b.x.b.|xx.bb.b.|x.xxx..."
ken_break1 = ["x.x.x.x.|x.x.x...|" + ken_base].cycle(2).to_a.join('|') + "|x.x.x.x.|x.x.x...|...xx...|x.b.x.b.|xx.bb.b.|x.xxx..."

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => [dun_base],
      "variations" => [dun_break1]
    },
    "sangban" => {
      "base" => [san_base],
      "variations" => [san_break1]
    },
    "kenken" => {
      "base" => [ken_base],
      "variations" => [ken_break1]
    },
    "djembe" => {
      "base" => [dj1_base],
      "variations" => [dj1_break1]
    },
    "djembe2" => {
      "base" => [dj2_base],
      "variations" => [dj2_break1]
    }
  }
  # ,
  # "breaks" => {
  #   "break_1" => ["djembe: " + ["i.i.i.i.|i.i.i...|ooxx.xx.|ooxxD.x."].cycle(2).to_a.join('|')] + "i.i.i.i.|i.i.i...|x..oo.x.|o.x.o.x.|oo.xx...|x.xxx..."
  # }
}
