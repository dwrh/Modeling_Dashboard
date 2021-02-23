[0]# Installing Packages


	#	R uses mostly outside packages to handle shape file data. Some useful packages are:
	
			install.packages("sp")
			install.packages("e1071")
			install.packages("classInt")
			install.packages("maptools")
			install.packages("fields")
			install.packages("raster")
			library(sp)
			library(e1071)
			library(classInt)
			library(maptools)
			library(fields)
			library(raster)



# [1] Subsetting in R

	#	One very useful feature in R is being able to pull out part of data from vectors, matrices, or data frames by subsetting. 
	#	You can pull out subsets of all of these objects using R's indexing system which uses square brackets [] at the end of an object name.
	#	In addition, for objects whose elements have names you can subset using names of elements/vectors by writing object$name.
	

	#(i) Indexing with []

		# Vectors
		
				x=seq(from=10,to=100,by=10)
				x
		
				x[1]
				x[5]
				x[10]
		
		# You can use : to subset multiple components
		
				x[1:4]
				x[2:10]
		
		# You can also use any combination of numbers that are within the range of the index.
		# In this case, the vector x has 10 numbers so you can include as many indeces as you want, as long as they are between 1 and 10:
		
				x[c(1,3,5)]
		
				y=rep(4,15)
				y
				x[y]
		
				x[seq(from=1,to=7,by=2)]
		
		# You can also use subsetting to change the values inside a vector:
		
				x
		
				x[1]=0
		
				x
		
				x[2:5]=0
		
				x
		
				x[c(6,7,8,9,10)]=0
		
				x
		
		# Finally, you can negative subset to remove elements from an object:
		
				x=seq(from=10,to=100,by=10)
				x
		
				x[-1]
		
				x[-(1:5)]
		
				x=x[-c(1,3,5,7,9)]
		
		
		# Matrices/Data Frames
		
		# 	When you subset matrices or data frames you need to specify which index is for rows and which is for columns. 
		#	In R, indexes are always written (row,column) 
		
				M=matrix(nrow=3,ncol=3,data=c(1,2,3,4,5,6,7,8,9))

				M

				M[1,1]
				M[2,1] 
				M[3,2]
	
	
		# If you leave the index for row (column) blank then you get that entire row (column)
		
				M[1,]
			
				M[,1]
			
				M[1,c(1,3)]
			
				M[1:2,]
			
				M[1,2:3]
			
				M[1:3,1:3]
	
	
		# You can also use a vector with TRUE's and FALSE's (as long as it is the same length as the object) to tell R which objects to include:
		
				index=c(TRUE,FALSE,TRUE)
		
				M[index,index]
						
						# This is the same as typing M[c(1,3), c(1,3)]
					
				M[index,]
				
						# This is the same as typing M[c(1,3),]
		
				index=c(TRUE,FALSE)
		
				M[index,index]
		
		# Negative subsetting with matrices are the same idea as negative subsetting with vectors. 
		
		# The operation below prints everything in the matrix EXCEPT for the second column.
			
				M[,-2]
		
	
	
	#(ii) Subsetting with $

		# For objects with element names you can pull out elements in the format object$name:
			
				setwd(". . ./R_Materials")

				data_temp=read.csv("Data/TemperatureExample.csv")
		
				class(data_temp)

				names(data_temp)
	
				dim(data_temp)
		
		# head() is a useful function used to see only the beginning of the object
	
				head(data_temp)
	
		# We can pull out individual vectors from the data frame using the $
	
				data_temp$province_id
	
				data_temp$province_name
	
				data_temp$temp_2008_1
				
		# Or we can pull out multiple vectors from the data using $ and [] together.
		
				data_temp[c("province_id","province_name","temp_2008_1")]	
			
		# Note that while data_temp is a matrix, data_temp$province_id is a vector.
		# As discussed above, you can subset this vector with [].
		
				data_temp$province_name[1:10] 
				
					# This gives you the first element of the vector province_id which is stored in the data frame data_temp.



	
# [2] Logical Tests

		# Logical tests can be used to test whether or not something is true about an object or an element.
		# These types of tests will always return TRUE or FALSE. TRUE=1 and FALSE=0.
	
		# One set of test are is.datatype functions: is.numeric(), is.character(), is.matrix(), is.data.frame(), is.na()

			is.matrix(data)
	
			is.data.frame(data)
	
		# You can also test whether A=B by writing A==B (A=B will change the value of A be the value of B)
		# To test whether something is NOT equal, you can use !=.
		# Similarly, with all numerics you can use A>B, A<B, A>=B, A<=B.
		
			x=3
	
			x==4
			x!=4	
			
			x==3
			x!=3
	
		# When you use logcial tests on a vector, matric, data frame, etc. R applies the test to all elements
		# that are inside that object (this is similar to the way R applies * to every element inside a vector)
	
			x=c(1,2,3,4,5)
	
			x==3
				
			data=read.csv("Data/TemperatureExample.csv")
	
			data$province_name=="Chiang Mai"
	
			data$province_name=="Thailand"
			
		# However, you cannot use == to test whether or not a value is missing. Instead you must use the function is.na()
		
			a=c(1,2)
			
			length(a)=3
			
			a
			
			a==NA
			
			is.na(a)
					

		# [i] Combining logical tests with functions and subsetting.

		# Because TRUE is the same as 1 and FALSE is the same as 0, you can combine functions with logical statements.
	
			sum(data$province_name=="Chiang Mai")
	
			sum(data$temp_2008_4>30)
	
		# One VERY USEFUL tool is using logical tests to subset rows of data:
	
			data[data$province_name=="Chiang Mai",]

			data[data$temp_2008_4>30,]
	
	# Why does this work?
	
		# 	step 1: 	data$province_name=="Chiang Mai" creates a vector of length 78 with FALSE's for every row that is not
		#				equal to "Chiang Mai" and TRUE's for every row that is equal to "Chiang Mai"
		
		#	step 2:		R ignores all ROWS=FALSE (since we have a comma after the statement its ROWS and not COLUMNS that are being subset) and includes all ROWS=TRUE






# [3] INTRODUCTION TO MAPS IN R


	# Four types of mapping data are: 
	
			#(1) polygons (shape files)
			
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



#[4] Example Mapping evenly distributed data.
	

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





# [5] Examples of combining other tools with mapping

	# Issue 1: I don't like the colors that are on the elevation grid. How do I change them?
		
	# Solution: Create a new color scheme using class intervales (since grids tend to continuous data)

			# Mapping from grids

					elev=raster("Maps/Elevation.grd")

					colors_elev=terrain.colors(12)

					plot(elev,col=colors_elev)
					plot(Provinces,add=TRUE,lwd=0.25)

	

	# Issue 2: The data that I want to use are not continuous. How do I create a color scheme with discontinuous data that looks good?
		
	# Solution: Create weights according to the value of the data for each province. Then use the weights to determine the
	#			color scheme.


			# If there are lots of zeros using intervals to but the data in groups method misrepresents the data.

				Resources=read.csv("Data/Resources.csv")
			
			# First, let's look at the data a little.
			
					summary(Resources$Orchid)
					sum(Resources$Orchid==0)
					sum(Resources$Orchid>0)
					sum(Resources$Orchid>1000)
					sum(Resources$Orchid>5000)
			
			# What does it look like if we plot these data by dividing them into groups:

					pallete=two.colors(n=256,start='white',middle='lightblue',end='green')
					quantiles = classIntervals(Resources$Orchid, n = 5, style = "quantile",digits=2)
					colors = findColours(quantiles, pallete)

					plot(Provinces,col=colors)
					
					title(main="Orchid Production (rai)")
					legend("bottomright", fill = attr(colors, "palette"),
       						legend = names(attr(colors, "table")),
       						bty="n", cex = 0.8, y.intersp = 1.5)


			# If the data are not continuous it may be better to 

					weights=(Resources$Orchid/sum(Resources$Orchid))

					col_white=rgb(1,1,1)
					plot(Provinces,col=col_white)

					col_black=rgb(0,0,0)
					plot(Provinces,col=col_black)
					
			# Incorporating the weights into the color scheme:
					colors=rgb(1,1-weights,1)
					plot(Provinces,col=colors)
					title("Orchid Production in Thailand")



			# Alternative: provinces that grow any orchids:
			
					Resources$Province[Resources$Orchid>0]

					weights=(Resources$Orchid>0)/2
					colors=rgb(1-weights,1-weights,1)

					plot(Provinces,col=colors)
					title("Provinces with Orchid Production")




	# Issue 3: The HPAI shape file has points for all of the Mekong Region. How do we map only the points in Thailand?
		
	# Solution: Use subsetting to edit the file so that we only include observations in Thailand.

					names(HPAI)
					dim(HPAI)
				
				# "country_fa" is the FAO country code.
				
					unique(HPAI$country_fa) 

				# According to Google, the FAO country code for Thailand is 240.
				# Use subsetting to redefine HPAI as only the Thailand data:
				
					HPAI=HPAI[HPAI$country_fa==240,]
					
				# But R does not know how to deal with missing values.
				
					# How many values are missing?
					
					is.na(HPAI$country_fa)
					sum(is.na(HPAI$country_fa)==TRUE)
				
				# There are only 9 missing values so we can drop them.
				
					HPAI=HPAI[is.na(HPAI$country_fa)==FALSE,]

				# Now we can try again to redefine HPAI to be only the Thailand data:
				
					HPAI=HPAI[HPAI$country_fa==240,]
					
				# The result:
				
					plot(HPAI)
					plot(Provinces, add=TRUE)
					
				# But there is still one point that is clearly a mistake because it is in the ocean.
				
					
				# Again, we can remove it with subsetting.
				
					axis(1)
					
				# Can we remove it if we take away all points on the left side of 96.5?
					
					abline(v=96.5,col="red")
					abline(v=106.5,col="red")
				
				# Yes. So subset all points that are greater than or equal to 96.5.
					
					HPAI=HPAI[HPAI$point_x>=96.5,]
					HPAI=HPAI[HPAI$point_x<=106.5,]
					
					# Alternatively, you could do the subsetting in one line:
					
					HPAI=HPAI[HPAI$point_x>=96.5 & HPAI$point_x<=106.5,]

					
					plot(HPAI)
					plot(Provinces, add=TRUE)
					
				# Finally, we can change the plot settings to make the map look better.
				
					plot(Provinces, lwd=0.2)
					plot(HPAI, add=TRUE, cex=0.35,col='red',pch='o')
					title("HPAI Outbreaks in Thailand")
					



# [4] Practice: 

			#	Now I will go through an example of what you might do if you wanted to map your own data.
			#  For this activity you could follow these directions and use your own data to make a map from Excel data. Your data should have one column of province 
			#	names in English and one or more columns of data that you would like to map with a column name that describes it.
			
			#	If you do not have data of your own that you would like to map, you can use the file "EnergyExp.csv" located in the Data folder.
			
	
	# 	Part I:	Preparing your data in Excel:
				
			# 	Step 1:		Open "YourData.csv" and make sure that you have 76 rows (one row for each province) and one column of English Province Names.	
							
			#	Step 2:		Sort "YourData.csv" by province name.
			
			#	Step 3:		Paste all of the information from "YourData.csv" into "EmptyData.csv", beginning in column D (do not paste over existing columns).
			
			# 	Step 4:		Compare the province names that you pasted from your data and the province names that were already in "EmptyData.csv". 
			#					Make sure the province names all match. If they do not, reorganize to make sure that all of the provinces match.
			
			#	Step 5:		Once you are certain that all of the province names match, delete the column of provine names that you pasted in from "YourData.csv"
			
			#	Step 6:		Save the new file as a .csv file with a name of your choice in the folder "Data".			
			
	
	# 	Part II:	Import data into R and organize it:
			
					
			#	Step 1:		Import your data into R.
			
									NewData=read.csv("Data/EnergyExp_new.csv")		

			# 	Step 2:		Check that your data imported correctly.
			
									names(NewData)
											
										# The names of your variable(s) should appear.
									
									dim(NewData)
			
										# You should have 78 rows. The number of columns depends on your data.
										
										
			#	Step 3:		Sort the object NewData by the variable plot order.
			
									NewData=NewData[order(NewData$plotorder),]

			
			#	Step 4:		Import the province shape files into R.
			
									Provinces=readShapePoly("Maps/Provinces")
		


	# 	Part III:	Select the color scheme for your map.
	
			#	At this point you have to make a choice about how to present your data on the map. As we discussed before, you need to determine
			#	whether you want to divide your data into groups or plot colors based on the value of the data for each province.
	
	
			#	[A] If you have continuous data then you may want to divide the data into quantile groups:
						
					#	Note: you can change the colors and the number of groups however you want.
	
	
							palletep=two.colors(n=256,start='Yellow',middle='light green',end='dark green')	

							quantiles = classIntervals(NewData$variablename, n = 5, style = "quantile", digits=2)

							colors = findColours(quantiles, pallete)

			
			#	[B] If you have lots of zeros in your data, you may want to color each province with the same color but a different density based on the data:

					#	Note: you can change the colors however you want [for example rgb(1-weights,1,1)]
				
							weights=(NewData$variablename/sum(NewData$variablename))
								
							colors=rgb(1,1-weights,1)


	#	Part IV:	Make a map:
			

							plot(Provinces,col=colors)
				
					
	#	Part V:		Add a title and legend and print your map.
	
							pdf(file="filename.pdf")
					
								plot(Provinces,col=colors)
					
								title("Title")
						
								legend("bottomright", fill = attr(colors, "palette"),
       								legend = names(attr(colors, "table")),
       								bty="n", cex = 0.8, y.intersp = 1.5)

							dev.off()

