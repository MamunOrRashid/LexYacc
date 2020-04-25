%{
int nchar, nword, nline;
%}

%%
\n { nline++; nchar++; }
[^ \t\n]+ { nword++, nchar += yyleng;//[^ab] means anything except a, b
          } 
. { nchar++; }
%%
int main(void) {
yyin= fopen("five.txt","r");
yylex();
printf("%d\t%d\t%d\n", nchar, nword, nline);
return 0;
}

