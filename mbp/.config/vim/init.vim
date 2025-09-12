" Prepend mise shims to PATH
let $PATH = $HOME . '/.local/share/mise/shims:' . $PATH
set nocompatible
if !has('gui_running')
  set t_Co=256
endif
nno <space><bs> <CMD>nohl<CR>
" bmenu_priority

syntax enable
filetype plugin indent on
set cmdheight=1
set nofoldenable
set linebreak
set loadplugins lazyredraw

			" call popup_create({what}, #{
				" \ pos: 'botleft',
				" \ line: 'cursor-1',
				" \ col: 'cursor',
				" \ moved: 'WORD',
				" \ })
" 
set previewwindow preserveindent

" set transparency=10
set previewheight=0

      set guifont=ZedMono\ Nerd\ Font:h10
      set guifontwide=ZedMono\ Nerd\ Font:h10
      set linespace=-1
	if !has("nvim")
    set ttymouse=sgr
	endif

nno gH <ESC>:<C-U>help<space><C-R>=expand("<cWORD>")<CR><CR>
nno gh <ESC>:<C-U>help<space><C-R>=expand("<cword>")<CR><CR>
    if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
        " Better mouse support, see  :help 'ttymouse'

      " Enable true colors, see  :help xterm-true-color
      let &termguicolors = v:true
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

      " Enable bracketed paste mode, see  :help xterm-bracketed-paste
      let &t_BE = "\<Esc>[?2004h"
      let &t_BD = "\<Esc>[?2004l"
      let &t_PS = "\<Esc>[200~"
      let &t_PE = "\<Esc>[201~"

      " Enable focus event tracking, see  :help xterm-focus-event
      let &t_fe = "\<Esc>[?1004h"
      let &t_fd = "\<Esc>[?1004l"
	execute "set <FocusGained>=\<Esc>[I"
        execute "set <FocusLost>=\<Esc>[O"

        " Enable modified arrow keys, see  :help arrow_modifiers
        execute "silent! set <xUp>=\<Esc>[@;*A"
        execute "silent! set <xDown>=\<Esc>[@;*B"
        execute "silent! set <xRight>=\<Esc>[@;*C"
        execute "silent! set <xLeft>=\<Esc>[@;*D"
    endif

nno ; :
nno H <ESC>:<C-U>bp<CR>
nno L <ESC>:<C-U>bn<CR>
nno ,vr <CMD>e ~/.vimrc<CR>
nno ,vv <CMD>e $HOME/.config/vim/init.vim<CR>
nno ,vV <CMD>e $HOME/.config/vv/init.lua<CR>
nno ,vc <CMD>e $HOME/.config/vim/coc.vim<CR>
nno ,vp <CMD>e $HOME/.config/vim/plugin.vim<CR>
nno ,vn <CMD>e $HOME/.config/nvim/init.lua<CR>


set grepprg=rg\ --vimgrep
set makeprg=make
set grepformat=%f:%l:%c:%m

set sessionoptions=buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds

ino <F7> <C-N><C-P>
ino <C-j> <C-n>
ino <C-k> <C-p>
" ino <TAB> <C-n>
" ino <S-TAB> <C-p>

nno <C-b><C-o> <CMD>browse oldfiles<CR>
nno <C-b><C-v> <CMD>browse view<CR>


    inoremap <C-]> <C-X><C-]>
    inoremap <C-F> <C-X><C-F>
    inoremap <C-D> <C-X><C-D>
    inoremap <C-L> <C-X><C-L>

	function! CleverTab()
	   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
	      return "\<Tab>"
	   else
	      return "\<C-N>"
	   endif
	endfunction
	" inoremap <Tab> <C-R>=CleverTab()<CR>

    function s:pu()
			call popup_create({what}, #{
				\ pos: 'center',
				\ zindex: 200,
				\ drag: 1,
				\ border: [],
				\ padding: [],
				\ mapping: 0,
				\})
    endfunc

    inoremap <Expr> <C-U> <SID>call s:pu()<CR>

" set showcmdloc
set shiftround showfulltag showmatch
au CompleteChanged * call UpdateCompleteInfo()
func UpdateCompleteInfo()
  " Cancel any pending info fetch
  let item = v:event.completed_item
  " Start fetching info for the item then call ShowCompleteInfo(info)
endfunc
func ShowCompleteInfo(info)
  let id = popup_findinfo()
  if id
    call popup_settext(id, 'async info: ' .. a:info)
    call popup_show(id)
  endif
endfunc

" inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>Down>"<CR>
" 	inoremap <expr> . MayComplete()
" 	func MayComplete()
" 	    if (can complete)
" 	      return ".\<C-X>\<C-O>"
" 	    endif
" 	    return '.'
" 	endfunc

tmap <C-j> <CMD>wincmd j<CR>
tmap <C-h> <CMD>wincmd h<CR>
tmap <C-k> <CMD>wincmd k<CR>
tmap <C-l> <CMD>wincmd l<CR>
nm <C-j> <C-W>j
nm <C-h> <C-W>h
nm <C-k> <C-W>k
nm <C-l> <C-W>l

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_list_hide = &wildignore
let g:netrw_winsize = 25
let g:netrw_hide = 0
let g:netrw_bufsettings="noma nomod nu nobl nowrap ro nornu laststatus=0 showtabline=0"
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_fastbrowse = 2
let g:netrw_keepdir=0

 hi netrwCompress term=NONE cterm=NONE gui=NONE ctermfg=10 guifg=green  ctermbg=0 guibg=black
 hi netrwData	  term=NONE cterm=NONE gui=NONE ctermfg=9 guifg=blue ctermbg=0 guibg=black
 hi netrwHdr	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
 hi netrwLex	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
 hi netrwYacc	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
 hi netrwLib	  term=NONE cterm=NONE gui=NONE ctermfg=14 guifg=yellow
 hi netrwObj	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
 hi def link netrwDir Repeat
 hi netrwTilde	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
 hi netrwTmp	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
 hi def link netrwPlain FoldColumn
 hi netrwTags	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
 hi netrwDoc	  term=NONE cterm=NONE gui=NONE ctermfg=220 ctermbg=27 guifg=yellow2 guibg=Blue3
 hi netrwSymLink  term=NONE cterm=NONE gui=NONE ctermfg=220 ctermbg=27 guifg=grey60


	let winid = 0
	let last_text = ''

	" function BalloonExpr()
	    " var text = v:beval_text
	    " if winid > 0 && popup_getpos(winid) != null_dict
		" # previous popup window still shows
		" if text == g:last_text
		    " # still the same text, keep the existing popup
		    " return null_string
		" endif
		" popup_close(winid)
	    " endif
" 
	    " # Simulate an asynchronous lookup that takes half a second for the
	    " # text to display.
	    " v:last_text = text
	    " timer_start(500, 'ShowPopup')
	    " return null_string
	" endfunc
	" set ballooneval balloonevalterm
	" set balloonexpr=BalloonExpr()
" 
	" def ShowPopup(timerid: number)
	"     winid = popup_beval('Result: ' .. last_text, {})
	" enddef


set sts=2 ts=2 sw=2 et
set noswapfile 
set termguicolors
set ttyfast
set background=dark

let g:loaded_gzip=1
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
let g:loaded_vimballPlugin=1
let g:loaded_zipPlugin=1
let g:loaded_rrhelper=1
let g:loaded_logiPat=1


" augroup Lex
" 	autocmd!
 "  autocmd VimEnter * :<C-U>Lexplore<CR>
" augroup END

set clipboard=unnamed,unnamedplus
" set wildignorecase

set ignorecase smartcase infercase
set hlsearch incsearch
set signcolumn=yes 
set virtualedit=block
set lazyredraw
set linespace=0

" map <C-e> <CMD>Lexplore<CR>

" augroup Exp
"   au!
"   " startup netrw if not with buf
"   au VimEnter * if expand("%") == "" && argc() == 0 &&
"   \ (v:servername =~ 'GVIM\d*' || v:servername == "")
"   \ | e . | endif
"   " remove flair
"   " au FileType netrw setl ls=0 stal=0 scl=no nonu nornu hi 
"   " au BufLeave,VimLeave netrw set ls=3 stal=3 scl=yes nu rnu
" augroup END
nmap <C-o> <CMD>terminal<CR>
tmap <C-o> <C-w>:<C-U>terminal<CR>

nmap <space>x <CMD>bd<CR>
nmap <space>w <CMD>w!<CR>
nmap <space>Q <CMD>wqa!<CR>

im <C-a> <HOME>
im <C-b> <LEFT>
im <C-f> <RIGHT>
im <C-e> <END>

cm <C-a> <HOME>
cm <C-b> <LEFT>
cm <C-f> <RIGHT>
cm <C-e> <END>

set mouse=a
set autoindent smartindent smarttab


set autoread autowrite
set splitbelow splitright splitkeep=screen pumheight=0 conceallevel=2 cursorline
set showmatch noshowmode showcmd
set splitright
" set guifont=Iosevka\ Nerd\ Font:h11
set autochdir
set wildcharm=<C-I>

map <c-x><c-h> <ESC>:<C-u>h<space><C-I>

map <c-x>rw <ESC>:<C-U>%s/<C-R>=expand("<cword>")<CR>//g<LEFT><LEFT>
map <c-x>rw <ESC>:<C-U>%s/<C-R>=expand("<cexpr>")<CR>//g<LEFT><LEFT>
map <c-x>rW <ESC>:<C-U>%s/<C-R>=expand("<cWORD>")<CR>//g<LEFT><LEFT>
map <c-x><C-r> <ESC>:<C-U>%s///g<LEFT><LEFT><LEFT>
map <c-x>R <ESC>:<C-U>%s///gi<LEFT><LEFT><LEFT><LEFT>
map ,cd <CMD>cd %:p:h<CR>
set omnifunc=syntaxcomplete#Complete




set wildmode=longest:full,full
set wildoptions=pum,tagfile " fuzzy
set wrap
set number relativenumber laststatus=3 wildmenu showtabline=3 incsearch hlsearch

	hi MyPopupColor ctermbg=lightblue guibg=lightblue
	" call setwinvar(winid, '&wincolor', 'MyPopupColor')
  "
" so $HOME/.config/vim/plugin.vim
" call plug#begin()
" call plug#end()


        " imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:false
        " imap <silent><script><expr> <C-E> copilot#Accept("\<CR>")
        " imap <silent><script><expr> <C-L> copilot#AcceptLine("\<CR>")
        " imap <silent><script><expr> <C-W> copilot#AcceptWord("\<CR>")
        imap <silent> <C-E> <CMD>lua require('copilot.suggestion').accept()<CR>
        imap <silent> <C-J> <CMD>lua require('copilot.suggestion').next()<CR>
        imap <silent> <C-K> <CMD>lua require('copilot.suggestion').prev()<CR>

if !has("nvim")
  color ayu
	set termwinkey=<C-W>
  set termwinsize=10x0
  set bdlay=0
  set beval
  set previewpopup=height:0,width:70
  set completepopup=height:10,width:100,highlight:NonText
  if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
  endif
  set completeopt=menu,menuone,preview,popup " ,popuphidden
endif

set autoread
cnoremap w!! %!sudo tee > /dev/null %

nno ,X <esc>:<c-u>read !<c-r>=expand("%:p:h")<cr>/<c-r>=expand("%:t")<cr><cr>
nno ,x <esc>:<c-u>read !

set guioptions-=e
set linespace=-1
nno ,cc <CMD>CocList commands<CR>
