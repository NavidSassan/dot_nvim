" This file is managed by Ansible - do not edit
" 2021111901

function! s:Rmtw()
    let l:winview = winsaveview()
    let l:oldsearch = @/
    :%s/\s\+$//e
    call winrestview(l:winview)
    let @/ = l:oldsearch
endfunction
command Rmtw call s:Rmtw()

function! s:Sort_ssh_config()
    :%g/Host\s/;'}-s/\n/`
    :%sort
    :%s/`/\r/g
endfunction
command! SortSshConfig call s:Sort_ssh_config()

function TabWidth(width)
  set smartindent
  set expandtab
  let l:width = str2nr(a:width)

  let &tabstop = l:width
  let &softtabstop = l:width
  let &shiftwidth = l:width
endfunction
command! -nargs=1 TabWidth call TabWidth(<f-args>)

function! UpdateDNSSerialZone()
    let line = getline('.')
    let serial=matchstr(line,'\(19\|20\)\d\d\(0[1-9]\|1[012]\)\(0[1-9]\|[12][0-9]\|3[01]\)\d\d')
    let newSerial=strftime("%Y%m%d")."01"
    if empty(serial)
        echom 'No serial found on line!'
        call setline('.', line . newSerial)
    else
        if serial =~ strftime("%Y%m%d")."\\d\\d"
            let newSerial = serial + 1
        endif
        call setline('.', substitute(line, serial, newSerial, ''))
        echom "Old serial = \"".serial."\" updated serial to = \"".newSerial."\""
    endif
endfunction

function! GenGUID()
    return trim(system('python3 -c ''import uuid; print(str(uuid.uuid4()),)'''))
endfunction

function! InsertGUID()
    let guid = GenGUID()
    execute "normal! a\<C-r>\<C-r>=guid\<CR>\<Esc>"
endfunction

function! ReplaceGUIDs()
    execute '%s/\v[0-9A-Fa-f]{8}(-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}/\=call("GenGUID", [])'
endfunction

function! GenPW()
    return trim(system('genpw'))
endfunction

function! ReplacePWs()
    execute "%s/\\vpassword: '\\zs.*\\ze'/\\=call('GenPW', [])/g"
endfunction

function! RstHeading()
    let len = strlen(getline('.'))
    if len == 0
        echom 'Line empty'
        return
    endif
    let c = nr2char(getchar())
    call setline(line('.') + 1, repeat(c, len))
    execute 'normal! jo'
endfunction

" TODO: compare with DiffOrig from /usr/share/vim/vim82/defaults.vim
function! s:DiffUnsavedChanges()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! DiffUnsaved call s:DiffUnsavedChanges()

command Ans lcd ~/git/lf/ansinv
command OldAns lcd ~/git/lf/old-ansible
command Lfops lcd ~/git/lf/lfops
command Rst lcd ~/git/lf/rst
command Mp lcd ~/git/lf/monitoring-plugins

command! -nargs=1 AnsibleDoc lua require"ansible".display_ansible_doc(<f-args>)

function! s:SortLinesOpFunc(...)
    '[,']sort
endfunction

nnoremap <silent> gs :<C-u>set operatorfunc=<SID>SortLinesOpFunc<CR>g@
