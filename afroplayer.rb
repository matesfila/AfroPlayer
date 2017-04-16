
##################################################################
#Používateľská časť - premenné, s ktorými sa používateľ môže hrať#
##################################################################

HUMANIZE_TIME = 0.01
HUMANIZE_DYNAMIC = 0.2
HUMANIZE_PITCH = 0.005

SAMPLES = {
  "dundun" => {"sample" => :drum_tom_lo_hard, "amp" => 1.5, "rate" => 0.85, "pan" => -0.5},
  "dunclos" => {"sample" => :drum_tom_lo_hard, "amp" => 0.7, "rate" => 0.95, "pan" => -0.5,
                "attack" => 0, "sustain" => 0, "release" => 0.18},
  "sangban" => {"sample" => :drum_tom_mid_hard, "amp" => 1.2, "rate" => 1, "pan" => 0.5},
  "sanclos" => {"sample" => :drum_tom_mid_hard, "amp" => 0.7, "rate" => 1.15, "pan" => 0.5,
                "attack" => 0, "sustain" => 0, "release" => 0.18},
  "kenken" => {"sample" => :drum_tom_hi_hard, "amp" => 1, "rate" => 1.4, "pan" => 0.2},
  "kenclos" => {"sample" => :drum_tom_hi_hard, "amp" => 0.6, "rate" => 1.5, "pan" => 0.2,
               "attack" => 0, "sustain" => 0, "release" => 0.13},
  "dunbell" => {"sample" => :drum_cowbell, "amp" => 0.5, "rate" => 0.7, "pan" => -0.4},
  "sanbell" => {"sample" => :drum_cowbell, "amp" => 0.5, "rate" => 1.18, "pan" => 0.4},
  "kenbell" => {"sample" => :drum_cowbell, "amp" => 0.5, "rate" => 1.8, "pan" => 0.2},
  "djbass" => {"sample" => :DJEMBEBASS2, "amp" => 2, "rate" => 1, "pan" => 0},
  "djton" => {"sample" => :DJEMBE3, "amp" => 2, "rate" => 1, "pan" => 0},
  "djslap" => {"sample" => :DJEMBESLAP3, "amp" => 3.2, "rate" => 1.6, "pan" => 0},
  "djclos" => {"sample" => :DJEMBESLAP1, "amp" => 2, "rate" => 1, "pan" => 0,
              "attack" => 0, "sustain" => 0, "release" => 0.13}
}

INSTRUMENTS = {
  "dundun" => {"open" => SAMPLES["dundun"], "closed" => SAMPLES["dunclos"], "bell" => SAMPLES["dunbell"]},
  "sangban" => {"open" => SAMPLES["sangban"], "closed" => SAMPLES["sanclos"], "bell" => SAMPLES["sanbell"]},
  "kenken" => {"open" => SAMPLES["kenken"], "closed" => SAMPLES["kenclos"], "bell" => SAMPLES["kenbell"]},
  "djembe" => {"bass" => SAMPLES["djbass"], "ton" => SAMPLES["djton"], "slap" => SAMPLES["djslap"], "closed" => SAMPLES["djclos"]}
}

####################################################
#Systémová časť - core (bežne sa do nej nezasahuje)#
####################################################

# Čistá štruktúra pre vytvorenie nového rytmu:
# @RHYTHM = {
#   "patterns" => {
#     "dundun" => {
#       "base" => [],
#       "variations" => []
#     },
#     "sangban" => {
#       "base" => [],
#       "variations" => []
#     },
#     "kenken" => {
#       "base" => [],
#       "variations" => []
#     },
#     "djembe" => {
#       "base" => [],
#       "variations" => []
#     }
#   }
# }


# Nastavenie defaultných hodnôt pre globálne premenné
if @BPM == nil
  @BPM = 95
end

if @PLAY_DUNDUN == nil
  @PLAY_DUNDUN=true
end
if @PLAY_SANGBAN == nil
  @PLAY_SANGBAN=true
end
if @PLAY_KENKEN == nil
  @PLAY_KENKEN=true
end
if @PLAY_DJEMBE == nil
  @PLAY_DJEMBE=true
end

if @VARCYCLE_LEN == nil
  @VARCYCLE_LEN=4
end
if @RHYTHM_TIME == nil
  @RHYTHM_TIME=[8,4] #osem štvrťový rytmus
end
if @RHYTHM_SWING == nil
  @RHYTHM_SWING=(ring 0,0,0,0)
end

#regulárny výraz na hodnotu patternu, príklad: "kenken: x.b.x.b.|x.b.x.b."
RGXP_PATTERN = /^(\w+):\s+([\.\|bXABCDIxo]+)$/

define :countNoteDelay do |note|
  #definuje dĺžku sleepu: pre štvrťové rytmy sa hrajú šestnástinové noty, pre trojkové sa hrajú osminové
  case
  when note == 4
    return 1.0 / 2 / 2 #štvrťová nota na polovicu a na polovicu = šestnástinová nota
  when note == 8
    return 1.0 / 3 #štvrťová nota na tretinu - tri osminové noty v jednej štvrťovej, hrajú sa osminky
  end
end

DELAY = countNoteDelay(@RHYTHM_TIME[1])

define :rand_around do |v,r|
  return rrand(v-r, v+r)
end

define :playSample do |instrument: {}, probability: 1|
  use_bpm @BPM

  if rand <= probability
    sample instrument["sample"],
      amp: rand_around(instrument["amp"], HUMANIZE_DYNAMIC),
      pan: instrument["pan"],
      rate: rand_around(instrument["rate"], HUMANIZE_PITCH),
      attack: instrument["attack"],
      sustain: instrument["sustain"],
      release: instrument["release"]
    return true
  else
    return false
  end
end

# Rozparsuje vstupný pattern, ktorý je na vstupe v surovom stave.
# +return+ Vráti mapu s kľúčmi instrumentName a pattern
define :patternParse do |pattern|
  m = pattern.match(RGXP_PATTERN)
  return {"instrumentName" => m[1], "pattern" => m[2].delete("|")}
end

define :patternSize do |pattern|
  return patternParse(pattern)["pattern"].length()
end

define :playPattern do |pattern: ""|

  m = patternParse(pattern)
  iname = m["instrumentName"]
  drumOpen = INSTRUMENTS[iname]["open"]
  drumClosed = INSTRUMENTS[iname]["closed"]
  bell = INSTRUMENTS[iname]["bell"]
  bass = INSTRUMENTS[iname]["bass"]
  ton = INSTRUMENTS[iname]["ton"]
  slap = INSTRUMENTS[iname]["slap"]
  pattern = m["pattern"]

  sync :tick
  use_bpm @BPM
  pattern.each_char { |c|
    case
    when c == 'X'
      playSample(instrument: drumOpen, probability: 1)
      playSample(instrument: bell)
    when c == 'A'
      playSample(instrument: drumOpen, probability: 0.12)
      playSample(instrument: bell)
    when c == 'B'
      playSample(instrument: drumOpen, probability: 0.4)
      playSample(instrument: bell)
    when c == 'C'
      playSample(instrument: drumOpen, probability: 0.8)
      playSample(instrument: bell)
    when c == 'I'
      playSample(instrument: drumClosed, probability: 1)
      playSample(instrument: bell)
    when c == 'D'
      playSample(instrument: bass, probability: 1)
    when c == 'x'
      playSample(instrument: slap, probability: 1)
    when c == 'o'
      playSample(instrument: ton, probability: 1)
    when c == 'b'
      playSample(instrument: bell)
    when c == '.'
    end
    sleep rand_around(DELAY + @RHYTHM_SWING.tick, HUMANIZE_TIME)
  }
end

define :playLiveTrack do |trackName, rhythm, instrument|
  basePatterns = rhythm["patterns"][instrument]["base"]
  variations = rhythm["patterns"][instrument]["variations"]
  in_thread(name: trackName) do
    loop do
      use_bpm @BPM

      #((dice(2) - 1)*4).times do

      x = 0
      t = -1
      if (variations.size > 0)
        #t = aká variácia sa bude hrať, náhodný výber
        t = dice(variations.size) - 1

        #x = koľkokrát sa základný pattern nachádza vo variácii (velkosť variácie...)
        #variácia nemôže byť menšia ako velkosť base patternu
        #basePatterns musia mat vsetky rovnaku velkost
        x = patternSize(variations[t]) / patternSize(basePatterns[0])
      end

      #základný pattern sa zahrá príslušný počet krát
      (@VARCYCLE_LEN - x).times do
        playPattern(pattern: basePatterns.choose)
      end

      #a na záver cyklu sa zahrá variácia
      if t >= 0
        playPattern(pattern: variations[t])
      end
    end
  end
end

define :playLive do
  live_loop :songLoop do
    cue :tick
    if @PLAY_DUNDUN
      playLiveTrack("dundunTrack", @RHYTHM, "dundun")
    end
    if @PLAY_SANGBAN
      playLiveTrack("sangbanTrack", @RHYTHM, "sangban")
    end
    if @PLAY_KENKEN
      playLiveTrack("kenkenTrack", @RHYTHM, "kenken")
    end
    if @PLAY_DJEMBE
      playLiveTrack("djembeTrack", @RHYTHM, "djembe")
    end
    use_bpm @BPM
    sleep DELAY * @RHYTHM_TIME[0]
  end
end

playLive()

=begin

TODO
- djembe sólovanie
- notácia patternov, zamysleť sa aké písmenká pre aké noty používať (napr. bude "b" zvonček, keď "B" je náhodný úder???)
- afro sample
- závislosti medzi patternami, spoločné variácie pre sangban a dundun
- envelope: obálky, modifikátory pre patterny/tracky
- inteligentnejší sampler: náhodné sample, vrstvy pre rôzne dynamiky
- inteligentnejší sequencer: ak sú dva/tri údery po sebe, vymysleť...

Kompozícia patternu
1) viacriadkové patterny (multipatterny)
  - pre spoločné variácie dundun+sangban
  - ak v multipatterne nebude definovaný niektorý nástroj, zahrá sa jeho defaultný base pattern
OK 2) pomenované nástroje
OK 3) nástroj v patterne (podľa toho sa vyberie nástroj z pomenovaných nástrojov)

Kompozícia skladby
1) pomenované patterny (aby sa dalo odkazovať sa na ne a mohli sa skladať do kompozície/skladby)
2) patterny v patternoch (vnorené patterny)
3) tracky?

VYRIEŠENÉ

OK - nejako refaktornúť funkcie na prehranie patternu, aby algoritmus bol rovnaký pre dundun aj sangban aj kenken
OK - doplniť možnosť konfigurovať ako často sa bude hrať variácia
OK - vytvoriť sampler: podobne ako sa zadávajú patterny ako text, môže sa tak vytvoriť aj sampler, tj. konkrétny hudobný nástroj
OK - počítať automaticky dĺžku variácie k dĺžke jedného cyklu a zahrať variáciu vždy na konci cyklu
OK - implementovať swing feeling
OK - uzavreté údery pre dunduny
OK - djembe

Definícia rytmu
OK - zadanie rytmu pre afroplayer pomocou hash tabuľky (imitácia definovania rytmu cez xml)
  Pre používateľa sa môže potom neskôr vytvoriť viac user friendly zadanie, pre ktoré vznikne
  kompilátor do zadania cez hash tabuľky

=end
