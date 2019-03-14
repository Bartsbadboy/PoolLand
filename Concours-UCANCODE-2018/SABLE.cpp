#include <iostream>
#include <string>
#include <stdio.h>
#include <cmath>

std::string sable(int x,char *buff)
{
  int n=((-1+sqrt(1+x*8.))/2.),j=x-n*(n+1)/2;
  sprintf(buff,"%d",n);
  std::string str=buff;

  if(j==0)
    for(int i(1);i<n;i++)
    {sprintf(buff,"%d",n-i);str+=" ";str+=buff;}
  else
  {
    for(int i(1);i<n+1-j;i++)
      {sprintf(buff,"%d",n-i);str+=" ";str+=buff;}
    for(int i(n+1-j);i<n+1;i++)
      {sprintf(buff,"%d",n+1-i);str+=" ";str+=buff;}
  }
  return str;
}

int main()
{
  int t,x;
  std::cin>>t;
  char buffer[33];
  std::string str="";
  for(int i(0);i<t;i++)
  {
    std::cin>>x;
    str+=sable(x,buffer);
    str+="\n";
  }
  std::cout<<str;
  return 0;
}
