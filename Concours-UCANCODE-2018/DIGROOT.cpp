#include <iostream>
#include <string>
#include <stdio.h>

int d(long i)
{
  long j(i%10);
  i=i/10;
  if(i==0)
    return j;
  while(i!=0)
  {
    j+=i%10;
    i=i/10;
  }
  return d(j);

}
int main()
{
  long i;
  std::cin>>i;
  char buffer[33];
  std::string str="";
  while(i!=0)
  {
    //itoa(d(i),buffer,10);
    sprintf(buffer,"%d",d(i));
    str+=buffer;
    str+="\n";
    std::cin>>i;
  }
  std::cout<<str;
  return 0;
}
