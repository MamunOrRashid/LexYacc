%{

   
    char ch[100], value[100];
    int j=0, k=0;
    int int_i=0,float_i=0,if_i=0,then_i=0;
    int else_i=0,for_i=0,printf_i=0,switch_i=0,case_i=0,return_i=0;
    
    void display(char *);
    void intshow(char *);
%}
Int [-+]?[0-9]*
Fraction [-+]?[0-9]*[.][0-9]*

%%


{Int} {intshow(yytext);}
{Fraction} {intshow(yytext);}

int {if(int_i==0){
      display(yytext);
      int_i=1;
      }}
float {if(float_i==0){
      display(yytext);
      float_i=1;
      }}
if {if(if_i==0){
      display(yytext);
      if_i=1;
      }}
then {if(then_i==0){
      display(yytext);
      then_i=1;
      }}
else {if(else_i==0){
      display(yytext);
      else_i=1;
      }}
for  {if(for_i==0){
      display(yytext);
      for_i=1;
      }}
printf {if(printf_i==0){
      display(yytext);
      printf_i=1;
      }}
switch {if(switch_i==0){
      display(yytext);
      switch_i=1;
      }}
case {if(case_i==0){
      display(yytext);
      case_i=1;
      }}
return {if(return_i==0){
      display(yytext);
      return_i=1;
      }}
. ;
%%
void intshow(char *s){

int i;

    for(i=0; s[i]!='\0'; i++){
     value[k] = s[i];
     k++;
   }
   value[k]=' ';
   k++;

}
void display(char *s)
{

   int i;

    for(i=0; s[i]!='\0'; i++){
     ch[j] = s[i];
     j++;
   }
   ch[j]=' ';
   j++;

}

int yywrap()
{
    return 1;
}
int main()
{
    yyin= fopen("one.txt","r");
    yylex();
     int i;
   printf("Keywords: ");
   for(i=0;ch[i]!='\0';i++){
       printf("%c",ch[i]);
    }
  
     printf("\nNumber: ");
   for(i=0;value[i]!='\0';i++){
       printf("%c",value[i]);
    }
    printf("\n");
    return 0;
}


