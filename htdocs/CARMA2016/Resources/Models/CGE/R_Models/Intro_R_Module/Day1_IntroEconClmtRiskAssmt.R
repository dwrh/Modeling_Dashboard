# DAY 1 - INTRODUCTION TO THE ECONOMICS OF CLIMATE RISK ASSESSMENT (WORKSHOP)

	
	# Set the working directory according to your own computer: setwd(".../R_Materials")

		# My Mac path 
		#setwd("/Summer_2011/BKK_Training_09.2011/R_Mac/R_Materials")
		# My windows path
		setwd("C:/R_Windows/R_Materials")


	
# [1] 	Objects in R:
		
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
	
	# Even if there are no arguments, you still need to use parenthese.
			
			ls()
			help()
			help(sum)
		
			
	#	You can remove objects with the rm() function.
			
			x=3
			x
			rm(x)
			x
			
		#  Clear your workspace (if you have something there already)
		
		rm(list = ls(all = TRUE))



	# 	Most functions have specific arguments that can be used with that function. For example, the sequence function creates an object
	#	that is a sequence of numbers.
	
			seq(from=1,to=10,by=2)
	
			seq(1,10,2)
			
			seq(by=2,to=10,from=1)
			
			seq(2,10,1)
	
	
	

# [3] Data Storage Types
	
	# [i] Vectors:
	
		#	The c() function concatonates, or combines, the arguments that you list inside the parentheses into one vector object.
	

			y1=c(1,2,3)

			y2=c("ไ","ท","ย")
	
			y3=c("ใคร","ขาย", "ไข่","ไก่",1,2,3)
	
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

	# [iv] Lists
	
	# Lists can be anything:
	
		ex_list=list(z_matrix,z_df,y1,y2,y3)
		
		ex_list
				




# [3] Reading and writing data
		
	# It is simple to read/write Excel from R.
			
		read.csv(file="Data/TemperatureExample.csv")
				
		data_temp=read.csv(file="Data/TemperatureExample.csv")

		names(data_temp)
		
		write.csv(data_temp,file="Data/TemperatureExample_Written.csv")
		
		# Other options (in the "foreign" package) include read.dta()/write.dta(), read.table()/write.table(), read.spss()/write.spss(), read.sas()/write.sas()
				
		
	# 	Once, you have read in data, the attach() function allows you to easily access the variables in that data:
		
		province_id
			
		attach(data_temp)

		province_id
		
	#	Now we can use R functions to learn about the data. For example:
	
		summary(temp_2008_1)	
		
		
	# Alternativley, you can load R data. This automatically adds new objects to your workspace.
	
		load(file="Data/BayesData.Rdata")
		

# [4] Plots in R:

	# 	For this introduction to R graphics we will use the file "Resources.csv" which contains 2008 Land Use data by province for Thailand (units are Rai).

		
				data_res=read.csv(file="Data/Resources.csv")
			
				names(data_res)
			
	# (i)  Primary plots with the plot() function.
	
		# plot() is called a primary graphics function in R because when you call this function R opens up a new plot window and you can control
		# the settings of the plot window by changing arguments inside the plot function.
					
				attach(data_res)
				
		#	If you only include one argument then R will assume that the x variable is an index and it will plot your data on the y-scale:
			
				plot(Major.rice)
				
		
		# (ii)  Secondary Plotting functions.
		
				# After you have used plot(), there are secondary plotting functions that can be used to add additional data to the existing plot.
				# Secondary plotting functions will not open a new window and can only be called if a graphics window is already open.

					#	It's also very easy to run a regression and add that line to the plot:
		
						plot(Second.rice, Major.rice,main="Major versus Secondary Rice Land Use (Rai)", xlab="Second Rice", ylab="Major Rice", col="blue")
		
							regression=lm(Major.rice ~ Second.rice)
							abline(regression,col='red')	
		
		
		# Example of using secondary plotting functions:
		
				load(file="Data/BayesData.Rdata")

		# Create "time-series" objects with the temperature and precipitation:
		
		ts_temp = ts(data=t(temp_prov),start=c(1910,1),end=c(2005,1),deltat=5)
		ts_precip=ts(data=t(precip_prov),start=c(1910,1),end=c(2005,1),deltat=5)

			# Primary Plot
			plot(ts_temp[,1],type='l',ylim=c(21,29.5),xaxp=c(1910,2005,19),xlab="Year",ylab="Temperature (C)",main="Ave Monthly Temperature by Province",xlim=c(1910,2005),col="darkgray")
		
			# Secondary Plots
				for (i in 2:76){
				lines(ts_temp[,i])
								}
		
				# Primary Plot
		plot(ts_precip[,1],type='l',ylim=c(50,460),xaxp=c(1910,2005,19),yaxp=c(0,500,10),xlab="Year",ylab="Rainfall (cm/month)",main="Ave Monthly Rainfall by Province",xlim=c(1910,2005),col="darkgray")

				# Secondary Plots
					for (i in 2:76){
							lines(ts_precip[,i])
								}








# [5] INTRODUCTION TO MAPS IN R

	# 	There are several different types of map data that can be plotted in R. Shape Files, which are commonly
	#	used with programs like ArcGIS, are the most common type of map data. These
	#	files can also can be combined with outside data. In these cases the shape files generally draw important outlines (eg, provinces)
	# 	while the outside data is used to determine the color scheme for each shape.
	
	
	#	R uses mostly outside packages to handle shape file data. Some useful packages are:
	
			install.packages("classInt")
			install.packages("maptools")
			install.packages("fields")
			install.packages("raster")
			library(classInt)
			library(maptools)
			library(fields)
			library(raster)

			
	# 	Shape files are a collection of data frames and lists that include names of places, their coordinates,
	#	and other relevant information that make up the maps. They are a relatively complex collection of objects 
	#	so is important to know how to work with them without getting lost. 
	
	#	Shape files are stored as a collection of files all having the same name with a different ending. 
	#	Without all of the files in the same place, you cannot read the data.
	
	#	In addition, grids are similar to shape files and can be used to map continuous data over area.


	# Four types of mapping data are: 
	
			#(1) 	polygons (shape files)
			
			#(2)	points (shape files)
			
			#(3)	lines (shape files)
			
			#(4)	Grids
	
	
	# EXAMPLES plotting each data type:
	

			# Points:
									HPAI=readShapePoints("Maps/MekongHPAI")
									plot(HPAI)
									
			# Lines:	
									roads=readShapeLines("Maps/roads")
									plot(roads)
			
			
			# Polygons:
									Provinces=readShapePoly("Maps/Provinces")
									plot(Provinces)
			
			
			# Grid Data:
									elevation=raster("Maps/elevation")
									plot(elevation)
	
	
	# Combining multiple shape files on one map.
	
			# 	It is straightforward to combine multiple shape files into one map by including the add=TRUE argument
			#	in all but the first plot() function.
			
				plot(elevation)
				plot(Provinces, add=TRUE)
				plot(HPAI, add=TRUE)
		
			#	When adding multiple plots, order matters:

				plot(HPAI)
				plot(Provinces, add=TRUE)
				plot(elevation, add=TRUE)
				
				# The first plot() function determines the plot window and some types of data, like grids, will prevent you from seeing layers below.
				# Consequently, grids should always be plotted first.



#[3] Example Mapping evenly distributed data.
	
	rm(list = ls(all = TRUE))


	#	[i] Read in the data

			# Before you begin, check what variables exist in your workspace:

				ls()

		# [A] Read im the map of Thai provinces

				Provinces=readShapePoly("Maps/Provinces")

		# [B] Read in the CSV file with our climate data

				ClimateData=read.csv("Data/ClimateExample.csv")

			# We can look at the names of the variables

				names(ClimateData)


	#	[ii] Sort the data

			# Sort the data according to plot order to ensure that provinces are colored correctly
			# In this case the provinces are already sorted in the CSV file but it is important to remember that
			# the data to be mapped must be sorted according to the plot order in the shapefile before we assign colors.

				ClimateData=ClimateData[order(ClimateData$plotorder),]


	#	[iii] Assign colors to the data

			# Prepare the Color Scheme for Mapping Precipitation

				# Notice we can change the color scheme and we can also set the number of groups that we divide 
				# the data into by changing the option 'n' when we are defining the quantiles. 
				# Right now n is set to 5 groups for precipitation and 10 groups for temperature.

					pallete_precip=two.colors(n=256,start='Yellow',middle='light green',end='dark green')

					quantiles_precip = classIntervals(ClimateData$PrecipAve_2008, n = 5, style = "quantile",digits=2)

					colors_precip = findColours(quantiles_precip, pallete_precip)


			# Prepare the Colors Scheme for Mapping Temperature

					pallete_temp=two.colors(n=256,start='blue',middle='lightyellow',end='red')

					quantile_temp = classIntervals(ClimateData$TempAve_2008, n = 10, style = "quantile",digits=2)

					colors_temp = findColours(quantile_temp, pallete_temp)


	#	[iv] MAKE THE MAPS


		# We can display both of the maps at one time by changing the 

		# Plot the two maps in one window with one row and two columns

				#pdf(file="Plots/ClimateMaps_2008.pdf")


					par(mfrow=c(1,2))

					plot(Provinces,col=colors_precip)
					title(main='Average Monthly Rainfall 2008 (cm/month)',cex.main=0.7)
				
					legend("bottomright", fill = attr(colors_precip, "palette"),
       						legend = names(attr(colors_precip, "table")),
       						bty="n", cex = 0.6, y.intersp = 1.5)
       
					plot(Provinces,col=colors_temp)
					title(main='Average Monthly Temperature 2008 (C)',cex.main=0.7)
						
					legend("bottomright", fill = attr(colors_temp, "palette"),
       					legend = names(attr(colors_temp, "table")),
       					bty="n", cex = 0.6, y.intersp = 1.5)

				#dev.off()
				

		# Reset the parameters back to normal so next time we only have one plot

					par(mfrow=c(1,1))


			
			
			
