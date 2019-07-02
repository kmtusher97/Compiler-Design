%{
#include <stdio.h>
#include <stdlib.h>

void yyerror( char * );

int value[200];
%}

%token Id
%left '&' '|'

%%

line        : line exp '\n' { ($2 == 1) ? printf("true\n") : printf("false\n"); YYABORT; }
			| line '\n'
			|
			| error '\n'    { yyerror("Write the prev line correctly"); yyerrok; }
			;
exp         : Id              { $$ = value[$1]; }
			| '(' exp ')'     { $$ = $2; }
			| '!' exp         { $$ = $2 ^ 1; }
			| exp '&' exp     { $$ = $1 & $3; }
			| exp '|' exp     { $$ = $1 | $3; }
			;
%%

void yyerror( char *s ) {
	fprintf(stderr, "%s\n", s);
}

void init() {
	value['f'] = 0;
	value['t'] = 1;
}

int main() {
	init();

	while(1) {
		yyparse();
	}
	return 0;
}