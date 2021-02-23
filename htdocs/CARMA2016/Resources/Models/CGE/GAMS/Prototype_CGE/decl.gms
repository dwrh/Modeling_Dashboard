* --------------------------------------------------------------------------------------------------
*
*  Initialize output files
*
* --------------------------------------------------------------------------------------------------

put reportfile ;
if (Header eq 1, put 'Scenario,year,variable,sector,qualifier,type,value' / ; ) ;

reportfile.pc   = 5 ;
reportfile.pw = 255 ;
reportfile.nj =   1 ;
reportfile.nw =  15 ;
reportfile.nd =   9 ;
reportfile.nz =   0 ;
reportfile.nr =   0 ;

file screen / 'con' / ;

* ------------------------------------------------------------------------------
*
* Declare initial variables
*
* ------------------------------------------------------------------------------

parameters

* ----- Production block

   nd0(i)         Initial demand for aggregate intermediates
   va0(i)         Initial demand for aggregate value added
   px0(i)         Initial unit cost
   pp0(i)         Initial producer price

   xap0(k,j)      Initial demand for intermediate goods
   pnd0(i)        Initial price of aggregate intermediate demand
   geg0(k,j)      Growth rate of electrity and gas use

   kl0(i)         Initial demand for aggregate capital labor bundle
   ttd0(i)        Initial demand for aggregate land
   rd0(i)         Initial demand for sector specific resource
   pva0(i)        Initial price of aggregate value added

   usk0(i)        Initial demand for aggregate unskilled labor bundle
   ksk0(i)        Initial demand for capital skilled bundle
   pkl0(i)        Initial price of capital labour bundle

   skl0(i)        Initial demand for skilled labor bundle
   ktd0(i)        Initial demand for aggregate capital
   pksk0(i)       Initial price of capital skilled labor bundle

   ld0(i,l)       Initial demand for labor by skill
   pusk0(i)       Initial price of aggregate unskilled labor bundle
   pskl0(i)       Initial price of skilled labor bundle

   kd0(i,kt)      Initial demand for capital
   pktd0(i)       Initial price of aggregate capital

   td0(i,lt)      Initial demand for land
   pttd0(i)       Aggregate land price

   xp0(i)         Initial production level
   p0(k)          Initial average commodity price

* ----- Income distribution

   ly0(l)         Initial aggregate labor income
   ky0(kt)        Initial aggregate capital income
   ty0(lt)        Initial land income
   ry0            Initial income from sector specific resource

   ktre0(kt)      Initial aggregate corporate income
   ktrh0(kt)      Initial aggregate capital transfers to households
   ktrw0(kt)      Initial aggregate transfers to ROW

   cy0(e)         Initial corporate income
   savc0(e)       Initial corporate retained earnings
   ctrh0(e)       Initial aggregate corporate transfers to households
   ctrw0(e)       Initial corporate transfers to rest of world

* ----- Income block

   yh0(h)         Initial total household income
   yd0(h)         Initial disposable income
   htr0(h)        Initial total household transfers
   htrh0(h,hh)    Initial intra household transfers
   htrw0(h)       Initial transfers to rest of world

* ----- Demand block

   xac0(k,h)      Initial household demand for goods and services
   savh0(h)       Initial household saving
   cpi0(h)        Initial household price index
   gce0(k,h)      Growth rate of electricity and gas demand

   xaf0(k,f)      Initial sectoral expenditures for other final demand accounts
   pf0(f)         Initial expenditure deflator for other final demand accounts
   yf0(f)         Initial aggregate value of expenditures

* ----- Trade block

   xa0(k)         Initial Armington demand
   xdd0(k)        Initial local demand for domestic production
   xmt0(k)        Initial aggregate level of imports
   pa0(k)         Initial Armington price inclusive of margins

   pm0(k,r)       Initial import price by region inclusive of tariffs
   xm0(k,r)       Initial volume of imports by region of origin
   pmt0(k)        Initial aggregate import price

   pe0(k,r)       Initial export price by region
   xds0(k)        Initial supply for domestic sales
   xet0(k)        Initial aggregate volume of exports
   x0(k)          Initial supply of commodities

   xe0(k,r)       Initial supply of exports by region of destination
   pet0(k)        Initial aggregate export price

   ed0(k,r)       Initial demand for exports by region of destination

* ----- Domestic trade and transport margins

   ytmg0(k,mg)    Initial aggregate margin values
   xtmg0(k,mg)    Initial aggregate margin volumes
   xamg0(k,kk,mg) Initial margins
   ptmg0(k,mg)    Initial aggregate margin price index

* ----- Goods market equilibrium

   pd0(k)         Initial price of domestic sales
   wpe0(k,r)      Initial world export price in international currency terms

* ----- Government accounts

   tary0          Initial level of tariff revenue
   rtary0         Initial real level of tariff revenue
   gy0            Initial government income
   gexp0          Initial aggregate government expenditures
   savg0          Initial government savings
   taxadjh0       Initial household tax adjustment
   taxadjc0       Initial household tax adjustment

* ----- Investment and macro closure

   xf0(f)         Initial aggregate volume of expenditures
   plev0          Initial price level
   walras0        Initial level of walras law

* ----- Factor block

   ls0(l,gz)      Initial labor supply by skill
   ewage0(l,gz)   Initial equilibrium wage
   wage0(i,l)     Initial sectoral wage by skill level

   migr0(l)       Initial migration level
   awage0(l,gz)   Initial average wage

   tlabs0         Initial total labor supply
   twage0         Initial aggregate wage

   tks0(kt)       Initial aggregate capital supply normalized
   PK0            Initial price of capital

   ks0(i,kt)      Initial sectoral capital supply
   ptks0(kt)      Initial aggregate price of capital
   rent0(i,kt)    Initial rate of return for capital

   tts0(lt)       Initial total land supply
   PLand0         Initial aggregate price of land

   ts0(i,lt)      Initial sectoral land supply
   ptts0(lt)      Initial average price of land
   pt0(i,lt)      Initial sectoral price of land

   rs0(i)         Initial sectoral sector specific resource
   pr0(i)         Initial price of sector specific resource

* ----- Macro identities

   gdpmp0         Initial GDP at market price
   rgdpmp0        Initial real GDP at market price
   pgdpmp0        Initial GDP deflator at market price
   gdpfc0         Initial GDP at factor cost
   rgdpfc0        Initial real GDP at factor
   pgdpfc0        Initial real GDP at factor cost deflator

* ----- Growth variables

   ggdp0          Initial GDP growth rate
   lambdal0(i,l)  Initial labor productivity

* ----- Growth factors

   gl0            Initial labor productivity growth rate
   lambdak0(i,kt) Initial capital productivity
   lambdat0(i,lt) Initial land productivity
   lambdar0(i)    Initial resource productivity
   KSup0          Initial aggregate capital supply normalized
   tk0            Initial non normalized aggregate capital stock
   Land0          Initial aggregate supply of land

* ----- Trade prices

   wpm0(k,r)      Initial world import price in international currency terms
   wpendx0(k,r)   Initial world export price index
   er0            Initial exchange rate

* ----- Policy variables

   rsg0           Initial real government savings
   tp0(j)         Initial production tax
   tcp0(k,j)      Initial sales tax in intermediate demand
   tcc0(k,h)      Initial sales tax in household demand
   tcf0(k,fd)     Initial sales tax in other final demand
   kappah0(h)     Initial income rate
   gtrh0(h)       Initial government transfers to households
   kappac0(e)     Initial corporate tax rate
   tmadj0         Initial tariff adjustment factor
   tm0(k,r)       Initial tariff rates
   te0(k,r)       Initial export tax and or subsidy
   tfl0(j,l)      Initial tax on labor
   tfk0(j,kt)     Initial tax on capital
   tft0(j,lt)     Initial tax on land
   tfr0(j)        Initial tax on sector specific resource

* ----- Miscellaneous variables

   wtrh0(h)       Initial remittances from row
   wtrg0          Initial transfers to government from rest of the world
   gtrw0          Initial transfers to the rest of the world from the government
   savf0          Initial foreign investment inflows
   csavrate0(e)   Initial corporate saving rate
   tmg0(k,mg)     Initial domestic margins

* ----- Dynamic variables

   pop0(h)        Initial population level
   glab0(l,gz)    Initial growth rate of labor

* ----- Lagged variables

   rgdpmpLag       Lagged GDP
   lambdalLag(i,l) Lagged labor productivity factor
   lambdakLag(i,kt) Lagged capital productivity factor
   lambdatLag(i,lt) Lagged land productivity factor
   lslag(l,gz)     Lagged labor supply
   xaplag(k,j)     lagged intermediate use
   xaclag(k,h)      lagged consumption
;

* ------------------------------------------------------------------------------
*
* Declare key model parameters
*
* ------------------------------------------------------------------------------

parameters

* ----- Production block

   sigmac(k)     CES substitution of produced goods into commodities

   sigmap(i)     CES elasticity between ND and VA bundles
   sigmav(i)     CES elasticity between KL and T bundles
   sigmakl(i)    CES elasticity between USK and KS
   sigmaks(i)    CES elasticity between K and SKL
   sigmau(i)     CES elasticity across unskilled labor
   sigmas(i)     CES elasticity across skilled labor
   sigmat(i)     CES elasticity across different types of land
   sigmak(i)     CES elasticity across different types of capital

* ----- Demand block

   eta(k,h)      Household income elasticities

* ----- Trade block

   sigmam(k)     First level Armington elasticity
   sigmaw(k)     Second level Armington elasticity
   sigmax(k)     First level CET elasticity
   sigmaz(k)     Second level CET elasticity
   etae(k,r)     Export demand elasticity



;

* ------------------------------------------------------------------------------
*
* Declare calibrated model parameters
*
* ------------------------------------------------------------------------------

parameters

* ----- Production block

   ac(i,k)       CES share parameters for transforming produced goods into commodities

   ava(i)        VA share parameter
   and(i)        ND share parameter

   a(k,j)        Input output coefficients

   akl(i)        KL share parameter
   au(i)         USK share parameter
   aksk(i)       KSK share parameter
   as(i)         SKL share parameter

   akt(i)        Aggregate capital share parameter
   ak(i,kt)      Capital share parameter
   att(i)        Aggregate land share parameter
   ar(i)         Natural resource share parameter
   at(i,lt)      Land share parameter
   al(i,l)       Labor by skill share parameters

* ----- Income distribution parameters

   xkht(kt)      Aggregate household share of capital earnings
   xket(kt)      Aggregate enterprise share of capital earnings
   xkwt(kt)      Aggregate ROW share of capital earnings

   xkh(kt,h)     Household shares of capital earnings
   xke(kt,e)     ROW shares of capital earnings
   xkw(kt)       ROW shares of capital earnings

   xcht(e)       Aggregate household share of corporate income
   xcwt(e)       Aggregate ROW share of corporate income

   xch(e,h)      Household shares of corporate earnings
   xcw(e)        ROW shares of corporate earnings

   xth(lt,h)     Household shares of land income

   xlh(h,l)      Household shares of labor earnings

   xrh(h)        Household share of sector specific factor earnings

* ----- Demand block

   mu(k,h)       Marginal propensity to consume
   theta(k,h)    Subsistence minima
   asav(h)       Saving rate
   etas(h)       Income elasticity of saving
   mus(h)        Marginal propensity to save

   ahtr(h)       Share of household after tax income going to transfers
   ahtrh(h,hh)   Share of household transfers going to other households
   ahtrw(h)      Share of household transfers going to rest of the world

   af(k,f)       Final demand expenditure share parameters

* ----- Trade block

   ad(k)          Domestic share parameter
   am(k)          Import share parameter

   aw(k,r)        Second level share parameters

   gd(k)          Domestic CET share parameter
   ge(k)          Export CET share parameter

   gx(k,r)        Second level CET share parameters

   ae(k,r)        Export demand elasticity shifter
   ae0(k,r)       Baseline Export demand elasticity shifter

   amg(k,kk,mg)   Domestic trade margin shares

* ----- Factor block

   als(l,gz)      Labor supply share parameter by category

   atks(kt)       Capital supply share parameters by type
   aks(i,kt)      Capital supply share parameters
   akst(kt)       Top level capital supply share parameters

   atts(lt)       Aggregate land supply share parameters
   ats(i,lt)      Land supply share parameters

   ars(i)         Sector specific supply shift parameter

   chil(i,v)      Sector and skill specific shift parameters
   phil(i,l)      Inter sectoral wage differential parameter
   chim(l)        Shift parameter for migration function
;

* ------------------------------------------------------------------------------
*
* Declare diagnostic variables for post-processing
*
* ------------------------------------------------------------------------------

parameters
   sam(s,ss)     Post proc social accounting matrix
   vatax(v,j)    Value added tax matrix
   walras        Evaluation of walras law
   rscale        Scale variable for output
   work          A working scalar
   index         A temporary index
   delta         Discrepancy

   voc(k,j)	Vehicle operating cost incidence
   chk1
   chkk(k)
   chki(i)
   chkh(h)
   chkl(l)
   
   ntcip	Expenditure for the NTCIP infrastructure investments
   
;

* ------------------------------------------------------------------------------
*
* Declare model variables
*
* ------------------------------------------------------------------------------

variables

* ----- Production block

   nd(i)        Demand for aggregate intermediates
   va(i)        Demand for aggregate value added
   px(i)        Unit cost
   pp(i)        Producer price

   xap(k,j)     Demand for intermediate goods
   pnd(i)       Price of aggregate intermediate demand
   geg(k,j)     Growth rate of electricity and gas use

   kl(i)        Demand for KL bundle
   ttd(i)       Aggregate sectoral demand for land
   rd(i)        Demand for the natural resource
   pva(i)       Price of aggregate value added

   usk(i)       Demand for aggregate unskilled labor
   ksk(i)       Demand for capital skilled labor bundle
   pkl(i)       Price of KL bundle

   skl(i)       Demand for aggregate skilled labor
   ktd(i)       Aggregate sectoral capital demand
   pksk(i)      Price of KS bundle

   ld(i,l)      Demand for labor by skill
   pusk(i)      Price of aggregate unskilled labor bundle
   pskl(i)      Price of skilled labor bundle

   kd(i,kt)     Demand for capital
   pktd(i)      Sectoral price of aggregate capital
   td(i,lt)     Demand for land
   pttd(i)      Sectoral price of aggregate land

   xp(i)        Production level
   p(k)         Aggregate commodity price

* ----- Income block

   ly(l)        Aggregate labor income
   ky(kt)       Aggregate capital income
   ty(lt)       Land income
   ry           Aggregate income from sector specific factor

   ktre(kt)     Capital income transferred to enterprises
   ktrh(kt)     Capital income transferred to households
   ktrw(kt)     Capital income transferred to ROW

   cy(e)        Aggregate corporate income
   savc(e)      Corporate savings
   ctrh(e)      Corporate income transferred to households
   ctrw(e)      Corporate income transferred to ROW

   yh(h)        Total income
   yd(h)        Disposable income
   htr(h)       Total household transfers
   htrh(h,hh)   Intra household transfers
   htrw(h)      Household transfers to rest of world

* ----- Demand block

   gce(k,h)     Growth rate of electricity and gas consumption
   xac(k,h)     Household demand for goods and services
   savh(h)      Household savings
   cpi(h)       Consumer price deflator

   xaf(k,f)     Other final demand accounts
   pf(f)        Final demand expenditure deflator
   yf(f)        Final demand aggregate value

* ----- Trade block

   xa(k)        Aggregate Armington demand
   xdd(k)       Domestic demand for domestic output
   xmt(k)       Aggregate sectoral import demand
   pa(k)        Armington price inclusive of margins

   pm(k,r)      Import price by region inclusive of tariffs
   xm(k,r)      Import demand by region of origin
   pmt(k)       Aggregate import price

   pe(k,r)      Export producer price by region
   xds(k)       Export supply
   xet(k)       Aggregate CET volume
   x(k)         Aggregate commodity supply

   xe(k,r)      Export volumes by region of destination
   pet(k)       Aggregate export price

   ed(k,r)      Export demand

* ----- Domestic trade and transport margins

   ytmg(kk,mg)        Aggregate value of trade and transport services
   xtmg(kk,mg)        Aggregate demand for trade and transport services
   xamg(k,kk,mg)      Demand for trade and transport services
   ptmg(kk,mg)        Aggregate price of trade and transport services

* ----- Goods market equilibrium

   pd(k)        Domestic price of domestic output
   wpe(k,r)     World export price in international currency terms

* ----- Government accounts

   tary               Tariff revenues
   rtary              Real tariff revenues
   gy                 Government revenues
   gexp               Government expenditures
   savg               Government savings
   taxadjh            Tax adjustment factor
   taxadjc            Tax adjustment factor

* ----- Closure

   xf(f)        Final demand aggregate volume
   plev         Domestic price level

* ----- Factor block

   ls(l,gz)           Aggregate labor supply by category
   ewage(l,gz)        Equilibrium wage rate
   wage(i,l)          Sectoral wage by skill level

* ----- Migration variables

   migr(l)            Rural to urban migration
   awage(l,gz)        Average wage by zone

   tks(kt)            Aggregate capital stock
   pk                 Aggregate rate of return to capital

   ptks(kt)           Aggregate rate of return to capital
   ks(i,kt)           Sectoral capital supply
   rent(i,kt)         Rate of return for capital

   tts(lt)            Land supply by type
   pland              Aggregate price of land

   ts(i,lt)           Land supply by type and sector
   ptts(lt)           Price of land by type
   pt(i,lt)           Price of land

   rs(i)              Supply of sector specific resource
   pr(i)              Price of natural resource

* ----- Macro variables

   gdpmp        GDP at market price
   rgdpmp       Real GDP at market price
   pgdpmp       GDP at market price deflator

   gdpfc        GDP at factor cost
   rgdpfc       Real GDP at factor cost
   pgdpfc       GDP at factor cost deflator

* ----- Growth variables

   ggdp          GDP growth rate
   lambdal(i,l)  Labor productivity

* ----- Growth factors

   gl            Labor productivity growth rate
   lambdak(i,kt) Capital productivity
   lambdat(i,lt) Land productivity
   lambdar(i)    Natural resource productivity
   ksup          Aggregate normalized capital supply
   tk            Aggregate non normalized capital supply
   land          Aggregate land supply
   pop(h)        Population
   glab(l,gz)    Labor force growth rate by zone

* ----- Trade prices

   wpm(k,r)     World import price in international currency terms
   wpendx(k,r)  Export price index
   er           Exchange rate

* ----- Policy variables

   rsg          Real government savings
   tp(i)        Production tax
   tcp(k,j)     Indirect taxes on intermediate consumption
   tcc(k,h)     Indirect taxes on household consumption
   tcf(k,f)     Indirect taxes on other final demand
   kappah(h)    Income tax rate
   gtrh(h)      Government transfers to households
   kappac       Corporate tax rate
   
   tmadj        Tariff uniform adjustment factor
   tm(k,r)      Tariff rates
   te(k,r)      Export tax rates

   tfl(j,l)     Labor tax
   tfk(j,kt)    Capital tax
   tft(j,lt)    Land tax
   tfr(j)       Tax on sector specific resource

* ----- Miscellaneous variables

   wtrh(h)      Remittances to households from abroad
   wtrg         Transfers to government from rest of the world
   gtrw         Government transfers to rest of the world
   savf         Foreign investment inflows
   csavrate(e)  Corporate savings rate
   tmg(k,mg)    Domestic trading margins

;

* -- Definitions for ELES Calibration
parameters
   share0(k,h)    Initial budget shares
;

variables
   thetav(k,h)    Calibrated theta parameters
;

equations
   thetaeq(k,h)   Consumer demand calibration equation
;

thetaeq(k,h)$(savh0(h) ne 0)..
   xac0(k,h)*(1+tcc0(k,h))*pa0(k) =e= (1+tcc0(k,h))*pa0(k)*thetav(k,h) + mu(k,h)*(yd0(h)
                                   -   sum(kk,(1+tcc0(k,h))*pa0(kk)*thetav(kk,h))) ;

model eles / thetaeq / ;

