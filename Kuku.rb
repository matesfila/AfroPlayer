
#################################################################
#Používateľská časť - definujú sa tu vlastnosti rytmu a patterny#
#################################################################

BPM = 100
HUMANIZE_TIME = 0.01
HUMANIZE_DYNAMIC = 0.3
HUMANIZE_PITCH = 0.005

kuku_pattern_dundun_base = Array.new(12, "b-bX-bb-|b-b-A-b-") + ["bX-X-bb-|b-b-A-b-"]
kuku_pattern_sangban_base = ["X-b-b-X-|X-b-b-X-"]
kuku_pattern_kenken_base = ["X-b-X-b-|X-b-X-b-"]
kuku_pattern_dundun_variations =
  Array.new(4, "b-bX-bb-|X-bX-bX-") +
  Array.new(8, "b-AX-AX-|AX-AX-X-") +
  Array.new(2, "b-bX-bb-|X-XX-XX-") +
  Array.new(8, "B-BB-BB-|C-CC-CC-") +
  Array.new(2, "X-bX-bB-|X-XX-XX-|XX-X-XX-|XX-XXXX-")


dundunBasePatterns = kuku_pattern_dundun_base
dundunVariations = kuku_pattern_dundun_variations
sangbanBasePatterns = kuku_pattern_sangban_base
kenkenBasePatterns = kuku_pattern_kenken_base

#############################################
#Systémová časť (bežne sa do nej nezasahuje)#
#############################################

QUARTER_NOTE = 0.5
EIGHT_NOTE = 0.25
use_bpm BPM

define :rand_around do |v,r|
  return rrand(v-r, v+r)
end


define :play_sample do |sample, time, amp, pan, rate|
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
  pattern.each_char { |c|
    case
    when c == 'X'
      play_dun
      play_bell_dun(EIGHT_NOTE)
    when c == 'A'
      play_dun(0, 0.09)
      play_bell_dun(EIGHT_NOTE)
    when c == 'B'
      play_dun(0, 0.4)
      play_bell_dun(EIGHT_NOTE)
    when c == 'C'
      play_dun(0, 0.8)
      play_bell_dun(EIGHT_NOTE)
    when c == 'b'
      play_bell_dun(EIGHT_NOTE)
    when c == '-'
      sleep EIGHT_NOTE
    end
  }
end

define :play_san_pattern do |pattern|
  sync :tick
  pattern.each_char { |c|
    case
    when c == 'X'
      play_san
      play_bell_san(EIGHT_NOTE)
    when c == 'b'
      play_bell_san(EIGHT_NOTE)
    when c == '-'
      sleep EIGHT_NOTE
    end
  }
end

define :play_ken_pattern do |pattern|
  sync :tick
  pattern.each_char { |c|
    case
    when c == 'X'
      play_ken
      play_bell_ken(EIGHT_NOTE)
    when c == 'b'
      play_bell_ken(EIGHT_NOTE)
    when c == '-'
      sleep EIGHT_NOTE
    end
  }
end

define :start_synchronizer do
  in_thread(name: :synchronizer) do
    loop do
      cue :tick
      sleep QUARTER_NOTE * 8
    end
  end
end

define :start_dundun do
  in_thread(name: :dundun) do
    
    loop do
      #((dice(2) - 1)*4).times do
      1.times do
        play_dun_pattern(dundunBasePatterns.choose)
      end
      
      if (dundunVariations.size > 0)
        t = dice(dundunVariations.size)
        play_dun_pattern(dundunVariations[t - 1])
      end
      
    end
  end
end

define :start_sangban do
  in_thread(name: :sangban) do
    loop do
      play_san_pattern(sangbanBasePatterns.choose)
    end
  end
end

define :start_kenken do
  in_thread(name: :kenken) do
    loop do
      play_ken_pattern(kenkenBasePatterns.choose)
    end
  end
end

start_synchronizer
start_dundun
start_sangban
start_kenken