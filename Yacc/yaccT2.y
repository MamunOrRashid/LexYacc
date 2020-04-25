%{
 #include <stdio.h>
    void yyerror(char *);
    int yylex(void);
%}

%token and or not true false
%left or
%left and
%right not

%%
line: line expr '\n' {printf("Output: %s\n",$2? "true":"false");}
     | '\n'
     |
     ;
expr:    expr or expr { $$ = ($1 | $3);}
	|expr and expr { $$ = ($1 & $3);}
	|not expr {$$ = !($2);}
	|'(' expr ')' {$$ = $2;}
	|true  {$$ = $1;}
	|false {$$ = $1;}
	
%%
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}
int main()
{
	yyparse();  

 return 0;
}
