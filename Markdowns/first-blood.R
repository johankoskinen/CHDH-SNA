library('RSiena')


### - Bur
EdgeList.1 <- format.edge.list("Bur16EdgeClean.csv",1)
EdgeList.2 <- format.edge.list("Bur19EdgeClean.csv",2)
EdgeList.3 <- format.edge.list("Bur22EdgeClean.csv",3)
EdgeList <- rbind(EdgeList.1,EdgeList.2,EdgeList.3)
all.ADJ <- from.edgelists.to.matrix(EdgeList)
share.net <- sienaDependent( all.ADJ )
nn <- dim(all.ADJ)[1]
group.size <- coCovar( as.numeric( matrix( log(nn),nn,1 ) ) ,center=FALSE )
data.1 <- sienaDataCreate( share.net , group.size)
#### - 

### - Kur
EdgeList.1 <- format.edge.list("Kur16EdgeClean.csv",1)
EdgeList.2 <- format.edge.list("Kur19EdgeClean.csv",2)
EdgeList.3 <- format.edge.list("Kur22EdgeClean.csv",3)
EdgeList <- rbind(EdgeList.1,EdgeList.2,EdgeList.3)
all.ADJ <- from.edgelists.to.matrix(EdgeList)

share.net <- sienaDependent( all.ADJ )
nn <- dim(all.ADJ)[1]
group.size <- coCovar( as.numeric( matrix( log(nn),nn,1 ) ) ,center=FALSE )
data.2 <- sienaDataCreate( share.net , group.size)
### - Mkw
EdgeList.1 <- format.edge.list("Mkw16EdgeClean.csv",1)
EdgeList.2 <- format.edge.list("Mkw19EdgeClean.csv",2)
EdgeList.3 <- format.edge.list("Mkw22EdgeClean.csv",3)
EdgeList <- rbind(EdgeList.1,EdgeList.2,EdgeList.3)
all.ADJ <- from.edgelists.to.matrix(EdgeList)
share.net <- sienaDependent( all.ADJ )
nn <- dim(all.ADJ)[1]
group.size <- coCovar( as.numeric( matrix( log(nn),nn,1 ) ) ,center=FALSE )
data.3 <- sienaDataCreate( share.net , group.size)
### - Msu
EdgeList.1 <- format.edge.list("Msu16EdgeClean.csv",1)
EdgeList.2 <- format.edge.list("Msu19EdgeClean.csv",2)
EdgeList.3 <- format.edge.list("Msu22EdgeClean.csv",3)
EdgeList <- rbind(EdgeList.1,EdgeList.2,EdgeList.3)
all.ADJ <- from.edgelists.to.matrix(EdgeList)
share.net <- sienaDependent( all.ADJ )
nn <- dim(all.ADJ)[1]
group.size <- coCovar( as.numeric( matrix( log(nn),nn,1 ) ) ,center=FALSE )
data.4 <- sienaDataCreate( share.net , group.size)
### - Nya
EdgeList.1 <- format.edge.list("Nya16EdgeClean.csv",1)
EdgeList.2 <- format.edge.list("Nya19EdgeClean.csv",2)
EdgeList.3 <- format.edge.list("Nya22EdgeClean.csv",3)
EdgeList <- rbind(EdgeList.1,EdgeList.2,EdgeList.3)
all.ADJ <- from.edgelists.to.matrix(EdgeList)
share.net <- sienaDependent( all.ADJ )
nn <- dim(all.ADJ)[1]
group.size <- coCovar( as.numeric( matrix( log(nn),nn,1 ) ) ,center=FALSE )
data.5 <- sienaDataCreate( share.net , group.size)
#plot(as.network(all.ADJ[,,3]))
### 

# Define siena group object

(FiveGuys <- sienaGroupCreate(list(data.1, data.2, data.3, data.4,data.5)))
myeff <- getEffects(FiveGuys)

myeff <- includeEffects( myeff,gwespFF)
myeff <- includeEffects( myeff,egoX,interaction1 = "group.size" )
#myeff <- includeEffects( myeff,inPopSqrt)
#myeff <- includeEffects( myeff,outPopSqrt)
#myeff <- includeEffects( myeff,inActSqrt)

FiveGuys.algo.1<- sienaAlgorithmCreate( projname = 'FiveGuys' )
### KEEP in mind
# If different groups sizes, good to include log(n) as covariate
# RSiena auromatically centers covariates - you do not want that so:
# mycov.group.1 <- coCovar(competent,center=FALSE)
# so, IN PARTICULAR, if you have an attribute that does *not* change for people
# in the same group, you DON't want to center that

FiveGuys.est.1 <- siena07( FiveGuys.algo.1,
                            data = FiveGuys,
                            effects =myeff ,
                            batch = TRUE,
                            returnDeps = TRUE )

FiveGuys.est.1

from.edgelists.to.matrix <- function(EdgeList)
{
  actor.set <- unique( c(EdgeList[,1],EdgeList[,2]) )
  n.act <- length(actor.set)
  waves <- unique(EdgeList[,4])
  n.waves <- length(waves)
  # but now we know that there are 3 waves
  ADJ.1 <- from.edgelist.to.mat(Edgelist=EdgeList[EdgeList[,4]==1,],actor.set=actor.set,use.wave=1,n.act=n.act)
  ADJ.2 <- from.edgelist.to.mat(Edgelist=EdgeList[EdgeList[,4]==2,],actor.set=actor.set,use.wave=1,n.act=n.act)
  ADJ.3 <- from.edgelist.to.mat(Edgelist=EdgeList[EdgeList[,4]==3,],actor.set=actor.set,use.wave=1,n.act=n.act)
  all.ADJ <- array(c( ADJ.1,ADJ.2,ADJ.3), dim=c(n.act,n.act,3))
  all.ADJ
}

from.edgelist.to.mat <- function(Edgelist,actor.set,use.wave,n.act)
{
  ADJ <- matrix(0,n.act,n.act)
  Num.ties <- dim(Edgelist)[1]
  for (k in c(1:Num.ties))
  {
    sender <- which(actor.set==Edgelist[k,1])
    receiver <- which(actor.set==Edgelist[k,2])
    ADJ[sender,receiver] <- 1
    
    
  }
  ADJ
}


format.edge.list <- function(name,wave){
EdgeList.1 <- read.table(name, header=TRUE, sep=",")
EdgeList.1 <- EdgeList.1[,1:2]
n.ties <- dim(EdgeList.1)[1]
# names(EdgeList) <- c( "sid", "recid", "bff", "wid" )
EdgeList.1 <- cbind(EdgeList.1,matrix(1,n.ties ,1 ),matrix(wave,n.ties , 1 ))
names(EdgeList.1) <- c( "sid", "recid" ,"share","wid")
EdgeList.1
}