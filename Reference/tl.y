%{
#include <stdio.h>
#include<stdlib.h>
#define YYERROR_VERBOSE 1
void yyerror(char *err);
%}
%token KEYWORD OPERATION NUMBER QUEMARK DOT COMMA WHITESPACE
%%
S : A | D { printf("\nThese Sentences are Valid. \n\n"); return 0; };
B : OPERATION WHITESPACE KEYWORD DOT P;
A : KEYWORD WHITESPACE A | KEYWORD WHITESPACE C;
C : NUMBER WHITESPACE B| NUMBER WHITESPACE KEYWORD WHITESPACE B;
P : KEYWORD WHITESPACE P| QUEMARK| S;
D : NUMBER WHITESPACE COMMA D| NUMBER WHITESPACE KEYWORD WHITESPACE NUMBER WHITESPACE Q| NUMBER WHITESPACE Q;
Q : KEYWORD WHITESPACE B;
%%
void yyerror(char *err) {
printf("Error: ");
fprintf(stderr, "%s\n", err);
exit(1);
}
int main() {
printf("Enter Gujarati Sentences:\n");
yyparse();
}
