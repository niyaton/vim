let s:config_dir = stdpath('config')

" load settings from rc.d directory
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.vimplug')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.basic')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.editing')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.statusline')    
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.colors')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.appearance')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.search')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.encodings')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.completion')
