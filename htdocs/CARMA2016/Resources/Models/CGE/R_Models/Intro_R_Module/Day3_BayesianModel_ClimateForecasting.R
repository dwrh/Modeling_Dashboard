#	
#
#
# 		Because this is a Bayesian model we need to specify a prior each time we run the model.
# 		For this scenario we must define a prior that reflects the amount of variance we believe there to be in the weather.
# 		Here, we run the model with three different priors: low variance, medium variance, and high variance.
# 		The lambda and mu arguments specify the prior. Documentation of this process is available by typing help(szbvar).
#	
#		There are three outputs from this code. All are plots written to the "R_Materials/Plots" directory automatically.
#
#
#				[1] 	Time series plots of historical climate data as well as forecasts at the PROVINCE LEVEL 
#						under the three scenarios described above.
#
#				[2] 	Time series plots of historical climate data as well as forecasts at the NATIONAL LEVEL 
#						under the three scenarios described above.
#
#				[3] 	Maps of forecasted temperature and rainfall under the three scenario for the forecast years.





	# [i] Clear your workspace:

		rm(list = ls(all = TRUE))
	
	# [ii] Load the data

		# Set your current working directory to wherever you are keeping the folder titled "R_Materials"
		# Every individual will need to change the beginning of the statement below: 
		# "/Summer_2011/BKK_Training_09.2011" is specific to my computer, but everyone should end with "/R_Materials"

			setwd("/Summer_2011/BKK_Training_09.2011/R_Windows/R_Materials")
			load("Data/BayesData.Rdata")

	# The data are monthly temperature and rainfall averages at the province level every five years from 1910 to 2005.


	# [iii] Load the library necessary for running the Bayesian time-series model

		#install.packages("MSBVAR") # you only need to do this once
		library(MSBVAR)
		library(classInt)
		library(fields)



# [1] Run a Bayesian SBVAR model which uses past climate data to make forecasts for future periods.


	# [a] Convert the climate data into a time series object in R
	
		# Note that we divide the country into 5 parts.
		# We do this because it is too slow to run the model for the whole country.

		# Temperature

			ts_temp_1 = ts(data=t(temp_prov[1:15,]),start=c(1910,1),end=c(2005,1),deltat=5)
			ts_temp_2 = ts(data=t(temp_prov[16:30,]),start=c(1910,1),end=c(2005,1),deltat=5)
			ts_temp_3 = ts(data=t(temp_prov[31:45,]),start=c(1910,1),end=c(2005,1),deltat=5)
			ts_temp_4 = ts(data=t(temp_prov[46:60,]),start=c(1910,1),end=c(2005,1),deltat=5)
			ts_temp_5 = ts(data=t(temp_prov[61:76,]),start=c(1910,1),end=c(2005,1),deltat=5)

		# Rainfall

			ts_precip_1 = ts(data=t(precip_prov[1:15,]),start=c(1910,1),end=c(2005,1),deltat=5)
			ts_precip_2 = ts(data=t(precip_prov[16:30,]),start=c(1910,1),end=c(2005,1),deltat=5)
			ts_precip_3 = ts(data=t(precip_prov[31:45,]),start=c(1910,1),end=c(2005,1),deltat=5)
			ts_precip_4 = ts(data=t(precip_prov[46:60,]),start=c(1910,1),end=c(2005,1),deltat=5)
			ts_precip_5 = ts(data=t(precip_prov[61:76,]),start=c(1910,1),end=c(2005,1),deltat=5)



	# [b] Fit the models

	
	# Temperature
	
		# LOW variance prior
	
			model_fit_low_1t=szbvar(ts_temp_1,p=2,z=NULL,lambda0=0.1,lambda1=0.1,lambda3=2,lambda4=0.25,lambda5=0,mu5=100,mu6=100,prior=0)
			model_fit_low_2t=szbvar(ts_temp_2,p=2,z=NULL,lambda0=0.1,lambda1=0.1,lambda3=2,lambda4=0.25,lambda5=0,mu5=100,mu6=100,prior=0)
			model_fit_low_3t=szbvar(ts_temp_3,p=2,z=NULL,lambda0=0.1,lambda1=0.1,lambda3=2,lambda4=0.25,lambda5=0,mu5=100,mu6=100,prior=0)
			model_fit_low_4t=szbvar(ts_temp_4,p=2,z=NULL,lambda0=0.1,lambda1=0.1,lambda3=2,lambda4=0.25,lambda5=0,mu5=100,mu6=100,prior=0)
			model_fit_low_5t=szbvar(ts_temp_5,p=2,z=NULL,lambda0=0.1,lambda1=0.1,lambda3=2,lambda4=0.25,lambda5=0,mu5=100,mu6=100,prior=0)

		# MEDIUM variance prior
	
			model_fit_med_1t=szbvar(ts_temp_1,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=2,lambda4=0,lambda5=0,mu5=350,mu6=350,prior=0)
			model_fit_med_2t=szbvar(ts_temp_2,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=2,lambda4=0,lambda5=0,mu5=350,mu6=350,prior=0)
			model_fit_med_3t=szbvar(ts_temp_3,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=2,lambda4=0,lambda5=0,mu5=350,mu6=350,prior=0)
			model_fit_med_4t=szbvar(ts_temp_4,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=2,lambda4=0,lambda5=0,mu5=350,mu6=350,prior=0)
			model_fit_med_5t=szbvar(ts_temp_5,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=2,lambda4=0,lambda5=0,mu5=350,mu6=350,prior=0)

		# HIGH variance prior
	
			model_fit_high_1t=szbvar(ts_temp_1,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=2,mu5=0,mu6=0,lambda4=1,lambda5=1,prior=0)
			model_fit_high_2t=szbvar(ts_temp_2,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=2,mu5=0,mu6=0,lambda4=1,lambda5=1,prior=0)
			model_fit_high_3t=szbvar(ts_temp_3,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=2,mu5=0,mu6=0,lambda4=1,lambda5=1,prior=0)
			model_fit_high_4t=szbvar(ts_temp_4,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=2,mu5=0,mu6=0,lambda4=1,lambda5=1,prior=0)
			model_fit_high_5t=szbvar(ts_temp_5,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=2,mu5=0,mu6=0,lambda4=1,lambda5=1,prior=0)


	# Rainfall
	
		# LOW variance prior
	
			model_fit_low_1p=szbvar(ts_precip_1,p=2,z=NULL,lambda0=0.1,lambda1=0.1,lambda3=2,lambda4=0.5,lambda5=0.5,mu5=100,mu6=100,prior=0)
			model_fit_low_2p=szbvar(ts_precip_2,p=2,z=NULL,lambda0=0.1,lambda1=0.1,lambda3=2,lambda4=0.5,lambda5=0.5,mu5=100,mu6=100,prior=0)
			model_fit_low_3p=szbvar(ts_precip_3,p=2,z=NULL,lambda0=0.1,lambda1=0.1,lambda3=2,lambda4=0.5,lambda5=0.5,mu5=100,mu6=100,prior=0)
			model_fit_low_4p=szbvar(ts_precip_4,p=2,z=NULL,lambda0=0.1,lambda1=0.1,lambda3=2,lambda4=0.5,lambda5=0.5,mu5=100,mu6=100,prior=0)
			model_fit_low_5p=szbvar(ts_precip_5,p=2,z=NULL,lambda0=0.1,lambda1=0.1,lambda3=2,lambda4=0.5,lambda5=0.5,mu5=100,mu6=100,prior=0)

		# MEDIUM variance prior
	
			model_fit_med_1p=szbvar(ts_precip_1,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=0,lambda4=0,lambda5=0,mu5=350,mu6=350,prior=0)
			model_fit_med_2p=szbvar(ts_precip_2,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=0,lambda4=0,lambda5=0,mu5=350,mu6=350,prior=0)
			model_fit_med_3p=szbvar(ts_precip_3,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=0,lambda4=0,lambda5=0,mu5=350,mu6=350,prior=0)
			model_fit_med_4p=szbvar(ts_precip_4,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=0,lambda4=0,lambda5=0,mu5=350,mu6=350,prior=0)
			model_fit_med_5p=szbvar(ts_precip_5,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=0,lambda4=0,lambda5=0,mu5=350,mu6=350,prior=0)

		# HIGH variance prior
	
			model_fit_high_1p=szbvar(ts_precip_1,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=0,mu5=0,mu6=0,lambda4=1,lambda5=1,prior=0)
			model_fit_high_2p=szbvar(ts_precip_2,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=0,mu5=0,mu6=0,lambda4=1,lambda5=1,prior=0)
			model_fit_high_3p=szbvar(ts_precip_3,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=0,mu5=0,mu6=0,lambda4=1,lambda5=1,prior=0)
			model_fit_high_4p=szbvar(ts_precip_4,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=0,mu5=0,mu6=0,lambda4=1,lambda5=1,prior=0)
			model_fit_high_5p=szbvar(ts_precip_5,p=2,z=NULL,lambda0=1,lambda1=1,lambda3=0,mu5=0,mu6=0,lambda4=1,lambda5=1,prior=0)

	


	# [c] Forecast future periods
	
		# Since the data go up until 2005, in 5 year intervals, we predict 9 periods 
		# ahead to obtain estimates for 2020, 2030, 2040, and 2050.


	
	# Temperature

		# Low variance prior
		
			predictions_low_1t=forecast(model_fit_low_1t,nsteps=9)
			predictions_low_2t=forecast(model_fit_low_2t,nsteps=9)
			predictions_low_3t=forecast(model_fit_low_3t,nsteps=9)
			predictions_low_4t=forecast(model_fit_low_4t,nsteps=9)
			predictions_low_5t=forecast(model_fit_low_5t,nsteps=9)
			rownames(predictions_low_1t)=rownames(predictions_low_2t)=rownames(predictions_low_3t)=rownames(predictions_low_4t)=rownames(predictions_low_5t)=seq(from=1910,to=2050,by=5)
	
		# Medium variance prior
		
			predictions_med_1t=forecast(model_fit_med_1t,nsteps=9)
			predictions_med_2t=forecast(model_fit_med_2t,nsteps=9)
			predictions_med_3t=forecast(model_fit_med_3t,nsteps=9)
			predictions_med_4t=forecast(model_fit_med_4t,nsteps=9)
			predictions_med_5t=forecast(model_fit_med_5t,nsteps=9)
			rownames(predictions_med_1t)=rownames(predictions_med_2t)=rownames(predictions_med_3t)=rownames(predictions_med_4t)=rownames(predictions_med_5t)=seq(from=1910,to=2050,by=5)
	
		# High variance prior
		
			predictions_high_1t=forecast(model_fit_high_1t,nsteps=9)
			predictions_high_2t=forecast(model_fit_high_2t,nsteps=9)
			predictions_high_3t=forecast(model_fit_high_3t,nsteps=9)
			predictions_high_4t=forecast(model_fit_high_4t,nsteps=9)
			predictions_high_5t=forecast(model_fit_high_5t,nsteps=9)
			rownames(predictions_high_1t)=rownames(predictions_high_2t)=rownames(predictions_high_3t)=rownames(predictions_high_4t)=rownames(predictions_high_5t)=seq(from=1910,to=2050,by=5)
	
	
		# Put all of the prediction regions back together into one matrix for each level (low, med, high)
	
			predictions_all_temp_low=cbind(predictions_low_1t,predictions_low_2t,predictions_low_3t,predictions_low_4t,predictions_low_5t)
			predictions_all_temp_med=cbind(predictions_med_1t,predictions_med_2t,predictions_med_3t,predictions_med_4t,predictions_med_5t)
			predictions_all_temp_high=cbind(predictions_high_1t,predictions_high_2t,predictions_high_3t,predictions_high_4t,predictions_high_5t)

			rownames(predictions_all_temp_low)=rownames(predictions_all_temp_med)=rownames(predictions_all_temp_high)=seq(from=1910,to=2050,by=5)
			colnames(predictions_all_temp_low)=colnames(predictions_all_temp_med)=colnames(predictions_all_temp_high)=1:76
	
	
		# Pull out only the relevant prediction years:
			
			# Initialize the matrix:
				
			predictions_temp_low=predictions_temp_med=predictions_temp_high=matrix(nrow=4,ncol=76)
		
			# Low
		
			predictions_temp_low[1,]=predictions_all_temp_low[rownames(predictions_all_temp_low)==2020,]
			predictions_temp_low[2,]=predictions_all_temp_low[rownames(predictions_all_temp_low)==2030,]
			predictions_temp_low[3,]=predictions_all_temp_low[rownames(predictions_all_temp_low)==2040,]
			predictions_temp_low[4,]=predictions_all_temp_low[rownames(predictions_all_temp_low)==2050,]

			# Med
		
			predictions_temp_med[1,]=predictions_all_temp_med[rownames(predictions_all_temp_med)==2020,]
			predictions_temp_med[2,]=predictions_all_temp_med[rownames(predictions_all_temp_med)==2030,]
			predictions_temp_med[3,]=predictions_all_temp_med[rownames(predictions_all_temp_med)==2040,]
			predictions_temp_med[4,]=predictions_all_temp_med[rownames(predictions_all_temp_med)==2050,]

			# High
		
			predictions_temp_high[1,]=predictions_all_temp_high[rownames(predictions_all_temp_high)==2020,]
			predictions_temp_high[2,]=predictions_all_temp_high[rownames(predictions_all_temp_high)==2030,]
			predictions_temp_high[3,]=predictions_all_temp_high[rownames(predictions_all_temp_high)==2040,]
			predictions_temp_high[4,]=predictions_all_temp_high[rownames(predictions_all_temp_high)==2050,]

			# Assign Names
		
			rownames(predictions_temp_low)=rownames(predictions_temp_med)=rownames(predictions_temp_high)=c(2020, 2030, 2040, 2050)
			colnames(predictions_temp_low)=colnames(predictions_temp_med)=colnames(predictions_temp_high)=1:76

		
		# Put all predictions into a single object (a list):
		
			predictions_temp=list(predictions_temp_low, predictions_temp_med, predictions_temp_high)	

		
	
	# Rainfall

			# Low
		
			predictions_low_1p=forecast(model_fit_low_1p,nsteps=9)
			predictions_low_2p=forecast(model_fit_low_2p,nsteps=9)
			predictions_low_3p=forecast(model_fit_low_3p,nsteps=9)
			predictions_low_4p=forecast(model_fit_low_4p,nsteps=9)
			predictions_low_5p=forecast(model_fit_low_5p,nsteps=9)
			rownames(predictions_low_1p)=rownames(predictions_low_2p)=rownames(predictions_low_3p)=rownames(predictions_low_4p)=rownames(predictions_low_5p)=seq(from=1910,to=2050,by=5)
	
			# Medium
		
			predictions_med_1p=forecast(model_fit_med_1p,nsteps=9)
			predictions_med_2p=forecast(model_fit_med_2p,nsteps=9)
			predictions_med_3p=forecast(model_fit_med_3p,nsteps=9)
			predictions_med_4p=forecast(model_fit_med_4p,nsteps=9)
			predictions_med_5p=forecast(model_fit_med_5p,nsteps=9)
			rownames(predictions_med_1p)=rownames(predictions_med_2p)=rownames(predictions_med_3p)=rownames(predictions_med_4p)=rownames(predictions_med_5p)=seq(from=1910,to=2050,by=5)
	
			# High
		
			predictions_high_1p=forecast(model_fit_high_1p,nsteps=9)
			predictions_high_2p=forecast(model_fit_high_2p,nsteps=9)
			predictions_high_3p=forecast(model_fit_high_3p,nsteps=9)
			predictions_high_4p=forecast(model_fit_high_4p,nsteps=9)
			predictions_high_5p=forecast(model_fit_high_5p,nsteps=9)
			rownames(predictions_high_1p)=rownames(predictions_high_2p)=rownames(predictions_high_3p)=rownames(predictions_high_4p)=rownames(predictions_high_5p)=seq(from=1910,to=2050,by=5)
	
	
		
		# Put all of the prediction regions back together into one matrix for each level (low, med, high)
	
			predictions_all_precip_low=cbind(predictions_low_1p,predictions_low_2p,predictions_low_3p,predictions_low_4p,predictions_low_5p)
			predictions_all_precip_med=cbind(predictions_med_1p,predictions_med_2p,predictions_med_3p,predictions_med_4p,predictions_med_5p)
			predictions_all_precip_high=cbind(predictions_high_1p,predictions_high_2p,predictions_high_3p,predictions_high_4p,predictions_high_5p)

			rownames(predictions_all_precip_low)=rownames(predictions_all_precip_med)=rownames(predictions_all_precip_high)=seq(from=1910,to=2050,by=5)
			colnames(predictions_all_precip_low)=colnames(predictions_all_precip_med)=colnames(predictions_all_precip_high)=1:76
	
	

		# Pull out only the relevant prediction years:
		
			# Initialize:
		
			predictions_precip_low=predictions_precip_med=predictions_precip_high=matrix(nrow=4,ncol=76)
		
			# Low
		
			predictions_precip_low[1,]=predictions_all_precip_low[rownames(predictions_all_precip_low)==2020,]
			predictions_precip_low[2,]=predictions_all_precip_low[rownames(predictions_all_precip_low)==2030,]
			predictions_precip_low[3,]=predictions_all_precip_low[rownames(predictions_all_precip_low)==2040,]
			predictions_precip_low[4,]=predictions_all_precip_low[rownames(predictions_all_precip_low)==2050,]

			# Med
		
			predictions_precip_med[1,]=predictions_all_precip_med[rownames(predictions_all_precip_med)==2020,]
			predictions_precip_med[2,]=predictions_all_precip_med[rownames(predictions_all_precip_med)==2030,]
			predictions_precip_med[3,]=predictions_all_precip_med[rownames(predictions_all_precip_med)==2040,]
			predictions_precip_med[4,]=predictions_all_precip_med[rownames(predictions_all_precip_med)==2050,]

			# High
		
			predictions_precip_high[1,]=predictions_all_precip_high[rownames(predictions_all_precip_high)==2020,]
			predictions_precip_high[2,]=predictions_all_precip_high[rownames(predictions_all_precip_high)==2030,]
			predictions_precip_high[3,]=predictions_all_precip_high[rownames(predictions_all_precip_high)==2040,]
			predictions_precip_high[4,]=predictions_all_precip_high[rownames(predictions_all_precip_high)==2050,]

			# Assign Names
		
			rownames(predictions_precip_low)=rownames(predictions_precip_med)=rownames(predictions_precip_high)=c(2020, 2030, 2040, 2050)
			colnames(predictions_precip_low)=colnames(predictions_precip_med)=colnames(predictions_precip_high)=1:76

			
		# Put all predictions into a single object (a list):
		
			predictions_precip=list(predictions_precip_low, predictions_precip_med, predictions_precip_high)
			
			# Since the model with high variance suggests negative rainfall, we set negative values to zero.
			predictions_precip[[3]][predictions_precip[[3]]<0]=0	
	



# [2] Plot the time series of the data - both historical data and forecasts.
		
		# First we show all provinces on the same plot, then national averages, for each prior.


	# [a] Organize the data to be plotted.


		# [i] X-coordinates of years:
		
		time=matrix(nrow=76,ncol=length(seq(1910,2005,5)))
		time_forecast=matrix(nrow=76,ncol=length(seq(2010,2050,10))+1)

		for (i in 1:76){
			time[i,]=seq(1910,2005,5)
						}

		for (i in 1:76){
			time_forecast[i,1]=2005
			time_forecast[i,2:6]=seq(2010,2050,10)
						}


	# Temperature Plots Data Preparation:

	# Add in earlier years of prediction to make the plots look better (so there is no empty space between observed and forecasted)

		predictions_temp_low_plot=matrix(nrow=6,ncol=76)
	
			predictions_temp_low_plot[1,]=predictions_all_temp_low[rownames(predictions_all_temp_low)==2005,]
			predictions_temp_low_plot[2,]=predictions_all_temp_low[rownames(predictions_all_temp_low)==2010,]	
			predictions_temp_low_plot[3,]=predictions_all_temp_low[rownames(predictions_all_temp_low)==2020,]
			predictions_temp_low_plot[4,]=predictions_all_temp_low[rownames(predictions_all_temp_low)==2030,]
			predictions_temp_low_plot[5,]=predictions_all_temp_low[rownames(predictions_all_temp_low)==2040,]
			predictions_temp_low_plot[6,]=predictions_all_temp_low[rownames(predictions_all_temp_low)==2050,]
		
		predictions_temp_med_plot=matrix(nrow=6,ncol=76)
	
			predictions_temp_med_plot[1,]=predictions_all_temp_med[rownames(predictions_all_temp_med)==2005,]
			predictions_temp_med_plot[2,]=predictions_all_temp_med[rownames(predictions_all_temp_med)==2010,]	
			predictions_temp_med_plot[3,]=predictions_all_temp_med[rownames(predictions_all_temp_med)==2020,]
			predictions_temp_med_plot[4,]=predictions_all_temp_med[rownames(predictions_all_temp_med)==2030,]
			predictions_temp_med_plot[5,]=predictions_all_temp_med[rownames(predictions_all_temp_med)==2040,]
			predictions_temp_med_plot[6,]=predictions_all_temp_med[rownames(predictions_all_temp_med)==2050,]
		
		predictions_temp_high_plot=matrix(nrow=6,ncol=76)
	
			predictions_temp_high_plot[1,]=predictions_all_temp_high[rownames(predictions_all_temp_high)==2005,]
			predictions_temp_high_plot[2,]=predictions_all_temp_high[rownames(predictions_all_temp_high)==2010,]	
			predictions_temp_high_plot[3,]=predictions_all_temp_high[rownames(predictions_all_temp_high)==2020,]
			predictions_temp_high_plot[4,]=predictions_all_temp_high[rownames(predictions_all_temp_high)==2030,]
			predictions_temp_high_plot[5,]=predictions_all_temp_high[rownames(predictions_all_temp_high)==2040,]
			predictions_temp_high_plot[6,]=predictions_all_temp_high[rownames(predictions_all_temp_high)==2050,]




		# Rainfall Plots Data Preparation:

			# Add in earlier years of prediction to make the plots look better (so there is no empty space between observed and forecasted)

		predictions_precip_low_plot=matrix(nrow=6,ncol=76)
	
			predictions_precip_low_plot[1,]=predictions_all_precip_low[rownames(predictions_all_precip_low)==2005,]
			predictions_precip_low_plot[2,]=predictions_all_precip_low[rownames(predictions_all_precip_low)==2010,]	
			predictions_precip_low_plot[3,]=predictions_all_precip_low[rownames(predictions_all_precip_low)==2020,]
			predictions_precip_low_plot[4,]=predictions_all_precip_low[rownames(predictions_all_precip_low)==2030,]
			predictions_precip_low_plot[5,]=predictions_all_precip_low[rownames(predictions_all_precip_low)==2040,]
			predictions_precip_low_plot[6,]=predictions_all_precip_low[rownames(predictions_all_precip_low)==2050,]
		
		predictions_precip_med_plot=matrix(nrow=6,ncol=76)
	
			predictions_precip_med_plot[1,]=predictions_all_precip_med[rownames(predictions_all_precip_med)==2005,]
			predictions_precip_med_plot[2,]=predictions_all_precip_med[rownames(predictions_all_precip_med)==2010,]	
			predictions_precip_med_plot[3,]=predictions_all_precip_med[rownames(predictions_all_precip_med)==2020,]
			predictions_precip_med_plot[4,]=predictions_all_precip_med[rownames(predictions_all_precip_med)==2030,]
			predictions_precip_med_plot[5,]=predictions_all_precip_med[rownames(predictions_all_precip_med)==2040,]
			predictions_precip_med_plot[6,]=predictions_all_precip_med[rownames(predictions_all_precip_med)==2050,]
		
		predictions_precip_high_plot=matrix(nrow=6,ncol=76)
	
			predictions_precip_high_plot[1,]=predictions_all_precip_high[rownames(predictions_all_precip_high)==2005,]
			predictions_precip_high_plot[2,]=predictions_all_precip_high[rownames(predictions_all_precip_high)==2010,]	
			predictions_precip_high_plot[3,]=predictions_all_precip_high[rownames(predictions_all_precip_high)==2020,]
			predictions_precip_high_plot[4,]=predictions_all_precip_high[rownames(predictions_all_precip_high)==2030,]
			predictions_precip_high_plot[5,]=predictions_all_precip_high[rownames(predictions_all_precip_high)==2040,]
			predictions_precip_high_plot[6,]=predictions_all_precip_high[rownames(predictions_all_precip_high)==2050,]


	# [b] Plot the data with lines for each province:
		
	pdf(file="Plots/ProvincialClimateForecasts.pdf")
		
		# Put three rows and two columns of plots on the same page:

			par(mfrow=c(3 ,2))

		# Low variance prior:
		
			# Temperature
				
					plot(time[1,],temp_prov[1,],type='l',ylim=c(21,29.5),xaxp=c(1910,2050,14),xlab="Year",ylab="Temperature (C)",main="Ave Monthly Temp with Low Forecasts",xlim=c(1910,2050),col="darkgray")

				# plot the observed temperature data 1910-2005
			
					for (i in 2:76){
							lines(time[i,],temp_prov[i,])
								}
				# plot the predicted temperature data 2010-2050
			
					for (i in 1:76){
							lines(time_forecast[i,],predictions_temp_low_plot[,i],col="blue")
								}
				# add a line to show where the predictions begin

					abline(v=2005,lty=2,col="green")


			# Rainfall
		
					plot(time[1,],precip_prov[1,],type='l',ylim=c(50,460),xaxp=c(1910,2050,14),xlab="Year",ylab="Rainfall (cm/month)",main="Ave Monthly Rainfall with Low Forecasts",xlim=c(1910,2050),col="darkgray")

				# plot the observed rainfall data 1910-2005
				
					for (i in 2:76){
							lines(time[i,],precip_prov[i,])
								}

				# plot the predicted temperature data 2010-2050
				
					for (i in 1:76){
							lines(time_forecast[i,],predictions_precip_low_plot[,i],col="blue")
								}

				# add a line to show where the predictions begin

					abline(v=2005,lty=2,col="green")
	
	
		# Medium variance prior:
		
			# Temperature
	
					plot(time[1,],temp_prov[1,],type='l',ylim=c(21,29.5),xaxp=c(1910,2050,14),xlab="Year",ylab="Temperature (C)",main="Ave Monthly Temp with Mid Forecasts",xlim=c(1910,2050),col="darkgray")

				# plot the observed temperature data 1910-2005
			
					for (i in 2:76){
							lines(time[i,],temp_prov[i,])
	
								}
				# plot the predicted temperature data 2010-2050
		
					for (i in 1:76){
							lines(time_forecast[i,],predictions_temp_med_plot[,i],col="orange")
								}
				# add a line to show where the predictions begin

				abline(v=2005,lty=2,col="green")


			# Rainfall
		
					plot(time[1,],precip_prov[1,],type='l',ylim=c(50,460),xaxp=c(1910,2050,14),xlab="Year",ylab="Rainfall (cm/month)",main="Ave Monthly Rainfall with Mid Forecasts",xlim=c(1910,2050),col="darkgray")

				# plot the observed rainfall data 1910-2005
				
					for (i in 2:76){
							lines(time[i,],precip_prov[i,])
								}

				# plot the predicted temperature data 2010-2050
				
					for (i in 1:76){
							lines(time_forecast[i,],predictions_precip_med_plot[,i],col="orange")
								}

				# add a line to show where the predictions begin

					abline(v=2005,lty=2,col="green")
	
		# High variance prior:
		
			# Temperature
		
				plot(time[1,],temp_prov[1,],type='l',ylim=c(21,29.5),xaxp=c(1910,2050,14),xlab="Year",ylab="Temperature (C)",main="Average Monthly Temp with High Forecasts",sub="Each line is a different province",col.sub="darkgray",xlim=c(1910,2050),col="darkgray")
	
				# plot the observed temperature data 1910-2005
				
					for (i in 2:76){
							lines(time[i,],temp_prov[i,])
								}
				# plot the predicted temperature data 2010-2050
			
					for (i in 1:76){
							lines(time_forecast[i,],predictions_temp_high_plot[,i],col="red")
								}
		
				# add a line to show where the predictions begin

					abline(v=2005,lty=2,col="green")


			# Rainfall
			
				plot(time[1,],precip_prov[1,],type='l',ylim=c(50,460),xaxp=c(1910,2050,14),xlab="Year",ylab="Rainfall (cm/month)",main="Average Monthly Rainfall with High Forecasts",sub="Each line is a different province",col.sub="darkgray",xlim=c(1910,2050),col="darkgray")

				# plot the observed rainfall data 1910-2005
				
					for (i in 2:76){
							lines(time[i,],precip_prov[i,])
								}

				# plot the predicted temperature data 2010-2050
				
					for (i in 1:76){
							lines(time_forecast[i,],predictions_precip_high_plot[,i],col="red")
								}

				# add a line to show where the predictions begin

					abline(v=2005,lty=2,col="green")

		dev.off()
		
		
		
	# [c] Plot the data with one line for the national average.
		
		pdf(file="Plots/NationalClimateForecasts.pdf")
		
		# Put three rows and two columns of plots on the same page:

			par(mfrow=c(3 ,2))

	# [a] Calculate the national average for each plot:
		
			national_temp_mean=apply(temp_prov,2,mean)
			national_predict_temp_low=apply(predictions_temp_low_plot,1,mean)
			national_predict_temp_med=apply(predictions_temp_med_plot,1,mean)
			national_predict_temp_high=apply(predictions_temp_high_plot,1,mean)

			national_precip_mean=apply(precip_prov,2,mean)
			national_predict_precip_low=apply(predictions_precip_low_plot,1,mean)
			national_predict_precip_med=apply(predictions_precip_med_plot,1,mean)
			national_predict_precip_high=apply(predictions_precip_high_plot,1,mean)
	
	
	# [b] Plot the data
	
		# Low variance prior
		
			# Temperature
	
				plot(time[1,],national_temp_mean,type='l',ylim=c(25,28),xaxp=c(1910,2050,14),xlab="Year",ylab="Temperature (C)",main="Ave Monthly Temp with Low Forecasts",xlim=c(1910,2050),col="darkgray")

				lines(time_forecast[i,],national_predict_temp_low,col="blue")
							
				abline(v=2005,lty=2,col="green")


			# Rainfall
		
				plot(time[1,],national_precip_mean,type='l',ylim=c(98,165),xaxp=c(1910,2050,14),xlab="Year",ylab="Rainfall (cm/month)",main="Ave Monthly Rainfall with Low Forecasts",xlim=c(1910,2050),col="darkgray")
				
				lines(time_forecast[i,],national_predict_precip_low,col="blue")
								
				abline(v=2005,lty=2,col="green")
	
		# Medium variance prior
		
			# Temperature
		
				plot(time[1,],national_temp_mean,type='l',ylim=c(25,28),xaxp=c(1910,2050,14),xlab="Year",ylab="Temperature (C)",main="Ave Monthly Temp with Mid Forecasts",xlim=c(1910,2050),col="darkgray")

				lines(time_forecast[i,],national_predict_temp_med,col="orange")
								
				abline(v=2005,lty=2,col="green")


			# Rainfall
			
				plot(time[1,],national_precip_mean,type='l',ylim=c(98,165),xaxp=c(1910,2050,14),xlab="Year",ylab="Rainfall (cm/month)",main="Ave Monthly Rainfall with Mid Forecasts",xlim=c(1910,2050),col="darkgray")
				
				lines(time_forecast[i,],national_predict_precip_med,col="orange")
								
				abline(v=2005,lty=2,col="green")


		# High variance prior
		
			# Temperature
			
				plot(time[1,],national_temp_mean,type='l',ylim=c(25,28),xaxp=c(1910,2050,14),xlab="Year",ylab="Temperature (C)",main="Average Monthly Temp with High Forecasts",sub="Each line is a different province",col.sub="darkgray",xlim=c(1910,2050),col="darkgray")

				lines(time_forecast[i,],national_predict_temp_high,col="red")
								
				abline(v=2005,lty=2,col="green")


			# Rainfall
			
				plot(time[1,],national_precip_mean,type='l',ylim=c(98,165),xaxp=c(1910,2050,14),xlab="Year",ylab="Rainfall (cm/month)",main="Average Monthly Rainfall with High Forecasts",xlim=c(1910,2050),col="darkgray")
				
				lines(time_forecast[i,],national_predict_precip_high,col="red")
								
				abline(v=2005,lty=2,col="green")


		dev.off()

	
# [3] Map the forecasts, under the three scenarios, for the years of 2020, 2030, 2040, and 2050: 
		

	# [a] Settings for the map:

		# [i] Map color settings:
				
			startcolor_temp='blue' 
			middlecolor_temp='lightyellow'
			endcolor_temp='red'
			n_class_temp=5
			n_colors_temp=256

			startcolor_precip='lightblue' 
			middlecolor_precip='blue'
			endcolor_precip='darkblue'
			n_class_precip=5
			n_colors_precip=256

		# [ii] Other settings:

			yrs=c(2020,2030,2040,2050)
			flevel=c("Low", "Medium", "High")
			L=3



	# [b] Calculate the color scheme:

		# Temperature


			quantiles_temp=quantiles_temp_low=quantiles_temp_med=quantiles_temp_high=list()
			colors_temp=colors_temp_low=colors_temp_med=colors_temp_high=list()

			pallete_temp=two.colors(n=n_colors_temp,start=startcolor_temp,middle=middlecolor_temp,end=endcolor_temp)


			for (y in 1:4){
				quantiles_temp = classIntervals(predictions_temp[[L]][y,], n = n_class_temp, style = "quantile",digits=2)
				colors_temp_low[[y]] = findColours(quantiles_temp, pallete_temp)
					}

			for (y in 1:4){
				quantiles_temp = classIntervals(predictions_temp[[L]][y,], n = n_class_temp, style = "quantile",digits=2)
				colors_temp_med[[y]] = findColours(quantiles_temp, pallete_temp)
					}

			for (y in 1:4){
				quantiles_temp = classIntervals(predictions_temp[[L]][y,], n = n_class_temp, style = "quantile",digits=2)
				colors_temp_high[[y]] = findColours(quantiles_temp, pallete_temp)
					}

			colors_temp=list(colors_temp_low,colors_temp_med,colors_temp_high)



		# Precipitation

			pallete_precip=two.colors(n=n_colors_precip,start=startcolor_precip,middle=middlecolor_precip,end=endcolor_precip)

			quantiles_precip=quantiles_precip_low=quantiles_precip_med=quantiles_precip_high=list()
			colors_precip=colors_precip_low=colors_precip_med=colors_precip_high=list()


			for (y in 1:4){
				quantiles_precip_low[[y]] = classIntervals(predictions_precip[[L]][y,], n = n_class_precip, style = "quantile",digits=2)
				colors_precip_low[[y]] = findColours(quantiles_precip_low[[y]], pallete_precip)
					}

			for (y in 1:4){
				quantiles_precip_med[[y]] = classIntervals(predictions_precip[[L]][y,], n = n_class_precip, style = "quantile",digits=2)
				colors_precip_med[[y]] = findColours(quantiles_precip_med[[y]], pallete_precip)
					}

			for (y in 1:4){
				quantiles_precip_high[[y]] = classIntervals(predictions_precip[[L]][y,], n = n_class_precip, style = "quantile",digits=2)
				colors_precip_high[[y]] = findColours(quantiles_precip_high[[y]], pallete_precip)
					}

			quantiles_precip=list(quantiles_precip_low,quantiles_precip_med,quantiles_precip_high)
			colors_precip=list(colors_precip_low,colors_precip_med,colors_precip_high)


	# [c] Plot the maps:

			
	# Temperature
		
		png(file=paste("TemperatureForecast_",flevel[L],"Variance_Maps.png",sep=""),res=100)
		
		par(mfrow=c(1,4))
		par(mar=c(5,3,2,2)+0.1)
		par(oma=c(0,0,0,0))
	
		#2020
		
		plot(locationmap,col=colors_temp[[L]][[1]],fg='blue',pty='m',pin=c(15,10),xlim=c(96,105.2),ylim=c(5.9,20.2),mai=c(0,0,0,0),mai=c(0,0,0,0))
		title(main=paste(yrs[1]), cex.main=0.9)
		legend("bottomright", fill = attr(colors_temp[[L]][[1]], "palette"),
       			legend = names(attr(colors_temp[[L]][[1]], "table")),
       			bty="n", cex = 0.8, y.intersp = 1.5)
		
		#2030

		plot(locationmap,col=colors_temp[[L]][[2]],fg='blue',pty='m',pin=c(15,10),omd=c(0,0,0,0),omi=c(0,0,0,0),oma=c(0,0,0,0),xlim=c(96,105.2),ylim=c(5.9,20.2),mai=c(0,0,0,0),mai=c(0,0,0,0))
		title(main=paste(yrs[2]), cex.main=0.9)
 		legend("bottomright", fill = attr(colors_temp[[L]][[2]], "palette"),
       			legend = names(attr(colors_temp[[L]][[2]], "table")),
       			bty="n", cex = 0.8, y.intersp = 1.5)
		
		#2040

		plot(locationmap,col=colors_temp[[L]][[3]],fg='blue',pty='m',pin=c(15,10),omd=c(0,0,0,0),omi=c(0,0,0,0),oma=c(0,0,0,0),xlim=c(96,105.2),ylim=c(5.9,20.2),mai=c(0,0,0,0),mai=c(0,0,0,0))
		title(main=paste(yrs[3]), cex.main=0.9)
  		legend("bottomright", fill = attr(colors_temp[[L]][[3]], "palette"),
       			legend = names(attr(colors_temp[[L]][[3]], "table")),
       			bty="n", cex = 0.8, y.intersp = 1.5)
 		
 		#2050

		plot(locationmap,col=colors_temp[[L]][[4]],fg='blue',pty='m',pin=c(15,10),omd=c(0,0,0,0),omi=c(0,0,0,0),oma=c(0,0,0,0),xlim=c(96,105.2),ylim=c(5.9,20.2),mai=c(0,0,0,0),mai=c(0,0,0,0))
		title(main=paste(yrs[4]), cex.main=0.9)
		legend("bottomright", fill = attr(colors_temp[[L]][[4]], "palette"),
       			legend = names(attr(colors_temp[[L]][[4]], "table")),
       			bty="n", cex = 0.8, y.intersp = 1.5)


		dev.off()


	
	# Precipitation

		png(file=paste("RainfallForecast_",flevel[L],"Variance_Maps.png",sep=""),res=100)
		
		par(mfrow=c(1,4))
		par(mar=c(5,3,2,2)+0.1)
		par(oma=c(0,0,0,0))


 		# 2020
 
		plot(locationmap,col=colors_precip[[L]][[1]],oma=c(1,1,1,1),xlim=c(95.5,106))
		title(main=paste(yrs[1]), cex.main=0.9)
		legend("bottomright", fill = attr(colors_precip[[L]][[1]], "palette"),
    		   legend = names(attr(colors_precip[[L]][[1]], "table")),
     		  bty="n", cex = 0.8, y.intersp = 1.5)
     		  
		#2030
 
		plot(locationmap,col=colors_precip[[L]][[2]],oma=c(1,1,1,1),xlim=c(95.5,106))
		title(main=paste(yrs[2]), cex.main=0.9)
		legend("bottomright", fill = attr(colors_precip[[L]][[2]], "palette"),
    		   legend = names(attr(colors_precip[[L]][[2]], "table")),
     		  bty="n", cex = 0.8, y.intersp = 1.5)
     		  
		#2040
      
		plot(locationmap,col=colors_precip[[L]][[3]],oma=c(1,1,1,1),xlim=c(95.5,106))
		title(main=paste(yrs[3]), cex.main=0.9)
		legend("bottomright", fill = attr(colors_precip[[L]][[3]], "palette"),
    		   legend = names(attr(colors_precip[[L]][[3]], "table")),
     		  bty="n", cex = 0.8, y.intersp = 1.5)

		#2050

		plot(locationmap,col=colors_precip[[L]][[4]],oma=c(1,1,1,1),xlim=c(95.5,106))
		title(main=paste(yrs[4]), cex.main=0.9)
		legend("bottomright", fill = attr(colors_precip[[L]][[4]], "palette"),
    		   legend = names(attr(colors_precip[[L]][[4]], "table")),
     		  bty="n", cex = 0.8, y.intersp = 1.5)


		dev.off()






