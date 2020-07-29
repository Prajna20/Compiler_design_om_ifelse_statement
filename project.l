%{
#include<stdio.h>
#include "y.tab.h"
int k=0,i=0,o=0,ln=1,s=0;
%}
%%
"int" {printf("\n%s is a keyword",yytext);k++;return INT;}
"main" {printf("\n%s is a identifier",yytext);i++;return MAIN;}
"begin" {printf("\n%s is a keyword",yytext);k++;return BG;}
"end" {printf("\n%s is a keyword",yytext);k++;return END;}
"if" {printf("\n%s is a keyword",yytext);k++;return IF;}
"printf" {printf("\n%s is a keyword",yytext);k++;return PF;}
"(" {printf("\n%s is a seperator",yytext);s++;return OPEN;}
")" {printf("\n%s is a seperator",yytext);s++;return CLOSE;}
[nN][123] {printf("\n%s is a identifier",yytext);i++;return VAR;}
[a-zA-Z0-9]+ {printf("\n%s is a identifier",yytext);i++;return EXPR;}
[ \t]+
[\n] {ln++;return NL;}
[;] {printf("\n%s is a seperator",yytext);s++;return SC;}
[,] {printf("\n%s is a seperator",yytext);s++;return CM;}
"<"|">"|"<="|">="|"=="|"!=" {printf("\n%s is a operator",yytext);o++;return RELOP;}
. {return yytext[0];}
%%
int yywrap()
{
return 1;
}
