%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);
%}

%token STRING
%token EOL

%%

input:
    | input line
    ;

line:
    STRING EOL     { printf("Received string: %s\n", $1); free($1); }
    ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
}

int main() {
    yyparse();
    return 0;
}
