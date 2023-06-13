%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
%}

%%
"priori" { return PRIORITOKEN; }
"patronum" { return PATRONUMTOKEN; }

"finite()" { return FINITETOKEN; }
%%