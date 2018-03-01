" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" UI
Plug 'trevordmiller/nova-vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-webdevicons'

" Syntax
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'

" Project navigation
Plug 'junegunn/fzf',                      { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/ctags.vim'              " ctags related stuff
Plug 'majutsushi/tagbar'
Plug 'eugen0329/vim-esearch'

" File navigation
Plug 'Lokaltog/vim-easymotion'
Plug 'haya14busa/incsearch.vim'

" Editing
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'matze/vim-move'
Plug 'Townk/vim-autoclose'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Code assist
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Extras
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
call plug#end()

set nu
set expandtab
set tabstop=2
set shiftwidth=2
set encoding=utf8

" Highlight search matches
set hlsearch

" Because using mouse sometimes is nice too
set mouse=a

colorscheme nova

let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" Nerd font with pretty icons
set guifont=DroidSansMono\ Nerd\ Font:h11
let g:airline_powerline_fonts = 1

"let g:ale_fixers = {'javascript': ['eslint']}

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Tab Shortcuts
nnoremap tk :tabfirst<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tj :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :CtrlSpaceTabLabel<CR>
nnoremap td :tabclose<CR>

nnoremap <space>l :tabnext<CR>
nnoremap <space>h :tabprev<CR>
nnoremap <space>j :tabfirst<CR>
nnoremap <space>k :tablast<CR>

" Git gutter bindings
nnoremap gj :GitGutterNextHunk<CR>
nnoremap gk :GitGutterPrevHunk<CR>
nnoremap gp :GitGutterPreviewHunk<CR>
nnoremap gr :GitGutterRevertHunk<CR>
nnoremap gc :GitGutterStageHunk<CR>

" Fugitive binding
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gt :Gtabedit<CR>
nnoremap <space>gb :Gblame<CR>


"##############################################################################
" Easier split navigation
"##############################################################################
" Use ctrl-[hjkl] to select the active split!
"nmap <silent> <c-k> :wincmd k<CR>
"nmap <silent> <c-j> :wincmd j<CR>
"nmap <silent> <c-h> :wincmd h<CR>
"nmap <silent> <c-l> :wincmd l<CR>


" Vertical splits appear on right side in Explore
let g:netrw_altv=1

" Quickly find file in NERDTree
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=60

" Mapping for finding files in project
nnoremap <silent><C-P> :GFiles<CR>
nnoremap <leader>p :Grepper<cr>

"let g:grepper.highlight = 1
"let g:grepper.switch = 0

" Snippety snippets
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:jsx_ext_required = 0
" Mocha test runner
let test#project_root = '/Users/aldis.ameriks/Projects/sanoma-customership/fe'
let test#javascript#mocha#file_pattern = '\.spec\.js'
let test#javascript#mocha#executable = 'NODE_ENV=test mocha --compilers jsx:babel-core/register --watch'
let test#strategy = 'vimux'

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g


" Moving in quickfix window
nnoremap ]q :cnext<CR>
nnoremap ]Q :clast<CR>
nnoremap [Q :cfirst<CR>
nnoremap [q :cprev<CR>

" Add file preview when using fzf
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}

"imap <C-e> --exclude=\*.{spec.js,robot,json}

" CTRL+S to Save!
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
inoremap <c-s> <Esc>:Update<CR>
nnoremap <c-s> :Update<CR>

" Vimux bindings
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

" Copy paste to clipboard
noremap ty "+y
noremap tY "+Y  // copy a whole line to the clipboard
noremap tp "+p  // put the text from clipboard after the cursor 
noremap tP "+P  // put the text from clipboard before the cursor 

