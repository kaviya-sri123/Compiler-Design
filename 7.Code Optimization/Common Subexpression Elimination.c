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

void eliminate(struct quadruple *q,int n)
{
	for(int i=0;i<n-1;i++)
	{
		for(int j=i+1;j<n;j++)
		{
			if(strcmp(q[i].operand1,q[j].operand1) 
			+ strcmp(q[i].operand2,q[j].operand2) 
			+ strcmp(q[i].operator,q[j].operator)==0)
			{
				int flag=0;
				for(int k=i;k<j-1;k++)
				{
					if(strcmp(q[k].result,q[k+1].result)==0
					||strcmp(q[k].operand1,q[k+1].result)==0
					||strcmp(q[k].operand2,q[k+1].result)==0)
						flag=1;
				}
				if(flag==0)
				{
					strcpy(q[j].operand1,q[i].result);
					strcpy(q[j].operand2,"---");
					strcpy(q[j].operator,"=");
				}
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
 	eliminate(quad,n);
 	printf("\nAfter Common-Subexpression Elimination\n");
	display(quad,n);
 	return 0;
}
