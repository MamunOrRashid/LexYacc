

%{
#include<stdio.h>
int count=0;
%}

%%
"/*"[^*/]*"*/" {count++;fprintf(yyout,"");}
"//".* { count++; fprintf(yyout,"");}
%%

int main()
{
	yyin=fopen("open.c","r");
	yyout=fopen("new.c","w");
	yylex();
	printf("Number of Comments=%d\n",count);
        return 0;
}




