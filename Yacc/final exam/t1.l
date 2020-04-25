%{

   
    char ch[100], value[100],comma,semi,flag_comma=0,flag_semi=0,in[100],m=0,ot[100];
    int j=0, k=0,l=0;
    int class_i=0,extends_i=0,public_i=0,implements_i=0;
    int final_i=0;

    void idShow(char *);
    void display(char *);
    void inv(char *);
    void other(char *);
%}

id [a-zA-Z]+
inval [0-9a-zA-Z]+
%%
"class" {if(class_i==0){
      display(yytext);
      class_i=1;
      }}
"extends" {if(extends_i==0){
      display(yytext);
      extends_i=1;
      }}
"public" {if(public_i==0){
      display(yytext);
      public_i=1;
      }}
"implements" {if(implements_i==0){
      display(yytext);
      implements_i=1;
      }}
"final" {if(final_i==0){
      display(yytext);
      final_i=1;
      }}
{id} {idShow(yytext);}
[,] {if(flag_comma==0){ flag_comma=1; other(yytext);}}
[;] {if(flag_semi==0){flag_semi=1; other(yytext);}}
{inval} {inv(yytext);}
%%
void other(char *s){
     int i;

    for(i=0; s[i]!='\0'; i++){
     ot[m] = s[i];
     m++;
   }
   ot[m]=' ';
   m++;

}
void inv(char *s)
{

   int i;

    for(i=0; s[i]!='\0'; i++){
     in[l] = s[i];
     l++;
   }
   in[l]=' ';
   l++;

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
void idShow(char *s)
{

   int i;

    for(i=0; s[i]!='\0'; i++){
     value[k] = s[i];
     k++;
   }
   value[k]=' ';
   k++;

}


int yywrap()
{
    return 1;
}
int main()
{
    yyin= fopen("input.txt","r");
    yylex();
     int i;
   printf("Kywords: ");
   for(i=0;ch[i]!='\0';i++){
       printf("%c",ch[i]);
    }
    printf("\n");
    
   printf("Identifiers: ");
   for(i=0;value[i]!='\0';i++){
       printf("%c",value[i]);
    }
   printf("\nOthers: ");
    for(i=0;ot[i]!='\0';i++){
       printf("%c",ot[i]);
    }
    printf("\n");
    printf("Invalid Input: ");
   for(i=0;in[i]!='\0';i++){
       printf("%c",in[i]);
    }
    printf("\n");
    return 0;
}


