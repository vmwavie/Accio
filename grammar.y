%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define SPELLTOKEN 258
%}

%union {
    char* str;
}

%token PRIORITOKEN PATRONUMTOKEN SPELLTOKEN GRIMOIRETOKEN FINITETOKEN
%token <str> STRING

%type <str> expr

%%
command: PRIORITOKEN { handlePrioriCommand(); } |
         PATRONUMTOKEN { handlePatronumCommand(); } |
         SPELLTOKEN expr { handleSpellCommand($2); } |
         GRIMOIRETOKEN { handleGrimoireCommand(); } |
         FINITETOKEN { handleFiniteCommand(); }
       ;

expr: STRING { $$ = $1; }
    ;
%%

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern int yylex(void);
extern int yyparse(void);

void yyerror(const char* msg);
int yywrap(void);

void handlePrioriCommand() {
  printf("Priori spell call.\n");
}

void handlePatronumCommand() {
  printf("Expecto Patronum!\n");
}

void handleSpellCommand(const char* spell) {
    printf("%s\n", spell);
}

void handleGrimoireCommand() {
  printf("v0.0.1\n");
}

void handleFiniteCommand() {
  printf("[Voldemort] : Try another spell or lose.\n");
  exit(0);
}

int main() {
    char input[100];
    printf("Accio v0.0.1 (main, beta version) \n");
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
    exit(1);
}

int yywrap() {
    return 1;
}
