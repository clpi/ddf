
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'
Plug 'exafunction/codeium.vim'
Plug 'exafunction/windsurf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'npm ci' }
Plug 'ayu-theme/ayu-vim'
Plug 'vimwiki/vimwiki'
Plug 'liuchengxu/vim-which-key'
Plug 'clpi/down.nvim'
Plug 'vim-test/vim-test'
Plug 'airblade/vim-gitgutter'
call plug#end()

let g:vimwiki_list = [
      \{'path': '~/wiki', 'syntax': 'markdown', 'ext': '.md', 'template_path': '~/wiki/templates/'},
      \{'path': '~/d/wiki', 'syntax': 'markdown', 'ext': '.md', 'template_path': '~/d/wiki/templates/'},
      \{'path': '~/Library/Mobile Documents/com~apple~CloudDocs/wiki', 'syntax': 'markdown', 'ext': '.md', 'template_path': '~/Library/Mobile Documents/com~apple~CloudDocs/wiki/templates'}
      \]
