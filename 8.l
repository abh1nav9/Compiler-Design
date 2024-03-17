%{
#include <stdio.h>
%}

%%

\<[^>]*\>  { fprintf(yyout, "%s\n", yytext); }

. {  }

%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("input.html", "r");

    yyout = fopen("output.html", "w");

    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}
