%{
 #include <stdlib.h>
 void yyerror(char *);
 #include "y.tab.h"
   
    
%}



%%
ep {yylval="";return ep;}
"," {return comma;}
class {
       return class;
      }
extends {
       return extends;
      }
public {
       return public;
      }
implements {
       return implements;
      }
final {
       return final;
      }
identifier {
       return identifier;
      }
. yyerror("invalid character");
%%


int yywrap()
{
    return 1;
}


