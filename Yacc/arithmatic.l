

%{
 #include <stdlib.h>
 
 #include "y.tab.h"
%}

/* this sections is known as defined section in which we defined the rule and regulation of regular expression which will going to accept or not */
%%
[0-9]+ { 
          yylval=atoi(yytext);
          return NUMBER;
       }
[\t] ;
[\n] return 0;
. return yytext[0];
%%
int yywrap()
{
return 1;
}

