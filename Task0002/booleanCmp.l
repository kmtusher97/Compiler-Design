%{
#include <stdlib.h>
#include "y.tab.h"
%}

whitespace       [ \t]

%%

{whitespace}               ;
"true"                     { yylval = yytext[0]; return Id; }
"false"                    { yylval = yytext[0]; return Id; }
.|\n                       { return yytext[0]; }

%%
int yywrap( void ) {
	return 1;
}
