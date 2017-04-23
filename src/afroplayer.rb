
##################################################################
#Používateľská časť - premenné, s ktorými sa používateľ môže hrať#
##################################################################


HUMANIZE_TIME = 0.0133

HUMANIZE_DYNAMIC = 0.2
HUMANIZE_PITCH = 0.005

#dĺžka základného cyklu: na konci každého základného cyklu sa zahrá variácia
@VARCYCLE_LEN = [4]
#či sa variácie vyberajú náhodne, alebo v poradí, v akom sú definované
@RANDOM_VARIATIONS = false
#minimálne koľkokrát sa zvolená variácia zopakuje
@VAR_MINREPEAT = 1
#maximálne koľkokrát sa zvolená variácia zopakuje
@VAR_MAXREPEAT = 1

@PLAY_DUNDUN = true
@PLAY_SANGBAN = true
@PLAY_KENKEN = true
@PLAY_DJEMBE = true

# SAMPLES = {
#   "dundun" => {"sample" => :drum_tom_lo_hard, "amp" => 1.2, "rate" => 0.75, "pan" => -0.5, "sustain" => 0.18, "release" => 0.02},
#   "dunclos" => {"sample" => :drum_tom_lo_hard, "amp" => 0.7, "rate" => 0.95, "pan" => -0.5,
#                 "attack" => 0, "sustain" => 0, "release" => 0.18},
#   "sangban" => {"sample" => :drum_tom_mid_hard, "amp" => 1.2, "rate" => 1, "pan" => 0.5},
#   "sanclos" => {"sample" => :drum_tom_mid_hard, "amp" => 0.7, "rate" => 1.15, "pan" => 0.5,
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

SAMPLES = {
  "dundun" => {"sample" => :drum_dundun, "amp" => 5, "rate" => 0.84, "pan" => -0.3},
  "dunclos" => {"sample" => :drum_dundun, "amp" => 0.7, "rate" => 0.95, "pan" => -0.3,
                "attack" => 0, "sustain" => 0, "release" => 0.18},
  "sangban" => {"sample" => :drum_sangban, "amp" => 4.8, "rate" => 0.9, "pan" => 0.1},
  "sanclos" => {"sample" => :drum_sangban, "amp" => 1.5, "rate" => 1.15, "pan" => 0.1,
                "attack" => 0, "sustain" => 0, "release" => 0.15},
  "kenken" => {"sample" => :drum_kenkeni, "amp" => 4, "rate" => 1.1, "pan" => 0.02},
  "kenclos" => {"sample" => :drum_kenkeni, "amp" => 0.6, "rate" => 1.05, "pan" => 0.02,
                "attack" => 0, "sustain" => 0, "release" => 0.13},
  "dunbell" => {"sample" => :drum_dundun_bell, "amp" => 2.5, "rate" => 0.8, "pan" => -0.3},
  "sanbell" => {"sample" => :drum_sangban_bell, "amp" => 1.7, "rate" => 1, "pan" => 0.1},
  "kenbell" => {"sample" => :drum_kenkeni_bell, "amp" => 1.7, "rate" => 1.2, "pan" => 0.02},
  "djbass" => {"sample" => :DJEMBEBASS2, "amp" => 1, "rate" => 1, "pan" => 0},
  "djton" => {"sample" => :DJEMBE3, "amp" => 1, "rate" => 1, "pan" => 0},
  "djslap" => {"sample" => :DJEMBESLAP3, "amp" => 1, "rate" => 1.1, "pan" => 0},
  "djclos" => {"sample" => :DJEMBESLAP1, "amp" => 1, "rate" => 1, "pan" => 0}
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
#   },
#   "dependencies" => {}
# }


# Nastavenie defaultných hodnôt pre globálne premenné
@BPM ||= 95
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
@VARCYCLE_LEN ||= [4]
@RHYTHM_TIME ||= [4,4]
@RHYTHM_SWING ||= (ring 0,0,0,0)

#regulárny výraz na hodnotu patternu, príklad: "x.b.x.b.|x.b.x.b."
RGXP_PATTERN = /^([\.\|bXABCDIxo]+)$/

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

define :countNoteDelay_new do |rhythm_time|
    return 1.0 / (rhythm_time[0] / 4.0)
end

DELAY = countNoteDelay(@RHYTHM_TIME[0])
#DELAY = countNoteDelay_new(@RHYTHM_TIME[0])

define :rand_around do |v,r|
  return rrand(v-r, v+r)
end

define :playSample do |instrument: {}, probability: 1|
  use_bpm @BPM

  if rand <= probability
    with_fx :reverb, room:0.09, damp:1 do
      sample instrument["sample"],
        amp: rand_around(instrument["amp"], HUMANIZE_DYNAMIC),
        pan: instrument["pan"],
        rate: rand_around(instrument["rate"], HUMANIZE_PITCH),
        attack: instrument["attack"],
        sustain: instrument["sustain"],
        release: instrument["release"]
    end
    return true
  else
    return false
  end
end

define :playNote do |note: "", instrument: {}|
  drumOpen = instrument["open"]
  drumClosed = instrument["closed"]
  bell = instrument["bell"]
  bass = instrument["bass"]
  ton = instrument["ton"]
  slap = instrument["slap"]
  case
  when note == 'X'
    playSample(instrument: drumOpen, probability: 1)
    playSample(instrument: bell)
  when note == 'A'
    playSample(instrument: drumOpen, probability: 0.12)
    playSample(instrument: bell)
  when note == 'B'
    playSample(instrument: drumOpen, probability: 0.4)
    playSample(instrument: bell)
  when note == 'C'
    playSample(instrument: drumOpen, probability: 0.8)
    playSample(instrument: bell)
  when note == 'I'
    playSample(instrument: drumClosed, probability: 1)
    playSample(instrument: bell)
  when note == 'D'
    playSample(instrument: bass, probability: 1)
  when note == 'x'
    playSample(instrument: slap, probability: 1)
  when note == 'o'
    playSample(instrument: ton, probability: 1)
  when note == 'b'
    playSample(instrument: bell)
  when note == '.'
  end

end

# Rozparsuje vstupný pattern.
# +return+ Vráti pattern v stave iba s notami, bez pomocných symbolov.
define :patternParse do |pattern|
  m = pattern.match(RGXP_PATTERN)
  return m[1].delete("|")
end

define :patternSize do |pattern|
  return patternParse(pattern).length()
end

define :playPattern do |pattern: "", instrumentName: ""|
  use_bpm @BPM
  h = 0
  #pattern = patternParse(pattern)
  pattern.split(/\|/).each do |t|
    sync :tick
    t.each_char { |c|
      playNote(note: c, instrument: INSTRUMENTS[instrumentName])
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

define :playLiveTrack do |trackName, rhythm, instrument|
  basePatterns = rhythm["patterns"][instrument]["base"]
  variations = rhythm["patterns"][instrument]["variations"]

  varIndex = -1;
  varCount = 0
  in_thread(name: trackName) do
    loop do

      variation = nil
      #výber variácie
      if (variations.size > 0)
        if varCount >= @VAR_MINREPEAT
          if @RANDOM_VARIATIONS
            varIndexOld = varIndex
            varIndex = dice(variations.size) - 1
            if varIndexOld != varIndex
              #meni sa variacia
              varCount = 0
            else #variacia ostava
              if varCount >= @VAR_MAXREPEAT && variations.size > 1
                #ak nemohla ostat ta ista variacia
                while varIndex == varIndexOld do
                  varIndex = dice(variations.size) - 1
                end
              end
            end
          else
            varIndex = (varIndex + 1) % variations.size
          end
        end
        variation = variations[varIndex]
        varCount += 1
      end

      #existuje závislosť na zvolenej variácii? Vytvor príkaz
      if rhythm["dependencies"] != nil && rhythm["dependencies"][instrument] != nil
        dependencies = rhythm["dependencies"][instrument][variation]
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
        playPattern(pattern: basePatterns.choose, instrumentName: instrument)
      end

      #a na záver cyklu sa zahrá variácia
      if variation != nil

        #existuje príkaz na variaciu? Dodrž ho. A odstráň, lebo už sa splní.
        if orders[instrument] != nil
          variation = orders[instrument]
          orders.delete(instrument)
        end

        playPattern(pattern: variation, instrumentName: instrument)
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
  playDirigent
end

playLive()

=begin

TODO
- djembe sólovanie
    - v zátvorkách () bude skupina úderov, ktoré sa majú odohrať za jednu štvrťovú notu
    (tj ak tam budú tri noty, zahrajú sa tri údery, ak 5 nôt, zahrá sa 5 úderov... veľká variabilita...)
- notácia patternov
    zamysleť sa aké písmenká pre aké noty používať (napr. bude "b" zvonček, keď "B" je náhodný úder???)
    - zaviesť modifikátory nôt, bude na to potrebný inteligentnejší parser patternov:
        - medzery budú povolené, ale prehrávačom patternu ignorované (budú iba pre používateľa)
        - pred každou notou môže byť modifikátor, príklady modifikátorov:
            < zahrá notu o niečo skôr, tj. skráti pauzu medzi notou vľavo a vpravo od modifikátora
            ^ zahrá notu s väčšou razanciou, dynamikou
            v zahrá notu s menšou razanciou, dynamikou
        - keď vznikne obálka na náhodnosť úderov, bude sa dať náhodnosť aplikovať
          aj na použitie modifikátora (tj modifikátor sa aplikuje na základe náhodnosti)
- náhodnosť medzi dundun a nemu príslušný zvonček
- závislosti medzi patternami, spoločné variácie pre sangban a dundun
- envelope: obálky, modifikátory pre patterny/tracky
- inteligentnejší sampler: náhodné sample, vrstvy pre rôzne dynamiky
    nápad: rôzne verzie samplu budú v jednom wav. V názve wav súboru bude povedané, či ide
    o multisampel a podľa toho bude funkcia playSample vyberať/nevyberať náhodný sampel
- inteligentnejší sequencer: ak sú dva/tri údery po sebe, vymysleť...
- HUMANIZE_TIME by sa mal možno až exponenciálne zmenšovať so zmenšovaním dĺžky noty
  (pre šestnástinové by teda humanize mal byť menší ako pre štvrtinové)

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
OK - djembe (zatial na úrovni dundunov, bez možnosti sól v zmenenom time)
OK - afro sample (zatial narýchlo čo som našiel, neskôr zdokonaliť)

Definícia rytmu
OK - zadanie rytmu pre afroplayer pomocou hash tabuľky (imitácia definovania rytmu cez xml)
  Pre používateľa sa môže potom neskôr vytvoriť viac user friendly zadanie, pre ktoré vznikne
  kompilátor do zadania cez hash tabuľky

=end
