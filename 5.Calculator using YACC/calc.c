#include <stdio.h>
#include "lex.yy.c"
#include "y.tab.c"
int main()
{
	yyparse();
	printf("Parsing success\n");
}