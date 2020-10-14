if exists('g:loaded_fretboard')
  finish
endif

let g:loaded_fretboard = 1

command! FretBoard call fretboard#show_all()
