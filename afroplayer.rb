
##################################################################
#Používateľská časť - premenné, s ktorými sa používateľ môže hrať#
##################################################################

HUMANIZE_TIME = 0.01
HUMANIZE_DYNAMIC = 0.2
HUMANIZE_PITCH = 0.005

INSTRUMENTS = {
  "dundun" => {"sample" => :drum_tom_lo_hard, "amp" => 2.4, "rate" => 0.85, "pan" => -0.5},
  "sangban" => {"sample" => :drum_tom_mid_hard, "amp" => 1.3, "rate" => 1, "pan" => 0.5},
  "kenken" => {"sample" => :drum_tom_hi_soft, "amp" => 4, "rate" => 1.4, "pan" => 0.2},
  "dunbell" => {"sample" => :drum_cowbell, "amp" => 0.7, "rate" => 0.7, "pan" => -0.4},
  "sanbell" => {"sample" => :drum_cowbell, "amp" => 0.7, "rate" => 1.18, "pan" => 0.4},
  "kenbell" => {"sample" => :drum_cowbell, "amp" => 0.7, "rate" => 1.8, "pan" => 0.2}
}

BELLS = {
  "dundun" => "dunbell", "sangban" => "sanbell", "kenken" => "kenbell"
}


####################################################
#Systémová časť - core (bežne sa do nej nezasahuje)#
####################################################

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
RGXP_PATTERN = /^(\w+):\s+([\.\|bXABC]+)$/

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

define :playSample do |sample: '', sleep: 0, amp: 1, pan: 1, rate: 1, probability: 1|
  use_bpm @BPM

  if rand <= probability
    sample sample, amp: rand_around(amp, HUMANIZE_DYNAMIC), pan: pan, rate: rand_around(rate, HUMANIZE_PITCH)
    return true
  else
    return false
  end
end

define :playInstrument do |instrument: {}, probability: 1|
  return playSample(sample: instrument["sample"], sleep: 0, amp: instrument["amp"], pan: instrument["pan"], rate: instrument["rate"], probability: probability)
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
  drum = INSTRUMENTS[m["instrumentName"]]
  bell = INSTRUMENTS[BELLS[m["instrumentName"]]]
  pattern = m["pattern"]

  sync :tick
  use_bpm @BPM
  pattern.each_char { |c|
    case
    when c == 'X'
      playInstrument(instrument: drum, probability: 1)
      playInstrument(instrument: bell)
    when c == 'A'
      playInstrument(instrument: drum, probability: 0.09)
      playInstrument(instrument: bell)
    when c == 'B'
      playInstrument(instrument: drum, probability: 0.4)
      playInstrument(instrument: bell)
    when c == 'C'
      playInstrument(instrument: drum, probability: 0.8)
      playInstrument(instrument: bell)
    when c == 'b'
      playInstrument(instrument: bell)
    when c == '.'
    end
    sleep rand_around(DELAY + @RHYTHM_SWING.tick, HUMANIZE_TIME)
  }
end

define :playLiveTrack do |trackName: "", basePatterns: [], variations: []|
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
      playLiveTrack(trackName: "dundunTrack", basePatterns: @dundunBasePatterns, variations: @dundunVariations)
    end
    if @PLAY_SANGBAN
      playLiveTrack(trackName: "sangbanTrack", basePatterns: @sangbanBasePatterns, variations: @sangbanVariations)
    end
    if @PLAY_KENKEN
      playLiveTrack(trackName: "kenkenTrack", basePatterns: @kenkenBasePatterns, variations: [])
    end
    use_bpm @BPM
    sleep DELAY * @RHYTHM_TIME[0]
  end
end

playLive()

=begin

TODO
OK - nejako refaktornúť funkcie na prehranie patternu, aby algoritmus bol rovnaký pre dundun aj sangban aj kenken
OK - doplniť možnosť konfigurovať ako často sa bude hrať variácia
OK - vytvoriť sampler: podobne ako sa zadávajú patterny ako text, môže sa tak vytvoriť aj sampler, tj. konkrétny hudobný nástroj
OK - počítať automaticky dĺžku variácie k dĺžke jedného cyklu a zahrať variáciu vždy na konci cyklu
- envelope: obálky, modifikátory pre patterny/tracky
OK - implementovať swing feeling

- inteligentnejší sampler: náhodné sample, vrstvy pre rôzne dynamiky
- zamysleť sa nad notáciou, aké písmenká pre aké noty používať (napr. bude "b" zvonček, keď "B" je náhodný úder???)
- spoločné variácie pre sangban a dundun
- uzavreté údery pre dunduny
- djembe

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

=end
