BPM = 100
HUMANIZE_TIME = 0.01
HUMANIZE_DYNAMIC = 0.3
HUMANIZE_PITCH = 0.005

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
    play_sample(:drum_tom_hi_hard, s, 2.4, -0.3, 1)
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
      play_dun(0, 0.15)
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


define :kuku_pattern_dundun_base do
  if one_in(5)
    play_dun_pattern("bX-X-bb-|b-b-B-b-")
  else
    play_dun_pattern("b-bX-bb-|b-b-B-b-")
  end
end

define :kuku_pattern_sangban_base do
  play_san_pattern("X-b-b-X-|X-b-b-X-")
end

define :kuku_pattern_kenken_base do
  play_ken_pattern("X-b-X-b-|X-b-X-b-")
end

define :kuku_pattern_dundun_var1 do
  play_dun_pattern("b-bX-bb-|X-bX-bX-")
end

define :kuku_pattern_dundun_var2 do
  play_dun_pattern("b-bX-bb-|X-XX-XX-")
end

define :kuku_pattern_dundun_var3 do
  play_dun_pattern("B-BB-BB-|C-CC-CC-")
end

define :kuku_pattern_dundun_var4 do
  play_dun_pattern("X-bX-bB-|X-XX-XXX")
  #cue :tick
  play_dun_pattern("X-XXX-XX|-XXX-X-X")
end

in_thread(name: :synchronizer) do
  loop do
    cue :tick
    play_dun_pattern("--------|--------")
  end
end

in_thread(name: :dundun) do
  
  loop do
    (dice(2) - 1).times do
      #0.times do
      kuku_pattern_dundun_base
      kuku_pattern_dundun_base
      kuku_pattern_dundun_base
      kuku_pattern_dundun_base
    end
    
    t = dice(6)
    case
    when t == 1
      kuku_pattern_dundun_base
      kuku_pattern_dundun_var1
    when t == 2
      kuku_pattern_dundun_base
      kuku_pattern_dundun_var2
    when t >= 3 && t <= 5
      kuku_pattern_dundun_base
      kuku_pattern_dundun_var3
    else
      kuku_pattern_dundun_base
      kuku_pattern_dundun_base
      kuku_pattern_dundun_var4
    end
    
  end
end

in_thread(name: :sangban) do
  loop do
    kuku_pattern_sangban_base
  end
end

in_thread(name: :kenken) do
  loop do
    kuku_pattern_kenken_base
  end
end