
##################################################################
#Používateľská časť - premenné, s ktorými sa používateľ môže hrať#
##################################################################

HUMANIZE_TIME = 0.01
HUMANIZE_DYNAMIC = 0.3
HUMANIZE_PITCH = 0.005

DUNDUN = {"sample" => :drum_tom_lo_hard, "amp" => 2.4, "rate" => 0.85, "pan" => -0.5}
DUNDUN_BELL = {"sample" => :drum_cowbell, "amp" => 0.7, "rate" => 0.7, "pan" => -0.4}

SANGBAN = {"sample" => :drum_tom_mid_hard, "amp" => 1.3, "rate" => 1, "pan" => 0.5}
SANGBAN_BELL = {"sample" => :drum_cowbell, "amp" => 0.7, "rate" => 1.18, "pan" => 0.4}

KENKEN = {"sample" => :drum_tom_hi_soft, "amp" => 4, "rate" => 1.8, "pan" => 0}
KENKEN_BELL = {"sample" => :drum_cowbell, "amp" => 0.7, "rate" => 1.8, "pan" => 0}

INSTRUMENTS = {
  "dundun" => DUNDUN, "sangban" => SANGBAN, "kenken" => KENKEN,
  "dunbell" => DUNDUN_BELL, "sanbell" => SANGBAN_BELL, "kenbell" => KENKEN_BELL
}

BELLS = {
  DUNDUN => DUNDUN_BELL, SANGBAN => SANGBAN_BELL, KENKEN => KENKEN_BELL
}


####################################################
#Systémová časť - core (bežne sa do nej nezasahuje)#
####################################################

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

DELAY = countNoteDelay(@rhythmTime[1])

define :rand_around do |v,r|
  return rrand(v-r, v+r)
end

define :playSample do |sample: '', sleep: 0, amp: 1, pan: 1, rate: 1, probability: 1|
  use_bpm @BPM

  if rand <= probability
    sample sample, amp: rand_around(amp, HUMANIZE_DYNAMIC), pan: pan, rate: rand_around(rate, HUMANIZE_PITCH)
    sleep rand_around(sleep, HUMANIZE_TIME)
    return true
  else
    sleep sleep
    return false
  end
end

define :playInstrument do |instrument: {}, sleep: 0, probability: 1|
  return playSample(sample: instrument["sample"], sleep: sleep, amp: instrument["amp"], pan: instrument["pan"], rate: instrument["rate"], probability: probability)
end

define :playPattern do |pattern: "", drum: {}|

  m = pattern.match(RGXP_PATTERN)
  if m != nil
    drum = INSTRUMENTS[m[1]]
    pattern = m[2]
  end
  bell = BELLS[drum]
  pattern = pattern.delete("|")

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
    sleep DELAY
  }
end

define :patternSize do |pattern|
  m = pattern.match(RGXP_PATTERN)
  if m != nil
    drum = INSTRUMENTS[m[1]]
    pattern = m[2]
  end
  return pattern.delete("|").length()
end

define :playTrack do |trackName: "", drum: {}, basePatterns: [], variations: []|
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
        playPattern(pattern: basePatterns.choose, drum: drum)
      end

      #a na záver cyklu sa zahrá variácia
      if t >= 0
        playPattern(pattern: variations[t], drum: drum)
      end

    end
  end
end

define :start_dundun do
  playTrack(trackName: "dundunTrack", drum: DUNDUN, basePatterns: @dundunBasePatterns, variations: @dundunVariations)
end

define :start_sangban do
  playTrack(trackName: "sangbanTrack", drum: SANGBAN, basePatterns: @sangbanBasePatterns, variations: @sangbanVariations)
end

define :start_kenken do
  playTrack(trackName: "kenkenTrack", drum: KENKEN, basePatterns: @kenkenBasePatterns, variations: [])
end

define :playWholeSong do
  live_loop :songLoop do
    cue :tick
    if @PLAY_DUNDUN
      start_dundun
    end
    if @PLAY_SANGBAN
      start_sangban
    end
    if @PLAY_KENKEN
      start_kenken
    end
    use_bpm @BPM
    sleep DELAY * @rhythmTime[0]
  end
end

playWholeSong()

=begin

TODO
OK - nejako refaktornúť funkcie na prehranie patternu, aby algoritmus bol rovnaký pre dundun aj sangban aj kenken
OK - doplniť možnosť konfigurovať ako často sa bude hrať variácia
OK - vytvoriť sampler: podobne ako sa zadávajú patterny ako text, môže sa tak vytvoriť aj sampler, tj. konkrétny hudobný nástroj
OK - počítať automaticky dĺžku variácie k dĺžke jedného cyklu a zahrať variáciu vždy na konci cyklu
- envelope: obálky, modifikátory pre patterny/tracky
- implementovať swing feeling

- inteligentnejší sampler: náhodné sample, vrstvy pre rôzne dynamiky
- zamysleť sa nad notáciou, aké písmenká pre aké noty používať (napr. bude "b" zvonček, keď "B" je náhodný úder???)
- spoločné variácie pre sangban a dundun
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
