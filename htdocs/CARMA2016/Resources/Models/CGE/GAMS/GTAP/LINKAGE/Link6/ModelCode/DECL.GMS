* --------------------------------------------------------------------
*
*  LINKAGE -- LINKAGE Applied General Equilibrium Model
*
*  Variable and parameter declarations
*  -----------------------------------
*
*  Based on GTAP Version 5.0
*
* --------------------------------------------------------------------

set m Markets /
   Dom      Domestic market
   Imp      Aggregate import market
/ ;

Alias(m,m1) ;

file screen / 'con' / ;

* --------------------------------------------------------------------
*  Initial data
* --------------------------------------------------------------------

parameters

*  Production variables

   nd0(r,i)         Initial aggregate intermediate demand
   va0(r,i,v1)      Initial value added bundle
   uvcv0(r,i,v1)    Initial unit variable cost of production by vintage
   uvc0(r,i)        Initial unit variable cost of production
   ac0(r,i)         Initial average unit cost of production
   px0(r,i)         Initial producer price exclusive of taxes
   cdr0(r,i)        Initial cost disadvantage ratio
   markup0(r,i)     Initial price markup
   pp0(r,i)         Initial producer price inclusive of taxes
   nfirm0(r,i)      Initial number of firms

   ld0(r,i)         Initial demand for aggregate labor
   hkte0(r,i,v1)    Initial demand for hkte bundle
   pva0(r,i,v1)     Initial price of value added bundle

   labdv0(r,ll,i)   Initial demand for variable labor
   labdf0(r,ll,i)   Initial demand for fixed labor
   wage0(r,ll,i)    Initial demand for wages
   awage0(r,i)      Initial price of labor bundle
   tlabd0(r,i)      Initial aggregate demand for labor in sector

   kapd0(r,i)       Initial demand for capital
   land0(r,i)       Initial demand for land
   fctd0(r,i)       Initial demand for sector specific factor

   xep0(r,i,v1)     Initial demand for energy bundle
   hkt0(r,i,v1)     Initial demand for hkt bundle
   kt0(r,i,v1)      Initial demand for kt bundle
   phkte0(r,i,v1)   Initial price of hkte bundle

*  For crops

   hktef0(r,i,v1)   Initial demand for hktef bundle
   phktef0(r,i,v1)  Initial price of hktef bundle
   fert0(r,i)       Initial demand for fertilizer bundle
   pfert0(r,i)      Initial price of fertilizer bundle

*  For livestock

   tfd0(r,i,v1)     Initial demand for tfd bundle
   ptfd0(r,i,v1)    Initial price of tfd bundle
   ktel0(r,i,v1)    Initial demand for ktel bundle
   pktel0(r,i,v1)   Initial price of ktel bundle
   feed0(r,i)       Initial demand for feed bundle
   pfeed0(r,i)      Initial price of feed bundle

   td0(r,i)         Initial demand for land
   ff0(r,i)         Initial demand for other sector-specific resource
   kapdv0(r,i,v1)   Initial demand for variable capital by vintage
   kapdf0(r,i)      Initial demand for fixed capital by vintage
   phkt0(r,i,v1)    Initial price of hkt bundle
   pkt0(r,i,v1)     Initial price of kt bundle

   xap0(r,i,j)      Initial input output table
   pnd0(r,i)        Initial price of the aggregate intermediate demand bundle
   pep0(r,i,v1)     Initial price of energy bundle

   xdp0(r,i,j)      Initial demand for domestic goods in production
   xmp0(r,i,j)      Initial demand for imported goods in production
   pap0(r,i,j)      Initial Armington price in production

*
*  Income variables
*

   profit0(r,i)    Initial sectoral profits
   LandY0(r)       Initial aggregate land income
   FFactY0(r)      Initial fixed factor income
   LabY0(r,ll)     Initial labor income
   KapY0(r)        Initial capital income
   yh0(r,h)        Initial aggregate household income
   yd0(r,h)        Initial household disposable income
   yc0(r,h)        Initial expenditure bundle

*
*  Consumer variables
*

   xc0(r,k,h)      Initial consumer demand by commodity
   pc0(r,k,h)      Initial consumer price
   supy0(r,h)      Initial supernumerary income
   savh0(r,h)      Initial level of household saving
   aps0(r,h)       Initial average propensity to consume
   cpi0(r,h)       Initial consumer price index
   xac0(r,i,h)     Initial Armington demand for consumer goods
   pac0(r,i,h)     Initial Armington consumer prices
   xdc0(r,i,h)     Initial demand for domestic consumer goods
   xmc0(r,i,h)     Initial demand for imported consumer goods

*  ---- For AIDADS

   uad0(r,h)       Initial utility level
   mu0(r,i,h)      Initial marginal propensity to consume

*
*  Final demand variables
*

   xaf0(r,i,f)       Initial final demand for Armington goods
   pfd0(r,f)         Initial aggregate final demand price index

   xdf0(r,i,f)       Initial final demand for domestic goods
   xmf0(r,i,f)       Initial final demand for imported goods
   paf0(r,i,f)       Initial Armington final demand prices

*  Import variables

   xa0(r,i)          Initial volume of Armington demand
   pd0(r,i)          Initial price of locally produced goods sold locally
   xmt0(r,i)         Initial volume of aggregate imports
   pa0(r,i)          Initial aggregate Armington price

   xm10(r,r1,i)      Initial second tier import demand
   pm10(r,r1,i)      Initial second tier import price

   xm20(r,r2,i)      Initial third tier import demand
   pm20(r,r2,i)      Initial third tier import price

   wtf0(r,rp,i)      Initial volume of trade from region r to region rp
   wtf_in0(r,rp,i)   Initial in quota trade flows
   wtf_out0(r,rp,i)  Initial over quota trade flows

   shr0(r,rp,i)      Initial volume share
   pmt0(r,i)         Initial price of aggregate imports

*  AIDS variables

   pmAIDS0(rp,r,i)   Initial price matrix for the AIDS function
   pdm0(r,i)         Initial price of the XD domestic import aggregate
   xdm0(r,i)         Initial volume of the XD domestic import aggregate
   share0(rp,r,i)    Initial share matrix

*  Domestic and export supply variables

   xd0(r,i)          Initial domestic sales of domestic production
   es0(r,i)          Initial volume of aggregate exports
   xp0(r,i)          Initial gross output

   wpe0(r,rp,i)      Initial world price of exports (fob)
   pet0(r,i)         Initial aggregate price of exports

*
*  Import prices
*

   tar_p0(r,rp,i)    Initial import quota premium
   tm_p0(r,rp,i)     Initial export price markup
   pe0(r,rp,i)       Initial producer price of exports incl of wedges
   wpm0(r,rp,i)      Initial world price of imports (cif)
   pm0(r,rp,i)       Initial price of imports tariff inclusive
   er0(r,rp)         Exchange rate converting curreny of region rp into r

*
*  Trade and transportation services variables
*

   ptmarg0(r)        Initial aggregate regional price of trade service
   pwmarg0           Initial global price index of trade service demand

   xwmarg0           Initial global volume of trade service demand
   xtmarg0(r)        Initial aggregate regional volume of trade service supply
   xmarg0(r,i)       Initial trade margin demand for local goods and services

*
*  Emission variables
*
   emitot0(r)      Initial level of emissions
   emitax0(r)      Initial level of the emission tax

*
*  Domestic closure
*

   GRev0(r)        Initial government revenues
   savg0(r)        Initial level of government saving
   rsg0(r)         Initial level of real government saving
   savf0(r)        Initial level of foreign saving in domestic currency
   fdvol0(r,f)     Initial volume of aggregate gov and inv expenditures
   psavw0          Initial world price of savings
   p0              Initial value of numeraire
   wrr0            Initial average world rate of return
   invsh0(r)       Initial ratio of investment to GDP

*
*  labor market equilibrium variables
*
   avgw0(r,ll,gz)  Initial average wage rate
   migr0(r,ll)     Initial rural to urban migration
   labs0(r,ll,gz)  Initial labor supply
   ue0(r,ll,gz)    Initial rate of unemployment by zone
   ueTot0(r,ll)    Initial national unemployment rate
   wmin0(r,ll,gz)  Initial minimum wage by zone
   twage0(r,ll,gz) Initial aggregate wage rate
   nwage0(r,ll,i)  Initial wage rate net of taxes

*
*  Land equilibrium variables
*

   tland0(r)       Initial volume of total agricultural land
   ptland0(r)      Initial aggregate price of land
   ts0(r,i)        Initial supply of land by sector
   pt0(r,i)        Initial price of land by sector
   npt0(r,i)       Initial price of land by sector net of taxes
   LndTax0(r,i)    Initial tax on land

*
*  Sector specific factor variables
*
   fs0(r,i)        Initial sector specific factor supply
   pf0(r,i)        Initial sector specific factor price

*
*  Capital market equilibrium variables
*

   kaps0(r,i)      Initial sectoral capital supply
   rrat0(r,i)      Initial rental rate ratios
   trent0(r)       Initial aggregate rental rate
   rent0(r,i,v1)   Initial vintage specific rental rate by sector
   nrent0(r,i,v1)  Initial vintage specific rental rate by sector net of taxes
   KapTax0(r,i,v1) Initial vintage specific tax on capital by sector

   kxrat0(r,i)     Initial capital output ratio
   xpv0(r,i,v1)    Initial output by vintage

   ginv0(r)        Initial value of real investment growth rate
   kstock0(r)      Initial value of aggregate capital stock
   tkaps0(r)       Initial volume of (normalized) aggregate capital stock

*
*  Aggregate accounts
*

   rgdpmp0(r)      Initial value of real GDP at MP
   gdpmp0(r)       Initial value of nominal GDP at MP
   rgdp0(r)        Initial value of real GDP at FC
   pgdp0(r)        Initial value of GDPFC deflator
   pabs0(r)        Initial aggregate absorption price

*
*  Dynamic variables
*
   glab0(r,ll,gz)  Initial labor force growth rates
   ggdp0(r)        Initial value of GDP growth rate
   kaplab0(r)      Initial value of capital per worker ratio
   phip0(r,i)      Initial shifter for endogenous productivity factor

   agprod0(r,i)    Initial agricultural productivity

*
*  Other (exogenous) variables
*

   savfbar0(r)        Initial level of foreign saving in world currency
   hpop0(r,h)         Initial population level by household
   pop0(r,tranche)    Initial aggregate population by tranche
   deprat0(r,tranche) Initial dependency ratios

*  Taxes

   pdtax0(r,i,j)     Initial taxes on domestic goods in production
   pmtax0(r,i,j)     Initial taxes on imported goods in production
   patax0(r,i,j)     Initial aggregate taxes on goods used in production

   ptax0(r,i)        Initial producer tax

   etax0(r,rp,i)     Initial export price wedges
   tmarg0(r,rp,i)    Initial trade and transportation margins
   tar0(r,rp,i)      Initial tariffs
   tar_in0(r,rp,i)   Initial in quota tariff rate
   tar_out0(r,rp,i)  Initial over quota tariff rate
   wtf_q0(r,rp,i)    Initial import quota level

   cdtax0(r,i,h)     Initial tax on domestic consumer goods
   cmtax0(r,i,h)     Initial tax on imported consumer goods
   catax0(r,i,h)     Initial aggregate tax on consumer goods

   kappah0(r,h)      Initial direct tax rate on household income
   chik0(r)          Initial direct tax shifter

   fdtax0(r,i,f)     Initial final demand tax on domestic goods
   fmtax0(r,i,f)     Initial final demand tax on imported goods
   fatax0(r,i,f)     Initial aggregate tax on final demand goods

   trg0(r,h)         Initial transfers to households
 ;

* --------------------------------------------------------------------
*  Model parameters
* --------------------------------------------------------------------

parameters

*  Production parameters

   g0(r,i)         Base uniform productivity parameter
   G(r,i)          Uniform productivity parameter
   and(r,i,v1)     Share parameter for ND bundle
   ava(r,i,v1)     Share parameter for VA bundle
   axp(r,i)        Presence of output flag

   ae(r,i,v1)      Share parameter for energy bundle
   at(r,i,v1)      Share parameter for land
   af(r,i,v1)      Share parameter for sector specific factor
   al(r,i,v1)      Share parameter for labor
   ald(r,l,i)      Share parameter for labor bundle
   ak(r,i,v1)      Share parameter for capital

   ahkte(r,i,v1)   Share parameter for hkte bundle
   ahkt(r,i,v1)    Share parameter for hkt bundle
   akt(r,i,v1)     Share parameter for kt bundle
   ah(r,i,v1)      Share parameter for human capital factor

*  For crops

   ahktef(r,i,v1)  Share parameter for hktef bundle
   afert(r,i,v1)   Share parameter for fertilizer bundle

   aft(r,j,i)      Share parameters for fertilizer bundle
   sigmaft(r,i)    CES substitution elasticity across fertilizers

*  For livestock

   aktel(r,i,v1)   Share parameter for ktel bundle
   atfd(r,i,v1)    Share parameter for tfd bundle

   afeed(r,i,v1)   Share parameter for feed bundle

   afd(r,j,i)      Share parameters for feed bundle
   sigmafd(r,i)    CES substitution elasticity across feed

   a(r,i,j)        Leontief IO coefficients
   aep(r,i,j,v1)   CES share parameters for the energy bundle in production
   apd(r,i,j)      Armington domestic share parameters in production
   apm(r,i,j)      Armington import share parameters in production

*  Trade parameters

   aew(r,rp,i)       Second level CET share parameters
   lambdaw(r,rp,i)   Trade efficiency parameter
   lambdaw0(r,rp,i)  Initial trade efficiency parameter
   chiTRQ(r,rp,i)    Quota rent income share parameter

   axd(r,i)          Top level CET share parameter for domestic supply
   axe(r,i)          Top level CET share parameter for export supply

   ad(r,i)           Aggregate Armington domestic share
   am(r,i)           Aggregate Armington import share

   beta1(r,r1,i)     First tier import share parameter
   beta2(r,r2,i)     Second tier import share parameter
   amw(r,rp,i)       Third tier Armington share parameter

   thetad(r,i)       Domestic shift parameter in Armington function
   thetam(r,i)       Import shift parameter in Armington function
   yelasArm0(r,i,m)  Initial Armington income elasticities
   yelasArm(r,i,m)   Final Armington income elasticities

   sigmam(r,i)       Aggregate Armington CES elasticity
   sigmamf(r,i,f)    Armington CES elasticity for final demand
   thetArm1(r,i)     Theta parameter for adjusting share parameters at top nest
   betaArm1(r,i,m)   Beta parameter for adjusting share parameters
   mrktshr1(r,i,m)   Market share
   thetArm2(r,i)     Theta parameter for adjusting share parameters at second nest
   betaArm2(r,rp,i)  Beta parameter for adjusting share parameters at second nest
   mrktshr2(r,rp,i)  Market shares

   a0(r,i)           Shift parameter for Armington AIDS function
   betad(r,i)        Domestic income parameter
   betam(r,i)        Import income parameter
   gdd(r,i)          Cross parameter for Armington AIDS function
   gdm(r,i)          Cross parameter for Armington AIDS function
   gmm(r,i)          Cross parameter for Armington AIDS function
   gmd(r,i)          Cross parameter for Armington AIDS function

   ebar0(r,i)        Export supply reference point

*  AIDS parameters

   add(r,i)          Armington share parameter for domestic goods
   adm(r,i)          Armington share parameter for intraregional imports
   sigmab(r,i)       Armington CES elasticity for XD and intraregional imports
   alpha0(r,i)       AIDS price shift parameter
   alpha(rp,r,i)     AIDS share parameters
   beta(rp,r,i)      AIDS income parameters
   yelasAIDS(rp,r,i) AIDS income elasticities
   gamma(rp,rpp,r,i) AIDS cross price parameters

*  Income distribution parameters

   phiLnd(r,h)       Land distribution shares
   phiFF(r,h)        Fixed factor distribution shares
   phiLab(r,h,ll)    Labor income distribution shares
   phiKap(r,h)       Capital income distribution shares

*  Final demand parameters

   acons(r,i,k,h)    Household transition matrix share coefficients
   mpc(r,k,h)        Household marginal propensity to consume
   theta(r,k,h)      Household floor consumption
   mps(r,h)          Household marginal propensity to save
   alphas(r,h)       Household savings shift parameter
   frisch(r,h)       Household Frisch parameter
   etas0(r,h)        Household saving income elasticity in base year
   acd(r,i,h)        Household domestic share parameters
   acm(r,i,h)        Household import share parameters

*  ----- For AIDADS

   alphaAD(r,k,h)    Alpha parameter in AIDADS function
   betaAD(r,k,h)     Beta parameter in AIDADS function
   aad(r,h)          Utility function shift parameter

   afa(r,i,f)        Final demand share parameters
   afdd(r,i,f)       Final demand domestic share parameters
   afdm(r,i,f)       Final demand import share parameters

   agx(r)            Government expenditure to GDP ratio

   fxconsflag(r,k,h) Flag to determine if consumption is to be fixed

*  Emission parameters

   emicoef(r,i)    Emissions per unit of consumption
   emitaxFlag(r)   Emissions tax flag

*  Trade margin parameters

   atmarg(r)       CES regional share parameters of trade service demand
   amarg(r,i)      Local share coefficients for trade service production

*  Factor supply parameters

   chiMigr(r,ll)   Labor migration shift parameter
   amin0(r,ll,gz)  Minimum wage function shift parameter

   ats(r)          Aggregate land supply curve shift parameter
   landMax(r)      Maximum amount of land
   gammats(r)      Curvature parameter in land supply function
   alnd(r,i)       CET share parameters for sectoral land supply
   als(r,ll)       Labor supply curve shift parameter
   akap(r,i)       CET share parameters for sectoral capital supply
   wdist0(r,ll,i)  Wage distribution matrix
   afs(r,i)        Sector specific factor supply shifter

   chiInv(r)       Investment function shift parameter
   epsI(r)         Investment function elasticity wrt to global rate of return
   epsrr(r)        Investment function elasticity wrt to local rate of return
   epsY(r)         Investment function elasticity wrt to gdp growth
   lambdainv(r)    Persistence parameter in investment function

*  Depreciation rates
   fdepr(r)        Fiscal capital depreciation rate
   depr(r)         Real capital depreciation rate

*  Lagged variables
   rgdpmpLag(r)       Lagged value of rgdpmp
   popLag(r,tranche)  Lagged population
   rgdpLag(r)         Lagged value of rgdp
   apsLag(r,h)        Lagged value of savings rate
   lambdakLag(r,i,v1) Lagged value of capital efficiency factors
   lambdalLag(r,ll,i) Lagged value of labor efficiency factors
   lambdatLag(r,i)    Lagged land productivity
   lambdafLag(r,i)    Lagged fixed factor productivity
   tiLag(r)           Lagged value of real investment
   invshLag(r)        Lagged ratio of investment to GDP
   tgLag(r)           Lagged value of real government expenditures
   labsLag(r,ll,gz)   Lagged labor stock
   emplLag(r,ll,gz)   Lagged employment
   kstockLag(r)       Lagged value of aggregate capital stock
   rratLag(r,i)       Lagged ratio of rental rates
   ;

* --------------------------------------------------------------------
*  Model variables
* --------------------------------------------------------------------

Variables

*
*  Crop-specific production variables
*

   hktef(r,i,v1)   Demand for hktef bundle
   phktef(r,i,v1)  Price of hktef bundle
   fert(r,i)       Demand for fertilizer bundle
   pfert(r,i)      Price of fertilizer bundle

*  Livestock-specific production variables

   tfd(r,i,v1)     Demand for tfd bundle
   ptfd(r,i,v1)    Price of tfd bundle
   ktel(r,i,v1)    Demand for ktel bundle
   pktel(r,i,v1)   Price of ktel bundle
   feed(r,i)       Demand for feed bundle
   pfeed(r,i)      Price of feed bundle

*
*  Production variables
*
   nd(r,i)         Demand for aggregate intermediate goods
   va(r,i,v1)      Demand for aggregate value added
   uvcv(r,i,v1)    Unit variable cost of production by vintage
   uvc(r,i)        Unit variable cost of production
   ac(r,i)         Unit average cost of production
   px(r,i)         Producer price exclusive of producer taxes
   cdr(r,i)        Cost disadvantage ratio
   markup(r,i)     Price markup
   pp(r,i)         Producer price inclusive of producer taxes
   nfirm(r,i)      Number of firms

   ld(r,i)         Demand for the aggregate labor bundle
   hkte(r,i,v1)    Demand for hkte bundle
   pva(r,i,v1)     Price of value added

   labdv(r,ll,i)   Demand for variable labor
   labdf(r,ll,i)   Demand for fixed labor
   awage(r,i)      Price of the aggregate labor bundle

   xep(r,i,v1)     Demand for energy in production
   hkt(r,i,v1)     Demand for hkt bundle
   kt(r,i,v1)      Demand for kt bundle
   phkte(r,i,v1)   Price of hkte bundle
   phkt(r,i,v1)    Price of hkt bundle

   td(r,i)         Demand for land
   ff(r,i)         Demand for the sector specific factor
   kapdv(r,i,v1)   Demand for variable capital by vintage
   kapdf(r,i)      Demand for fixed capital
   pkt(r,i,v1)     Price of kt bundle

   xap(r,i,j)      Demand for Armington goods in production
   pnd(r,i)        Price of aggregate intermediate goods
   pep(r,i,v1)     Price of energy bundle in production

   xdp(r,i,j)      Demand for domestic goods in production
   xmp(r,i,j)      Demand for imported goods in production
   pap(r,i,j)      Armington price in production

*
*  Income variables
*

   profit(r,i)     Sectoral profits
   LandY(r)        Land income
   FFactY(r)       Fixed factor income
   LabY(r,ll)      Labor income
   KapY(r)         Capital income
   yh(r,h)         Aggregate income variable
   Deprec(r,h)     Depreciation income
   yd(r,h)         Household disposable income
   yc(r,h)         Household expenditure bundle

*
*  Consumer demand variables
*

   xc(r,k,h)       Consumer demand by commodity
   pc(r,k,h)       Consumer price
   supy(r,h)       Supernumerary income
   xac(r,i,h)      Household Armington consumption
   savh(r,h)       Household saving
   aps(r,h)        Average propensity to consume

   xdc(r,i,h)      Household consumption of domestic goods
   xmc(r,i,h)      Household consumption of imported goods
   pac(r,i,h)      Household Armington price
   cpi(r,h)        Consumer price index

*  ----- AIDADS variables

   uad(r,h)        Utility level
   mu(r,k,h)       Marginal propensity to consume

*
*  Final demand variables
*

   xaf(r,i,f)      Final demand Armington consumption
   pfd(r,f)        Aggregate price index for final demand consumption

   xdf(r,i,f)      Final demand consumption of domestic goods
   xmf(r,i,f)      Final demand consumption of imported goods
   paf(r,i,f)      Final demand Armington price

*
*  Import variables
*

   xa(r,i)         Armington aggregate demand
   pd(r,i)         Price of locally produced goods sold locally
   xmt(r,i)        Aggregate volume of imports
   pa(r,i)         Aggregate Armington price

   xm1(r,r1,i)     Second tier import demand
   pm1(r,r1,i)     Second tier import price

   xm2(r,r2,i)     Third tier import demand
   pm2(r,r2,i)     Third tier import price

   wtf(r,rp,i)     Volume of world trade flows
   wtf_in(r,rp,i)  In quota imports
   wtf_out(r,rp,i) Over quota imports

   shr(r,rp,i)     Volume share of world trade flows
   pmt(r,i)        Aggregate price of imports

*  AIDS variables

   pmAIDS(rp,r,i)  Price matrix for the AIDS function
   pdm(r,i)        Price of the XD domestic import aggregate
   xdm(r,i)        Volume of the XD domestic import aggregate
   share(rp,r,i)   Share matrix

*
*  Domestic and export supply variables
*
   xd(r,i)         Domestic supply of domestic goods
   es(r,i)         Export supply of domestic goods
   xp(r,i)         Gross domestic output

   wpe(r,rp,i)     Border price of exports (fob)
   pet(r,i)        Aggregate producer export price

*
*  Trade prices
*

   tar_p(r,rp,i)   Import quota premium
   tm_p(r,rp,i)    Export price markup
   pe(r,rp,i)      Producer export price by region of destination
   wpm(r,rp,i)     Border price of imports (cif)
   pm(r,rp,i)      Local price of imports tariff inclusive
   er(r,rp)        Exchange rate converting currency of region rp into r

*
*  Trade and transportation services variables
*

   xwmarg          Global volume of trade service demand
   xtmarg(r)       Aggregate regional volume of trade service supply
   pwmarg          Global price index of trade service demand
   xmarg(r,i)      Trade service demand for local goods and services
   ptmarg(r)       Aggregate regional price of trade service

*
*  Emission variables
*

   emitot(r)       Total emissions
   emitax(r)       Emissions tax

*
*  Domestic closure
*
   GRev(r)         Government revenues
   savg(r)         Government saving
   rsg(r)          Real government saving
   savf(r)         Level of foreign saving in domestic currency
   fdvol(r,f)      Volume of gov and inv expenditures
   invsh(r)        Ratio of investment to GDP
   p               Numeraire
   psavw           World price of savings
   wrr             Average world rate of return

*
*  labor market equilibrium variables
*

   avgw(r,ll,gz)    Average wage rate
   migr(r,ll)       Rural to urban migration
   labs(r,ll,gz)    Labor supply
   amin(r,ll,gz)    Minimum wage shift factor
   ue(r,ll,gz)      Unemployment rate by zone
   ueTot(r,ll)      National unemployment rate
   wmin(r,ll,gz)    Minimum wage by zone
   twage(r,ll,gz)   Aggregate wage rate
   wage(r,ll,i)     Sectoral wage rate
   nwage(r,ll,i)    Sectoral wage rate net of taxes
   wdist(r,ll,i)    Wage premium

*
*  Land equilibrium variables
*

   tland(r)        Aggregate volume of agricultural land
   ptland(r)       Aggregate price of land
   ts(r,i)         Sectoral supply of land
   pt(r,i)         Price of land by sector
   npt(r,i)        Price of land by sector net of taxes

*
*  Sector specific factor
*
   fs(r,i)         Sectoral supply of sector-specific factor
   pf(r,i)         Equilibrium price of sector-specific factor

*
*  Capital market equilibrium variables
*
   kaps(r,i)       Sectoral capital supply
   rrat(r,i)       Ratio of rental rates
   trent(r)        Aggregate rental rate
   rent(r,i,v1)    Rental rate
   nrent(r,i,v1)   Rental rate net of taxes

   kxrat(r,i)      Old capital output ratio
   xpv(r,i,v1)     Output by vintage

*
*  Capital stock variables
*

   ginv(r)         Growth rate of real investment
   kstock(r)       Aggregate volume of capital stock
   tkaps(r)        Aggregate volume of (normalised) capital stock

*
*  GDP definitions
*

   rgdpmp(r)       Real GDP at market price
   gdpmp(r)        Nominal GDP at market price
   rgdp(r)         Real GDP at factor cost
   pgdp(r)         GDP at FC deflator
   pabs(r)         Aggregate absorption price

*
*  Dynamic variables
*
   glab(r,ll,gz)   Labor force growth rates
   ggdp(r)         Growth rate of real GDP
   gk(r)           Common capital growth factor for capital
   lambdak(r,i,v1) Efficiency factor for capital

   gl(r)            Common labor growth factor for labor
   lambdal(r,ll,i)  Efficiency factor for labor
   chip(r,i)        Endogenous productivity shift factor
   phip(r,i)        Endogenous productivity scale factor
   kaplab(r)        Capital per worker ratio

   agprod(r,i)      Agricultural productivity

*
*  Other variables
*

   savfbar(r)      Level of foreign saving in world currency

*
*  Objective variable
*
   obj             Objective variable
   ;

* --------------------------------------------------------------------
*  Policy variables
* --------------------------------------------------------------------

variables

*
*  Taxes
*
   pdtax(r,i,j)    Indirect tax in sector j on domestic good i
   pmtax(r,i,j)    Indirect tax in sector j on imported good i
   patax(r,i,j)    Indirect tax in sector j on Armington good i

   ptax(r,i)       Producer tax (or subsidy)

   etax(r,rp,i)    Export tax (or subsidy) by region of origin and destination

   tar(r,rp,i)     Tariff by region of origin (r) and destination (rp)
   tar_out(r,rp,i) Over quota tariff
   wtf_q(r,rp,i)   Import quota level

   cdtax(r,i,h)    Consumer tax on domestic goods
   cmtax(r,i,h)    Consumer tax on imported goods
   catax(r,i,h)    Consumer tax on Armington goods

   kappah(r,h)     Household direct tax rate
   chik(r)         Household direct tax shifter
   wagetax(r,ll,i) Wage tax
   KapTax(r,i,v1)  Tax on capital
   LndTax(r,i)     Tax on land
   trg(r,h)        Transfers to households

   fdtax(r,i,f)    Final demand tax on domestic goods
   fmtax(r,i,f)    Final demand tax on imported goods
   fatax(r,i,f)    Final demand tax on Armington goods

*  Tax shifters for limiting demand across the board

   mtxadj(r,i)     Multiplicative tax adjustment factor
   atxadj(r,i)     Additive tax adjustment factor

*
*  Other (exogenous) variables
*
   tmarg(r,rp,i)   Trade margins between region r and region rp

   ;

* --------------------------------------------------------------------
*  Dynamic variables
* --------------------------------------------------------------------

variables

   hpop(r,h)         Population level by household
   pop(r,tranche)    National population by tranche
   deprat(r,tranche) Dependency ratio by tranche
   lambdat(r,i)      Efficiency factor for land
   lambdaf(r,i)      Efficiency factor for other resources
   lambdaep(r,i,j)   Energy efficiency factor
   lambdaft(r,i,j)   Fertilizer efficiency factor
   lambdafd(r,i,j)   Feed efficiency factor
   ;

* --------------------------------------------------------------------
*  Other parameters
* --------------------------------------------------------------------

parameters

   wageBarg(r,ll,i)   Flag for presence of wage bargaining
   L0(r,ll,i)         Wage premium shift factor
   delta(r,ll,i)      Weight of wage premium in sectoral utility function
   GDPFX(r)           Flag set to 1 to fix GDP 0 otherwise

*  Growth accounting parameters

   lalloc(r,t)     labor reallocation factor
   kalloc(r,t)     Capital reallocation factor
   talloc(r,t)     Land reallocation factor
   lprod(r,t)      labor productivity factor
   kprod(r,t)      Capital productivity factor
   tprod(r,t)      Land productivity factor
   fprod(r,t)      Fixed factor productivity factor
   lgrowth(r,t)    labor growth factor
   kgrowth(r,t)    Capital growth factor
   tgrowth(r,t)    Land growth factor
   fgrowth(r,t)    Fixed factor growth factor

   gT(r,i,t)        Sector specific uniform productivity factor
   gtT(r,t)         Land productivity factor
   gfT(r,t)         Fixed factor productivity factor
   prodshft(r,i)    Sector specific shift factor in productivity

   labshr(r,ll,i)  Labor share in GDP
   kapshr(r,i)     Capital share in GDP
   lndshr(r,i)     Land share in GDP
   ffcshr(r,i)     Fixed factor share in GDP

   labdlag(r,ll,i) Lagged aggregate sectoral labor demand
   kapslag(r)      Lagged aggregate capital supply
   kapdlag(r,i)    Lagged aggregate sectoral capital demand
   lndslag(r)      Lagged aggregate land supply
   lnddlag(r,i)    Lagged sectoral land demand
   ffcslag(r)      Lagged aggregate fixed factor supply

* Welfare calculation variables

   wydt(r,t)            Disposable income
   wlabdt(r,ll,i,t)     Labor demand
   wnwaget(r,ll,i,t)    Net wage
   wkapdt(r,i,t)        Capital demand
   wnrentt(r,i,t)       Net rent
   wtdt(r,i,t)          Land demand
   wnptt(r,i,t)         Land rent
   wfft(r,i,t)          Fixed factor demand
   wpft(r,i,t)          Fixed factor price
   wdtt(r,t)            Direct taxes
   wxact(r,i,h,t)       Consumer demand
   wpact(r,i,h,t)       Consumer prices
   wsavht(r,t)          Savings

$ontext
*  Parameters for calculating income distribution

   Reg_Gini(r)    Gini for each region
   GBL_Gini       Gini for the world
   income(r,h)    Household income
   incdist(r,h)   Income distribution
   popdist(r,h)   Population distribution

   ycap(hh)       Household per capita income
   incshr(hh)     Household income share
   popshr(hh)     Household population share
   ycaps(hh)      Sorted household income per capita
   incshrs(hh)    Sorted household income share
   popshrs(hh)    Sorted population share
   yshrcum(hh)    Cumulative household income share
   ntot           Number of households
   totinc         Total income
   totpop         Total population
   gini           Gini coefficient
   h2             Household index
   minimum        Running minimum
   cumul          Running cumulative share
   previous       Tracking of previous
$offtext
 ;
