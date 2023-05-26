path = "/Users/yahiro/Documents/working/new-lang/data.json"

chords = [(chord :C, :major), (chord :G, :major), (chord :A, :minor), (chord :G, :major), (chord :F, :major), (chord :G, :major)].ring
c = chords[0]

live_loop :drums do
  sample :elec_soft_kick
  sleep 1
  sample :elec_mid_snare
  sleep 1
  sample :elec_soft_kick
  sleep 1
  sample :elec_mid_snare
  sleep 1
end

live_loop :hihat do
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_pedal
  sleep 1
end

live_loop :bass do
  use_synth :square
  data = eval_file path
  puts data
  
  if(data[0] == 1)
    play c.choose, release: 0.125, cutoff: rrand(60, 110), sustain: 2
  end
  sleep 1
end

live_loop :bass2 do
  sample :ambi_glass_hum
  data = eval_file path
  puts data
  
  if(data[1] == 1)
    play c.choose, sustain: 0.5
  end
  sleep 1
end

live_loop :merody do
  use_synth :piano
  data = eval_file path
  puts data
  
  if(data[2] == 1)
    play c.choose, release: 0.125
  end
  sleep 1
end

live_loop :merody2 do
  sample :ambi_piano
  use_octave -1
  data = eval_file path
  puts data
  
  if(data[3] == 1)
    play c.choose, attack: 0.2
  end
  sleep 0.5
end

live_loop :bass do
  use_synth :fm
  use_octave -2
  puts c;
  3.times do
    play c[0] # play the first note of the chord
    sleep 1
  end
  play c[2] # play the third note of the chord
  sleep 0.5
  play c[1] # # play the second note of the chord
  sleep 0.5
  c = chords.tick
end

