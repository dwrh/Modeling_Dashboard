#### DAY 1 - Training Course on Economywide Assessment of High Impact Animal Diseases in Cambodia  ######

		
	## [0] Installing and Opening R
	
	#In order to use a packages there are two steps:
			
			#[1] Install the package. This only has to be done once on a computer.
			#[2] Load the packages for use. This has to be done every time you start a new R session.
	
						install.packages("sp")  #[1]
						require(sp)  #[2]
						
						install.packages("maptools")
						require(maptools)
	

	# Set the working directory according to your own computer: setwd(".../Data")

		setwd("../Data")


	
# [1] 	Objects in R:
	
	#	R stores things called "objects" in its memory which can include numbers, imported data sets, and functions that operate on numbers/data, among other things. 
	
	# 	You can type any numbers in R and they will print out the result but nothing is stored.
	
			3
			3+4
			7/3
	
	#	Use the equals sign (=) to create new objects by giving names to numbers, data, or the output of functions.
	
			w=3
			x=4
			y=w+x
			z=y/x
			
	
	# 	You can see what the object is by typing its name (this is equivalent to using the print() function).
	
			w
			x
			y
			z
			print(z)


# [2] Functions
	
	# 	Almost every command you execute in R uses one or more functions. Functions are called by their name followed by parentheses ().
	#	For most functions, there are arguments that need to be specified inside the parentheses that tell the function more about
	#	what you want it to do. Even if there are no arguments, you still need to use parenthese.
			
			ls()
			help(sum)
		
			
	#	You can remove objects with the rm() function.
			
			x=3
			x
			rm(x)
			x

	# 	Most functions have specific arguments that can be used with that function. For example, the sequence function creates an object
	#	that is a sequence of numbers.
	
			seq(from=1,to=10,by=2)
	
	# Some useful functions include:
	
		#				lm()
		#{tseries}		arma()
		#{tseries}		arima()
	
	
	

# [3] Storage Types
	
	# [i] Vectors:
	
		#	The c() function concatonates, or combines, the arguments that you list inside the parentheses into one vector object.
	

			y1=c(1,2,3)

			y2=c("a","b","c")
	
			y3=c("a","b",1,2,3)
	
			y1
			y2
			y3
				
		# You can test the size of the vector with length()
		
			length(y1)
		
			length(y3)
		
		
	#	[ii] Matrices:
	
	 	#	Matrices can store multiple vectors (of the same type and length) in one object.
	
		# 	The function matrix() is used to create matrices.
	
			matrix(nrow=2,ncol=2)

			z_matrix=matrix(nrow=5,ncol=3,data=y3)
			
			z_matrix
				
		# you can test the size of a matrix with dim()
	
			dim(z_matrix)	
			
		


	# [iii]	Data Frames
	
		# Data frames are similar to matrices but differ in at least two important ways. 
	
			#		(1) Data frames can store characters and numbers in the same object.
			#		(2) Data frames can have row and column names. Matrices cannot. This is useful for data sets with variable names.
	
		#	Because of these differences, most data sets that you import into R will be imported as data frames.
	
			z_df=data.frame(y1,y2,y1)
			z_df
			
		# and we can give names to the columns	
			
			names(z_df)
			
			names(z_df) = c("column1", "column2", "column3")
		
			z_df



		# For both matrices and data frames, you can access rows(columns) of the data by using object.name[row,column] index.
		
		# For example, 
		
		matrix = matrix(nrow = 3, ncol = 3, data = 1:9)
			
			matrix
			matrix[1,1]
			matrix[3,3]
			matrix[1,]
			matrix[,2]
			
			z_df
			z_df[,"column2"]
			z_df[1,"column2"]

				

# [3] Reading and writing data
		
	# It is simple to read/write Excel from R.
		
		# R data
		load("CambodiaShapefile.RData")	
		contents = load("CambodiaShapefile.RData")
		contents
		Cambodia = gadm
		rm(gadm)
			
		# csv files
			
		read.csv(file="HPAI_outbreaks_Cambodia.csv")
				
		data=read.csv(file="HPAI_outbreaks_Cambodia.csv")
		data
		names(data)
		
		data[,c("lat","lon")]
		
		
		# Other options (in the "foreign" package) include read.dta()/write.dta(), read.table()/write.table(), read.spss()/write.spss(), read.sas()/write.sas()
				



# [4] Plots in R:

	#	R has very powerful graphics packages that can be used to make of almost any type of graphic you can think of.
	
	# 	For this introduction to R graphics we will use the file "Resources.csv" which contains 2008 Land Use data by province for Thailand (units are Rai).

		
				plot(Cambodia)
				points(data[,c("lat","lon")], col = "red")
				# points is a plotting function for adding points on top an existing plot					
			
	


			
			
			
