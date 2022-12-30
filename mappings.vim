" This file is managed by Ansible - do not edit
" 2021111901

let g:mapleader="\<Space>"
let g:maplocalleader='\'

noremap <silent> <leader>dp V:diffput<cr>
noremap <silent> <leader>do V:diffget<cr>

noremap <silent> <leader>wdt :windo diffthis<cr>
noremap <silent> <leader>wdo :windo diffoff<cr>

noremap <silent> <leader>n :nohlsearch<cr>

noremap D "_d

noremap ]f <cmd>next<CR>
noremap [f <cmd>prev<CR>

noremap ]F <cmd>last<CR>
noremap [F <cmd>first<CR>

noremap ]q <cmd>cnext<CR>
noremap [q <cmd>cprev<CR>

noremap ]Q <cmd>clast<CR>
noremap [Q <cmd>cfirst<CR>

nnoremap <silent> <leader>fl :let @+ = join([expand('%'), line(".")], ':')<cr>

xnoremap          il g_o^o " :help v_o (since this is in visual mode)
onoremap <silent> il :<c-u>exe 'normal v' . v:count1 . 'il'<CR>

" nnoremap <silent> sip vip :sort<CR>
" " maybe use https://github.com/christoomey/vim-sort-motion
" " nnoremap <silent> <leader>s <cmd>'<,'>sort<cr>
xnoremap <silent> gs :sort<cr>

" visually select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap <C-e> :call UpdateDNSSerialZone()<cr>
inoremap <C-e> <C-\><C-O>:call UpdateDNSSerialZone()<CR>

" nnoremap <C-g> :call InsertGUID()<cr>
" inoremap <C-g> <C-\><C-O>:call InsertGUID()<CR>

" vim-fugitive
nnoremap <silent> <leader>gh <cmd>0Gclog<CR>
nnoremap <silent> <leader>gbl <cmd>Git blame<cr>
nnoremap <silent> <leader>gd <cmd>Gdiffsplit<cr>

" lspsaga.nvim
lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> <leader>ca :Lspsaga code_action<CR>
vnoremap <silent> <leader>ca <cmd>Lspsaga range_code_action<CR>
" nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> gr :Lspsaga rename<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" remove this in favor of lsp_signature.nvim?
" nnoremap <silent> gs :Lspsaga signature_help<CR>

" nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" no clue what scroll does
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" " snippets.nvim
" " <c-k> will either expand the current snippet at the word or try to jump to
" " the next position for the snippet.
" inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>

" " <c-j> will jump backwards to the previous field.
" " If you jump before the first field, it will cancel the snippet.
" inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

" luasnip
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent> <c-k> <Plug>luasnip-expand-or-jump
" -1 for jumping backwards.
inoremap <silent> <c-j> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent> <C-l> <Plug>luasnip-next-choice

" vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" telescope.nvim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" telescope-project.nvim
nnoremap <leader>fd <cmd>lua require'telescope'.extensions.project.project{}<cr>

" cheatsheet.nvim
nnoremap <unique> <leader>? <cmd>Cheatsheet<CR>

" vim-tmux-runner
noremap <silent> <leader>pa :VtrAttachToPane<cr>
noremap <silent> <leader>r :update <bar> :VtrSendCommandToRunner<cr>
noremap <silent> <leader>sc :VtrSetCommand<cr>

" leap.nvim
lua require('leap').set_default_keymaps()


nnoremap <silent> <leader>t :write \| lua require'reload'.ansible()<cr>

nnoremap <silent> <leader>dt :ToggleDiag<cr>
