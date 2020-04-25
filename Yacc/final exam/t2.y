%{
 #include <stdio.h>
    void yyerror(char *);
    int yylex(void);
%}

%token ep class extends public implements final comma identifier

%%
line: line C '\n' {printf("Compilation Successful");}
     | '\n'
     |
     ;
C:  P F class identifier X Y {$$=$1*$2*$3*$4*$5*$6;}
P:  public {$$=$1;}
P:  ep	{$$=$1;}
F:  final {$$=$1;}
F: ep {$$=$1;}
X: extends identifier {$$=$1*$2;}
X: ep  {$$=$1;}
Y: implements I {$$=$1*$2;}
Y: ep {$$=$1;}
I: identifier J {$$=$1*$2;}
J: comma I {$$=$1*$2;}
J: ep {$$=$1;}
  	
%%
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}
int main()
{	
	yyparse();  

 return 0;
}
