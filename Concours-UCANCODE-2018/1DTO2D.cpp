#include <iostream>


int main()
{
  int n,m,t,a,b;
  std::cin >> n;
  std::cin >> m;
  std::cin >> t;
  int *nb=new int[t];
  for(int i(0);i<t;i++)
  {
    std::cin>>nb[i];
  }
  for(int i(0);i<t;i++)
  {
    a=(nb[i]-1)/m+1;
    b=(nb[i]-1)%m+1;
    std::cout<<a<<" "<<b<<std::endl;

  }
  return 0;
}
