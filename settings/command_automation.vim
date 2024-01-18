""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动指令相关配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 判断是否已经加载过
if exists("s:did_load_command_automation_vim")
    finish
endif
let s:did_load_command_automation_vim = 1

"{{{> 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
"<}}}

"{{{> 关闭自动折叠代码块(目前有bug: 导致buffer中的"撤销"和"重做"没有记录)
" autocmd! BufNewFile,BufRead * setlocal nofoldenable
"<}}}

"{{{> 自动创建视图
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview
"<}}}

"{{{> markdown 设置缩进为3个空格
autocmd FileType markdown set shiftwidth=3 | set expandtab | set tabstop=3 | set softtabstop=3
"<}}}




