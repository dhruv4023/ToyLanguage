%{
#include "y.tab.h"
%}

%%

[ \t]           /* ignore whitespace */
[a-zA-Z]+       { yylval = strdup(yytext); return STRING; }
\n              { return EOL; }

%%

int yywrap() {
    return 1;
}
