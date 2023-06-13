%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
%}

%token PRIORITOKEN PATRONUMTOKEN FINITETOKEN

%%
command: PRIORITOKEN { handlePrioriCommand(); } |
         PATRONUMTOKEN { handlePatronumCommand(); } |
         FINITETOKEN { handleFiniteCommand(); }
       ;
%%

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int yylex(void);

void yyerror(const char* msg);
int yywrap(void);

void handlePrioriCommand() {
  printf("Priori spell call.\n");
}

void handlePatronumCommand() {
  printf("Expecto Patronum!\n");
}

void handleFiniteCommand() {
  printf("[Voldemort] : Try other spell or lose.\n");
  exit(0);
}

int main() {
    char input[100];
    printf("Accio 0.0.1 (main, beta version) \n");
    while (1) {
        printf(">>> ");
        fgets(input, sizeof(input), stdin);
        input[strcspn(input, "\n")] = '\0';

        if (strncmp(input, ">>", 2) == 0) {
            yy_scan_string(input + 2);
        } else {
            yy_scan_string(input);
        }

        yyparse();
    }

    return 0;
}
void yyerror(const char* msg) {
    fprintf(stderr, "Error: %s\n", msg);
}

int yywrap(void) {
    return 1;
}