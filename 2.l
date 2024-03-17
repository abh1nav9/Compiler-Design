%{
#include <stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Valid Identifier: %s\n", yytext);
}

. {
    printf("Not a Valid Identifier: %s\n", yytext);
}

%%
int yywrap(){
    return 1;
}

int main() {
    printf("Enter the string or character to check :\n");
    yylex();
    return 0;
}
