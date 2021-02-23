#  Decomposition Algebra

		# Import and organize the data

		# Load the data
		
			#setwd(" . . ")
			SAM=read.csv("TestSAM.csv",row.names=1) #row.names=1 because the row.names of the matrix are in column 1.

		# Store the dimensions of X

				n_row=dim(SAM)[1]
				n_col=dim(SAM)[2]

		# Convert NA elements to be equal to 0
	
				SAM[is.na(SAM)==TRUE]=0

		# Create the A matrix from the SAM (ie, column normalize the SAM):
		
				# Create an empty A matrix

						A=matrix(nrow=n_row,ncol=n_col)

				# Fill the A matrix with the column normalized SAM

							for (i in 1:n_col){

									A[,i]=SAM[,i]/apply(SAM,2,sum)[i]	
	
											}
			
#  A_n and A0_n	
	
			# We start by defining three matrices: A_n, A0_n, and A*
		
				# Define A_n
				
					A_n = A[1:3,1:3]
				
				# Define A0_n
				
					A0_n = matrix(nrow=3,ncol=3,data=0)
						A0_n[1,1] = A[1,1]
						A0_n[3,3] = A[3,3]

# A* 
			# Note: in R code we write A* as A_star

			# Remember that A* = (I-A_n)^-1(A_n-A0_n)
						
						# Create a 3x3 Identity matrix
						I = matrix(nrow=3,ncol=3,data=0)
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
						M_a1[1,1]==solve(1-A[1,1])
						M_a1[2,2]==1
						M_a1[3,3]==solve(1-A[3,3])
# M_a2		
				# For M_a2 = (I = A* + A*^2), check elements of M_a2
			
						M_a2[2,1] == A_star[2,1]
						M_a2[3,1] == A_star[3,2]%*%A_star[2,1]
						M_a2[1,2] == A_star[1,3]%*%A_star[3,2]
						M_a2[3,2] == A_star[3,2]
						M_a2[1,3] == A_star[1,3]
						M_a2[2,3] == A_star[2,1]%*%A_star[1,3]
						
# M_a3

				# For M_a3 = (I_A*^3)^-1, check that M_a3
						M_a3[1,1] == solve(1-A_star[1,3]%*%A_star[3,2]%*%A_star[2,1])
						M_a3[2,2] == solve(1-A_star[2,1]%*%A_star[1,3]%*%A_star[3,2])
						M_a3[3,3] == solve(1-A_star[3,2]%*%A_star[2,1]%*%A_star[1,3])

			
		
# Additive Multipliers
						
						# I
						I=I # Identity multiplier
						
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
	
				M_a_rotate=matrix(rev(M_a),nrow=3,byrow=TRUE)[(3:1),]
				
				image.plot(M_a_rotate)
		
		# Add text labels that inclue the value of each matrix element:
		
			for (x in 1:dim(M_a)[1]){
					for (y in 1:dim(M_a)[2]){
								
								text((x-1)/(dim_M-1), (y-1)/(dim_M-1), sprintf("%0.2f", M_a_rotate[x,y]))
		
								}}
		
	
	
	

				
	
	