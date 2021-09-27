call plug#begin()
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'morhetz/gruvbox'
  Plug 'mattn/emmet-vim'
  Plug 'luochen1990/rainbow'
  Plug 'yggdroot/indentline'
  Plug 'othree/yajs.vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'tpope/vim-fugitive'
  Plug 'pantharshit00/vim-prisma'
  Plug 'preservim/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'heavenshell/vim-jsdoc', {
    \ 'for': ['javascript', 'javascript.jsx','typescript'],
    \ 'do': 'make install'
  \}
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
