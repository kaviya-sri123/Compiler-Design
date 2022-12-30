%{
#include<stdio.h>
#include<string.h>
int count=1,recInd=0;
char* createNewTempVariable();
char ans[15],ch;
void generateCode(char[],char[],char[],char[]);
%}
%union {char name[10];};
%token OPEN CLOSE EQUAL
%left PLUS BMINUS MUL DIV MOD
%right UMINUS
%start S
%token<name> ID INT FLOAT
%type<name> E
%%
S : ID EQUAL E {char op[10]="="; generateCode($1,$3,op,"NIL");};
E : E PLUS E {strcpy($$,createNewTempVariable()); generateCode($$,$1,"+",$3);}
  |
  E BMINUS E {strcpy($$,createNewTempVariable()); generateCode($$,$1,"-",$3);}
  |
  E MUL E {strcpy($$,createNewTempVariable()); generateCode($$,$1,"*",$3);}
  |
  E DIV E {strcpy($$,createNewTempVariable()); generateCode($$,$1,"/",$3);}
  |
  E MOD E {strcpy($$,createNewTempVariable()); generateCode($$,$1,"%",$3);}
  |
  UMINUS E {strcpy($$,createNewTempVariable()); generateCode($$,$2,"-","UMINUS");}
  |
  OPEN E CLOSE {strcpy($$,$2);}
  |
  INT {strcpy($$,$1);}
  |
  FLOAT {strcpy($$,$1);}
  |
  ID {strcpy($$,$1);}
  ;
%%

int yyerror()
{
	printf("Parse error\n");
	return -1;
}

char* createNewTempVariable()
{
	sprintf(ans,"T%d",count);
	count++;
	return ans;
}

void generateCode(char res[10],char operand1[10],char operator[10],char operand2[10])
{
	if(strcmp(operand2,"NIL")==0 || strcmp(operand2,"UMINUS")==0)
		fprintf(yyout,"%d\t%s\t%s\t%s\t%s\n",recInd,operator,operand1,"",res);
	else
		fprintf(yyout,"%d\t%s\t%s\t%s\t%s\n",recInd,operator,operand1,operand2,res);
	recInd++;
}

void display(FILE *fp)
{
	char ch=fgetc(fp);
	while(ch!=EOF)
	{
		printf("%c",ch);
		ch=fgetc(fp);
	}
	fclose(fp);
}
