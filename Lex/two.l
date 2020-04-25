%{
  //arithmetic operators +|-|*|/|%|++|--
  //Relational Operators ==|!=|>|<|>=|<=
  //Logical Operators    &&| || |!
 void arithmeticShow(char *);
 void relationalShow(char *);
 void logicalShow(char *);

 char arithOp[100], relaOp[100],logicalOp[100];
 int a_j = 0, r_j = 0, l_j = 0;
%}

arithmatic[+\-*/%]
relational >=|<=|!=|==|>|<
logical &&|\|\||!

%%
[a-zA-Z0-9] ;
{arithmatic}  {arithmeticShow(yytext);}
{logical} {logicalShow(yytext);}
{relational} {relationalShow(yytext);}
. ;
%%
void relationalShow(char *s)
{
   
   int i;
    
    for(i=0; s[i]!='\0'; i++){
     relaOp[r_j] = s[i];
     r_j++;
   }
  relaOp[r_j]=' ';
  r_j++;   
}
void arithmeticShow(char *s)
{
   
   int i;
    
    for(i=0; s[i]!='\0'; i++){
     arithOp[a_j] = s[i];
     a_j++;
   }
  arithOp[a_j]=' ';
  a_j++;   
}
void logicalShow(char *s)
{
   
   int i;
    
    for(i=0; s[i]!='\0'; i++){
     logicalOp[l_j] = s[i];
     l_j++;
   }
  logicalOp[l_j]=' ';
  l_j++;   
}
int yywrap()
{
	return 1;
}
int main(){
 yyin = fopen("two.txt","r");
 yylex();
 int i;
	
 printf("Arithmetic operator: ");
 for(i=0;arithOp[i]!='\0';i++){
       printf("%c",arithOp[i]);
    }
printf("\nLogical operator: ");
 for(i=0;logicalOp[i]!='\0';i++){
       printf("%c",logicalOp[i]);
    }
printf("\nRelational operator: ");
 for(i=0;relaOp[i]!='\0';i++){
       printf("%c",relaOp[i]);
    }
 printf("\n");
   
 
 return 0;
}

