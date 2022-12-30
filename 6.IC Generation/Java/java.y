%{
#include<stdio.h>
#include<string.h>
#include"y.tab.h"
int s=0,i=0,j=0;
typedef struct quad
{
	char op1[20];
	char op2[20];
	char oper[20];
	char res[20];
}quad;
quad qtable[30];
void newTemp(char*);
void newLabel(char*);
extern FILE *yyin;
extern FILE *yyout;
char templab[20];
%}
%union 
{
	char place[20];
	char name[20];
	struct lab
	{
		char place[20];
		char tru[20];
		char fls[20];
	}l1;
	struct stmt
	{
		char nxt[20];
		char begin[20];
	}l2;
};
%left LT GT GE LE NE EQU
%left ADD SUB
%left MUL DIV
%left UM
%left AND OR
%token OB CB SC EQ CONS IF WHILE THEN DO
%token <name>ID
%type <place>E
%type<l2>S
%type<l1>COND
%%
S:	ID EQ E SC {printf("%s = %s\n",$1,$3);}
 |	IF COND THEN { printf("%s:",$2.tru);} S {;}
 |	WB COND DO {printf("%s:",$2.tru);} S { strcpy($$.begin,templab);printf("goto %s\n",$$.begin);}
 	;
WB:		WHILE {newLabel(templab); printf("%s:",templab);};
E:      E ADD E {newTemp($$); printf("%s = %s + %s\n",$$,$1,$3);}
 |      E MUL E {newTemp($$); printf("%s = %s * %s\n",$$,$1,$3);}
 |      ID {strcpy($$,$1);}
 ;
COND :  E LT E {newLabel($$.tru);
                newLabel($$.fls);
                printf("if %s < %s goto %s\n goto %s\n",$1,$3,$$.tru,$$.fls);}
     |  E GT E {newLabel($$.tru);
                newLabel($$.fls);
                printf("if %s > %s goto %s\n goto %s\n",$1,$3,$$.tru,$$.fls);}
     |  E GE E {newLabel($$.tru);
                newLabel($$.fls);
                printf("if %s >= %s goto %s\n goto %s\n",$1,$3,$$.tru,$$.fls);}
     |  E LE E {newLabel($$.tru);
                newLabel($$.fls);
                printf("if %s <= %s goto %s\n goto %s\n",$1,$3,$$.tru,$$.fls);}
     |  E NE E {newLabel($$.tru);
                newLabel($$.fls);
                printf("if %s != %s goto %s\n goto %s\n",$1,$3,$$.tru,$$.fls);}
     |  E EQU E {newLabel($$.tru);
                newLabel($$.fls);
                printf("if %s == %s goto %s\n goto %s\n",$1,$3,$$.tru,$$.fls);}
     |  COND AND COND
     |  COND OR COND
     ;
%%
void yyerror(char *msg)
{
    printf("%s\n",msg);
}
int yywrap(void)
{
    return 1;
}
void newTemp(char *temp)
{
    sprintf(temp,"t%d",j);
    j++;
}
void newLabel(char *l){
    sprintf(l,"L%d",s);
    s++;
}

int main()
{
	yyin = fopen("input.txt","r");
	yyparse();
}