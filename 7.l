%{
#include <stdio.h>
%}

%%

"\/\/"(.*) {
    fprintf(yyout, "%s\n", yytext);
}

"\/\*"(.*\n)*.*"\*\/" {
    fprintf(yyout, "%s\n", yytext);
}

.|\n {
    /* Ignore all other characters */
}

%%

int yywrap(){
    return 1;
}

int main() {
    yyin = fopen("input.c", "r");
    yyout = fopen("output.c", "w");

    if (!yyin || !yyout) {
        printf("Error opening files.\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}
