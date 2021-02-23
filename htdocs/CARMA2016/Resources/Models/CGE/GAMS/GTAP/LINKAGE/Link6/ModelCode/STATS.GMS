* --------------------------------------------------------------------
*
*  LINKAGE -- LINK Applied General Equilibrium Model
*
*  Statistics Module
*  -----------------
*
*  Based on GTAP Version 5.0
*
* --------------------------------------------------------------------

sets
   is SAM categories /
                        act  Activities
                        comm Commodities
                        itax Indirect taxes
                        fct  sector specific factor
                        lab  Labor account
                        kap  Capital account
                        hh   Household account
                        gov  Government account
                        inv  Investment account
                        depr Depreciation account
                        tar  Tariff account
                        etax Export tax account
                        marg Trade services account
                        row  Rest of the world account
                        tot  Aggregate account
                        res  Residual between column and row sums /
   ist(is)           /  tot, Res /
   is2(is)

   Alias(is,is1) ; Alias(is2, is3) ; Alias(is, is4) ;
   is2(is) = not ist(is) ;

parameters
   Walras(r)     Walras' Law
   WalrasT(r,t)  Walras' Law
   sam(is,is1)   Social accounting matrix
   rscale        Parameter for scaling output
   ;

* --------------------------------------------------------------------
*
*  Define the time subsripted variable for the report facility
*
* --------------------------------------------------------------------

parameters

*
*  Aggregate variables
*

gdpmpT(r,t)   GDP at market price
rgdpmpT(r,t)  Real GDP at market price
rgdpT(r,t)    Real GDP at factor cost
hpopT(r,h,t)  Population
tlabsT(r,t)   Employment
gkT(r,t)      Residual productivity measure
glT(r,t)      Labor productivity measure
avgglt(r,t)   Average aggregate labor productivity
avggkt(r,t)   Average aggregage capital produtivity
consT(r,t)    Real household consumption
govT(r,t)     Real government expenditures
invT(r,t)     Real investment expenditures
expT(r,t)     Real exports
impT(r,t)     Real imports

rgdpmp_ppp(r,t) Real GDP at PPP exchange rates
gdp_pc(r,t)     Real GDP per capita at market exchange rates
gdp_pc_ppp(r,t) Real GDP per capita at PPP exchange rates

tkapsT(r,t)   Aggregate capital supply (normalised)
tlandT(r,t)   Aggregate land supply
kstockT(r,t)  Aggregate capital supply (non-normalised)
savgT(r,t)    Public saving
savfT(r,t)    Foreign saving

*
*  Price indices
*

pgdpmpT(r,t)  GDP at market price deflator
pgdpT(r,t)    GDP at factor cost deflator
pabsT(r,t)    Aggregate absorption price
cpiT(r,t)     Consumer price index
gpiT(r,t)     Government expenditure price index
zpiT(r,t)     Investment expenditure price index
epiT(r,t)     Export price index
mpiT(r,t)     Import price index
wepiT(r,i,t)  World export sectoral price index
wmpiT(r,i,t)  World import sectoral price index
totT(r,t)     Terms of trade index
totPT(r,t)    Terms of trade impact
awpT(i,t)     Average world export price

*
*  Factor prices
*
ptT(r,i,t)     Price of land
pfT(r,i,t)     Price of fixed factor
ffT(r,i,t)     Supply of fixed factor
rentT(r,i,t)   Rental rate
arentT(r,t)    Aggregate rental rate

*
*  Sectoral vectors
*

xpt(r,i,t)     Gross output
ldt(r,i,t)     Sectoral labor demand
kapdt(r,i,t)   Sectoral capital demand
xapt(r,i,t)    Aggregate intermediate demand
xact(r,i,h,t)  Household consumption
xct(r,k,h,t)   Household consumption using consumer goods
xaft(r,i,t)    Aggregate final demand
xat(r,i,t)     Aggregate Armington demand
xdt(r,i,t)     Domestic sales of domestic production
est(r,i,t)     Exports including trade services
xmtt(r,i,t)    Imports
est0(r,i,t)    Baseline exports
xmtt0(r,i,t)   Basline imports

ppt(r,i,t)     Producer price
pat(r,i,t)     Armington price
pdt(r,i,t)     Domestic sales price of domestic goods
pmtt(r,i,t)    Aggregate import price
ppet(r,i,t)    Aggregate export price

pxt(r,i,t)     Average unit cost
swageT(r,i,t)  Average wage
srentT(r,i,t)  Average rental rate
spapT(r,i,t)   Average input cost

slabT(r,i,t)   Average labor output ratio
skapT(r,i,t)   Average capital output ratio
slandT(r,i,t)  Average land output ratio
sfactT(r,i,t)  Average fixed factor output ratio
sndT(r,i,t)    Average input output ratio

chipT(r,i,t)   Endogenous increase in productivity
phipT(r,i,t)   Endogenous productivity scale factor

exprodT(r,i,t) Average exogenous productivity in the economy
avgexpT(r,i,t) Average export to output ratio in the economy

va1T(r,gz,t)   Value added by zone at producer factor cost
va2T(r,gz,t)   Value added by zone at factor price
rva1T(r,gz,t)  Real value added by zone at producer factor cost
rva2T(r,gz,t)  Real value added by zone at factor price

pp1T(r,gz,t)   Producer price index by zone
pa1T(r,gz,t)   Absorption price index by zone

*
*  Consumption parameters
*

adjmpc(r,k,h)    Adjusted marginal propensity to consume parameters
pcT(r,k,h,t)     Consumer price using consumer goods
pacT(r,i,h,t)    Consumer price
mpcT(r,k,h,t)    Marginal propensity to consume
thetaT(r,k,h,t)  Subsistence minima
savhT(r,h,t)     Household saving
deprYT(r,h,t)    Depreciation allowance
ydT(r,h,t)       Disposable income
rydT(r,h,t)      Real disposable income
etaT(r,k,h,t)    Income elasticity

* Expenditure function parameters

subsmin0(r,h,t)  Value of subsistence minima at base year prices
subsmin1(r,h,t)  Value of subsistence minima at current year prices in shock simulation
subsminT(r,h,t)  Value of subsistence minima at current year prices in BAU simulation

pindex0(r,h,t)   Value of price index at base year prices
pindex1(r,h,t)   Value of price index at current year prices in shock simulation
pindexT(r,h,t)   Value of price index at current year prices in BaU simulation
Apindex0(r,h,t)  Value of adjusted price index at base year prices
Apindex1(r,h,t)  Value of adjusted price index at current year prices in shock simulation
ApindexT(r,h,t)  Value of adjusted price index at current year prices in BaU simulation
gpindex1(r,t)    Value of government price index at current year prices in shock simulation
gpindexT(r,t)    Value of government price index at current year prices in BaU simulation

u1(r,h,t)        Value of utility function in shock simulation
uT(r,h,t)        Value of utility function in BaU simulation
Au1(r,h,t)       Value of adjusted utility function in shock simulation
AuT(r,h,t)       Value of adjusted utility function in BaU simulation
gu1(r,t)         Value of government utility function in shock simulation
guT(r,t)         Value of government utility function in BaU simulation

E1T(r,h,t)       Expenditure function with BaU prices and utility
E2T(r,h,t)       Expenditure function with shock prices and utility
E3T(r,h,t)       Expenditure function with shock prices and BaU utility
E4T(r,h,t)       Expenditure function with BaU prices and shock utility
AE1T(r,h,t)      Adjusted expenditure function with BaU prices and utility
AE2T(r,h,t)      Adjusted expenditure function with shock prices and utility
AE3T(r,h,t)      Adjusted expenditure function with shock prices and BaU utility
AE4T(r,h,t)      Adjusted expenditure function with BaU prices and shock utility
E5T(r,h,t)       Expenditure function with base year prices and BaU utility
E6T(r,h,t)       Expenditure function with base year prices and shock utility
GE1T(r,t)        Government expenditure function with BaU prices and utility
GE2T(r,t)        Government expenditure function with shock prices and utility
GE3T(r,t)        Government expenditure function with shock prices and BaU utility
GE4T(r,t)        Government expenditure function with BaU prices and shock utility

tgT(r,t)         Real government expenditures
*
*  Employment parameters
*

 L0T(r,l,i,t)     Employment shifter
 aminT(r,ll,gz,t) Minimum wage shifter

*
*  Trade taxes
*

tarT(r,rp,i,t)    Tariff rates
etaxT(r,rp,i,t)   Export taxes

*
*  Emission variables
*

 emitotT(r,t)      Total emissions
 emitaxT(r,t)      Nominal emissions tax
 emitaxadt(r,i,t)  Ad valorem emissions tax

   ;

set gts / Tax     Government revenue
          Subs    Government expenditure / ;

set gi  / Output  Output tax
          FctTax  Tax on factors of production
          Indprod Indirect taxes in production
          IndCons Indirect taxes in consumption
          IndGov  Indirect taxes in government consumption
          IndInv  Indirect taxes in investment demand
          ExpTax  Export taxes
          ImpTax  Import taxes
          DirTax  Indirect taxes
          Exp     Current expenditures
         / ;

parameter GovAcctT(r,gi,gts,t) Government ledger ;
