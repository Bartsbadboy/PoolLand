#Conditions initiales
nbCartes<-52
Id<-1:nbCartes


##Espérance Rif-U
#Nombre de simulations:
N=10
som<-rep(0,nbCartes)
for(i in 1:N){
  U<-sample(Id)
  Rif<-simuRif(Id)
  som=som+Rif-U
}
som=som/N

##Simulation k Rif
Rif<-Id
k<-10
for(k in 1:k)
{
  Rif<-simuRif(Rif)
}

#Espérance Rif*10
N<-1000
som<-rep(0,nbCartes)
for(i in 1:N)
{
  Rif<-Id
  for(k in 1:10)
  {
    Rif<-simuRif(Rif)
  }
  som=som+Rif
}
som=som/N

##Approximation de proba pour chaque carte indiv
#freq[i,j] = freq que i aille en j
#Rif*1
N=10000
freq=matrix(0,nbCartes,nbCartes)
for(i in 1:N){
  Rif<-simuRif(Id)
  for(j in 1:nbCartes){
    freq[j,Rif[j]]=freq[j,Rif[j]]+1
  }
}
freq=freq/N

#Rif*k
N=10000
k<-10
freq=matrix(0,nbCartes,nbCartes)
for(i in 1:N){
  Rif<-Id
  for(j in 1:k)
  {
    Rif<-simuRif(Rif)
  }
  for(j in 1:nbCartes){
    freq[j,Rif[j]]=freq[j,Rif[j]]+1
  }
}
freq=freq/N






