if exists('g:loaded_fretboard')
  finish
endif

let g:loaded_fretboard = 1

command! -nargs=1 FretBoardShow call fretboard#show(<f-args>)
command! -nargs=* FretBoardScale call fretboard#scale(<f-args>)
