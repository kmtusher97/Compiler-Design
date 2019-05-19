%{

#include <stdio.h>

%}

whitespace                     [ \t\n]+
letter                         [A-Za-z_]
digit                          [0-9]
                     
id                             {letter}({letter}|{digit})*
integer                        {digit}+

%%

{whitespace}            ;
"int"                   { printf("%s is a keyword\n", yytext); }
{integer}               { printf("%s is an integer\n", yytext); }
{id}                    { printf("%s is an identifier\n", yytext); }
.                       ;
%%
int yywrap() {
	return 1;
}
