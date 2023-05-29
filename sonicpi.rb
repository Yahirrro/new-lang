path = "/Users/yahiro/Documents/working/new-lang/data.json"

chords = [(chord :C, :major), (chord :G, :major), (chord :A, :minor), (chord :G, :major), (chord :F, :major), (chord :G, :major)].ring
c = chords[0]

with_fx :reverb, mix: 0.8 do
  live_loop :melody1 do
    use_octave -1
    use_synth :dark_ambience
    
    play c, amp: 1.3, sustain: rrand(1, 2.5), attack: rrand(1, 1.5)
    sleep 1
  end
  
  live_loop :melody2 do
    data = eval_file path
    puts data
    
    use_synth :piano
    
    if(data[0] == 1)
      play c[0], sustain: rrand(1, 2), attack: 2, amp: 6
      sleep 1
      play c[1], sustain: rrand(1, 2), attack: 2, amp: 6
      sleep 1
      play c[2], sustain: rrand(1, 2), attack: 2, amp: 6
    end
    sleep 1
  end
  
  
  live_loop :melody3 do
    data = eval_file path
    puts data
    
    use_synth :mod_sine
    use_octave -1
    
    if(data[1] == 1)
      play c[0], amp: 0.6, sustain: 2, attack: 1
      play c[1], amp: 0.6, sustain: 2, attack: 1
      play c[2], amp: 0.6, sustain: 2, attack: 1
    end
    sleep 4
  end
  
  live_loop :melody3 do
    data = eval_file path
    puts data
    
    use_synth :noise
    use_octave -2
    
    if(data[2] == 1)
      play c[0], amp: 0.08, sustain: 5, attack: 2
    end
    sleep 9
  end
  
  live_loop :melody4 do
    data = eval_file path
    puts data
    
    if(data[3] == 1)
      sample :guit_harmonics, pitch: rrand(0, 1), amp: 3, attack: 1
    end
    sleep 8
  end
  
  live_loop :melody5 do
    data = eval_file path
    puts data
    
    if(data[4] == 1)
      sample :misc_crow, pitch: rrand(0, 0.2), amp: 2
      sleep 1
      sample :misc_crow, pitch: rrand(0, 0.2), amp: 2
    end
    sleep 11
  end
  
  live_loop :melody6 do
    data = eval_file path
    puts data
    
    if(data[5] == 1)
      sample :ambi_glass_rub, pitch: rrand(0, 0.2), release: 0.2, amp: 0.5
    end
    
    sleep 9
  end
  
  live_loop :melody7 do
    data = eval_file path
    puts data
    
    with_fx :echo do
      if(data[6] == 1)
        sample :ambi_choir, sustain: 10, attack: 1, time_dis: 5, pitch: rrand(1, 6), _slide: 10, _slide_curve: 5, _slide_shape: 1, amp: 2
      end
      sleep 3
    end
  end
  
  live_loop :melody8 do
    with_fx :ixi_techno, amp: 0.8, mix: 0.8 do
      data = eval_file path
      puts data
      
      use_synth :growl
      use_octave 2
      
      if(data[7] == 1)
        play c.choose, amp: 0.7, sustain: 4, release: 2
      end
      sleep 4
    end
  end
  
  live_loop :bass do
    use_synth :fm
    ##| puts c;
    sleep 4
    c = chords.tick
  end
end



