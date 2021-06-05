#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define MAX 10000
int main()
{
    int i,j,ctr=0,num,sum=0,min,max=0;
    char str_num[1000][1000];
    int *number = (int *)malloc(sizeof(int)*MAX);
    if(number == NULL)
    {
        printf("not enough memory to create array\n");
        exit(1);
    }
    while(1)
    {
        printf("enter a number or, type 'quit' and hit enter to exit\n");
        scanf("%s",str_num[ctr]);
        if(!strcmp(str_num[ctr], "quit"))
        {
            ctr--;
            break;
        }
        else
        {
            ctr++;   
        }
    }
    printf("List of all numbers:\n");
    for(i=0;i<=ctr;i++)
    {
        printf("%s\n",str_num[i]);
    }
    printf("Total number of entries: %d\n", ctr+1);
    for(i=0;i<=ctr;i++)
    {
        j=0;
        num=0;
        while(str_num[i][j]!='\0')
        {
            num = num*10 + (str_num[i][j] - '0');
            j++;
        }
        number[i] = num;
        sum+=num;
    }
    printf("Sum of all numbers: %d\n", sum);
    printf("Average of all numbers: %.3f\n", (float)sum/(ctr+1));
    min = number[0];
    for(i=0;i<=ctr;i++)
    {
        if(min>number[i])
        {
            min = number[i];
        }
        if(max<number[i])
        {
            max = number[i];
        }
    }
    printf("Lowest number is %d and Highest number is %d\n", min,max);
    return 0;
}
