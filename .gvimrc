set fu

highlight clear SpellBad
highlight SpellBad gui=undercurl guisp=#bc6c4c
highlight clear SpellCap
highlight SpellCap gui=undercurl guisp=#bc6c4c
highlight clear SpellLocal
highlight SpellLocal gui=undercurl guisp=#bc6c4c
highlight clear SpellRare
highlight SpellRare gui=undercurl guisp=#bc6c4c

autocmd FocusLost * nested silent! wall
