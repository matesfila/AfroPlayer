
##################################################################
#Používateľská časť - premenné, s ktorými sa používateľ môže hrať#
##################################################################


HUMANIZE_TIME = 0.0133
HUMANIZE_DYNAMIC = 0.2
HUMANIZE_PITCH = 0.005

#dĺžka základného cyklu: na konci každého základného cyklu sa zahrá variácia
@VARCYCLE_LEN = [4]
#či sa variácie vyberajú náhodne, alebo v poradí, v akom sú definované
@VAR_RANDOMSELECT = false
#minimálne koľkokrát sa zvolená variácia zopakuje
@VAR_MINREPEAT = 1
#maximálne koľkokrát sa zvolená variácia zopakuje
@VAR_MAXREPEAT = 2

#@BREAK_CYCLELEN = [16]
#@RANDOM_BREAKS = false
#@BREAK_MINREPEAT = 1
#@BREAK_MAXREPEAT = 1

TRACKS = {
  #pre solo a mute: 0 = false, 1 = true, skrateny zapis
  "dundunTrack" => {"instrumentName" => "dundun", "solo" => 0, "mute" => 0},
  "sangbanTrack" => {"instrumentName" => "sangban", "solo" => 0, "mute" => 0},
  "kenkenTrack" => {"instrumentName" => "kenken", "solo" => 0, "mute" => 0},
  "djembeTrack" => {"instrumentName" => "djembe", "solo" => 0, "mute" => 0},
  "djembe2Track" => {"instrumentName" => "djembe2", "solo" => 0, "mute" => 1}
}

# SAMPLES = {
#   "dundun" => {"sample" => :drum_tom_lo_hard, "amp" => 1.2, "rate" => 0.75, "pan" => -0.5, "sustain" => 0.18, "release" => 0.02},
#   "dunclos" => {"sample" => :drum_tom_lo_hard, "amp" => 0.7, "rate" => 0.95, "pan" => -0.5,
#                 "attack" => 0, "sustain" => 0, "release" => 0.18},
#   "sangban" => {"sample" => :drum_tom_mid_hard, "amp" => 1.2, "rate" => 1, "pan" => 0.5},
#   "sanclos" => {"sample" => :drum_tom_mid _hard, "amp" => 0.7, "rate" => 1.15, "pan" => 0.5,
#                 "attack" => 0, "sustain" => 0, "release" => 0.025},
#   "kenken" => {"sample" => :drum_tom_hi_soft, "amp" => 4, "rate" => 1.55, "pan" => 0.2, "sustain" => 0.15, "release" => 0.03},
#   "kenclos" => {"sample" => :drum_tom_hi_hard, "amp" => 0.6, "rate" => 1.5, "pan" => 0.2,
#                "attack" => 0, "sustain" => 0, "release" => 0.13},
#   "dunbell" => {"sample" => :drum_cowbell, "amp" => 0.5, "rate" => 0.7, "pan" => -0.4},
#   "sanbell" => {"sample" => :drum_cowbell, "amp" => 0.5, "rate" => 1.18, "pan" => 0.4},
#   "kenbell" => {"sample" => :drum_cowbell, "amp" => 0.5, "rate" => 1.8, "pan" => 0.2},
#   "djbass" => {"sample" => :DJEMBEBASS2, "amp" => 1.5, "rate" => 1, "pan" => 0},
#   "djton" => {"sample" => :DJEMBE3, "amp" => 1.5, "rate" => 1, "pan" => 0},
#   "djslap" => {"sample" => :DJEMBESLAP3, "amp" => 1.5, "rate" => 1.1, "pan" => 0},
#   "djclos" => {"sample" => :DJEMBESLAP1, "amp" => 1.5, "rate" => 1, "pan" => 0}
# }

# Vytvorí pole s obsahom [sampleName1, sampleName2 ... sampleNameN] kde N = count
define :multiSample do |sampleName, count|
  Array.new(count) {|i| (sampleName + (i+1).to_s).to_sym }
end

SAMPLES = {
  "dundun" => {"sample" => multiSample("dundun_s2_v", 5), "amp" => 2.5, "rate" => 0.74, "pan" => -0.3},
  "dunclos" => {"sample" => multiSample("dundun_closed_v", 6), "amp" => 3, "rate" => 0.9, "pan" => 0.1},
  "sangban" => {"sample" => multiSample("sangban_s2_v", 7), "amp" => 2, "rate" => 0.9, "pan" => 0.1},
  "sanclos" => {"sample" => multiSample("sangban_closed_v", 6), "amp" => 3, "rate" => 0.9, "pan" => 0.1},
  "kenken" => {"sample" => multiSample("kenkeni_s2_v", 7), "amp" => 2, "rate" => 1.1, "pan" => 0.02},
  "kenclos" => {"sample" => multiSample("kenkeni_closed_v", 6), "amp" => 3, "rate" => 0.9, "pan" => 0.1},
  "dunbell" => {"sample" => multiSample("dundun_bell_open_v", 4), "amp" => 0.8, "rate" => 0.8, "pan" => -0.3},
  "sanbell" => {"sample" => multiSample("sangban_bell_open_v", 5), "amp" => 1, "rate" => 1, "pan" => 0.1},
  "kenbell" => {"sample" => multiSample("kenkeni_bell_open_v", 3), "amp" => 1.3, "rate" => 1.2, "pan" => 0.02},
  "djbass" => {"sample" => [:dj_tm_bass], "amp" => 1, "rate" => 1, "pan" => 0},
  "djton" => {"sample" => multiSample("dj_tm_ton_v", 6), "amp" => 2, "rate" => 1, "pan" => 0},
  "djslap" => {"sample" => multiSample("dj_tm_slap_v", 8), "amp" => 2, "rate" => 1, "pan" => 0},
  "djclos" => {"sample" => multiSample("dj_tm_tonclos_v", 3), "amp" => 2, "rate" => 1, "pan" => 0},
  "dj2_bass" => {"sample" => [:DJEMBEBASS2], "amp" => 0.5, "rate" => 1, "pan" => 0},
  "dj2_ton" => {"sample" => [:DJEMBE2,:DJEMBE3], "amp" => 0.5, "rate" => 1, "pan" => 0},
  "dj2_slap" => {"sample" => [:DJEMBESLAP2,:DJEMBESLAP3,:DJEMBESLAP4], "amp" => 0.5, "rate" => 1.1, "pan" => 0},
  "dj2_clos" => {"sample" => [:DJEMBESLAP1], "amp" => 0.5, "rate" => 1, "pan" => 0}
}

INSTRUMENTS = {
  "dundun" => {"open" => SAMPLES["dundun"], "closed" => SAMPLES["dunclos"], "bell" => SAMPLES["dunbell"]},
  "sangban" => {"open" => SAMPLES["sangban"], "closed" => SAMPLES["sanclos"], "bell" => SAMPLES["sanbell"]},
  "kenken" => {"open" => SAMPLES["kenken"], "closed" => SAMPLES["kenclos"], "bell" => SAMPLES["kenbell"]},
  "djembe" => {"bass" => SAMPLES["djbass"], "ton" => SAMPLES["djton"], "slap" => SAMPLES["djslap"], "closed" => SAMPLES["djclos"]},
  "djembe2" => {"bass" => SAMPLES["dj2_bass"], "ton" => SAMPLES["dj2_ton"], "slap" => SAMPLES["dj2_slap"], "closed" => SAMPLES["dj2_clos"]}
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
#   },
#   "dependencies" => {}
# }

# Nastavenie defaultných hodnôt pre globálne premenné
@BPM ||= 95
@VARCYCLE_LEN ||= [4]
@RHYTHM_TIME ||= [4,4]
@RHYTHM_SWING ||= (ring 0,0,0,0)

#regulárny výraz na hodnotu patternu, príklad: "kenken: x.b.x.b.|x.b.x.b."
RGXP_PATTERN = /^(\w+):\s+([\.\|bXABCDIixyop]+)$/

define :countNoteDelay do |note|
  #definuje dĺžku sleepu: pre štvrťové rytmy sa hrajú šestnástinové noty, pre trojkové sa hrajú osminové
  case
  when note == 2
    return 1.0 / 2
  when note == 3
    return 1.0 / 3
  when note == 4
    return 1.0 / 4
  when note == 6
    return 1.0 / 3
  when note == 8
    return 1.0 / 4
  when note == 12
    return 1.0 / 3
  end
end

DELAY = countNoteDelay(@RHYTHM_TIME[0])

define :rand_around do |v,r|
  return rrand(v-r, v+r)
end

define :playSample do |instrument: {}, probability: 1|
  use_bpm @BPM

  if rand <= probability
    sample instrument["sample"].choose,
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

define :playNote do |note: "", instrument: {}, instrumentName: ""|

  case
  when ["dundun", "sangban", "kenken"].include?(instrumentName)
    drumOpen = instrument["open"]
    drumClosed = instrument["closed"]
    bell = instrument["bell"]
    case
    when note == 'X' || note == 'x'
      playSample(instrument: drumOpen, probability: 1)
      playSample(instrument: bell)
    when note == 'A'
      if playSample(instrument: drumOpen, probability: 0.12)
        playSample(instrument: bell)
      end
    when note == 'B'
      if playSample(instrument: drumOpen, probability: 0.4)
        playSample(instrument: bell)
      end
    when note == 'C'
      if playSample(instrument: drumOpen, probability: 0.8)
        playSample(instrument: bell)
      end
    when note == 'I' || note == 'i'
      playSample(instrument: drumClosed, probability: 1)
      playSample(instrument: bell)
    when note == 'b'
      playSample(instrument: bell)
    when note == '.'
    end

  when ["djembe", "djembe2"].include?(instrumentName)
    bass = instrument["bass"]
    ton = instrument["ton"]
    slap = instrument["slap"]
    closed = instrument["closed"]
    case
    when note == 'D'
      playSample(instrument: bass, probability: 1)
    when note == 'x'
      playSample(instrument: slap, probability: 1)
    when note == 'y'
      playSample(instrument: slap, probability: 0.12)
    when note == 'o'
      playSample(instrument: ton, probability: 1)
    when note == 'p'
      playSample(instrument: ton, probability: 0.12)
    when note == 'i'
      playSample(instrument: closed, probability: 1)
    when note == 'b'
      playSample(instrument: bell)
    when note == '.'
    end
  end
end

# Rozparsuje vstupný pattern, ktorý je na vstupe v surovom stave.
# +return+ Vráti mapu s kľúčmi instrumentName a pattern
# define :patternParse do |pattern|
#   m = pattern.match(RGXP_PATTERN)
#   return {"instrumentName" => m[1], "pattern" => m[2]}
# end

define :patternSize do |pattern|
  return pattern.delete("|").length()
end

define :playPattern do |pattern: "", instrumentName: ""|
  use_bpm @BPM
  h = 0
  #pattern = patternParse(pattern)
  pattern.split(/\|/).each do |t|
    sync :tick
    t.each_char { |c|
      playNote(note: c, instrument: INSTRUMENTS[instrumentName], instrumentName: instrumentName)
      sleep h
      h = rrand(0, HUMANIZE_TIME)
      #sleep @RHYTHM_TIME[0]* 1.0 / t.length + @RHYTHM_SWING.tick - h
      sleep DELAY * (1.0*@RHYTHM_TIME[0] / t.length) + @RHYTHM_SWING.tick - h
      #sleep DELAY + @RHYTHM_SWING.tick - h
    }
  end
end

# Globálna premenná orders. Ukladajú sa do nej komunikačné príkazy medzi
# jednotlivými threadmi reprezentujúcimi konkrétny hudobný nástroj.
# Príklad: dundun ide zahrať variáciu X, ku ktorej sangban má hrať variácu Y,
# a tak dundun zadá cez premennú order príkaz sangbanu, aby zahral Y.
orders = {}

# Globálna premenná varcycle_len určuje pre všetky nástroje aktuálnu dĺžku
# cyklu pre variáciu.
varcycle_len = @VARCYCLE_LEN.choose

define :playLiveTrack do |trackName, rhythm, instrumentName|

  #Vráti index variácie, ktorá sa má hrať a aktualizuje frontu variationsToPlay ak treba.
  define :selectVariation do |variations, variationsToPlay, lastVariation|
    variation = nil
    if (variations.size > 0)
      #ak je zoznam variácie na hranie už prázdny, tak sa naplní
      if variationsToPlay.empty?
        varToPlay = nil #variácia, ktorá sa bude pridávať do variationsToPlay (index)
        if @VAR_RANDOMSELECT
          if (variations.size == 1)
            variation = nil #v nasl sa teda nebude hrat variacia
            varToPlay = 0
          elsif (variations.size > 1)
            varToPlay = dice(variations.size) - 1
            while varToPlay == lastVariation do
              varToPlay = dice(variations.size) - 1
            end
          end
        else
          varToPlay = ((lastVariation || -1) + 1) % variations.size
        end
        rrand_i(@VAR_MINREPEAT, @VAR_MAXREPEAT).times do
          variationsToPlay << varToPlay
        end
      end
      variation = variationsToPlay.pop
      lastVariation = variation
    end
    return variation
  end

  basePatterns = rhythm["patterns"][instrumentName]["base"]
  variations = rhythm["patterns"][instrumentName]["variations"]

  #variationsToPlay = fronta variácií, ktoré sa budú hrať
  variationsToPlay = Queue.new
  #lastVariation = variácia, ktorá sa hrala naposledy
  lastVariation = nil

  in_thread(name: trackName) do
    loop do

      #výber variácie
      variation = selectVariation(variations, variationsToPlay, lastVariation)
      lastVariation = variation
      if (variation != nil)
        #ak sa našla variácia, preklopí sa z indexu na samotnú variáciu:
        variation = variations[variation]
      end

      #existuje závislosť na zvolenej variácii? Vytvor príkaz
      if rhythm["dependencies"] != nil && rhythm["dependencies"][instrumentName] != nil
        dependencies = rhythm["dependencies"][instrumentName][variation]
        if dependencies != nil
          dependencies.each do |key, value|
            orders[key] = value
          end
        end
      end

      x = 0
      if variation != nil
        #x = koľkokrát sa základný pattern nachádza vo variácii (velkosť variácie...)
        #Podmienky funkčnosti tohto algoritmu:
        # - variácia nemôže byť menšia ako velkosť base patternu
        # - basePatterns musia mat vsetky rovnaku velkost
        x = patternSize(variation) / patternSize(basePatterns[0])
      end

      #základný pattern sa zahrá príslušný počet krát
      (varcycle_len - x).times do
        #existuje príkaz? Dodrž
        #výber pattern
        #existuje závislosť? Vytvor príkaz
        playPattern(pattern: basePatterns.choose, instrumentName: instrumentName)
      end

      #a na záver cyklu sa zahrá variácia
      if variation != nil

        #existuje príkaz na variaciu? Dodrž ho. A odstráň, lebo už sa splní.
        if orders[instrumentName] != nil
          variation = orders[instrumentName]
          orders.delete(instrumentName)
        end

        playPattern(pattern: variation, instrumentName: instrumentName)
      end
    end
  end
end

define :playDirigent do
#  cue :tick
  in_thread(name: :dirigent) do
    loop do
      varcycle_len = @VARCYCLE_LEN.choose
      use_bpm @BPM
      #sample  :drum_cymbal_closed #metronom
      cue :tick
      sleep DELAY * @RHYTHM_TIME[0]
    end
  end
end

define :playLive do
  soloTracks = TRACKS.select{|t| TRACKS[t]["solo"] == 1}
  tracksToPlay = soloTracks.size > 0 ? soloTracks : TRACKS
  tracksToPlay.each do |track, trackProperties|
    if trackProperties["mute"] == 0
      playLiveTrack(track, @RHYTHM, trackProperties["instrumentName"])
    end
  end

  playDirigent
end

with_fx :reverb, room:0.2, damp:0.5 do
  playLive()
end
