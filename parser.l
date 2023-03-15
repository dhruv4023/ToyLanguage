%{
/* Definition section */
#include<stdio.h>
// #include "y.tab.h"
// extern int yylval;
%}
Digit [0-9]
Int {Digit}+
alpha [a-zA-Z]
String {alpha}+
ws [\t ]
%%
{String}+ { printf("STR : %s",yytext); }
{Int}+      {printf("%d",atoi(yytext)); }
{ws}    
"\n" 
.           { fprintf(stderr, "Error: invalid input\n"); }
%%


int yywrap(){return 1;}

int main()
{
    yylex();
    return 0;
}
