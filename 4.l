%{
#include <stdio.h>
#include <string.h>
%}

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" {
    printf("Keyword: %s\n", yytext);
}

"="|"+"|"-"|"*"|"/"|"=="|"!="|"<"|">"|"<="|">="|"&&"|"||"|"!"|"&"|"|"|"%"|"++"|"--"|"+="|"-="|"*="|"/="|"&="|"|="|"%="|"<<"|">>"|"<<"|">>" {
    printf("Operator: %s\n", yytext);
}

"("|")"|"{"|"}"|";"|","|":"|"." {
    printf("Separator: %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Identifier: %s\n", yytext);
}

[0-9]+ {printf("Interger : %s\n", yytext);}

[0-9]+"."[0-9]+ {printf("Interger : %s\n", yytext);}

[" "]+ {
    /* Ignore whitespace */
}

[\n] {
    /* Ignore newline */
}

. {
    printf("Some symbol or character: %s\n", yytext);
}

%%

int yywrap(){
    return 1;
}

int main() {
    printf("Enter something to check : \n");
    yylex();
    return 0;
}
