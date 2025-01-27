lexer: lexer.l
	@flex lexer.l

compile: lexer
	@g++ lex.yy.c -o lexer

clean:
	@rm -f lex.yy.c lexer
