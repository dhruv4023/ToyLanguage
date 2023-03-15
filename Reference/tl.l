%{
#include<stdio.h>
#include "y.tab.h"
%}
Keyword "jawab"|"Havee"|"ne"|"thi"|"ane"|"noo"|"kar"|"Ema"|"nakh"|"Pachi"|"Cheloo"|"shu"|"chey" 
Op "sarvadoo"|"baad"|"bhagi"|"guni" 
Digit [0-9]
Int {Digit}+
Float {Digit}+(.{Digit})
qm "?" 
ws [\t]
eos "."
sep "," 
%% 
{Keyword} {printf("Keyword - %s\n",yytext);return KEYWORD;}
{Op} {printf("Operator - %s\n",yytext);return OPERATION;}
{Int} {printf("Integer - %s\n",yytext);return NUMBER;}
{Float} {printf("Float - %s\n",yytext);return NUMBER;}
{qm} {printf("End of program - %s\n",yytext);return QUEMARK;}
{eos} {printf("End of sentence - %s\n",yytext);return DOT;}
{sep} {printf("Separator - %s\n",yytext);return COMMA;}
{ws} {return WHITESPACE;}
. {printf("Invalid Token : %s\n",yytext); return 0;return *yytext;}
%%
int yywrap()
{return 1;}
// int main()
// {
//     yylex();
//     return 0;
// }
