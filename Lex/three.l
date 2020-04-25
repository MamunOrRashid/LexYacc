%{
  void display(char *);
  char specialData[30];
  int j = 0, upperCase = 0, lowerCase = 0;
%}

specialCharacter ~|!|#|$|%|;|:|\'|\"|\?|\.|\/|\^|\_|\\|\\t|\\b|\\r|\\f
upper [A-Z]
lower [a-z]

%%
{specialCharacter} {display(yytext);}
{upper} {upperCase++;}
{lower} {lowerCase++;}
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
int main(){
 yyin = fopen("three.txt","r");
 yylex();

   printf("\nSpecial characters: ");
   int i;
   for(i=0;specialData[i]!='\0';i++){
       printf("%c ",specialData[i]);
    }
   printf("\n");
  printf("Total upper case: %d and lower case letter: %d\n",upperCase, lowerCase);
 
 return 0;
}

