%{
    #include <stdio.h>
    void yyerror(char *);
    int yylex(void);
    int sym[26];
    int flag=0;
    // precedence & accociation is high for up to  bottom
%}

%token INTEGER VARIABLE
%right '='
%left  '<' '>' NE LE GE EQ
%left  '+' '-'
%left  '*' '/' 
%left '('')'
%right UMINUS


%%
program:
        program stmnt '\n' 
        |program '\n'
	|
        ;
     

stmnt:
        expr                      { if(flag==0) printf("%d\n",$1);
                                    else{ flag=0;}
                                  }
        | VARIABLE '=' expr       { sym[$1] = $3;//$1=a=0,$1=b=1,$1=c(VARIABLE)=2(index number) 
                          //sym[$1] means input value or c=a+b; then value
                         // is assign to x means sym[$1] 
                         //sym[0]=a=2,sym[1]=b=3, sym[2]=5; actually 2 is return for c from lex.
                                    }          
        ;

expr:
        INTEGER
        | VARIABLE                { $$ = sym[$1]; //printf("$$ = %d $1 = %d\n",$$,$1);
                                         if($$ == 0){flag=1; printf("Compilation Error\n");}
                                         // here value is assigned to below expr like $1=2,$3=3;
                                  } 
        | expr '+' expr           {//printf("$1 = %d\n",$1);
                                   //printf("$2 = %d\n",$2);
                                   //printf("$3 = %d\n",$3);
                                   $$ = $1 + $3; 
        }


        | expr '-' expr           { $$ = $1 - $3; }
        | expr '*' expr           { $$ = $1 * $3; }
        | expr '/' expr           {
                                    if($3==0) yyerror("divide 0");
				    else $$ = $1 / $3; 
                                   }
        | '(' expr ')'            { $$ = $2; //Default: $$ = $1; 
                                  } 
        | '-' expr %prec UMINUS {$$ = -$2;}     
        ;


%%
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {       //yytext means a string containing the lexeme 
    yyparse();        //*yytext means pointer to matched string
                     //The function yyparse() is created for you by YACC, 
                    //and ends up in y.tab.c. yyparse() reads  
                   // stream of token value pairs from yylex(), which needs to be supplied.
                  //yylex() means call to invoke lexer, returns token
  //printf("Output: %d\n",result);
    return 0;
}
