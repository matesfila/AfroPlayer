#################
### Jamakale ####
#################

@BPM = 97
@RHYTHM_TIME = [8,4] #osem štvrťový rytmus
@RHYTHM_SWING = (ring 0,0,0,0)

dun_break = "........|........|" +
  "........|........|" + "....x.b.|x.b.x...|" +
  "........|........|" + "....x.b.|x.b.x...|" +
  "........|........|" + "........|......x.|" +
  "x.......|........|" + "........|......x.|" +
  "x.......|......x.|" + "x.......|xx.xx.x.|" +
  "x.......|......x.|" + "x.......|xx.xx...|" +
  "........|....x.x.|"
dj1_break = "x.xx.x.x|x.xxx..D|" +
  "x.xx.Dx.|xx.Dx.x.|" + "xx......|.......D|" +
  "x.xx.Dx.|xx.Dx.x.|" + "xx......|........|" +
  "x..oo.x.|...oo.x.|" + "...oo.x.|.o.oo...|" +
  "...oo.x.|...oo.x.|" + "...oo.x.|.o.oo...|" +
  "..xo.xo.|xo.xo.D.|" + "D.xo.xo.|DD.DD.D.|" +
  "D.xo.xo.|xo.xo.D.|" + "D.xo.xo.|DD.Dx.,.|" +
  "x.xx.x.x|x.xxx...|"
empty_break = "........|........|" +
  "........|........|" + "........|........|" +
  "........|........|" + "........|........|" +
  "........|........|" + "........|........|" +
  "........|........|" + "........|........|" +
  "........|........|" + "........|........|" +
  "........|........|" + "........|........|" +
  "........|........|"

dun_base = ["x.......|....x.x.|"+"x.......|....xxx."].cycle(4).to_a.join('|')
ken_base = ["...x..i.|..x.....|"+"...x..i.|..x....."].cycle(4).to_a.join('|')
dj1_base = ["x..o.oo.|x..Dxoo.|"+"x..o.oo.|x..Dxoo."].cycle(4).to_a.join('|')

@RHYTHM = {
  "patterns" => {
    "dundun" => {
      "base" => [dun_break+dun_base],
      "variations" => []
    },
    "sangban" => {
      "base" => [empty_break],
      "variations" => []
    },
    "kenken" => {
      "base" => [empty_break+ken_base],
      "variations" => []
    },
    "djembe" => {
      "base" => [dj1_break+dj1_base],
      "variations" => []
    },
    "djembe2" => {
      "base" => [empty_break],
      "variations" => []
    }
  }
}
