%{
	#include <stdio.h>
	#include <stdlib.h>

	void yyerror(char *);
	int values[200], symbols[200];
%}
%token Identifier INTEGER
%left '+' '-'
%left '*' '/'
%right UnaryMinus

%%
line    : line exp '\n' {printf("result = %d\n", $2); YYABORT;}
		| line '\n'
		|
		| error '\n'    {yyerror("Write the prev line correctly"); yyerrok;}
		;

exp     : Identifier  {$$ = values[$1];}
		| exp '+' exp {$$ = $1 + $3;}
		| exp '-' exp {$$ = $1 - $3;}
		| exp '*' exp {$$ = $1 * $3;}
		| exp '/' exp {
			if( $3 == 0 ) {
				yyerror("Undefined\n");
			}
			else {
				$$ = $1 / $3;
			}
		}
		| '(' exp ')' {$$ = $2;}
		| '-' exp %prec UnaryMinus {$$ = -$2;}
		;
%%
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
	char a, b;
	int n, i, x;
	printf("Enter the number of variables, n: ");
	scanf("%d", &n);
	printf("Enter n variables and their values: (x=4) format\n");
	for(i = 1; i <= n; i++) {
		getchar();
		scanf("%c%c", &a, &b);
		scanf("%d", &x);
		printf(":: %c = %d\n", a, x);
		symbols[a]++;
		values[a] = x;
	}
	printf("Enter the number of queries, q: ");
	int q;
	scanf("%d", &q);
	for(i = 1; i <= q; i++) {
		yyparse();
	}
	return 0;
}