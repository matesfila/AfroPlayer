##################################################################
# Engine na jamovanie.
##################################################################



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
      sleep DELAY * @RHYTHM_TIME[0] + HUMANIZE_TIME
    end
  end
end

define :playLive do
  soloTracks = TRACKS.select{|t| TRACKS[t]["solo"] == 1}
  tracksToPlay = (soloTracks.size > 0 ? soloTracks : TRACKS).select{|t| TRACKS[t]["mute"] == 0}

  tracksToPlay.each do |track, trackProperties|
    playLiveTrack(track, @RHYTHM, trackProperties["instrumentName"])
  end

  playDirigent
end

with_fx :reverb, room:0.2, damp:0.5 do
  playLive()
end
