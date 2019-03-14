#Simulation du mélange Top
simuTop<-function(cartes)
{
  n<-length(cartes)
  t<-sample(1:n,1)
  if(t==1){
    return(cartes)
  }else if(t==n){
    return(c(cartes[2:n],cartes[1]))
  }else{
    return(c(cartes[2:t],cartes[1],cartes[(t+1):n]))
  }
}

#Simulation du mélange à l'américaine
simuRif<-function(cartes)
{
  n<-length(cartes)
  t<-rbinom(1,n,0.5)
  if(t==0||t==n){
    return(cartes)
  }
  Top<-c(cartes[1:t])
  Bot<-c(cartes[(t+1):n])
  Rif<-c()
  for (i in 0:(n-1)){
    bern<-rbinom(1,1,t/(n-i))
    if(bern){
      Rif<-c(Top[t],Rif)
      t=t-1
    }else{
      Rif<-c(Bot[n-i-t],Rif)
    }
  }
  return(Rif)
}

#Simulation du mélange à l'américaine inverse
simuRifInv<-function(cartes)
{
  n<-length(cartes)
  Top<-c()
  Bot<-c()
  bern<-rbinom(n,1,0.5)
  for (i in 1:n){
    if(bern[i]){
      Top<-c(Top,cartes[i])
    }else{
      Bot<-c(Bot,cartes[i])
    }
  }
  return(c(Top,Bot))
}

#Simu Rif inverse qui retourne T = Tous les noms sont diff
simuRifInvT<-function(cartes)
{
  n<-length(cartes)
  if(n<2){
    return(0)
  }
  bern<-rbinom(n,1,0.5)
  return(max(simuRifInvT(cartes[bern]),simuRifInvT(cartes[!bern]))+1)
}


fact<-function(n)
{
  if(n>1)
  {return(n*fact(n-1))}
  else{return(1)}
}
