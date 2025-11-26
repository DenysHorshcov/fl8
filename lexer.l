%{
#include <stdio.h>
#include <string.h>
%}

STRING_LITERAL   \"([^\"\\]|\\.)*\"

%%

{STRING_LITERAL} {
    char *p = yytext;

    while ((p = strstr(p, ":\\")) != NULL) {

        char *start = p - 1;


        if ((*start >= 'A' && *start <= 'Z') ||
            (*start >= 'a' && *start <= 'z'))
        {

            char *end = p + 2;
            while (*end && *end != '"' && *end != ' ' && *end != '\n')
                end++;


            printf("Found path: ");
            fwrite(start, 1, end - start, stdout);
            printf("\n");
        }

        p++;
    }
}

.|\n   {  }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
