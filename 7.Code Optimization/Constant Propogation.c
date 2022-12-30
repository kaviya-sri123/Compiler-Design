#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

struct quadruple
{
	char result[10];
	char operator[2];
	char operand1[10];
	char operand2[10];
};

void display(struct quadruple *q,int n)
{
	printf("RI\tOP\tO1\tO2\tRES\n");
 	for(int i=0;i<n;i++)
  		printf("%d\t%s\t%s\t%s\t%s\n",i,q[i].operator,q[i].operand1,q[i].operand2,q[i].result);
}

int operateNumbers(char *opr,int n1,int n2)
{
 	if(strcmp(opr,"+")==0)
  		return n1+n2;
 	else if(strcmp(opr,"-")==0)
  		return n1-n2;
 	else if(strcmp(opr,"*")==0)
  		return n1*n2;
 	else if(strcmp(opr,"/")==0)
  		return n1/n2;
}

void applyConstantFolding(struct quadruple *q,int n)
{
 	int num1,num2,res;
 	for(int i=0;i<n;i++)
	{
  		if( (isdigit(q[i].operand1[0])) && (isdigit(q[i].operand2[0])))
		{
			num1 = atoi(q[i].operand1);
			num2 = atoi(q[i].operand2);
			res = operateNumbers(q[i].operator,num1,num2);
			sprintf(q[i].operand1,"%d",res);
			strcpy(q[i].operand2,"---");
			strcpy(q[i].operator,"=");
  		}
        for(int j=i;j<n;j++)
        {
            if(strcmp(q[j].operand1,q[i].result)==0)
            {
                sprintf(q[j].operand1,"%d",res);
            }
            else if(strcmp(q[j].operand2,q[i].result)==0)
            {
                sprintf(q[j].operand2,"%d",res);
            }
        }
 	}
}
int main()
{
	int n;
 	printf("Enter the number of quadrapules: ");
 	scanf("%d",&n);
    struct quadruple quad[n];
	printf("Format: Operator Operand-1 Operand-2 Result\n");
 	for(int i=0;i<n;i++)
	{
  		printf("Enter the quadrapule [%d] : ",i);
  		scanf("%s %s %s %s",quad[i].operator,quad[i].operand1,quad[i].operand2,quad[i].result);
 	}
    printf("TAC in Quadrapules\n");
 	display(quad,n);
 	applyConstantFolding(quad,n);
 	printf("\nConstant folded quadruples\n");
	display(quad,n);
 	return 0;
}
