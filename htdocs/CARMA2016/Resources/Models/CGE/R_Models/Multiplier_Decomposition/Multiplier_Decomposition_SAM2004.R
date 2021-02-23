#  Decomposition Algebra

		# Import and organize the data

		# Load the data
		
			#setwd(" . . /R_Materials")
				SAM=read.csv("ThaiMacro_SAM2004.csv",row.names=1)
				#SAM=read.csv("ThaiSAM2006.csv",row.names=1) row.names=SAM[,1] because the row.names of the matrix are in column 1.

			
			# Resources=function(water,land){
	
			# SAM[81,1:4]=(SAM[80,1:4]*water)
			# SAM[82,1:4]=(SAM[80,1:4]*land)
			# SAM[80,1:4]=(SAM[80,1:4]*(1-water-land))

				# }
				
			#			water=0.1; land=0.2;	


		# Convert NA elements to be equal to 0
	
				SAM[is.na(SAM)==TRUE]=0

		
		# Create the A matrix from the SAM (ie, column normalize the SAM):
		
				# Create an empty A matrix

						A=matrix(nrow=dim(SAM)[1],ncol=dim(SAM)[2])

				# Fill the A matrix with the column normalized SAM

							for (i in 1:dim(SAM)[1]){

									A[,i]=SAM[,i]/apply(SAM,2,sum)[i]	
	
											}
				
				# 0/0 is NA in R so replace NA's with 0
											
							A[is.na(A)==TRUE]=0

	
				# Give A names:
							
							rownames(A)=colnames(A)=rownames(SAM)
				
				# Check that rows and columns sum to one, repsectively:
											
							apply(A,2,sum)
				
				# Leave out the exogenous factors for now:
					
					# Big matrix
					# A=A[1:93,1:93,]
						
					# Small matrix
						
							A=A[1:6,1:6]
			
#  A_n and A0_n	
	
			# We start by defining three matrices: A_n, A0_n, and A*
		
				# Define A_n
				
				n_row=dim(A)[1]; n_col=dim(A)[2];
				
					A_n = matrix(nrow=n_row,ncol=n_col,data=0)
	
	# Big matrix
	#				group1=1:78; group2=79:82; group3=83:93;
	
	#Small matrix
					group1=1:2; group2=3:4; group3=5:6;
					
					A11=A[group1,group1]
					A21=A[group2,group1]
					A32=A[group3,group2]
					A13=A[group1,group3]
					A33=A[group3,group3]
					
					
					# A11
						A_n[group1,group1]=A11
					
					#A21
						A_n[group2,group1]=A21
						
					#A32
						A_n[group3,group2]=A32
						
					#A13
						A_n[group1,group3]=A13
								
					#A33
						A_n[group3,group3]=A33

				#Give names:
						rownames(A_n)=colnames(A_n)=rownames(A)
				
				# Define A0_n
				
					A0_n = matrix(nrow=n_row,ncol=n_col,data=0)
					
						A0_n[group1,group1] = A11
						A0_n[group3,group3] = A33
						
				# Give names:
						rownames(A0_n)=colnames(A0_n)=rownames(A)


# A* 
			# Note: in R code we write A* as A_star

			# Remember that A* = (I-A_n)^-1(A_n-A0_n)
						
						# Create an nxn Identity matrix
						I = matrix(nrow=n_row,ncol=n_col,data=0)
						diag(I)=1
						
				# Calculate A_star
				
				A_star = solve(I - A0_n) %*% (A_n - A0_n)	
				
				
# M_a3 M_a2 M_a1

			# We can define the SAM multiplier M_a as the production of three matrices:
					# M_a = M_a3M_a2M_a1
				
					M_a1 = solve(I-A0_n)
					M_a2 = (I + A_star + A_star%*%A_star)
					M_a3 = solve(I - A_star%*%A_star%*%A_star)
				
					M_a = M_a3%*%M_a2%*%M_a1
					
					
#	M_a1

				# For M_a1 = (I-A0_n)^-1, check elements of M_a1
					
					I_11=matrix(nrow=dim(A11)[1],ncol=dim(A11)[2],data=0)
						diag(I_11)=1
					I_22=matrix(nrow=dim(A21)[1],ncol=dim(A21)[1],data=0)
						diag(I_22)=1
					I_33=matrix(nrow=dim(A33)[1],ncol=dim(A33)[2],data=0)
						diag(I_33)=1
		
					
						all.equal(M_a1[group1,group1], solve(I_11-A11))
						all.equal(M_a1[group3,group3],solve(I_33-A33))
						
						M_a1[group2,group2] 
						I_22
						
						
# M_a2		
				# For M_a2 = (I = A* + A*^2), check elements of M_a2
			
						all.equal(M_a2[group2,group1], A_star[group2,group1])
						all.equal(M_a2[group3,group1], A_star[group3,group2]%*%A_star[group2,group1])
						all.equal(M_a2[group1,group2], A_star[group1,group3]%*%A_star[group3,group2])
						all.equal(M_a2[group2,group3], A_star[group2,group1]%*%A_star[group1,group3])
						
						round(M_a2[group3,group2] ,digits=3)==round(A_star[group3,group2],digits=3)
						
						all.equal(M_a2[group1,group3], A_star[group1,group3])
						
# M_a3

				# For M_a3 = (I_A*^3)^-1, check that M_a3
						all.equal(M_a3[group1,group1], solve(I_11-A_star[group1,group3]%*%A_star[group3,group2]%*%A_star[group2,group1]))
						all.equal(M_a3[group2,group2], solve(I_22-A_star[group2,group1]%*%A_star[group1,group3]%*%A_star[group3,group2]))
						all.equal(M_a3[group3,group3], solve(I_33-A_star[group3,group2]%*%A_star[group2,group1]%*%A_star[group1,group3]))

			
		
# Additive Multipliers
						
						# I
						I=matrix(nrow=n_row,ncol=n_col,data=0) # Identity multiplier
						diag(I)=1
						
						#T
						T_mat = (M_a1-I) # Net transfer multiplier
						
						#O
						O=(M_a2-I)%*%M_a1 
						all.equal(O, M_a2%*%M_a1-M_a1) # Open-loop multiplier
						
						#C
						C = (M_a3-I)%*%M_a2%*%M_a1 
						all.equal(C , M_a3%*%M_a2%*%M_a1 - M_a2%*%M_a1) # Closed-loop multiplier
						
			
			# Check whether M_a = I + T + O + C
	
						all.equal(M_a , I + T_mat + O + C)
						

				
# Bonus: Color coding multiplier matrices:

		# Load the fields library so that you can use the function image.plot()
		
				library(fields)

		# Set the dimensions of the multiplier:
			
				dim_M=dim(M_a)[1]
		
		# Plot the multiplier matrix with color codes, but because of how image.plot works, we need to rotate the matrix first:
	
	
		plotMat=function(x,name){
			N=dim(x)[1]
			M_rotate=matrix(rev(x),nrow=N,byrow=TRUE)[(N:1),]
			M_rotate[M_rotate==0]=min(M_rotate[M_rotate>0])/2
			image.plot(log(M_rotate),xaxt="n",yaxt="n",main=name)
			
				for (x in 1:N){
					for (y in 1:N){
								
								text((x-1)/(N-1), (y-1)/(N-1), sprintf("%0.2f", M_rotate[x,y]))
		
								}}
	
						}


	# Plot four matrices: M_a, T, O, and C:
	
		
		# T
			quartz()
			plotMat(T_mat,"T")
			
		# O
			quartz()
			plotMat(O,"O")
			
		# C	
			quartz()
			plotMat(C,"C")

		#M_a:
		
			plotMat(M_a,"M_a")	
	