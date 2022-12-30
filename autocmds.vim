" This file is managed by Ansible - do not edit
" 2021111901

" jump to last position
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif

" force vimdiff to wrap lines
autocmd VimEnter * if &diff | execute 'windo set wrap' | endif

" highlight yanked text
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
    autocmd TextYankPost * call setreg("+", getreg(v:event.regname))
augroup END

" commenstrings
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType c setlocal commentstring=//%s

" other
autocmd! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2

" set correct filetype
augroup nextcloud_ssh_configs
    " Remove all autocommands in this group
    autocmd!
    au BufNewFile,BufRead ~/Nextcloud/it/ssh/configs/* :set filetype=sshconfig
augroup END

augroup ansible
    " Remove all autocommands in this group
    autocmd!
    au BufNewFile,BufRead ~/git/lf/lfops/**/*.yml :set keywordprg=:AnsibleDoc | set filetype=yaml.ansible
augroup END
