
##################################################################
#Používateľská časť - premenné, s ktorými sa používateľ môže hrať#
##################################################################

HUMANIZE_TIME = 0.01
HUMANIZE_DYNAMIC = 0.3
HUMANIZE_PITCH = 0.005


#############################################
#Systémová časť (bežne sa do nej nezasahuje)#
#############################################


define :countNoteDelay do |note|
  #definuje dĺžku sleepu: pre štvrťové rytmy sa hrajú šestnástinové noty, pre trojkové sa hrajú osminové
  case
  when note == 4
    return 1.0 / 2 / 2 #štvrťová nota na polovicu a na polovicu = šestnástinová nota
  when note == 8
    return 1.0 / 3 #štvrťová nota na tretinu - tri osminové noty v jednej štvrťovej, hrajú sa osminky
  end
end


define :rand_around do |v,r|
  return rrand(v-r, v+r)
end


define :play_sample do |sample, time, amp, pan, rate|
  use_bpm @BPM
  sample sample, amp: rand_around(amp, HUMANIZE_DYNAMIC), pan: pan, rate: rand_around(rate, HUMANIZE_PITCH)
  sleep rand_around(time, HUMANIZE_TIME)
end

define :play_dun do |s = 0, p = 1|
  if rand <= p
    play_sample(:drum_tom_lo_hard, s, 2.4, -0.3, 0.85)
    return true
  else
    sleep s
    return false
  end
end

define :play_bell_dun do |s|
  play_sample(:drum_cowbell, s, 1, -0.3, 0.7)
end

define :play_san do |s = 0, p = 1|
  if rand <= p
    play_sample(:drum_tom_mid_hard, s, 2.4, -0.3, 1)
    return true
  else
    sleep s
    return false
  end
end

define :play_bell_san do |s|
  play_sample(:drum_cowbell, s, 0.8, 0.3, 1.18)
end

define :play_ken do |s = 0, p = 1|
  if rand <= p
    play_sample(:drum_tom_hi_hard, s, 2.4, -0.3, 1.6)
    return true
  else
    sleep s
    return false
  end
end

define :play_bell_ken do |s|
  play_sample(:drum_cowbell, s, 0.8, 0.3, 1.8)
end


define :play_dun_pattern do |pattern|
  sync :tick
  use_bpm @BPM
  pattern.each_char { |c|
    case
    when c == 'X'
      play_dun
      play_bell_dun(countNoteDelay(@rhythmTime[1]))
    when c == 'A'
      play_dun(0, 0.09)
      play_bell_dun(countNoteDelay(@rhythmTime[1]))
    when c == 'B'
      play_dun(0, 0.4)
      play_bell_dun(countNoteDelay(@rhythmTime[1]))
    when c == 'C'
      play_dun(0, 0.8)
      play_bell_dun(countNoteDelay(@rhythmTime[1]))
    when c == 'b'
      play_bell_dun(countNoteDelay(@rhythmTime[1]))
    when c == '-'
      sleep countNoteDelay(@rhythmTime[1])
    end
  }
end

define :play_san_pattern do |pattern|
  sync :tick
  use_bpm @BPM
  pattern.each_char { |c|
    case
    when c == 'X'
      play_san
      play_bell_san(countNoteDelay(@rhythmTime[1]))
    when c == 'b'
      play_bell_san(countNoteDelay(@rhythmTime[1]))
    when c == '-'
      sleep countNoteDelay(@rhythmTime[1])
    end
  }
end

define :play_ken_pattern do |pattern|
  sync :tick
  use_bpm @BPM
  pattern.each_char { |c|
    case
    when c == 'X'
      play_ken
      play_bell_ken(countNoteDelay(@rhythmTime[1]))
    when c == 'b'
      play_bell_ken(countNoteDelay(@rhythmTime[1]))
    when c == '-'
      sleep countNoteDelay(@rhythmTime[1])
    end
  }
end

define :start_synchronizer do
  use_bpm @BPM
  in_thread(name: :synchronizer) do
    loop do
      cue :tick
      sleep countNoteDelay(@rhythmTime[1]) * @rhythmTime[0]
    end
  end
end

define :start_dundun do
  in_thread(name: :dundun) do
    
    loop do
      use_bpm @BPM
      
      #((dice(2) - 1)*4).times do
      
      x = 0
      if (@dundunVariations.size > 0)
        t = dice(@dundunVariations.size)
        x = 1
      end
      
      (@VARCYCLE_LEN - x).times do
        play_dun_pattern(@dundunBasePatterns.choose)
      end
      
      if t > 0
        play_dun_pattern(@dundunVariations[t - 1])
      end
      
      
    end
  end
end

define :start_sangban do
  in_thread(name: :sangban) do
    loop do
      use_bpm @BPM
      play_san_pattern(@sangbanBasePatterns.choose)
    end
  end
end

define :start_kenken do
  in_thread(name: :kenken) do
    loop do
      use_bpm @BPM
      play_ken_pattern(@kenkenBasePatterns.choose)
    end
  end
end

define :playWholeSong_old do
  start_synchronizer
  start_dundun
  start_sangban
  start_kenken
end

define :playWholeSong do
  live_loop :xxx do
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
    sleep countNoteDelay(@rhythmTime[1]) * @rhythmTime[0]
  end
end

=begin
TODO
- doplniť možnosť konfigurovať ako často sa bude hrať variácia
- počítať automaticky dĺžku variácie k dĺžke jedného cyklu a zahrať
variáciu vždy na konci cyklu
- implementovať spoločné variácie pre sangban a dundun
- nejako refaktornúť funkcie na prehranie patternu, aby algoritmus bol rovnaký pre dundun aj sangban aj kenken
- vytvoriť sampler: podobne ako sa zadávajú patterny ako text, môže sa tak vytvoriť aj sampler, tj. konkrétny hudobný nástroj
- zamysleť sa nad notáciou, aké písmenká pre aké noty používať (napr. bude "b" zvonček, keď "B" je náhodný úder???)
- implementovať swing feeling
- implementovať djembe
=end