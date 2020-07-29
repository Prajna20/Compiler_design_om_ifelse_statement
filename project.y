%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
extern int k,o,i,ln,s;
extern int yylex();
extern int *yyin;
extern int *yyout;
%}
%token INT MAIN BG END IF PF  VAR EXPR CM SC NL RELOP OPEN CLOSE
%%
stmt: INT MAIN OPEN CLOSE newline code newline {
     printf("\n-------------------------------------\n");
     printf("\nThe program is compiled successfully \n");
     printf("The number of keywords are %d\n",k);
     printf("The number of identifier are %d\n",i);
     printf("The number of operators are %d\n",o);
     printf("\n-------------------------------------\n");
     exit(0);};
code: BG newline declare newline loops END;
declare: INT varlst SC;
varlst: varlst CM VAR | VAR;
loops: loops ifstmt | ifstmt;
ifstmt:IF OPEN cond CLOSE newline BG newline PF OPEN VAR CLOSE SC newline END newline;
cond:EXPR RELOP EXPR;
newline:newline NL |NL;
%%
int yyerror(const char *str)
{
fprintf(stderr,"Error at line %d\n%s\n",ln,str);
exit(0);
}
int main(int argc ,char *argv[])
{
yyin=fopen(argv[1],"r");
yyparse();
}
