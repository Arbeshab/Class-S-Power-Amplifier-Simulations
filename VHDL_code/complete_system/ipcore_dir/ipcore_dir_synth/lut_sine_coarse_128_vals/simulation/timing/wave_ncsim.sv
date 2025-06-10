
 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /lut_sine_coarse_128_vals_tb/status
      waveform add -signals /lut_sine_coarse_128_vals_tb/lut_sine_coarse_128_vals_synth_inst/bmg_port/CLKA
      waveform add -signals /lut_sine_coarse_128_vals_tb/lut_sine_coarse_128_vals_synth_inst/bmg_port/ADDRA
      waveform add -signals /lut_sine_coarse_128_vals_tb/lut_sine_coarse_128_vals_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
