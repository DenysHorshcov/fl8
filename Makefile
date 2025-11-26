lexer: lexer.l
	flex lexer.l
	gcc lex.yy.c -o lexer

clean:
	rm -f lex.yy.c lexer
