#include <iostream>
#include <string>
#include <stdio.h>

long tonneaux(int n)
{
  if((n==1)*(n==0))
    return 1;
  long summ(1);
  for(int i(1);i<n;i++)
    summ+=(n-i)*tonneaux(i);
  return summ;
}

int main()
{
  int t,n;
  std::cin>>t;
  char buffer[33];
  std::string str="";
  for(int i(0);i<t;i++)
  {
    std::cin>>n;
    sprintf(buffer,"%ld",tonneaux(n));
    str+=buffer;
    str+="\n";
  }
  std::cout<<str;
  return 0;
}
