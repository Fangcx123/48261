from pathlib import Path
import re
v=Path(__file__).resolve().parent
s=(v/'menu_after_rtl.v').read_text()
assert s.count('module media_menu_overlay')==1
s=s.replace('module media_menu_overlay','module media_menu_gate',1).replace('//.INIT_FILE(','.INIT_FILE(')
# Icarus's lexer cannot accept the glyph ROM's 17 KB string as one token.
# Concatenate smaller literals, preserving every byte of the vendor contents.
def split_init(match):
    init = match[1]
    chunks = [init[i:i+1024] for i in range(0,len(init),1024)]
    return '.INIT_FILE({' + ',\n'.join('"'+part+'"' for part in chunks) + '})'
s=re.sub(r'\.INIT_FILE\("([^"]*)"\)',split_init,s)
(v/'menu_compare_gate.v').write_text(s)
