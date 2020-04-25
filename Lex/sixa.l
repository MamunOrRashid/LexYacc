%{ 
int k=0;
%}

%%
[A-Za-z]+ {
if(yyleng==3)
{  
 printf("%s\n",yytext);
}
}
%%

int main()
{
 yyin=fopen("sixa.txt","r");
 yylex(); 
 printf("\n");
 return 0;
}
