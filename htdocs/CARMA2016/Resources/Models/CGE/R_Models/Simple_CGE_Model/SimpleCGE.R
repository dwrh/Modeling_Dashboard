#   A Simple Calibrated General Equilibrium Model Using GAMS


# Sets: 

		# industries (I) and factors (F)

				I=c("Ag","Other")
				F=c("L","K")

	
# Scalars

				dummy = 1	# dummy parameter		

	
# Parameters (declaration and calibration)
  
		# lambda(i,f): factor allocation share
		
				lambda=matrix(nrow=length(F),ncol=length(I),data=NA)
				rownames(lambda)=F
				colnames(lambda)=I
				lambda[1:4] = c(0.50,0.25,0.50,0.75)

		# theta(i,f): factor income share
		
				theta = matrix(nrow=length(F),ncol=length(I),data=NA)
				rownames(theta) = F
				colnames(theta) = I
				theta[1:4] = c(0.60,0.40,0.40,0.60)
		
		# sigma(i): elasticity of substitution
			
				sigma=rep(NA,length(I))		
				names(sigma) = I
				sigma[1:2] = c(0.8,0.9)

		# t(i): initial tariff
		
				t=rep(NA,length(I))	
				names(t) = I
				t["Ag"] = 0.20
		
		#s(i): initial subsidy
		
				s=rep(NA,length(I))	
				names(s) = I
				s["Other"] = 0.30              
                    
        # dt(i): change in tariff     
		
				dt=rep(NA,length(I))	
				names(dt) = I
				dt["Ag"]=0.10
		
       # ds(i): change in export subsidy     
			
				ds=rep(NA,length(I))
				names(ds) = I
				ds["Other"]=0.15		
		
		#tarhat(i): proportional change in tariff
		
				tarhat=rep(NA,length(I))
				names(tarhat) = I
			
				for (i in 1:length(I)){
						if (t[i]>0 & is.na(t[i])==FALSE){tarhat[i] = dt[i] / (1+t[i])}
											}
		
		#subhat(i): proportional change in export subsidy
		
				subhat =rep(NA,length(I))
				names(subhat) = I
			
				for (i in 1:length(I)){
						if (s[i]>0 & is.na(s[i])==FALSE){subhat[i] = ds[i] / (1+s[i])}
										}

		#cphat(i): proportional change in price due to commercial policy
		
				cphat =rep(NA,length(I))
				names(cphat) = I
		
				for (i in 1:length(I)){
						if (t[i]>0 & is.na(t[i])==FALSE){cphat[i] = tarhat[i]}
						if (s[i]>0 & is.na(s[i])==FALSE){cphat[i] = subhat[i]}
											}


# Print out the parameter calibrations:
		
			print(lambda)
			print(theta)
			print(sigma)
			print(t)
			print(dt)



# Declare endogenous variables

			yhat=rep(NA,length(I))
		
			ahat=matrix(nrow=length(F), ncol=length(I),data=NA); rownames(ahat)=F; colnames(ahat)=I;
		
			what=c(NA)
		
			rhat=c(NA)
		
			phat=rep(NA,length(I)); names(phat) = I;
		
			lhat=c(NA)
		
			khat=c(NA)
		
			psthat=rep(NA,length(I)); names(psthat) = I;

			omega=c(NA)





# Write the function that represents the system of equations:

g=function(x){

		# set endogenous variables equal to values of input vector x:
	  			
				yhat[1:2] = x[1:2]; names(yhat) = I;		# proportional change in production (i)
					
				ahat[1:4] = x[3:6]; rownames(ahat) = F; colnames(ahat) = I;		#proportional change in input (f,i)
     	
     			what  = x[7]		# proportional change in wage rate
     	
     			rhat = x[8]		#proportional change in capital rental rate
		
     			phat[1:2] = x[9:10]; names(phat) = I;		#proportional change in domestic price (i)
		
     			omega = x[11]		#dummy variable
	
	
	
		# Store the equations in the system in a vector called G.
		
		G=rep(NA,11)

					
				G[1] = sum(lambda["L",I]*yhat[I]) - (lhat-sum(lambda["L",I]*ahat["L",I]))		# fxelab:  fixed employment of labor
 		
				G[2] = sum(lambda["K",I]*yhat[I]) - (khat-sum(lambda["K",I]*ahat["K",I]))		#fxecap: fixed employment of capital
 
				G[3:4] = theta["L",I]*what + theta["K",I]*rhat - phat[I]		#acp(i): average cost pricing for industry i

				G[5:6] = ahat["L",I] - theta["K",I]*sigma[I]*(rhat-what)		#linp(i):  labor input equations for industry i

				G[7:8] = ahat["K",I] - theta["L",I]*sigma[I]*(what-rhat)		#kinp(i): capital input equations for industry i

				G[9:10] = phat[I] - (psthat[I] + cphat[I])		#domp(i): domestic prices for industry i
						
				G[11] = omega - dummy;		#objective function

		
		return(G)

				}



# Model closure (exogenous variables)

			lhat = 0.00;		#proportional change in labor endowment
			khat = 0.00;		#proportional change in capital endowment
			psthat["Ag"] = 0.00;		#proportional change in world price (i)
			psthat["Other"] = 0.00;		






# Solve the model

			# Load the solver library
			
					library(nleqslv)

			# Set initial values to 1
		
					x_initial=rep(1,11)

			# solve the system with above initial values using nleqslv:
		
					solve=nleqslv(x_initial,g)




# Organize the solutions improve presentation of results::

			solutions=list()

			solutions[[1]] = round(solve$x[1:2],digits=3); names(solutions[[1]]) = I;		# proportional change in production (i)
				
			solutions[[2]] = matrix(nrow=length(F), ncol=length(I), data=round(solve$x[3:6],digits=3));	rownames(solutions[[2]]) = F; colnames(solutions[[2]]) = I;		#proportional change in input (f,i)
     
     		solutions[[3]]  =round(solve$x[7]	,digits=3)	# proportional change in wage rate
     	
     		solutions[[4]] = round(solve$x[8]	, digits=3)	#proportional change in capital rental rate
		
     		solutions[[5]] =round(solve$x[9:10], digits=3); names(solutions[[5]]) = I;		#proportional change in domestic price (i)
		
			solutions[[6]]=round(lhat, digits=3)
		
			solutions[[7]]=round(khat, digits=3)
		
			solutions[[8]]=round(psthat, digits=3)
		
		# give names to each endogenous variable stored in the solutions list:
		
     		names(solutions)=c("yhat","ahat","what","rhat","phat","lhat","khat","psthat")
	
			print(solutions)

