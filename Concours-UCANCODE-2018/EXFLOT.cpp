#include <iostream>
#include <string>
#include <stdio.h>
#include <cmath>

double tronc(double a,int tron)
{
  if(tron==2)
    {
      double b(100*a);
      int fb(b);
      if(b-fb==0.5)
      {
        if(fb%2==1)
          return (fb+1)/100.;
        else
          return fb/100.;
      }else
        return round(b)/100.;
    }
  else if(tron==1)
    return ceil(100*a)/100.;
  else if(tron==-1)
    return floor(100*a)/100.;
  else
    return trunc(100*a)/100.;
}
int main()
{
  int t,tron;
  std::cin>>t;
  double a;
  char buffer[33];
  std::string str="";
  for(int i(0);i<t;i++)
  {
    std::cin>>a;
    std::cin>>tron;
    sprintf(buffer,"%.2f",tronc(a,tron));
    str+=buffer;
    str+="\n";
  }
  std::cout<<str;
  return 0;
}
