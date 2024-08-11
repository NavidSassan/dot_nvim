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


" cheatsheet.nvim
nnoremap <unique> <leader>? <cmd>Cheatsheet<CR>

" vim-tmux-runner
noremap <silent> <leader>pa :VtrAttachToPane<cr>
noremap <silent> <leader>r :update <bar> :VtrSendCommandToRunner<cr>
noremap <silent> <leader>sc :VtrSetCommand<cr>

nnoremap <silent> <leader>t :write \| lua require'reload'.ansible()<cr>

nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <leader>tn :tabnew<cr>
