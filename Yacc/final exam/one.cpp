#include <iostream>
#include <string>
using namespace std;

int main()
{
    int i,len=0,flag=0;
    char x,y,pattern[100];
    printf("Enter x:");
    cin>>x;
    printf("Enter y:");
    cin>>y;
    printf("Enter pattern:");
    cin>>pattern;


    for(i=0; pattern[i]!='\0'; i++)
    {
        len++;
    }
    if(len==0)
    {
        cout<<"VALID"<<endl;
    }
    else
    {
        for(i=0; i<len; i++)
        {
            if(pattern[i]<x || pattern[i]>y)
            {
                flag=1;
                break;
            }
        }

        if(flag==0)
        {
            cout<<"VALID"<<endl;
        }
        else
        {
            cout<<"INVALID"<<endl;
        }
    }

    main();
    return 0;
}
