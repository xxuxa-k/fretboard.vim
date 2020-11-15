let s:chromatic_scales = {
      \ 'C': ['C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb', 'B'],
      \ 'C#/Db': ['C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb', 'B', 'C'],
      \ 'D': ['D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb', 'B', 'C', 'C#/Db'],
      \ 'D#/Eb': ['D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D'],
      \ 'E': ['E', 'F', 'F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb'],
      \ 'F': ['F', 'F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E'],
      \ 'F#/Gb': ['F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F'],
      \ 'G': ['G', 'G#/Ab', 'A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb'],
      \ 'G#/Ab': ['G#/Ab', 'A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G'],
      \ 'A': ['A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'G#/Ab'],
      \ 'A#/Bb': ['A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'G#/Ab', 'A'],
      \ 'B': ['B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb']
      \ }
let s:scale_indexs = {
      \ 'chromatic': [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
      \ 'major': [0, 2, 4, 5, 7, 9, 11],
      \ 'minor': [0, 2, 3, 5, 7, 8, 10],
      \ 'major_pentatonic': [0, 2, 4, 7, 9],
      \ 'minor_pentatonic': [0, 2, 3, 7, 8],
      \ }
let s:lowest_sounds= {
      \ 'guitar' : {
      \ '1': 'E',
      \ '2': 'B',
      \ '3': 'G',
      \ '4': 'D',
      \ '5': 'A',
      \ '6': 'E'
      \ },
      \ 'bass' : {
      \ '1': 'G',
      \ '2': 'D',
      \ '3': 'A',
      \ '4': 'E'
      \ },
      \ }
let s:fretnumber_count = 20

let s:single_char_sounds = ['C', 'D', 'E', 'F', 'G', 'A', 'B']

function! fretboard#scale(instrument, scale, root) abort
  let scale_sounds = []
  for index in s:scale_indexs[a:scale]
    let scale_sounds = add(scale_sounds, s:chromatic_scales[a:root][index])
  endfor
  for n in keys(s:lowest_sounds[a:instrument])
    let lowest_sound = s:lowest_sounds[a:instrument][n]
    let sound_sequence = '|'
    for i in range(s:fretnumber_count)
      let mod = i % 12
      let sound = s:chromatic_scales[lowest_sound][mod]
      if index(s:single_char_sounds, sound) > -1
        if index(scale_sounds, sound) > -1
          let sound_sequence = sound_sequence . '   ' . sound . '   ' . '|'
        else
          let sound_sequence = sound_sequence . '   ' . ' ' . '   ' . '|'
        endif
      else
        if index(scale_sounds, sound) > -1
          let sound_sequence = sound_sequence . ' ' . sound . ' ' . '|'
        else
          let sound_sequence = sound_sequence . ' ' . '     ' . ' ' . '|'
        endif
      endif
    endfor
    echo sound_sequence
  endfor
  call s:fretnumber()
endfunction

function! fretboard#show(instrument) abort
  for n in keys(s:lowest_sounds[a:instrument])
    let lowest_sound = s:lowest_sounds[a:instrument][n]
    let sound_sequence = '|'
    for i in range(s:fretnumber_count)
      let mod = i % 12
      let sound = s:chromatic_scales[lowest_sound][mod]
      if index(s:single_char_sounds, sound) > -1
        let sound_sequence = sound_sequence . '   ' . sound . '   ' . '|'
      else
        let sound_sequence = sound_sequence . ' ' . sound . ' ' . '|'
      endif
    endfor
    echo sound_sequence
  endfor
  call s:fretnumber()
endfunction

function! s:fretnumber() abort
  let edge = '|'
  for i in range(s:fretnumber_count)
    let edge = edge . '========'
  endfor
  echo edge
  let fretnumber_sequence = '|'
  for i in range(s:fretnumber_count)
    if i < 10
      let fretnumber_sequence = fretnumber_sequence . '   ' . i . '   ' . '|'
    else
      let fretnumber_sequence = fretnumber_sequence . '   ' . i . '  ' . '|'
    endif
  endfor
  echo fretnumber_sequence
endfunction
