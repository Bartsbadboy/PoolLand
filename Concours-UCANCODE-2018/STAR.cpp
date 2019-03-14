#include <iostream>
#include <string>


int equart(int& a,int b,const int& n)
{
  int t,q;
  if(b<a)
  {
    t=a-b;q=b+n-a;
    if(t<q)
    {a=b;return t;}
  }
  else
  {
    t=b-a;q=a+n-b;
    if(t<q)
      return t;
    a=b;
  }
  return q;
}


int main()
{
  std::string str;
  getline(std::cin,str);

  int i(0),j(0),n(0),nb(1);
  int *nums(new int[str.size()/2+1]);
  nums[0]=0;
  for(std::string::iterator it=str.begin(); it!=str.end(); ++it)
  {
    if(*it>47&&*it<58)
      nums[j] = nums[j]*10 + *it-48;
    else
    {
      if(n<nums[j])
        n=nums[j];
      j++;
      nums[j]=0;
    }
  }

  n++;nb=j+1;
  int idx(0),vraiNb(n*(n-1)/2),a(0),b,c(0);
  int *visit(new int[vraiNb]);
  for(j=0;j<vraiNb;j++)
    visit[j]=0;

  i=0;
  for(j=0;j<nb-1;j++)
  {
    idx=(equart(nums[j],nums[j+1],n)-1)*n;
    idx+=nums[j];
    if(visit[idx]==0)
    {visit[idx]=1;i++;}
    else if(visit[idx]==1)
    {visit[idx]=2;c++;}
  }

  b=vraiNb-i;
  if(b!=0||c!=0)
    a=1;
  std::cout<<a<<" "<<b<<" "<<c<<std::endl;
  return 0;
}
