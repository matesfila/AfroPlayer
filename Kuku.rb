
BPM = 80

loop do
  use_bpm BPM
  
  in_thread do
    use_bpm BPM
    sample :drum_tom_mid_hard
    sleep 0.75
    sample :drum_tom_lo_hard
    sleep 0.25
    sleep 0.50
    sample :drum_tom_mid_hard
    sleep 0.50
  end
  
  in_thread do
    use_bpm BPM
    sample :drum_cowbell
    sleep 0.5
    sample :drum_cowbell
    sleep 0.25
    sample :drum_cowbell
    sleep 0.5
    sample :drum_cowbell
    sleep 0.25
    sample :drum_cowbell
    sleep 0.5
  end
  
  sleep 2
end