
# Here the primary matrix is called X and you can define M by size and coordinates of the upper-left hand element of M in the first three lines

dim_M=2
start_Mrow=1
start_Mcol=1


# Define the Matrix to begin with as X

		X=matrix(nrow=3,ncol=3,data=runif(3*3))

# Store the dimensions of X

		n_row=dim(X)[1]
		n_col=dim(X)[2]

# Create an empty A matrix

		A=matrix(nrow=n_row,ncol=n_col)

# Fill the A matrix which is just a column normalized X matrix

		for (i in 1:n_col){

						A[,i]=X[,i]/apply(X,2,mean)[i]	
	
								}
						
# Create the M matrix which is a subset of A defined by the upper left hand element of M which is in turn determined by the variables start_Mrow and start_Mcol
						
			M=A[start_Mrow:(start_Mrow+dim_M-1),start_Mcol:(start_Mcol+dim_M-1)]


# Create an identity matrix the same dimensions as M

		I=matrix(nrow=dim_M,ncol=dim_M,data=0)
		diag(I)=1


# Create the multiplier matrix which is the inverse of (I-M)

		Multiplier=solve(I-M)