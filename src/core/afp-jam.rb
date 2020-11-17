##################################################################
# Engine na jamovanie.
##################################################################


#dĺžka základného cyklu: na konci každého základného cyklu sa zahrá variácia
JAM_VARIATION_CYCLE_LENGTH = [8]
#či sa variácie vyberajú náhodne, alebo v poradí, v akom sú definované
JAM_VARIATION_RANDOMSELECT = false
#minimálne koľkokrát sa zvolená variácia zopakuje
JAM_VARIATION_MINREPEAT = 1
#maximálne koľkokrát sa zvolená variácia zopakuje
JAM_VARIATION_MAXREPEAT = 2

#BREAK_CYCLELEN = [16]
#RANDOM_BREAKS = false
#BREAK_MINREPEAT = 1
#BREAK_MAXREPEAT = 1

#JAM_VARIATION_CYCLE_LENGTH ||= [4]

# Premenná orders. Ukladajú sa do nej komunikačné príkazy medzi
# jednotlivými threadmi reprezentujúcimi konkrétny hudobný nástroj.
# Príklad: dundun ide zahrať variáciu X, ku ktorej sangban má hrať variácu Y,
# a tak dundun zadá cez premennú order príkaz sangbanu, aby zahral Y.
orders = {}

# Premenná varcycle_len určuje pre všetky nástroje aktuálnu dĺžku
# cyklu pre variáciu.
varcycle_len = JAM_VARIATION_CYCLE_LENGTH.choose

define :jam_playTrackLive do |trackName, rhythm, instrumentName|

  #Vráti index variácie, ktorá sa má hrať a aktualizuje frontu variationsToPlay ak treba.
  define :selectVariation do |variations, variationsToPlay, lastVariation|
    variation = nil
    if (variations.size > 0)
      #ak je zoznam variácie na hranie už prázdny, tak sa naplní
      if variationsToPlay.empty?
        varToPlay = nil #variácia, ktorá sa bude pridávať do variationsToPlay (index)
        if JAM_VARIATION_RANDOMSELECT
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
        rrand_i(JAM_VARIATION_MINREPEAT, JAM_VARIATION_MAXREPEAT).times do
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
        x = seqn_patternSize(variation) / seqn_patternSize(basePatterns[0])
      end

      #základný pattern sa zahrá príslušný počet krát
      (varcycle_len - x).times do
        #existuje príkaz? Dodrž
        #výber pattern
        #existuje závislosť? Vytvor príkaz
        seqn_playPattern(pattern: basePatterns.choose, instrumentName: instrumentName)
      end

      #a na záver cyklu sa zahrá variácia
      if variation != nil

        #existuje príkaz na variaciu? Dodrž ho. A odstráň, lebo už sa splní.
        if orders[instrumentName] != nil
          variation = orders[instrumentName]
          orders.delete(instrumentName)
        end

        seqn_playPattern(pattern: variation, instrumentName: instrumentName)
      end
    end
  end
end

define :jam_playAllLive do
	seqn_tracksToPlay(TRACKS).each do |track, trackProperties|
		jam_playTrackLive(track, @RHYTHM, trackProperties["instrumentName"])
	end
	jam_playDirigent
end

define :jam_playDirigent do
#  cue :tick
  in_thread(name: :dirigent) do
    loop do
      varcycle_len = JAM_VARIATION_CYCLE_LENGTH.choose
      use_bpm @RHYTHM["BPM"]
      #sample  :drum_cymbal_closed #metronom
      cue :tick
      sleep @DELAY * @RHYTHM["TIME_SIGNATURE"][0] + HUMANIZE_TIME + 0.025
    end
  end
end

seqn_initialize(@RHYTHM)
set_volume! 3
if @OPTIMIZED
	jam_playAllLive()
elsif
	with_fx :reverb, room:0.2, damp:0.5 do
		jam_playAllLive()
	end
end