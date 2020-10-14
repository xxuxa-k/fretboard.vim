let s:fretboard_default = {
      \ '1': 'G || _ | A | _ | B | C | _ | D | _ | E | F | _ | G | _ | A | _ | B | C | _ | D | _ | E | F | ',
      \ '2': 'D || _ | E | F | _ | G | _ | A | _ | B | C | _ | D | _ | E | F | _ | G | _ | A | _ | B | C | ',
      \ '3': 'A || _ | B | C | _ | D | _ | E | F | _ | G | _ | A | _ | B | C | _ | D | _ | E | F | _ | G | ',
      \ '4': 'E || F | _ | G | _ | A | _ | B | C | _ | D | _ | E | F | _ | G | _ | A | _ | B | C | _ | D | '
      \ }

let s:guitar_fretboard_origin = {
      \ '1': ['E', 'F', '_', 'G', '_', 'A', '_', 'B', 'C', '_', 'D', '_', 'E', ],
      \ '2': ['B', 'C', '_', 'D', '_', 'E', 'F', '_', 'G', '_', 'A', '_', 'B', ],
      \ '3': ['G', '_', 'A', '_', 'B', 'C', '_', 'D', '_', 'E', 'F', '_', 'G', ],
      \ '4': ['D', '_', 'E', 'F', '_', 'G', '_', 'A', '_', 'B', 'C', '_', 'D', ],
      \ '5': ['A', '_', 'B', 'C', '_', 'D', '_', 'E', 'F', '_', 'G', '_', 'A', ],
      \ '6': ['E', 'F', '_', 'G', '_', 'A', '_', 'B', 'C', '_', 'D', '_', 'E', ]
      \ }

function! s:show_fretboard(fretboard) abort
  call s:echo_edge()
  for key in keys(a:fretboard)
    echo a:fretboard[key]
  endfor
  call s:echo_edge()
  call s:echo_position_mark()
endfunction

function! s:show(fretboard) abort
  call s:echo_edge()
  for key in keys(a:fretboard)
    let str = ''
    for note in a:fretboard[key]
      let str = str . note
    endfor
    echo str
  endfor
  call s:echo_edge()
  call s:echo_position_mark()
endfunction

function! s:echo_edge() abort
  echo "  ============================================================================================"
endfunction

function! s:echo_position_mark() abort
  echo "             x       x       x       x          xxx          x       x       x       x "
endfunction

function! fretboard#show_all() abort
  call s:show_fretboard(s:fretboard_default)
endfunction
