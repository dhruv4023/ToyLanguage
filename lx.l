%{
/* Definition section */
#include<stdio.h>
#include "y.tab.h"
%}
Digit [0-9]
Int {Digit}+
alpha [a-zA-Z]
String {alpha}+
ws [\t ]
%%
"add"    { return ADD; }
"sub"    { return SUB; }
"mul"    { return MUL; }
"div"    { return DIV; }
"rvs"    { return REVERSE;}
"isPrime"    { return PRIME;}
"sumofdigit"    { return SOD;}
"exp"    { return EXP;}
"isPal"    { return PALINDROME;}
[a-zA-Z]+    {yylval = strdup(yytext); return STR; }
{Int}+    { yylval = atoi(yytext); return NUMBER; }
{ws}    
"\n" 
.           { fprintf(stderr, "Error: invalid input\n"); }
%%


int yywrap(){return 1;}
