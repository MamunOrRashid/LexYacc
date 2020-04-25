%{
	#include <stdlib.h>
	#include "y.tab.h"
%}

%%
"true" {yylval=1; return true;}
"false" {yylval=0; return false;}
"and" {return and;}
"or"  {return or;}
"not" {return not;}
[ \t] ; /* skip whitespace */
.|\n {return yytext[0];}
%%
int wrap(){

 return 1;
}
