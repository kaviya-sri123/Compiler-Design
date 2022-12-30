#include<stdio.h>
#include<string.h>
int main()
{
	int fp=0,lb=0,cs,ns,isPresent=0;
	char startState;
	char word[50];
	int number,a,cn,prev=-2,chk;
	printf("Enter the total number of states: ");
	scanf("%d",&number);
	char states[number+1];
	char acceptStates[number+1];
	for(int i=0;i<number;i++)
	{
		printf("Enter state %d: ",i+1);
		scanf("%c",&states[i]);
		scanf("%c",&states[i]);
	}
	printf("Enter the number of input symbols: ");
	scanf("%d",&cn);
	char inputSymbols[cn+1];
	char transition[number][cn+1];
	for(int i=0;i<cn;i++)
	{
     	printf("Enter symbol %d: ",i+1);
        scanf("%c",&inputSymbols[i]);
		scanf("%c",&inputSymbols[i]);
	}
	printf("Enter the start state: ");
	scanf("%c",&startState);
	scanf("%c",&startState);
	cs=0;
	printf("Enter the number of accepting states: ");
	scanf("%d",&a);
	for(int i=0;i<a;i++)
	{
		printf("Enter the accepting state %d: ",i+1);
		scanf("%c",&acceptStates[i]);
		scanf("%c",&acceptStates[i]);
	}
	for(int i=0;i<number;i++)
	{
		for(int j=0;j<cn;j++)
		{
			printf("Enter transition of (%c,%c): ",states[i],inputSymbols[j]);
			scanf("%c",&transition[i][j]);
			scanf("%c",&transition[i][j]);
		}
	}
	getchar();
	printf("Enter the string: ");
	scanf("%[^\n]s",word);

	while(word[fp]!='\0')
	{
		int y;
		for(int l=0;l<cn;l++)
		{
			if(inputSymbols[l]==word[fp])
			{
				y=l;
				prev=0;
				chk=0;
				break;
			}
			else
			{
				if(prev==fp-1)
					chk=1;
				y=-1;
				prev=fp;
			}
		}
		if(y==-1)
		{
			if(chk==0)
			{
				printf("\n<");
				for(int k=lb;k<fp;k++)
					printf("%c",word[k]);
				printf(",%c>\n",states[cs]);
			}
			printf("\nUnrecognized token: ");
			printf("%c",word[fp++]);
			cs=0;
			lb=fp;
			continue;
		}
		for(int j=0;j<number;j++)
		{
			if(transition[cs][y]==states[j])
			{
				ns=j;    
				break;
			}
			else
				ns=-1;
		}
		if(ns!=-1)
		{
			cs=ns;
			fp=fp+1;
		}
		else
		{
			for(int x=0;x<a;x++)
			{
				if(acceptStates[x]==states[cs])
				{
					isPresent=1;
					break;
				}
			}
			if(isPresent==1)
			{
				printf("\n<");
				for(int k=lb;k<fp;k++)
					printf("%c",word[k]);
				printf(",%c>\n",states[cs]);
				cs=0;
				lb=fp;
				continue;
			}
			else
			{
				printf("\nUnrecognized token: ");
				for(int k=lb;k<=fp;k++)
					printf("%c",word[k]);
				cs=0;
				lb=fp;
				continue;
			}
		}
	}
	for(int x=0;x<a;x++)
	{
		if(acceptStates[x]==states[cs])
		{
			isPresent=1;
			break;
		}
	}

	if(isPresent==1)
	{
		printf("\n<");
		for(int k=lb;k<=fp;k++)
			printf("%c",word[k]);
		printf(",%c>\n",states[cs]);
	}
	else
		printf("\nUnrecognized token.");
}
