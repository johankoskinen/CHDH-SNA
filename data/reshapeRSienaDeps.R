reshapeRSienaDeps <- function(sim_ans,n) {
numSimulated <- length(sim_ans$sims)mySimNets <- array(0,dim=c(numSimulated,n,n))
theseNets <- seq(1,numSimulated)for (i in c(1:numSimulated ) ){adj <- matrix(0, n, n)# Make shorter notation for edge listedges <- sim_ans$sims[[theseNets[i]]][[1]][[1]][[1]] # put edge values in desired placesadj[edges[, 1:2]] <- edges[, 3]mySimNets[i,,] <- adj}
mySimNets}