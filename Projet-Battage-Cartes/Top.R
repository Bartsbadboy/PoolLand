##Conditions initiales
nbCartes<-52
Id<-1:nbCartes

#Majoration d(k)
N<-3
inter<-0.2
nlogn<-nbCartes*log(nbCartes)
c<-seq(0,N,inter)
m<-c()
expo<-c()
for(i in c){
  m<-c(m,(nlogn + i*nbCartes))
  expo<-c(expo,exp(-i))
}
#Porba [T > m] <= expo
plot(m,expo,type="l",xlab="k=n*ln(n)+c*n",ylab="exp(-c)",main="Majoration théorique exp(-c)")

#Simulation espérance de T
N<-100
TN<-0
for(i in 1:N){
  t<-0
  Top<-Id
  while(Top[1]!=52)
  {
    t=t+1
    Top<-simuTop(Top)
  }
  TN=TN+t+1
}
TN=TN/N

#Probabilités cumulées k de 51:400
N<-1000
Tcumules<-rep(0,350)
for(i in 1:N){
  k<-1
  Top<-Id
  while(Top[1]!=52)
  {
    k=k+1
    Top<-simuTop(Top)
  }
  if(k>400){
    k<-400
  }
  Tcumules=Tcumules+c(rep(1,(k-50-1)),rep(0,(400-k+1)))
}
Tcumules=Tcumules/N
#Pob [T > m] <= Tcumules
k<-51:400
plot(k,Tcumules,type="l",xlab="k",ylab="Prob[T > k]",main="Simulation de 100 TOP")
lines(c(51,400),c(0.5,0.5),col="red")

#Comparaison
#par(mfrow=c(1,2))
#plot(k,expo,type="l",xlab="k=n*ln(n)+c*n",ylab="exp(-c)",main="Majoration théorique exp(-c)")
plot(k,Tcumules,type="l",xlab="k",ylab="Prob[T > k]",main="Simulation de 100 TOP")
lines(c(51,400),c(0.5,0.5),col="red")
lines(m,expo,col="blue")
