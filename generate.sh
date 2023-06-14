lex -o build/lex.yy.c tokens.lex
yacc -d -o build/y.tab.c grammar.y
gcc build/lex.yy.c build/y.tab.c -o build/accio-language