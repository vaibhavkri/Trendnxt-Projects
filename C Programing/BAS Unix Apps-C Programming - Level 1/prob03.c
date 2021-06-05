#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define MAX 1000
typedef struct
{
    int *str;
    int top;
    int maxSize;
}stack;
void stackinit(stack *s, int size)
{
    s->str = (int *)malloc(sizeof(int)*size);
    if(s==NULL)
    {
        printf("Not enough memory to make a stack\n");
        exit(1);
    }
    s->top = -1;
    s->maxSize = size;
}
void stackdestroy(stack *s)
{
    free(s->str);
    s->str = NULL;
    s->top = -1;
    s->maxSize = 0;
}
int isStackFull(stack *s)
{
    return (s->top >= s->maxSize);
}
int isStackEmpty(stack *s)
{
    return (s->top < 0);
}
void push(stack *s, int letter)
{
    if(isStackFull(s))
    {
        printf("Stack is already full\n");
        exit(1);
    }
    s->str[++s->top] = letter;
}
int pop(stack *s)
{
    if(isStackEmpty(s))
    {
        printf("Stack is empty\n");
        exit(1);
    }
    return s->str[s->top--];
}
char elementOnTop(stack *s)
{
    return s->str[s->top];
}
int cmpOperator(char symbol)
{
    if(symbol == '^')
    {
        return 3;
    }
    else if(symbol == '*' || symbol == '/')
    {
        return 2;
    }
    else if(symbol == '+' || symbol == '-')
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
int main()
{
    int i=0,num;
    char exp_[MAX],ch;
    stack s;
    stackinit(&s,MAX);
    printf("enter a postfix expression: ");
    scanf("%s", exp_);
    while(exp_[i]!='\0')
    {
        if(exp_[i]>=48&&exp_[i]<=57)
        {
            num = exp_[i]-'0';
            //printf("number pushed: %d\n", num);
            push(&s, num);
        }
        else
        {
            if(exp_[i]=='*')
            {
                push(&s, pop(&s)*pop(&s));
            }
            if(exp_[i]=='+')
            {
                push(&s, pop(&s)+pop(&s));
            }
            if(exp_[i]=='-')
            {
                push(&s, pop(&s)-pop(&s));
            }
            if(exp_[i]=='/')
            {
                push(&s, pop(&s)/pop(&s));
            }
        }
        i++;
    }
    printf("result is: %d", pop(&s));
    stackdestroy(&s);
    return 0;
}
