call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'morhetz/gruvbox'
  Plug 'mattn/emmet-vim'
  Plug 'luochen1990/rainbow'
  Plug 'yggdroot/indentline'
  Plug 'sheerun/vim-polyglot'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pantharshit00/vim-prisma'
  Plug 'preservim/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'heavenshell/vim-jsdoc', {
    \ 'for': ['javascript', 'javascript.jsx','typescript'],
    \ 'do': 'make install'
  \}
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'airblade/vim-gitgutter'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'RyanMillerC/better-vim-tmux-resizer'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kdheepak/tabline.nvim'
  Plug 'sainnhe/vim-color-forest-night'
  Plug 'metakirby5/codi.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'zivyangll/git-blame.vim'
  Plug 'majutsushi/tagbar'
  Plug 'github/copilot.vim'
call plug#end()
