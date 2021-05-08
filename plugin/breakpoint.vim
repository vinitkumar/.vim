" Make sure the Vim was compiled with +python before loading the script...
if !has("python")
    finish
endif

python << EOF
import vim
import re

ipdb_breakpoint = 'import ipdb; ipdb.set_trace()'
pprint_block = 'import pprint; pprint.pprint()'
tenjin_breakpoint = '<?py import ipdb; ipdb.set_trace() ?>'
js_breakpoint = 'debugger;'
go_breakpoint = 'log.Println()'

def set_pprint():
    breakpoint_line = int(vim.eval('line(".")')) - 1
    current_line = vim.current.line
    white_spaces = re.search('^(\s*)', current_line).group(1)
    if vim.current.buffer.name.endswith('.py'):
        vim.current.buffer.append(white_spaces + pprint_block, breakpoint_line)
    elif vim.current.buffer.name.endswith('.t_html'):
        vim.current.buffer.append(white_spaces + "<?py ?>", breakpoint_line)
    else:
        pass

vim.command('map <F8> :py set_pprint()<cr>')

def set_breakpoint():
    breakpoint_line = int(vim.eval('line(".")')) - 1

    current_line = vim.current.line
    white_spaces = re.search('^(\s*)', current_line).group(1)
    if vim.current.buffer.name.endswith('.py'):
        vim.current.buffer.append(white_spaces + ipdb_breakpoint, breakpoint_line)
    elif vim.current.buffer.name.endswith('.t_html'):
        vim.current.buffer.append(white_spaces + tenjin_breakpoint, breakpoint_line)
    elif vim.current.buffer.name.endswith('.js'):
        vim.current.buffer.append(white_spaces + js_breakpoint, breakpoint_line)
    elif vim.current.buffer.name.endswith('.go'):
        vim.current.buffer.append(white_spaces + go_breakpoint, breakpoint_line)
    else:
        pass

vim.command('map <C-I> :py set_breakpoint()<cr>')

def remove_breakpoints():
    if vim.current.buffer.name.endswith('.js'):
        breakpoint = js_breakpoint
    elif vim.current.buffer.name.endswith('.go'):
        breakpoint = go_breakpoint
    else:
        breakpoint = ipdb_breakpoint
    op = 'g/^.*%s.*/d' % breakpoint
    vim.command(op)

vim.command('map <C-P> :py remove_breakpoints()<cr>')
EOF

