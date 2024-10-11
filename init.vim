call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/goyo.vim' |Plug 'junegunn/limelight.vim'
Plug 'morhetz/gruvbox'
call plug#end()

"key bind
let mapleader=" "
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
nnoremap <leader><ENTER> :Goyo <CR>
nnoremap Q <nop>
nnoremap <leader>n :Explore <CR>
nnoremap <leader>z :set invrnu invnu<CR>

"general
set encoding=UTF-8 nobackup nowritebackup nocursorline splitright splitbelow 
set shiftwidth=4 tabstop=4 softtabstop=4 autoindent smartindent expandtab wildmode=longest,list,full
set statusline= statusline+=%#CursorLineNr#\ %y%#NonText#\ %F
set statusline+=%=%#DiffText#\ %l/%L\ [%c]
colorscheme gruvbox
set background=dark termguicolors 
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE

"goyo
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  hi! Normal ctermbg=NONE guibg=NONE
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
