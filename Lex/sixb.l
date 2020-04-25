%{
#include<stdio.h>
#include<ctype.h>
int k=0,j = 0;
void display(char *);
char specialData[100];

%}

letter [a-zA-Z0-9]*
com [//]
mult_s [/][*]
mult_end [*][/]

%%
{com} {k=1;printf("\n");}
{letter} {if(k==1) printf("%s\n",yytext); k=0;}
{mult_s} {display(yytext);k=1;}
{mult_end} {display(yytext);k=0;}
%%
void display(char *s)
{
   
   int i;
    
    for(i=0; s[i]!='\0'; i++){
     specialData[j] = s[i];
     j++;
   }
  specialData[j]=' ';
  j++;   
}

int yywrap()
{
return 1;
}

int main()
{
   yyin= fopen("sixb.txt","r");
   yylex();
   int i;
   for(i=0;specialData[i]!='\0';i++){
       printf("%c",specialData[i]);
    }
   printf("\n");
    return 0;
}

