%{
#include <stdio.h>
int num_lines = 0;
int num_spaces = 0;
int num_tabs = 0;
int num_words = 0;
int num_other = 0;
%}

%%
[\n] { num_lines++; }
[" "] { num_spaces++; }
[\t] { num_tabs++; }
[a-zA-Z0-9]+ { num_words++; }
. { num_other++; }
%%

int yywrap(){
    return 1;
}
int main() {
    printf("Enter a String/Sentence : \n");
    yylex();
    printf("Number of lines: %d\n", num_lines);
    printf("Number of spaces: %d\n", num_spaces);
    printf("Number of Tab-meta characters: %d\n", num_tabs);
    printf("Number of words: %d\n", num_words);
    printf("Number of other characters: %d\n", num_other);
    return 0;
}
