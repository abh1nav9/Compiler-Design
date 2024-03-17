%{
#include <stdio.h>
%}

%%

[0-9]+ {
    printf("Integer: %s\n", yytext);
}

[0-9]+"."[0-9]+ {
    printf("Float: %s\n", yytext);
}

. {
    printf("Unknow Character: %s\n ", yytext);
}

%%
int yywrap(){
    return 1;
}

int main() {
    printf("Enter a number : \t");
    yylex();
    return 0;
}
