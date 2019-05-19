%{
	#include<bits/stdc++.h>
	using namespace std;
%}

delim [ \t\n]
whitespace {delim}+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
integer {digit}+
floatingPoint {digit}+(\.{digit}+)?

%%

{whitespace} ;
{int}          { cout << "found a keyword : " << yytext << endl; }
{float}        { cout << "found a keyword : " << yytext << endl; }
{if}           { cout << "found a keyword : " << yytext << endl; }
{then}         { cout << "found a keyword : " << yytext << endl; }
{else}         { cout << "found a keyword : " << yytext << endl; }
{for}    	   { cout << "found a keyword : " << yytext << endl; }
{printf} 	   { cout << "found a keyword : " << yytext << endl; }
{switch} 	   { cout << "found a keyword : " << yytext << endl; }
{case}   	   { cout << "found a keyword : " << yytext << endl; }
{return}       { cout << "found a keyword : " << yytext << endl; }
{integer}      { cout << "found a integer number : " << yytext << endl; }
{floatingPoint}{ cout << "found a float number : " << yytext << endl; }
. ;

%%

int yywrap() {
	return 1;
}

int main() {
	FILE *readfile = fopen("C:\\Users\\Dell\\Desktop\\t.txt","r");

	if( !readfile ) {
		cout << "can't open t.txt file" << endl;
	}
	else {
		yyin = readfile;
		yylex();
		fclose(readfile);
	}
	getchar();
	return 0;
}