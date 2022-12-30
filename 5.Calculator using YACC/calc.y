%{
#include <stdio.h>
%}
%token NL OPEN CLOSE
%left PLUS UMINUS BMINUS MUL DIV
%start LS
%union {int ival;float fval;}
%token<ival> INT
%token<fval> FLOAT
%type<fval> E
%%
LS : LS L
   |
   L ;
L : E NL {printf("Answer : %0.2f\n",$1);}
  ;
E : E PLUS E {$$ = $1+$3;}
  |
  E BMINUS E{$$ = $1-$3;}
  |
  E MUL E{$$ = $1*$3;}
  |
  E DIV E{if($3==0){printf("Divide by 0 error.\n");return;} else{$$ = $1/$3;}}
  |
  UMINUS E{$$ = -$2;}
  |
  OPEN E CLOSE {$$ = $2;}
  |
  INT {$$ = $1;}
  |
  FLOAT {$$ = $1;}
  ;
%%

int yyerror()
{
  printf("Parse error.\n");
  return -1;
}