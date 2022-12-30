#include<stdio.h>
int main()
{
	for(int i=0;i<100;i++)
    {
        if(i%2==0)
            printf("Even number\n");
        else
            printf("Odd number\n");
    }

    int a;
    float b;
    printf("Enter two numbers: ");
    scanf("%d %f",&a,&b);
    int x=(10&5);
    int y=(15|10);
    if(a&&b || a||b) a=!b;
    else b=!a;
    printf("%d %d %d %d \n",++a,b++,a--,--b);
    return 0;
}