%{



%}

oct [o][0-9]+
hexa [o][x|X][0-9A-F]+
intgr [+-]?[0-9]+
fraction [+-]?[0-9]*[.][0-9]+

%%
{oct} {printf("%s is a octal number\n",yytext);
       //yytext is called lexeme which store match pattern.
      }
{hexa} {printf("%s is hexa decimal number\n",yytext);}
{intgr} {printf("%s is a integer number\n",yytext);}
{fraction} {printf("%s is a fraction number\n",yytext);}
%%

int yywrap()
{
	return 1;
}

int main()
{
      yyin = fopen("four.txt","r");//yyin means input stream pointer
      yylex();
	return 0;
}
