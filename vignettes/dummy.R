# https://sites.uci.edu/camp2014/2014/04/30/managing-midi-pitchbend-messages/

synth_bend_bottom <- -2 # semitones at the bottom end
synth_bend_top <- 2 # semitones at the top end
synth_bend_scale <- 1.0 / (synth_bend_top - synth_bend_bottom)
midi_bend_bottom <- 0 # MIDI bend value for bottom of pitch bend
midi_bend_zero <- 8192 # MIDI bend value for no pitch bend
midi_bend_scale <- midi_bend_zero - midi_bend_bottom
synth_range <- synth_bend_top - synth_bend_bottom
(note_numbers <-
    seq(48, 72, by = 0.125))
ints <- floor(note_numbers)
fracs <- note_numbers - ints
(ints <-
    ifelse (fracs > 0.5, ints + 1, ints))
fracs <- ifelse (fracs > 0.5, fracs - 1, fracs)
synth_bend_fracs <- synth_bend_scale * fracs
(midi_bend_values <-
    round(midi_bend_scale * synth_bend_fracs + midi_bend_zero, 0))
