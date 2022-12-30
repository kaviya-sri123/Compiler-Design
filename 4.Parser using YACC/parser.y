%{
#include<stdio.h>
#include<stdlib.h>
%}

%left COMMA OR AND PLUS SUB MUL DIV MOD POSTINC POSTDEC
%right EQ PEQ MEQ MUEQ DEQ MODEQ NOT POS NEG PREINC PREDEC
%token ID OB CB OC CC ICONST FCONST DELIM FOR IF ELSE EOFL

%%
H:      STMT {printf("Parsed successfully\n");};
STMT:   ASTMT DELIM
        |ISTMT
        |FSTMT
        ;
ASTMT:  ID AOP EXP
        ;
AOP:    EQ
        |PEQ
        |MEQ
        |MUEQ
        |DEQ
        |MODEQ
        ;
EXP:    ID
        |ICONST
        |FCONST
        |OB EXP CB
        |EXP PLUS EXP
        |POS EXP
        |EXP SUB EXP
        |NEG EXP
        |EXP MUL EXP
        |EXP DIV EXP
        |EXP MOD EXP
        |PREINC EXP
        |EXP POSTINC
        |PREDEC EXP
        |EXP POSTDEC
        |EXP AND EXP
        |EXP OR EXP
        |NOT EXP
        ;
FSTMT:  FOR OB EXP1 DELIM EXP1 DELIM EXP1 CB OC STMT CC
        ;
ISTMT:  IF OB EXP CB OC STMT CC ELSE OC STMT CC
        |IF OB EXP CB OC STMT CC
        ;
EXP1:   EXP
        |ASTMT
        |;
%%
int yyerror()
{
  printf("Parse error.\n");
  exit(0);
}
