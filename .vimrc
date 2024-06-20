"set guifont=Deja\ Vu\ Sans\ Mono\ 9
set guifont=Hack\ Nerd\ Font,Hack

syntax on           " syntax coloring by default

set background=dark
"let base16colorspace=256
"colorscheme base16-railscasts
colorscheme vimbrant
" override some vimbrant color options
highlight CursorLine  guibg=#111111 guifg=NONE "for MacVim (gui) set highlight to very dark grey and don't change foreground color
highlight ColorColumn guibg=#111111 guifg=NONE  
highlight Comment ctermfg=248 	"terminal needs a little lighter comment color
highlight Comment guifg=#888888 "gui needs a little lighter comment color (terminal is darker due to transparent background)

filetype plugin indent on  " activates indenting and plugins for specific files

set listchars=tab:→…,trail:◥,eol:¬,extends:❯,precedes:❮	" when 'set list' will identify whitespace chraracters such as tab
highlight NonText ctermfg=gray guifg=gray
highlight SpecialKey ctermfg=red guifg=red
set softtabstop=0	" see https://vi.stackexchange.com/questions/4244/what-is-softtabstop-used-for
set tabstop=4		" width of a tab
set shiftwidth=4    " width of the indentation
set autoindent      " continue indentation level to new line
"set expandtab       " has the effect of replacing tabs with spaces, not good for tsv files
set showmatch       " paren match highlighting
set hlsearch        " highlight what you search for
set incsearch       " type-ahead-find
set wildmenu        " command-line completion shows a list of matches
set wildmode=longest,list:longest,full " Bash-vim completion behavior
set autochdir       " use current working directory of a file as base path
set mouse=a         " allow mouse to move cursor
set nu              " show line numbers
set showmode        " show the current mode on the last line
set showcmd         " show informations about selection while in visual mode

set cursorline      " highlight current line
set scrolloff=5     " always keep lines around the cursor

" use ctrl-space as to toggle insert mode / Escape
:nnoremap <C-@> i
:inoremap <C-@> <Esc>

let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

let mapleader = "\<Space>"     " set leader to spacebar

"nnoremap <silent> <Leader>r :call Cycle_numbering()<CR>   " cycle relative numbering
nmap <silent> <Leader>r :call Cycle_numbering()<CR>   		" cycle relative numbering
nmap <silent> ./ :nohlsearch<CR>							" clear the search highlighting

" Cycle through relativenumber + number, number (only), and no numbering.
" source https://github.com/arithran/dotfiles/blob/master/.vim/autoload/arithran/mappings.vim
function! Cycle_numbering() 
	if exists('+relativenumber')
		execute {
			\ '00': 'set relativenumber   | set number',
			\ '01': 'set norelativenumber | set number',
			\ '10': 'set norelativenumber | set nonumber',
			\ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
	else
		" No relative numbering, just toggle numbers on and off.
		set number!
	endif
endfunction

