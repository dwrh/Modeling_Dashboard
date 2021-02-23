# Install the package "nleqslv" for solving systems of non linear equations:

#	install.packages("nleqslv") # you only need to install the package once
	library(nleqslv) # you have to load the package with the library() function after every time you open R

  
  
  
  
  
  
  
        # This file presents a GAMS-based implementation of the 123 CGE model
         # developed at the World Bank and involving papers by Jaime de Melo,
         # Sherman Robinson, Jeff Lewis, Delfin Go, Pekka Sinko, and
         # Shanta Devarajan (in various combinations of authors).
         # The basic theory is spelled out in the paper:

           # de Melo, J. and S. Robinson, (1989).  "Product Differentiation
           # and the Treatment of Foreign Trade in Computable General
           # Equilibrium Models of Small Open Economies,"  Journal of
           # International Economics 27: 47-67.

         # This application is based on the description of the 123 model in
         # Applied Methods for Trade Policy Analysis:  A Handbook.

           # Devarajan, S., D.S. Go, J.D. Lewis, S. Robinson, and P.
           # Sinko (1997), "Simple General Equilibrium Modeling,"
           # Chapter 6 in J.F. Francois and K.A. Reinert eds.,
           # Applied Methods for Trade Policy Analysis:  A Handbook,
           # Cambridge University Press: Cambridge UK:  156-188.

         # Last Modification: David Roland-Holst, July 2009

         # The Equation numbers match those in the chapter, as do variable
         # definitions.  The core data also follow from the example provided
         # by Devarajan et al and circulated in spreadsheet form -- the
         # macro-economic accounts for Sri Lanka in 1991.  All values
         # have been scaled relative to GDP.  These data are listed below.

                                # Rs Billion      Output=1

        # National Accounts

        # Output (Value Added)    324.6940        1.0000
          # Wages                 163.3200        0.5030

        # GDP at  market prices   375.3390        1.1560
          # Private Consumption   291.6940        0.8984
          # Public Consumption     35.5830        0.1096
          # Investment             86.3760        0.2660
          # Exports               106.3860        0.3277
          # Imports               144.7010        0.4457

        # Tax Revenue
          # Sales & Excise Tax     32.0270        0.0986
          # Import Tariffs         18.6170        0.0573
          # Export Duties           1.1370        0.0035
          # Payroll Tax             0.0000        0.0000
          # Personal Income Tax     3.5390        0.0109
          # Capital Income Tax     12.8370        0.0395
        # Total                    68.1570        0.2099

        # Fiscal Account
        # Revenue                  76.1790        0.2346
          # NonTax                  8.0220        0.0247
        # Current Expenditure      83.7560        0.2580
          # Goods & Services       35.5830        0.1096
          # Interest Payments      22.0730        0.0680
          # Transfers & Subsidies  26.1000        0.0804
        # Capital Expenditure      35.7710        0.1102
        # Fiscal Balance          -43.3480       -0.1335


        # Balance of Payments
        # Exports - Imports       -38.3150       -0.1180
        # Net Profits & Dividends  -0.7830       -0.0024
        # Interest Payments        -8.8200       -0.0272
        # Net Private Transfers    11.6000        0.0357
        # Net Official Transfers    7.9000        0.0243
        # Current Account Balance -28.4180       -0.0875

        # External Debt           260.5000        0.8023
        # Debt Service Payments    20.2100        0.0622
        




# Here we define a mix of policy and functional parameters

           # PWm      world price of import good
           # PWe      world price of export good
           # tm       import tariff
           # te       export subsidy rate
           # ts       sales or excise of VAT tax rate
           # ty       direct income tax rate
           # tr       government transfers
           # ft       foreign transfers to government
           # re       foreign remittances to private sector
           # sr       average savings rate
           # X        aggregate output
           # G        government demand
           # B        balance of trade
           # at       technical shift term for CET expression
           # OMEGA    export transformation elasticity
           # rt       the CET exponential term
           # aq       technical shift term for CES expression
           # sigma    import substitution elasticity
           # rq       the CES exponential term
           # bq   the CES weight term in the Armington function
           # bt   the CET weight term in the national product function
           # values(vars,exp) a table to hold experiment values
           # pchg(vars,exp) comparative static percent changes
        

# Initialization of parameters

           PWm    = 0.8860
           PWe    = 1.0107
           tm     = 0.1287
           te     = 0.0107
           ts     = 0.0839
           ty     = 0.0350
           tr     = 0.1237
           ft     = 0.0243
           re     = 0.0062
           sr     = 0.1699
           X      = 1.0000
           G      = 0.1011
           B      = 0.0840
           OMEGA  = 0.6000
           sigma  = 0.6000
           at     = 2.2173
           aq     = 1.9659
           bq     = 0.3814
           bt     = 0.7682
           rt     = 1 + (1/OMEGA)
           rq     = (1/sigma) -1

 
	f=function(x){


# These are the definitions of our endogenous variable set [19 endogenous variables]
   
           # E        export good quantity
           # M        import good quantity
           # Ds       supply of domestic good
           # Dd       demand for domestic good
           # Qs       supply of composite good
           # Qd       demand for composite good
           # Pe       domestic price of export good
           # Pm       dometic price of import good
           # Pd       producer price of domestic good
           # Pt       sales price of composite good
           # Px       price of aggregate output
           # Pq       price of composite good
           # T        tax revenue
           # R        exchange rate
           # Sg       government savings
           # Y        total income
           # C        aggregate consumption
           # S        aggregate savings
           # Z        aggregate real investment
           # ts       a variable for endogenizing taxes


# Define x as an empty vector of length 20:

			x = rep(NA,20)

# Set our 20 endogenous variables in x:

			E = x[1]
			M = x[2] 
			Ds = x[3] 
			Dd = x[4] 
			Qs = x[5] 
			Qd = x[6] 
			Pe = x[7] 
			Pm = x[8] 
			Pd = x[9] 
			Pt = x[10] 
			Px = x[11] 
			Pq = x[12] 
			t = x[13] 
			R = x[14] 
			Sg = x[15] 
			Y = x[16] 
			C = x[17] 
			S = x[18] 
			Z = x[19] 
			ts = x[20]
			
#names(x)=c("E","M","Ds","Dd","Qs","Qd","Pe","Pm","Pd","Pt","Px","Pq","t","R","Sg","Y","C","S","Z","ts")
		

### WTF?
# set exp / benchmark, fcap, tot /;
        
           # endog.l(vars) = initial(vars);
            # GDP.l = endog.l("Y");

         # values(vars,"benchmark") = endog.l(vars);
					
		

# Objective function
           # OBJ      This is the fake objective function for GAMS
		
		F = rep(NA,20)
		
		
# Real flow equations with numbering following Devarajan et al
           # [1]    definition of the product transformation surface
           # [2]    definition of the Armingon aggregation function
           # [3]    expenditure definition of national income
           # [4]    supply ratios based on EQ621
           # [5]    supply ratios based on EQ622
           
		F[1] =  X  -  (at * (bt*E**rt + (1-bt)*Ds**rt)**(1/rt)) 
          
		F[2] = Qs - (aq * (bq*M**(-rq) + (1-bq)*Dd**(-rq))**(-1/rq)) 
 
		F[3] = Qd - (C + Z + G)
 
		F[4] = E - (Ds * (((1-bt)*Pe)/(bt*Pd))**OMEGA) 
  
		F[5] = M - (Dd * ((bq*Pd)/((1-bq)*Pm))**sigma)
		
# Nominal flows
           # [6]    government tax income definition
           # [7]    value added definition of national income
           # [8]    savings definition
           # [9]    consumption definition		
 
		F[6] = t - (tm*R*PWm*M  + ts*Pq*Qd + ty*Y - te*R*PWe*E)
 
		F[7] = Y - (Px*X + tr*Pq + re*R)            
 
		F[8] = S - (sr * Y + R * B + Sg)             
 
		F[9] = C - ((1/Pt) * (1 - sr - ty) * Y)                   
 
 # Price equations
           # EQ630    internal import prices
           # EQ631    internal export prices
           # EQ632    consumer prices
           # EQ633    national product price index
           # EQ634    producer prices for the composite good
           # EQ635    real exchange rate
 
		F[10] = Pm - ((1 + tm) * R * PWm)                             
 
		F[11] = Pe - (R * PWe / (1 + te))                                 
 
		F[12] = Pt - ((1 + ts) * Pq)                               
 
		F[13] = Px - ((Pe*E + Pd*Dd)/X)               
 
		F[14] = Pq  - ((Pm*M + Pd*Ds)/Qs)
 
		F[15] = R - 1                                                           
 
 # Market clearing Equations
           # EQ636    domestic good excess demand
           # EQ637    Armington composite excess demand
           # EQ638    capital and current account relationship
           # EQ639    savings investment linkage
 
		F[16] = Ds  - Dd                                                       
 
		F[17] = Qs - Qd                                               
 
		F[18] = B - (PWm*M -PWe*E - ft - re)                    

		F[19] = Z  - ((1/Pt) * S)                                    

		F[20] = Y


	return(F)
									}
									
									


# [3]	Set initival values for the endogenouse variables

		initial_vals=c(0.3277, 0.5030, 0.6723, 0.6723, 1.1753, 1.1753, 1.1753, 1, 1, 1, 1.0839,1,0.1990,1,-0.0099, 1.1298, 0.8288, 0.2660, 0.2454, 0.0839)
		names(initial_vals)=c("E","M","Ds","Dd","Qs","Qd","Pe","Pm","Pd","Pt","Px","Pq","t","R","Sg","Y","C","S","Z","ts")


# [4]	Solve the model

		model_solution=nleqslv(x=initial_vals,fn=f)

# [5]	Store, label, and print the solution:

		solution_values=model_solution$x

		names(solution_valuels)=c("E","M","Ds","Dd","Qs","Qd","Pe","Pm","Pd","Pt","Px","Pq","t","R","Sg","Y","C","S","Z","ts")

		print(solution_values)












