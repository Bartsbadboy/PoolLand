#include <iostream>


int main()
{
  long n;
  std::cin>>n;

  while(n%4==0)
    n=n/4;
  if(n==1)
    std::cout<<4<<std::endl;
  else
  {
    while(n%2==0)
      n=n/2;
    if(n==1)
      std::cout<<2<<std::endl;
    else
      std::cout<<0<<std::endl;
  }

  return 0;
}
