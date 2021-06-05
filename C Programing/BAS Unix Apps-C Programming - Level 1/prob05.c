#include<stdio.h>
#include<stdlib.h>
#include<string.h>
struct emp_data{
    int emp_code;
    char emp_address[30];
    struct emp_data *next;
};
void printlist(struct emp_data **head)
{
    struct emp_data *start = (struct emp_data*)malloc(sizeof(struct emp_data));
    start = *head;
    while(start!=NULL)
    {
        printf("%d %s->",start->emp_code, start->emp_address);
        start=start->next;
    }
    printf("\n");
}
int main()
{
    char ch;
    int i;
    //struct emp_data head[10];
    struct emp_data *head[10];
    for(i=0;i<10;i++)
    {
        head[i] = NULL;
    }
    while(1)
    {
        int code;
        char address[30];
        printf("Press 'a' to add, 'u' to update, 'd' to delete data, or to exit, press 'q'\n");
        scanf(" %c",&ch);
        if(ch=='a')
        {
            printf("enter employee code and address\n");
            scanf("%d", &code);
            gets(address);
            struct emp_data *temp=(struct emp_data *)malloc(sizeof(struct emp_data));
            if(head[code%10]==NULL)
            {
                struct emp_data *cpy;
                cpy = head[code%10];
                temp->emp_code = code;
                strcpy(temp->emp_address, address);
                temp->next = cpy;
                head[code%10]= temp;
            }
            else
            {
                struct emp_data *start;
                start = head[code%10];
                while(start->next!=NULL)
                {
                    start = start->next;
                }
                temp->emp_code = code;
                strcpy(temp->emp_address, address);
                temp->next = NULL;
                start->next = temp;
            }
        }
        else if(ch=='u')
        {
            //update
            int index,ctr=1;
            char address[30];
            printf("enter the employee code of the employee to update address\n");
            scanf("%d",&index);
            struct emp_data *temp = (struct emp_data*)malloc(sizeof(struct emp_data));
            struct emp_data *start = (struct emp_data*)malloc(sizeof(struct emp_data));
            start = head[index%10];
            while( start!=NULL )
            {
                if(start->emp_code == index)
                {
                    break;
                }
                start=start->next;
                ctr++;   
            }
            if(start==NULL)
            {
                printf("Recoord not found!\n");
            }
            else if(ctr==1)
            {
                printf("1st entry change\n");
                printf("enter new address for this employee\n");
                getc(stdin);
                gets(address);
                strcpy(head[index%10]->emp_address, address);
            }
            else
            {
                printf("further entry change\n");
                printf("enter new address for this employee\n");
                getc(stdin);
                gets(address);
                strcpy(start->emp_address, address);
            }
        }
        else if(ch=='d')
        {
            //delete
            int index,ctr=1;
            printf("enter the employee code of the employee to delete his/her data\n");
            scanf("%d", &index);
            struct emp_data *temp = (struct emp_data*)malloc(sizeof(struct emp_data));
            struct emp_data *start = (struct emp_data*)malloc(sizeof(struct emp_data));
            struct emp_data *prev = (struct emp_data*)malloc(sizeof(struct emp_data));
            start = head[index%10];
            while( start!=NULL )
            {
                if(start->emp_code == index)
                {
                    break;
                }
                prev=start;
                start=start->next;
                ctr++;
            }
            if(start==NULL)
            {
                printf("Record not found!\n");
            }
            else if(ctr==1)
            {
                temp = head[index%10];
                head[index%10] = head[index%10]->next;
                free(temp);
            }
            else
            {
                prev->next = start->next;
                //start->next = start->next->next;
                free(start);
            }
        }
        else if(ch=='q')
        {
            break;
        }
        else
        {
            //invalid
            printf("Please enter a valid command\n");
        }
    }
    //to print the list
    for(i=0;i<10;i++)
    {
        if(head[i] == NULL)
        {
            continue;
        }
        printlist(&head[i]);
    }
}
