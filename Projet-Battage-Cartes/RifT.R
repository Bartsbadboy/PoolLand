#Conditions initiales
nbCartes<-52
Id<-1:nbCartes


####Calcul Variation totale
#Rif*1
twoN<-2^nbCartes
nFact=fact(nbCartes)
d1=(((nbCartes+1)/twoN-1/nFact)+(1/twoN-1/nFact)*
      (twoN-(nbCartes+1)))#(+(1-(twoN-nbCartes)/nFact))/2

#Majoration ||Rifinv*k - U|| par Prob [T > k]
dK=d1
N=15
for(k in 2:N)
{
  d=1
  for(i in 1:(nbCartes-1))
  {
    d=d*(1-i/2^k)
  }
  dK=c(dK,1-d)
}

plot(dK,type="l")


##Simulation espérance T = Tous les noms sont diff
N<-1000
TN<-rep(0,16)
for(i in 1:N){
  t<-simuRifInvT(Id)
  if(t>16){
    t<-16
  }
  TN=TN+c(rep(1,t-1),rep(0,16-t+1))
}
TN=TN/N
#Pob [T > m] <= TN
plot(1:16,TN,type="l",xlab="k",ylab="Prob[T > k]",main="Majoration de d(k)")
lines(1:15,dK,col='blue')
lines(c(1,16),c(0.5,0.5),col="red")
