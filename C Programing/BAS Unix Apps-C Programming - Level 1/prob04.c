#include<stdio.h>
#include<stdlib.h>
#define MAX 1000
typedef struct
{
    char *str;
    int top;
    int maxSize;
}stack;
void stackinit(stack *s, int size)
{
    s->str = (char *)malloc(sizeof(char)*size);
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
void push(stack *s, char letter)
{
    if(isStackFull(s))
    {
        printf("Stack is already full\n");
        exit(1);
    }
    s->str[++s->top] = letter;
}
char pop(stack *s)
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
    int i=0, j=0;
    char exp_[1000],rev_[MAX], ch;
    stack s;
    stackinit(&s,1000);
    printf("enter an infix expression: ");
    scanf("%s", exp_);
    printf("Postfix expression is:\n");
    while(exp_[i]!='\0')
    {
        if(exp_[i]>=48&&exp_[i]<=57)
        {
            printf("%c",exp_[i]);
        }
        else if( isStackEmpty(&s) || elementOnTop(&s) == '(' )
        {
            push(&s,exp_[i]);
        }
        else if(exp_[i] == '(')
        {
            push(&s, exp_[i]);
        }
        else if(exp_[i] == ')')
        {
            ch = pop(&s);
            while(ch != '(')
            {
                printf("%c", ch);
                ch = pop(&s);
            }
        }
        else if( cmpOperator(exp_[i]) > cmpOperator(elementOnTop(&s)) )
        {
            push(&s, exp_[i]);
        }
        else if( cmpOperator(exp_[i]) == cmpOperator(elementOnTop(&s)) )
        {
            printf("%c", pop(&s));
            push(&s, exp_[i]);
        }
        else if( cmpOperator(exp_[i]) < cmpOperator(elementOnTop(&s)) )
        {
            printf("%c", pop(&s));
            while( cmpOperator(exp_[i]) < cmpOperator(elementOnTop(&s)) )
            {
                printf("%c", pop(&s));
            }
            if( cmpOperator(exp_[i]) > cmpOperator(elementOnTop(&s)) )
            {
                push(&s, exp_[i]);
            }
            else if( cmpOperator(exp_[i]) == cmpOperator(elementOnTop(&s)) )
            {
                printf("%c", pop(&s));
                push(&s, exp_[i]);
            }
        }
        i++;
    }
    while(!isStackEmpty(&s))
    {
        printf("%c", pop(&s));
    }
    for(i=strlen(exp_)-1; i>=0; i--)
    {
        if(exp_[i]>=48&&exp_[i]<=57)
        {
            rev_[j] =exp_[i];
            j++;
        }
        else if( isStackEmpty(&s) || elementOnTop(&s) == ')' )
        {
            push(&s,exp_[i]);
        }
        else if(exp_[i] == ')')
        {
            push(&s, exp_[i]);
        }
        else if(exp_[i] == '(')
        {
            ch = pop(&s);
            while(ch != ')')
            {
                rev_[j] = ch;
                j++;
                ch = pop(&s);
            }
        }
        else if( cmpOperator(exp_[i]) > cmpOperator(elementOnTop(&s)) )
        {
            push(&s, exp_[i]);
        }
        else if( cmpOperator(exp_[i]) == cmpOperator(elementOnTop(&s)) )
        {
            rev_[j] =exp_[i];
            j++;
            push(&s, exp_[i]);
        }
        else if( cmpOperator(exp_[i]) < cmpOperator(elementOnTop(&s)) )
        {
            rev_[j] = pop(&s);
            j++;
            while( cmpOperator(exp_[i]) < cmpOperator(elementOnTop(&s)) )
            {
                rev_[j] = pop(&s);
                j++;
            }
            if( cmpOperator(exp_[i]) > cmpOperator(elementOnTop(&s)) )
            {
                push(&s, exp_[i]);
            }
            else if( cmpOperator(exp_[i]) == cmpOperator(elementOnTop(&s)) )
            {
                rev_[j] = pop(&s);
                j++;
                push(&s, exp_[i]);
            }
        }
    }
    while(!isStackEmpty(&s))
    {
        rev_[j] = pop(&s);
        j++;
    }
    rev_[j]='\0';
    j++;
    printf("\nprefix expression is:\n");
    for(i=strlen(rev_)-1; i>=0; i--)
    {
        printf("%c",rev_[i]);
    }

    return 0;
}
