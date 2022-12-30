#include <stdio.h>
#include <string.h>
#include "lex.yy.c"
#include "y.tab.c"
int main()
{
	FILE *f1 = fopen("input.txt","r");
	FILE *f2 = fopen("output.txt","w");
	yyin  = f1;
	yyout = f2;
	fprintf(f2,"%s\n","|RID|\tOPER|\tOP1\tOP2|\tRESULT|");
	yyparse();
	fclose(f1);
	fclose(f2);
	f2=fopen("output.txt","r");
	display(f2); 
}
