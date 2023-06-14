%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
%}

%%
"priori" { return PRIORITOKEN; }
"patronum" { return PATRONUMTOKEN; }
"spell" { return SPELLTOKEN; }

"grimoire()" { return GRIMOIRETOKEN; }
"finite()" { return FINITETOKEN; }
. { yylval.str = strdup(yytext); return STRING; }
%%