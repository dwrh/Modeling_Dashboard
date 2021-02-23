* --------------------------------------------------------------------
*
*  LINKAGE -- LINKAGE Applied General Equilibrium Model
*
*  Model Definition
*  ----------------
*
*  Based on GTAP Version 5
*
* --------------------------------------------------------------------

* --------------------------------------------------------------------
*
*  Declaration of model equations
*
* --------------------------------------------------------------------

Equations

*  Top-level nest equations

ndeq(r,i)       Demand equation for aggregate intermediate demand
vaeq(r,i,v)     Demand equation for aggregate value added
uvcveq(r,i,v)   Unit cost of production by vintage
uvceq(r,i)      Unit cost of production

*  Market price equations

aceq(r,i)       Definition of average cost
pxeq(r,i)       Definition of producer price exclusive of taxes
ppeq(r,i)       Definition of producer price tax inclusive
profiteq(r,i)   Definition of sectoral profits

*
*  Crop production structure equations
*

ldcreq(r,i)       Demand equation for aggregate labor
hktefcreq(r,i,v)  Demand for hktef bundle
pvacreq(r,i,v)    Price of aggregate value added bundle

labdvcreq(r,l,i)  Demand equation for labor by skill
awagecreq(r,i)    Price of aggregate labor bundle

fertcreq(r,i)     Demand for the fertilizer bundle in crop production
hktecreq(r,i,v)   Demand for hkte bundle
phktefcreq(r,i,v) Price of hktef bundle

xepcreq(r,i,v)    Demand for the energy bundle in crop production
hktcreq(r,i,v)    Demand for the hkt bundle
hdcreq(r,i)       Demand for human capital
ktcreq(r,i,v)     Demand for kt bundle
phktecreq(r,i,v)  Price of hkte bundle
phktcreq(r,i,v)   Price of the hkt bundle

tdcreq(r,i)       Demand equation for land
ffcreq(r,i)       Demand equation for sector specific resource
kapdvcreq(r,i,v)  Demand equation for capital
pktcreq(r,i,v)    Price of kt bundle

xapcreq1(r,i,j)   Demand for non energy intermediate Armington demand
pndcreq1(r,i)     Price of aggregate intermediate demand bundle and ArmFlag eq 1
pndcreq2(r,i)     Price of aggregate intermediate demand bundle and ArmFlag eq 0
xapcreq2(r,i,j)   Demand for energy intermediate Armington demand with ArmFlag eq 1
xapcreq3(r,i,j)   Demand for energy intermediate Armington demand with ArmFlag eq 0
xapcreq4(r,i,j)   Demand for fertilizer intermediate Armington demand with ArmFlag eq 1
xapcreq5(r,i,j)   Demand for fertilizer intermediate Armington demand with ArmFlag eq 0
pepcreq1(r,i,v)   Price of energy bundle in crop production and ArmFlag eq 1
pepcreq2(r,i,v)   Price of energy bundle in crop production and ArmFlag eq 0
pfertcreq1(r,i)   Price of fertilizer bundle in crop production and ArmFlag eq 1
pfertcreq2(r,i)   Price of fertilizer bundle in crop production and ArmFlag eq 0

*
*  Livestock production structure equations
*

ktellveq(r,i,v)   Demand equation for ktel bundle
tfdlveq(r,i,v)    Demand equation for tfd bundle
pvalveq(r,i,v)    Price of aggregate value added bundle

feedlveq(r,i)     Demand equation for feed bundle
tdlveq(r,i)       Demand equation for land
ptfdlveq(r,i,v)   Price of tfd bundle

ldlveq(r,i)       Demand equation for aggregate labor
hktelveq(r,i,v)   Demand for hkte bundle
pktellveq(r,i,v)  Price of ktel bundle

labdvlveq(r,l,i)  Demand equation for labor by skill
awagelveq(r,i)    Price of aggregate labor bundle

xeplveq(r,i,v)    Demand for the energy bundle in livestock production
hktlveq(r,i,v)    Demand for hkt bundle
phktelveq(r,i,v)  Price of hkte bundle
ktlveq(r,i,v)     Demand for the kt bundle
phktlveq(r,i,v)   Price of the hkt bundle
hdlveq(r,i)       Demand for human capital

fflveq(r,i)       Demand equation for sector specific resource
kapdvlveq(r,i,v)  Demand equation for capital
pktlveq(r,i,v)    Price of kt bundle

xaplveq1(r,i,j)   Demand for non energy intermediate Armington demand
pndlveq1(r,i)     Price of aggregate intermediate demand bundle and ArmFlag eq 1
pndlveq2(r,i)     Price of aggregate intermediate demand bundle and ArmFlag eq 0
xaplveq2(r,i,j)   Demand for energy intermediate Armington demand with ArmFlag eq 1
xaplveq3(r,i,j)   Demand for energy intermediate Armington demand with ArmFlag eq 0
xaplveq4(r,i,j)   Demand for feed intermediate Armington demand with ArmFlag eq 1
xaplveq5(r,i,j)   Demand for feed intermediate Armington demand with ArmFlag eq 0
peplveq1(r,i,v)   Price of energy bundle in livestock production and ArmFlag eq 1
peplveq2(r,i,v)   Price of energy bundle in livestock production and ArmFlag eq 0
pfeedlveq1(r,i)   Price of feed bundle in livestock production and ArmFlag eq 1
pfeedlveq2(r,i)   Price of feed bundle in livestock production and ArmFlag eq 0

*
*  Manufacturing and services production structure equations
*

ldeq(r,i)       Demand equation for aggregate labor
hkteeq(r,i,v)   Demand for hkte bundle
pvaeq(r,i,v)    Price of aggregate value added bundle

labdveq(r,l,i)  Demand equation for labor by skill
awageeq(r,i)    Price of aggregate labor bundle

xepeq(r,i,v)    Demand for the energy bundle in production
hkteq(r,i,v)    Demand for hkt bundle
kteq(r,i,v)     Demand for kt bundle
phkteeq(r,i,v)  Price of hkte bundle
phkteq(r,i,v)   Price of the hkt bundle
hdeq(r,i)       Demand for human capital

tdeq(r,i)       Demand equation for land
ffeq(r,i)       Demand equation for sector specific resource
kapdveq(r,i,v)  Demand equation for capital
pkteq(r,i,v)    Price of kt bundle

xapeq1(r,i,j)   Demand for non energy intermediate Armington demand
pndeq1(r,i)     Price of aggregate intermediate demand bundle and ArmFlag eq 1
pndeq2(r,i)     Price of aggregate intermediate demand bundle and ArmFlag eq 0
xapeq2(r,i,j)   Demand for energy intermediate Armington demand with ArmFlag eq 1
xapeq3(r,i,j)   Demand for energy intermediate Armington demand with ArmFlag eq 0
pepeq1(r,i,v)   Price of energy bundle in production and ArmFlag eq 1
pepeq2(r,i,v)   Price of energy bundle in production and ArmFlag eq 0

*  Armington decomposition in production (all sectors)

xdpeq(r,i,j)    Armington demand equation for intermediate domestic goods
xmpeq(r,i,j)    Armington demand equation for intermediate imported goods
papeq(r,i,j)    Armington price equation in production

*
*  Income distribution
*

LandYeq(r)      Land income identity
FFactYeq(r)     Fixed factor income identity
LabYeq(r,ll)    Labor income identity
KapYeq(r)       Capital income identity
yheq(r,h)       Definition of household income
deprYeq(r,h)    Definition of depreciation income
ydeq(r,h)       Definition of disposable household income
yceq1(r,h)      Household expenditures incl saving
yceq2(r,h)      Household expenditures excl saving

*
*  Consumer demand system
*

supyeq(r,h)     Definition of supernumerary income
xceq(r,k,h)     Household demand equation
pceq(r,k,h)     Household consumer prices
xaceq(r,i,h)    Determination of household Armington consumption
mueq(r,k,h)     Marginal budget shares with AIDADS
uadeq(r,h)      Utility equation with AIDADS
savheq1(r,h)    Determination of household saving with ELES
savheq2(r,h)    Determination of household saving without ELES
apseq(r,h)      Propensity to save

xdceq(r,i,h)    Determination of household consumption of domestic goods
xmceq(r,i,h)    Determination of household consumption of imported goods
paceq1(r,i,h)   Definition of household Armington price with ArmFlag eq 1
paceq2(r,i,h)   Definition of household Armington price with ArmFlag eq 0
cpieq(r,h)      Definition of the consumer price index

*
*  Other final demand functions
*

xafeq(r,i,f)    Determination of Armington final demand
pfdeq1(r,f)     Definition of aggregate final demand price index ArmFlag eq 1
pfdeq2(r,f)     Definition of aggregate final demand price index ArmFlag eq 0

xdfeq(r,i,f)    Determination of final demand for domestic goods
xmfeq(r,i,f)    Determination of final demand for imported goods
pafeq(r,i,f)    Definition of final demand Armington price

*
*  Import equations
*

xaeq(r,i)         Determination of aggregate Armington demand ArmFlag eq 0
pdeq1(r,i)        Determination of price of domestic goods ArmFlag eq 1
pdeq2(r,i)        Determination of price of domestic goods ArmFlag eq 0 sigmam ne inf
pdeq3(r,i)        Determination of price of domestic goods ArmFlag eq 0 sigmam eq inf
pdeq4(r,i)        Determination of price of domestic goods using AIDS
xmteq1(r,i)       Determination of aggregate imports ArmFlag eq 1
xmteq2(r,i)       Determination of aggregate imports ArmFlag eq 0 sigmam ne inf
xmteq3(r,i)       Determination of aggregate imports ArmFlag eq 0 sigmam eq inf
xmteq4(r,i)       Determination of aggregate imports using AIDS
paeq1(r,i)        Definition of aggregate Armington price sigmam ne inf
paeq2(r,i)        Definition of aggregate Armington price sigmam eq inf
paeq4(r,i)        Definition of aggregate Armington price using AIDS

xm1eq1(r,r1,i)    First tier Armington import demand equation with sigmaw1 ne inf
xm1eq2(r,r1,i)    First tier Armington import demand equation with sigmaw1 ne inf
pmteq1(r,i)       Definition of aggregate import price with sigmaw1 ne inf
pmteq2(r,i)       Definition of aggregate import price with sigmaw1 eq inf

xm2eq1(r,r1,r2,i) Second tier Armington import demand equation with sigmaw2 ne inf
xm2eq2(r,r1,r2,i) Second tier Armington import demand equation with sigmaw2 eq inf
pm1eq1(r,r1,i)    First tier import price equation with sigmaw2 ne inf
pm1eq2(r,r1,i)    First tier import price equation with sigmaw2 ne inf

wtfeq1(rp,r,r2,i) Determination of import demand by region of origin with sigmaw ne inf
wtfeq2(rp,r,r2,i) Determination of import demand by region of origin with sigmaw eq inf
pm2eq1(r,r2,i)    Definition of aggregate import price with sigmaw ne inf
pm2eq2(r,r2,i)    Definition of aggregate import price with sigmaw eq inf

*  TRQ constraints

wtf_ineq(rp,r,i)  Upper constraint on within quota imports
tar_peq(rp,r,i)   Upper constraint on level of TRQ premium
wtf_outeq(rp,r,i) Import identity

*
*  AIDS equations
*

pmAIDSeq1(rp,r,i)    AIDS base price definition for external import
pmAIDSeq2(rp,r,i)    AIDS base price definition for aggregate domestic demand
pdmeq(r,i)           Definition of price of XDM bundle
pAIDSeq(r,i)         Definition of AIDS price index
shareeq(rp,r,i)      Determination of AIDS shares
wtfeq3(rp,r,i)       Determination of external import volumes
xdmeq(r,i)           Determination of XDM volume
pdeq5(r,i)           Determination of XD demand
wtfeq4(r,r,i)        Determination of intraregional imports

*
*  Export equations
*

xdeq1(r,i)      Determination of domestic supply finite CET
xdeq2(r,i)      Determination of domestic supply infinite CET
eseq1(r,i)      Determination of export supply   finite CET
eseq2(r,i)      Determination of export supply   infinite CET
xpeq1(r,i)      Determination of gross output    finite CET
xpeq2(r,i)      Determination of gross output    infinite CET

tm_peq(r,rp,i)  Export price markup with TRQ
wpeeq1(r,rp,i)  Determination of (world) export equilibrium price finite CET
wpeeq2(r,rp,i)  Determination of (world) export equilibrium price infinite CET
peteq1(r,i)     Determination of aggregate export price finite CET
peteq2(r,i)     Determination of aggregate export price infinite CET

*
*  Definition of trade prices
*

peeq(r,rp,i)    Definition of domestic export prices (pre fob)
wpmeq(r,rp,i)   Definition of world import prices (cif)
pmeq(r,rp,i)    Definition of domestic import price tariff inclusive

*
*  Trade service equations
*

xwmargeq        Volume of aggregate trade services
xtmargeq(r)     Regional supply of trade services
pwmargeq        Definition of world price of trade services
xmargeq(r,i)    Demand for local goods and services for production of trade services
ptmargeq(r)     Definition of regional price of trade services

*
*  Emission equations
*

emitoteq(r)     Definition of total regional emissions
emitaxeq(r)     Definition of emission tax if tax is exogenous

*
*  Domestic closure
*

Greveq1(r)      Definition of government revenues ArmFlag eq 1
Greveq2(r)      Definition of government revenues ArmFlag eq 0
savgeq(r)       Determination of government saving
rsgeq(r)        Determination of real government saving
savfeq(r)       Definition of the local value of foreign saving
fdvolgoveq(r)   Determination of government spending

wrreq           Average world rate of return to capital
fdvolinveq(r)   Determination of real investment
invsheq(r)      Investment share of GDP equation when foreign savings are endogenous
inveq(r)        Investment equation when foreign savings are endogenous
psavweq         Investment savings equilibrium price at world level
peq             Definition of numeraire

*
*  Labor market equilibrium conditions
*

avgweq(r,ll,gz)   Average wage definition by zone
migreq(r,ll)      Rural to urban migration function
lsrureq(r,ll)     Rural labor supply
lsurbeq(r,ll)     Urban labor supply
lstoteq(r,ll)     Total labor supply
twageToteq1(r,ll) Total wage equation with national market
twageToteq2(r,ll) Total wage equation with segmented market
twageToteq3(r,ll) Total wage equation with national market and fixed UE
twageeq1(r,ll,gs) Regional wage equation with segmented market
twageeq2(r,ll,gs) Regional wage equation with national market
wminToteq(r,ll)   National minimum wage equation with national market
wmineq1(r,ll,gs)  Regional minimum wage equation with segmented market
wmineq2(r,ll,gs)  Regional minimum wage equation with national market
ueeq(r,ll,gz)     Unemployment definition
ueToteq(r,ll)     Unemployment definition for national market

nwageeq(r,ll,i)   Sectoral wages net of taxes and or subsidies
wageeq(r,ll,i)    Sectoral wage equation
wdisteq(r,ll,i)   Determination of wage premium

*
*  Equilibrium conditions for land
*

tlandeq1(r)     Supply of aggregate land with finite supply elasticity
tlandeq2(r)     Supply of aggregate land with infinite supply elasticity
tlandeq3(r)     Supply of aggregate land with finite supply using logistic function
ptlandeq1(r)    Determination of the aggregate price of land with finite CET
ptlandeq2(r)    Determination of the aggregate price of land with infinite CET
tseq1(r,i)      Sectoral land supply with finite CET
tseq2(r,i)      Sectoral land supply with infinite CET
pteq(r,i)       Determination of sector specific rental rate of land
npteq(r,i)      Determination of land rental rate net of taxes

*
*  Equilibrium conditions for other sector specific resources

fseq1(r,i)      Supply of sector specific resources (finite supply)
fseq2(r,i)      Supply of sector specific resources (infinite supply)
pfeq(r,i)       Equilibrium condition for sector specific resources

*
*  Equilibrium conditions for capital in comparative static mode
*

kapseq1(r,i)    Sectoral capital supply with finite CET
kapseq2(r,i,v)  Sectoral capital supply with infinite CET
trenteq1(r)     Determination of the aggregate rental rate with finite CET
trenteq2(r)     Determination of the aggregate rental rate with infinite CET
renteq1(r,i)    Determination of equilibrium sectoral rental rates

*
*  Equilibrium conditions for capital in dynamic mode
*

kxrateq(r,i)    Determination of capital output ratios
rrateq(r,i)     Determination of equil rental rate in declining sectors
trenteq3(r)     Determination of economywide rental rate for new capital
renteq2(r,i,v1) Determination of old sectoral rental rates
renteq3(r,i,v1) Determination of new sectoral rental rates
nrenteq(r,i,v1) Determination of sectoral rents net of taxes

*
*  Allocation of output across vintages
*

xpveq1(r,i)     Equilibrium ie sum across vintages must add up to total
xpveq2(r,i)     In dynamic mode determines old output

*
*  Calculation of aggregate capital stock
*

ginveq(r)       Definition of real investment growth rate
kstockeq1(r)    Determination of aggregate capital stock w step size EQ 1
kstockeq2(r)    Determination of aggregate capital stock w step size GT 1
tkapseq(r)      Determination of (normalised) aggregate capital stock

*
*  GDP definition
*

rgdpmpeq1(r)    Definition of real GDP at market price ArmFlag eq 1
rgdpmpeq2(r)    Definition of real GDP at market price ArmFlag eq 0
gdpmpeq1(r)     Definition of nominal GDP at market price ArmFlag eq 1
gdpmpeq2(r)     Definition of nominal GDP at market price ArmFlag eq 0
rgdpeq(r)       Definition of real GDP at factor cost
pgdpeq(r)       Definition of GDP at factor cost price deflator
pabseq1(r)      Definition of economywide absorption price with agent specific Armington
pabseq2(r)      Definition of economywide absorption price with national Armington agent

*
*  Dynamic equations
*

ggdpeq(r)        Definition of real GDP growth rate
lambdakeq(r,i,v) Updating of capital productivity factor

kaplabeq(r)        Capital per worker definition
lambdaleq1(r,ll,i) Updating of labor productivity factor w annual gap
lambdaleq2(r,ll,i) Updating of labor productivity factor w non annual gap
chipeq1(r,i)       Endogenous productivity shifter w unit elasticity
chipeq2(r,i)       Endogenous productivity shifter w non unit elasticity
phipeq(r,i)        Scaling factor for endogenous productivity shifter

* Agricultural productivity equations

agprodeq(r,i)      Uniform productivity factor
lamlageq(r,ll,i)   Labor productivity
lamkageq(r,i,v)    Capital productivity
lamtageq(r,i)      Land productivity
lamfageq(r,i)      Fixed factor productivity

*  Objective function equation
*

objeq           Definition of objective function

   ;

* --------------------------------------------------------------------
*
*  Definition of model equations
*
* --------------------------------------------------------------------

* --------------------------------------------------------------------
*
*  Top level production nest
*
* --------------------------------------------------------------------

*
* Top level nest between ND and VA
*

* ----- Equation (P-1)

ndeq(r,i)$(and(r,i,"Old") ne 0)..
   nd(r,i) =e= sum(v,and(r,i,v)*xpv(r,i,v)*(G(r,i)**(sigmap(r,i,v)-1))
            * (uvcv(r,i,v)/pnd(r,i))**sigmap(r,i,v)) ;

nd.fx(r,i)$(and(r,i,"Old") eq 0) = 0 ;
ndeq.m(r,i) = 1 ;

* ----- Equation (P-2)

vaeq(r,i,v)$(ava(r,i,"Old") ne 0)..
   va(r,i,v)*pva(r,i,v)**sigmap(r,i,v) =e= ava(r,i,v)*xpv(r,i,v)
                                        * (G(r,i)**(sigmap(r,i,v)-1))
                                        *  uvcv(r,i,v)**sigmap(r,i,v) ;

va.fx(r,i,v)$(ava(r,i,"Old") eq 0) = 0 ;
vaeq.m(r,i,v) = 1 ;

* ----- Equation (P-3)

uvcveq(r,i,v)$(axp(r,i) ne 0)..
   (G(r,i)*uvcv(r,i,v))**(1-sigmap(r,i,v))
      =e= and(r,i,v)*pnd(r,i)**(1-sigmap(r,i,v))
       +  ava(r,i,v)*pva(r,i,v)**(1-sigmap(r,i,v)) ;

uvcv.fx(r,i,v)$(axp(r,i) eq 0) = 1 ;
uvcveq.m(r,i,v) = 1 ;

* ----- Equation (P-4)

uvceq(r,i)$(axp(r,i) ne 0)..
   uvc(r,i)*xp(r,i) =e= sum(v,uvcv(r,i,v)*xpv(r,i,v)) ;

uvc.fx(r,i)$(axp(r,i) eq 0) = 1 ;
uvceq.m(r,i) = 1 ;

* --------------------------------------------------------------------
*
*  Market structure equations
*
* --------------------------------------------------------------------

* ----- Equation (P-5)

aceq(r,i)$(axp(r,i) ne 0)..
*  ac(r,i)*xp(r,i) =e= uvc(r,i)*xp(r,i)
*                   +  (nfirm(r,i)*(sum(ll,wage(r,ll,i)*labdf(r,ll,i))
*                   +              rent(r,i,"Old")*kapdf(r,i))) ;
   ac(r,i) =e= uvc(r,i)
                    +  (nfirm(r,i)*(sum(ll,wage(r,ll,i)*labdf(r,ll,i))
                    +   rent(r,i,"Old")*kapdf(r,i)))/xp(r,i) ;
   ;

ac.fx(r,i)$(axp(r,i) eq 0) = ac0(r,i) ;
aceq.m(r,i) = 1 ;

* ----- Equation (P-6)

pxeq(r,i)$(axp(r,i) ne 0)..
   px(r,i) =e= uvc(r,i)*(1+markup(r,i)) ;

px.fx(r,i)$(axp(r,i) eq 0) = px0(r,i) ;
pxeq.m(r,i) = 1 ;

* ----- Equation (P-7)

ppeq(r,i)$(axp(r,i) ne 0)..
   pp(r,i) =g= px(r,i)*(1+ptax(r,i)) ;

pp.lo(r,i) = 0.01 ;
pp.fx(r,i)$(axp(r,i) eq 0) = pp0(r,i) ;
ppeq.m(r,i) = 1 ;

* ----- Equation (P-8)

profiteq(r,i)$(axp(r,i) ne 0)..
   profit(r,i) =e= xp(r,i)*(px(r,i)-ac(r,i)) ;

profit.fx(r,i)$(axp(r,i) eq 0) = 0 ;
profiteq.m(r,i) = 1 ;

* --------------------------------------------------------------------
*
*  Crop production nesting
*
* --------------------------------------------------------------------

*
*  Disaggregation of VA nest
*

* ----- Equation (P-9)

ldcreq(r,cr)$(al(r,cr,"Old") ne 0)..
   ld(r,cr) =e= sum(v,al(r,cr,v)*va(r,cr,v)*(pva(r,cr,v)/awage(r,cr))**sigmav(r,cr,v)) ;

ld.fx(r,cr)$(al(r,cr,"Old") eq 0) = 0 ;
ldcreq.m(r,cr) = 1 ;

* ----- Equation (P-10)

hktefcreq(r,cr,v)$(ahktef(r,cr,"Old") ne 0)..
   hktef(r,cr,v)*phktef(r,cr,v)**sigmav(r,cr,v) =e=
      ahktef(r,cr,v)*va(r,cr,v)*pva(r,cr,v)**sigmav(r,cr,v) ;

hktef.fx(r,cr,v)$(ahktef(r,cr,"Old") eq 0) = 0 ;
hktefcreq.m(r,cr,v) = 1 ;

* ----- Equation (P-11)

pvacreq(r,cr,v)$(ava(r,cr,"Old") ne 0)..
   pva(r,cr,v)**(1-sigmav(r,cr,v))
      =e= ahktef(r,cr,v)*phktef(r,cr,v)**(1-sigmav(r,cr,v))
       +  al(r,cr,v)*awage(r,cr)**(1-sigmav(r,cr,v)) ;

pva.fx(r,cr,v)$(ava(r,cr,"Old") eq 0) = 0 ;
pvacreq.m(r,cr,v) = 1 ;

*
*  Disaggregation of the labor demand bundle
*

* ----- Equation (P-12)

labdvcreq(r,l,cr)$(ald(r,l,cr) ne 0)..
   labdv(r,l,cr)*wage(r,l,cr)**sigmal(r,cr) =e=
      ald(r,l,cr)*(lambdal(r,l,cr)**(sigmal(r,cr)-1))*ld(r,cr)*awage(r,cr)**sigmal(r,cr) ;

labdv.fx(r,l,cr)$(ald(r,l,cr) eq 0) = 0 ;
labdvcreq.m(r,l,cr) = 1 ;

* ----- Equation (P-13)

awagecreq(r,cr)$(al(r,cr,"Old") ne 0)..
   awage(r,cr)
      =e= (sum(l,ald(r,l,cr)*(wage(r,l,cr)/lambdal(r,l,cr))**(1-sigmal(r,cr))))**(1/(1-sigmal(r,cr))) ;

awage.fx(r,cr)$(al(r,cr,"Old") eq 0) = 1 ;
awagecreq.m(r,cr) = 1 ;

*
*  Disaggregation of ktef bundle
*

* ----- Equation (P-14)

fertcreq(r,cr)$(afert(r,cr,"Old") ne 0)..
   fert(r,cr) =e= sum(v,afert(r,cr,v)*hktef(r,cr,v)
               *       (phktef(r,cr,v)/pfert(r,cr))**sigmaf(r,cr,v)) ;

fert.fx(r,cr)$(afert(r,cr,"Old") eq 0) = 0 ;
fertcreq.m(r,cr) = 1 ;

* ----- Equation (P-15)

hktecreq(r,cr,v)$(ahkte(r,cr,"Old") ne 0)..
   hkte(r,cr,v)*phkte(r,cr,v)**sigmaf(r,cr,v) =e= ahkte(r,cr,v)*hktef(r,cr,v)
                                        *  phktef(r,cr,v)**sigmaf(r,cr,v) ;

hkte.fx(r,cr,v)$(ahkte(r,cr,"Old") eq 0) = 0 ;
hktecreq.m(r,cr,v) = 1 ;

* ----- Equation (P-16)

phktefcreq(r,cr,v)$(ahktef(r,cr,"Old") ne 0)..
   phktef(r,cr,v)**(1-sigmaf(r,cr,v))
      =e= afert(r,cr,v)*pfert(r,cr)**(1-sigmaf(r,cr,v))
       +  ahkte(r,cr,v)*phkte(r,cr,v)**(1-sigmaf(r,cr,v)) ;

phktef.fx(r,cr,v)$(ahktef(r,cr,"Old") eq 0) = 1 ;
phktefcreq.m(r,cr,v) = 1 ;

*
*  Disaggregation of hkte bundle
*

* ----- Equation (P-17)

xepcreq(r,cr,v)$(ae(r,cr,"Old") ne 0)..
   xep(r,cr,v)*pep(r,cr,v)**sigmae(r,cr,v) =e= ae(r,cr,v)*hkte(r,cr,v)
                                            *  phkte(r,cr,v)**sigmae(r,cr,v) ;

xep.fx(r,cr,v)$(ae(r,cr,"Old") eq 0) = 0 ;
xepcreq.m(r,cr,v) = 1 ;

* ----- Equation (P-18)

hktcreq(r,cr,v)$(ahkt(r,cr,"Old") ne 0)..
   hkt(r,cr,v)*phkt(r,cr,v)**sigmae(r,cr,v) =e= ahkt(r,cr,v)*hkte(r,cr,v)
                                             *  phkte(r,cr,v)**sigmae(r,cr,v) ;

hkt.fx(r,cr,v)$(ahkt(r,cr,"Old") eq 0) = 0 ;
hktcreq.m(r,cr,v) = 1 ;

* ----- Equation (P-19)

phktecreq(r,cr,v)$(ahkte(r,cr,"Old") ne 0)..
   phkte(r,cr,v)**(1-sigmae(r,cr,v))
      =e= ae(r,cr,v)*pep(r,cr,v)**(1-sigmae(r,cr,v))
       +  ahkt(r,cr,v)*phkt(r,cr,v)**(1-sigmae(r,cr,v)) ;

phkte.fx(r,cr,v)$(ahkte(r,cr,"Old") eq 0) = 1 ;
phktecreq.m(r,cr,v) = 1 ;

*
*  25-APR-2000
*  Addition of human capital
*
*  Disaggregation of hkt bundle
*

* ----- Equation (P-20)

hdcreq(r,cr)$(ah(r,cr,"Old") ne 0)..
   labdv(r,"HSk",cr) =e= sum(v,ah(r,cr,v)*(lambdal(r,"HSk",cr)**(sigmah(r,cr,v)-1))
            *  hkt(r,cr,v)*(phkt(r,cr,v)/wage(r,"HSk",cr))**sigmah(r,cr,v)) ;

labdv.fx(r,"HSk",cr)$(ah(r,cr,"Old") eq 0) = 0 ;
hdcreq.m(r,cr) = 1 ;

* ----- Equation (P-21)

ktcreq(r,cr,v)$(akt(r,cr,"Old") ne 0)..
   kt(r,cr,v)*pkt(r,cr,v)**sigmah(r,cr,v) =e= akt(r,cr,v)*hkt(r,cr,v)
                                           *  phkt(r,cr,v)**sigmah(r,cr,v) ;

kt.fx(r,cr,v)$(akt(r,cr,"Old") eq 0) = 0 ;
ktcreq.m(r,cr,v) = 1 ;

* ----- Equation (P-22)

phktcreq(r,cr,v)$(ahkt(r,cr,"Old") ne 0)..
   phkt(r,cr,v)**(1-sigmah(r,cr,v))
      =e=  ah(r,cr,v)*(wage(r,"HSk",cr)/lambdal(r,"HSk",cr))**(1-sigmah(r,cr,v))
       +   akt(r,cr,v)*pkt(r,cr,v)**(1-sigmah(r,cr,v)) ;

phkt.fx(r,cr,v)$(ahkt(r,cr,"Old") eq 0) = 1 ;
phktcreq.m(r,cr,v) = 1 ;

*
*  Disaggregation of kt bundle
*

* ----- Equation (P-23)

kapdvcreq(r,cr,v)$(ak(r,cr,"Old") ne 0)..
   kapdv(r,cr,v)*rent(r,cr,v)**sigmak(r,cr,v) =e= ak(r,cr,v)*kt(r,cr,v)
                                            * (lambdak(r,cr,v)**(sigmak(r,cr,v)-1))
                                            * pkt(r,cr,v)**sigmak(r,cr,v) ;

kapdv.fx(r,cr,v)$(ak(r,cr,"Old") eq 0) = 0 ;
kapdvcreq.m(r,cr,v) = 1 ;

* ----- Equation (P-24)

tdcreq(r,cr)$(at(r,cr,"Old") ne 0)..
   td(r,cr) =e= sum(v,at(r,cr,v)*(lambdat(r,cr)**(sigmak(r,cr,v)-1))
            *  kt(r,cr,v)*(pkt(r,cr,v)/pt(r,cr))**sigmak(r,cr,v)) ;

td.fx(r,cr)$(at(r,cr,"Old") eq 0) = 0 ;
tdcreq.m(r,cr) = 1 ;

* ----- Equation (P-25)

ffcreq(r,cr)$(af(r,cr,"Old") ne 0)..
   ff(r,cr) =e= sum(v,af(r,cr,v)*(lambdaf(r,cr)**(sigmak(r,cr,v)-1))
            *  kt(r,cr,v)*(pkt(r,cr,v)/pf(r,cr))**sigmak(r,cr,v)) ;

ff.fx(r,cr)$(af(r,cr,"Old") eq 0) = 0 ;
ffcreq.m(r,cr) = 1 ;

* ----- Equation (P-26)

pktcreq(r,cr,v)$(akt(r,cr,"Old") ne 0)..
   pkt(r,cr,v)**(1-sigmak(r,cr,v))
      =e=  at(r,cr,v)*(pt(r,cr)/lambdat(r,cr))**(1-sigmak(r,cr,v))
       +   af(r,cr,v)*(pf(r,cr)/lambdaf(r,cr))**(1-sigmak(r,cr,v))
       +   ak(r,cr,v)*(rent(r,cr,v)/lambdak(r,cr,v))**(1-sigmak(r,cr,v)) ;

pkt.fx(r,cr,v)$(kt0(r,cr,"Old") eq 0) = 1 ;
pktcreq.m(r,cr,v) = 1 ;

*
*  Armington disaggregation of the Leontief matrix
*

* ----- Equation (P-31)

xapcreq1(r,nnft,cr)$(a(r,nnft,cr) ne 0)..
   xap(r,nnft,cr) =e= a(r,nnft,cr)*nd(r,cr) ;

xap.fx(r,i,cr)$(xap0(r,i,cr) eq 0) = 0 ;
xapcreq1.m(r,nnft,cr) = 1 ;

* ----- Equation (P-32)

pndcreq1(r,cr)$(and(r,cr,"Old") ne 0 and ArmFlag eq 1)..
   pnd(r,cr) =e= sum(nnft, a(r,nnft,cr)*pap(r,nnft,cr)) ;

pndcreq1.m(r,cr) = 1 ;

pndcreq2(r,cr)$(and(r,cr,"Old") ne 0 and ArmFlag eq 0)..
   pnd(r,cr) =e= sum(nnft, a(r,nnft,cr)*(1+mtxadj(r,nnft)*patax(r,nnft,cr)+atxadj(r,nnft) )*pa(r,nnft)) ;

pndcreq2.m(r,cr) = 1 ;

pnd.fx(r,cr)$(and(r,cr,"Old") eq 0) = pnd0(r,cr) ;

* ----- Equation (P-29)

xapcreq2(r,e,cr)$(aep(r,e,cr,"Old") ne 0 and ArmFlag eq 1)..
   xap(r,e,cr) =e= sum(v,aep(r,e,cr,v)*(lambdaep(r,e,cr)**(sigmaep(r,cr,v)-1))
                *  xep(r,cr,v)*(pep(r,cr,v)/pap(r,e,cr))**sigmaep(r,cr,v)) ;

xapcreq2.m(r,e,cr) = 1 ;

xapcreq3(r,e,cr)$(aep(r,e,cr,"Old") ne 0 and ArmFlag eq 0)..
   xap(r,e,cr) =e= sum(v,aep(r,e,cr,v)*xep(r,cr,v)*(lambdaep(r,e,cr)**(sigmaep(r,cr,v)-1))
                *  (pep(r,cr,v)/((1+mtxadj(r,e)*patax(r,e,cr)+atxadj(r,e))*pa(r,e)))**sigmaep(r,cr,v)) ;

xapcreq3.m(r,e,cr) = 1 ;

* ----- Equation (P-30)

pepcreq1(r,cr,v)$(ae(r,cr,"Old") ne 0 and ArmFlag eq 1)..
   pep(r,cr,v)**(1-sigmaep(r,cr,v))
      =e= sum(e,aep(r,e,cr,v)*(pap(r,e,cr)/lambdaep(r,e,cr))**(1-sigmaep(r,cr,v))) ;

pepcreq1.m(r,cr,v) = 1 ;

pepcreq2(r,cr,v)$(ae(r,cr,"Old") ne 0 and ArmFlag eq 0)..
   pep(r,cr,v)**(1-sigmaep(r,cr,v))
      =e= sum(e,aep(r,e,cr,v)*((1+mtxadj(r,e)*patax(r,e,cr)+atxadj(r,e))*pa(r,e)/lambdaep(r,e,cr))**(1-sigmaep(r,cr,v))) ;

pepcreq2.m(r,cr,v) = 1 ;

pep.fx(r,cr,v)$(ae(r,cr,"Old") eq 0) = pep0(r,cr,"Old") ;

* ----- Equation (P-27)

xapcreq4(r,ft,cr)$(aft(r,ft,cr) ne 0 and ArmFlag eq 1)..
   xap(r,ft,cr)*pap(r,ft,cr)**sigmaft(r,cr) =e= aft(r,ft,cr)*(lambdaft(r,ft,cr)**(sigmaft(r,cr)-1))
                 *  fert(r,cr)*pfert(r,cr)**sigmaft(r,cr) ;

xapcreq4.m(r,ft,cr) = 1 ;

xapcreq5(r,ft,cr)$(aft(r,ft,cr) ne 0 and ArmFlag eq 0)..
   xap(r,ft,cr)*((1+mtxadj(r,ft)*patax(r,ft,cr)+atxadj(r,ft))*pa(r,ft))**sigmaft(r,cr) =e= aft(r,ft,cr)*fert(r,cr)
       *(lambdaft(r,ft,cr)**(sigmaft(r,cr)-1))*pfert(r,cr)**sigmaft(r,cr) ;

xapcreq5.m(r,ft,cr) = 1 ;

* ----- Equation (P-28)

pfertcreq1(r,cr)$(afert(r,cr,"Old") ne 0 and ArmFlag eq 1)..
   pfert(r,cr)**(1-sigmaft(r,cr))
      =e= sum(ft,aft(r,ft,cr)*(pap(r,ft,cr)/lambdaft(r,ft,cr))**(1-sigmaft(r,cr))) ;

pfertcreq1.m(r,cr) = 1 ;

pfertcreq2(r,cr)$(afert(r,cr,"Old") ne 0 and ArmFlag eq 0)..
   pfert(r,cr)**(1-sigmaft(r,cr))
      =e= sum(ft,aft(r,ft,cr)*((1+mtxadj(r,ft)*patax(r,ft,cr)+atxadj(r,ft))*pa(r,ft)/lambdaft(r,ft,cr))**(1-sigmaft(r,cr))) ;

*pfert.lo(r,cr) = 0.01 ;
pfertcreq2.m(r,cr) = 1 ;

pfert.fx(r,cr)$(afert(r,cr,"Old") eq 0) = pfert0(r,cr) ;

* --------------------------------------------------------------------
*
*  Livestock production structure
*
* --------------------------------------------------------------------

*
*  Disaggregation of VA nest
*

* ----- Equation (P-33)

ktellveq(r,lv,v)$(aktel(r,lv,"Old") ne 0)..
   ktel(r,lv,v) =e= aktel(r,lv,v)*va(r,lv,v) ;

ktel.fx(r,lv,v)$(aktel(r,lv,"Old") eq 0) = 0 ;
ktellveq.m(r,lv,v) = 1 ;

* ----- Equation (P-34)

tfdlveq(r,lv,v)$(atfd(r,lv,"Old") ne 0)..
   tfd(r,lv,v) =e= atfd(r,lv,v)*va(r,lv,v) ;

tfd.fx(r,lv,v)$(atfd(r,lv,"Old") eq 0) = 0 ;
tfdlveq.m(r,lv,v) = 1 ;

* ----- Equation (P-35)

pvalveq(r,lv,v)$(ava(r,lv,"Old") ne 0)..
   pva(r,lv,v) =e= aktel(r,lv,v)*pktel(r,lv,v) + atfd(r,lv,v)*ptfd(r,lv,v) ;

pva.fx(r,lv,v)$(ava(r,lv,"Old") eq 0) = pva0(r,lv,"Old") ;
pvalveq.m(r,lv,v) = 1 ;

*
*  Disaggregation of tfd bundle
*

* ----- Equation (P-36)

feedlveq(r,lv)$(afeed(r,lv,"Old") ne 0)..
   feed(r,lv) =e= sum(v,afeed(r,lv,v)*tfd(r,lv,v)
               *        (ptfd(r,lv,v)/pfeed(r,lv))**sigmaf(r,lv,v)) ;

feed.fx(r,lv)$(afeed(r,lv,"Old") eq 0) = 0 ;
feedlveq.m(r,lv) = 1 ;

* ----- Equation (P-37)

tdlveq(r,lv)$(at(r,lv,"Old") ne 0)..
   td(r,lv) =e= sum(v,at(r,lv,v)*(lambdat(r,lv)**(sigmaf(r,lv,v)-1))
             *  tfd(r,lv,v)*(ptfd(r,lv,v)/pt(r,lv))**sigmaf(r,lv,v)) ;

td.fx(r,lv)$(at(r,lv,"Old") eq 0) = 0 ;
tdlveq.m(r,lv) = 1 ;

* ----- Equation (P-38)

ptfdlveq(r,lv,v)$(atfd(r,lv,"Old") ne 0)..
   ptfd(r,lv,v)**(1-sigmaf(r,lv,v))
      =e= afeed(r,lv,v)*pfeed(r,lv)**(1-sigmaf(r,lv,v))
       +  at(r,lv,v)*(pt(r,lv)/lambdat(r,lv))**(1-sigmaf(r,lv,v)) ;

ptfd.fx(r,lv,v)$(atfd(r,lv,"Old") eq 0) = ptfd0(r,lv,v) ;
ptfdlveq.m(r,lv,v) = 1 ;

*
*  Disaggregation of ktel bundle
*

* ----- Equation (P-39)

ldlveq(r,lv)$(al(r,lv,"Old") ne 0)..
   ld(r,lv) =e= sum(v,al(r,lv,v)*ktel(r,lv,v)*(pktel(r,lv,v)/awage(r,lv))**sigmav(r,lv,v)) ;

ld.fx(r,lv)$(al(r,lv,"Old") eq 0) = 0 ;
ldlveq.m(r,lv) = 1 ;

* ----- Equation (P-40)

hktelveq(r,lv,v)$(ahkte(r,lv,"Old") ne 0)..
   hkte(r,lv,v)*phkte(r,lv,v)**sigmav(r,lv,v) =e=
      ahkte(r,lv,v)*ktel(r,lv,v)*pktel(r,lv,v)**sigmav(r,lv,v) ;

hkte.fx(r,lv,v)$(ahkte(r,lv,"Old") eq 0) = 0 ;
hktelveq.m(r,lv,v) = 1 ;

* ----- Equation (P-41)

pktellveq(r,lv,v)$(aktel(r,lv,"Old") ne 0)..
   pktel(r,lv,v)
      =e= (ahkte(r,lv,v)*phkte(r,lv,v)**(1-sigmav(r,lv,v))
       +   al(r,lv,v)*awage(r,lv)**(1-sigmav(r,lv,v)))**(1/(1-sigmav(r,lv,v))) ;

pktel.fx(r,lv,v)$(ktel0(r,lv,"Old") eq 0) = pktel0(r,lv,"Old") ;
pktellveq.m(r,lv,v) = 1 ;

*
*  Disaggregation of the labor demand bundle
*

* ----- Equation (P-42)

labdvlveq(r,l,lv)$(ald(r,l,lv) ne 0)..
   labdv(r,l,lv)*wage(r,l,lv)**sigmal(r,lv) =e=
      ald(r,l,lv)*(lambdal(r,l,lv)**(sigmal(r,lv)-1))*ld(r,lv)*awage(r,lv)**sigmal(r,lv) ;

labdv.fx(r,l,lv)$(ald(r,l,lv) eq 0) = 0 ;
labdvlveq.m(r,l,lv) = 1 ;

awagelveq(r,lv)$(al(r,lv,"Old") ne 0)..
   awage(r,lv)
      =e= (sum(l,ald(r,l,lv)*(wage(r,l,lv)/lambdal(r,l,lv))**(1-sigmal(r,lv))))**(1/(1-sigmal(r,lv))) ;

* ----- Equation (P-43)

awage.fx(r,lv)$(al(r,lv,"Old") eq 0) = awage0(r,lv) ;
awagelveq.m(r,lv) = 1 ;

*
*  Disaggregation of hkte bundle
*

* ----- Equation (P-44)

xeplveq(r,lv,v)$(ae(r,lv,"Old") ne 0)..
   xep(r,lv,v)*pep(r,lv,v)**sigmae(r,lv,v) =e= ae(r,lv,v)*hkte(r,lv,v)
                                            *  phkte(r,lv,v)**sigmae(r,lv,v) ;

xep.fx(r,lv,v)$(ae(r,lv,"Old") eq 0) = 0 ;
xeplveq.m(r,lv,v) = 1 ;

* ----- Equation (P-45)

hktlveq(r,lv,v)$(ahkt(r,lv,"Old") ne 0)..
   hkt(r,lv,v)*phkt(r,lv,v)**sigmae(r,lv,v) =e= ahkt(r,lv,v)*hkte(r,lv,v)
                                             *  phkte(r,lv,v)**sigmae(r,lv,v) ;

hkt.fx(r,lv,v)$(ahkt(r,lv,"Old") eq 0) = 0 ;
hktlveq.m(r,lv,v) = 1 ;

* ----- Equation (P-46)

phktelveq(r,lv,v)$(ahkte(r,lv,"Old") ne 0)..
   phkte(r,lv,v)**(1-sigmae(r,lv,v))
      =e= ae(r,lv,v)*pep(r,lv,v)**(1-sigmae(r,lv,v))
       +  ahkt(r,lv,v)*phkt(r,lv,v)**(1-sigmae(r,lv,v)) ;

phkte.fx(r,lv,v)$(ahkte(r,lv,"Old") eq 0) = phkte0(r,lv,"Old") ;
phktelveq.m(r,lv,v) = 1 ;

*
*  25-APR-2000
*  Addition of human capital
*
*  Disaggregation of hkt bundle
*

* ----- Equation (P-47)

hdlveq(r,lv)$(ah(r,lv,"Old") ne 0)..
   labdv(r,"HSk",lv) =e= sum(v,ah(r,lv,v)*(lambdal(r,"HSk",lv)**(sigmah(r,lv,v)-1))
            *  hkt(r,lv,v)*(phkt(r,lv,v)/wage(r,"HSk",lv))**sigmah(r,lv,v)) ;

labdv.fx(r,"HSk",lv)$(ah(r,lv,"Old") eq 0) = 0 ;
hdlveq.m(r,lv) = 1 ;

* ----- Equation (P-48)

ktlveq(r,lv,v)$(akt(r,lv,"Old") ne 0)..
   kt(r,lv,v)*pkt(r,lv,v)**sigmah(r,lv,v) =e= akt(r,lv,v)*hkt(r,lv,v)
                                           *  phkt(r,lv,v)**sigmah(r,lv,v) ;

kt.fx(r,lv,v)$(akt(r,lv,"Old") eq 0) = 0 ;
ktlveq.m(r,lv,v) = 1 ;

* ----- Equation (P-49)

phktlveq(r,lv,v)$(ahkt(r,lv,"Old") ne 0)..
   phkt(r,lv,v)**(1-sigmah(r,lv,v))
      =e=  ah(r,lv,v)*(wage(r,"HSk",lv)/lambdal(r,"HSk",lv))**(1-sigmah(r,lv,v))
       +   akt(r,lv,v)*pkt(r,lv,v)**(1-sigmah(r,lv,v)) ;

phkt.fx(r,lv,v)$(ahkt(r,lv,"Old") eq 0) = phkt0(r,lv,"Old") ;
phktlveq.m(r,lv,v) = 1 ;

*
*  Disaggregation of kt bundle
*

* ----- Equation (P-51)

fflveq(r,lv)$(af(r,lv,"Old") ne 0)..
   ff(r,lv) =e= sum(v,af(r,lv,v)*(lambdaf(r,lv)**(sigmak(r,lv,v)-1))
             *  kt(r,lv,v)*(pkt(r,lv,v)/pf(r,lv))**sigmak(r,lv,v)) ;

ff.fx(r,lv)$(af(r,lv,"Old") eq 0) = 0 ;
fflveq.m(r,lv) = 1 ;

* ----- Equation (P-50)

kapdvlveq(r,lv,v)$(ak(r,lv,"Old") ne 0)..
   kapdv(r,lv,v)*rent(r,lv,v)**sigmak(r,lv,v) =e= ak(r,lv,v)*kt(r,lv,v)
                                            * (lambdak(r,lv,v)**(sigmak(r,lv,v)-1))
                                            * pkt(r,lv,v)**sigmak(r,lv,v) ;

kapdv.fx(r,lv,v)$(ak(r,lv,"Old") eq 0) = 0 ;
kapdvlveq.m(r,lv,v) = 1 ;

* ----- Equation (P-52)

pktlveq(r,lv,v)$(ahkt(r,lv,"Old") ne 0)..
   pkt(r,lv,v)**(1-sigmak(r,lv,v))
      =e=  af(r,lv,v)*(pf(r,lv)/lambdaf(r,lv))**(1-sigmak(r,lv,v))
       +   ak(r,lv,v)*(rent(r,lv,v)/lambdak(r,lv,v))**(1-sigmak(r,lv,v)) ;

pkt.fx(r,lv,v)$(ahkt(r,lv,"Old") eq 0) = pkt0(r,lv,"Old") ;
pktlveq.m(r,lv,v) = 1 ;

*
*  Armington disaggregation of the Leontief matrix
*

* ----- Equation (P-57)

xaplveq1(r,nnfd,lv)$(a(r,nnfd,lv) ne 0)..
   xap(r,nnfd,lv) =e= a(r,nnfd,lv)*nd(r,lv) ;

xaplveq1.m(r,nnfd,lv) = 1 ;

xap.fx(r,i,lv)$(xap0(r,i,lv) eq 0) = 0 ;

* ----- Equation (P-58)

pndlveq1(r,lv)$(and(r,lv,"Old") ne 0 and ArmFlag eq 1)..
   pnd(r,lv) =e= sum(nnfd, a(r,nnfd,lv)*pap(r,nnfd,lv)) ;

pndlveq1.m(r,lv) = 1 ;

pndlveq2(r,lv)$(and(r,lv,"Old") ne 0 and ArmFlag eq 0)..
   pnd(r,lv) =e= sum(nnfd, a(r,nnfd,lv)*(1+mtxadj(r,nnfd)*patax(r,nnfd,lv)+atxadj(r,nnfd))*pa(r,nnfd)) ;

pndlveq2.m(r,lv) = 1 ;

pnd.fx(r,lv)$(and(r,lv,"Old") eq 0) = pnd0(r,lv) ;

* ----- Equation (P-55)

xaplveq2(r,e,lv)$(aep(r,e,lv,"Old") ne 0 and ArmFlag eq 1)..
   xap(r,e,lv) =e= sum(v,aep(r,e,lv,v)*(lambdaep(r,e,lv)**(sigmaep(r,lv,v)-1))
                *  xep(r,lv,v)*(pep(r,lv,v)/pap(r,e,lv))**sigmaep(r,lv,v)) ;

xaplveq2.m(r,e,lv) = 1 ;

xaplveq3(r,e,lv)$(aep(r,e,lv,"Old") ne 0 and ArmFlag eq 0)..
   xap(r,e,lv) =e= sum(v,aep(r,e,lv,v)*xep(r,lv,v)*(lambdaep(r,e,lv)**(sigmaep(r,lv,v)-1))
                *  (pep(r,lv,v)/((1+mtxadj(r,e)*patax(r,e,lv)+atxadj(r,e))*pa(r,e)))**sigmaep(r,lv,v)) ;

xaplveq3.m(r,e,lv) = 1 ;

* ----- Equation (P-56)

peplveq1(r,lv,v)$(ae(r,lv,"Old") ne 0 and ArmFlag eq 1)..
   pep(r,lv,v)**(1-sigmaep(r,lv,v))
      =e= sum(e,aep(r,e,lv,v)*(pap(r,e,lv)/lambdaep(r,e,lv))**(1-sigmaep(r,lv,v))) ;

peplveq1.m(r,lv,v) = 1 ;

peplveq2(r,lv,v)$(ae(r,lv,"Old") ne 0 and ArmFlag eq 0)..
   pep(r,lv,v)**(1-sigmaep(r,lv,v))
      =e= sum(e,aep(r,e,lv,v)*((1+mtxadj(r,e)*patax(r,e,lv)+atxadj(r,e))*pa(r,e)/lambdaep(r,e,lv))**(1-sigmaep(r,lv,v))) ;

peplveq2.m(r,lv,v) = 1 ;

pep.fx(r,lv,v)$(xep0(r,lv,"Old") eq 0) = pep0(r,lv,"Old") ;

* ----- Equation (P-53)

xaplveq4(r,fd,lv)$(afd(r,fd,lv) ne 0 and ArmFlag eq 1)..
   xap(r,fd,lv)*pap(r,fd,lv)**sigmafd(r,lv) =e= afd(r,fd,lv)*feed(r,lv)
      *(lambdafd(r,fd,lv)**(sigmafd(r,lv)-1))*pfeed(r,lv)**sigmafd(r,lv) ;

xaplveq4.m(r,fd,lv) = 1 ;

xaplveq5(r,fd,lv)$(afd(r,fd,lv) ne 0 and ArmFlag eq 0)..
   xap(r,fd,lv)*((1+mtxadj(r,fd)*patax(r,fd,lv)+atxadj(r,fd))*pa(r,fd))**sigmafd(r,lv)
      =e= afd(r,fd,lv)*feed(r,lv)*(lambdafd(r,fd,lv)**(sigmafd(r,lv)-1))*pfeed(r,lv)**sigmafd(r,lv) ;

xaplveq5.m(r,fd,lv) = 1 ;

* ----- Equation (P-54)

pfeedlveq1(r,lv)$(afeed(r,lv,"Old") ne 0 and ArmFlag eq 1)..
   pfeed(r,lv)**(1-sigmafd(r,lv))
      =e= sum(fd,afd(r,fd,lv)*(pap(r,fd,lv)/lambdafd(r,fd,lv))**(1-sigmafd(r,lv))) ;

pfeedlveq1.m(r,lv) = 1 ;

pfeedlveq2(r,lv)$(afeed(r,lv,"Old") ne 0 and ArmFlag eq 0)..
   pfeed(r,lv)**(1-sigmafd(r,lv))
      =e= sum(fd,afd(r,fd,lv)*((1+mtxadj(r,fd)*patax(r,fd,lv)+atxadj(r,fd))
       *          pa(r,fd)/lambdafd(r,fd,lv))**(1-sigmafd(r,lv))) ;

pfeedlveq2.m(r,lv) = 1 ;

pfeed.fx(r,lv)$(afeed(r,lv,"Old") eq 0) = pfeed0(r,lv) ;

* --------------------------------------------------------------------
*
*  Production in manufacturing and services structure
*
* --------------------------------------------------------------------

*
*  Disaggregation of VA nest
*

* ----- Equation (P-59)

ldeq(r,ip)$(al(r,ip,"Old") ne 0)..
   ld(r,ip) =e= sum(v,al(r,ip,v)*va(r,ip,v)*(pva(r,ip,v)/awage(r,ip))**sigmav(r,ip,v)) ;

ld.fx(r,ip)$(al(r,ip,"Old") eq 0) = 0 ;
ldeq.m(r,ip) = 1 ;

* ----- Equation (P-60)

hkteeq(r,ip,v)$(ahkte(r,ip,"Old") ne 0)..
   hkte(r,ip,v)*phkte(r,ip,v)**sigmav(r,ip,v) =e=
      ahkte(r,ip,v)*va(r,ip,v)*pva(r,ip,v)**sigmav(r,ip,v) ;

hkte.fx(r,ip,v)$(ahkte(r,ip,"Old") eq 0) = 0 ;
hkteeq.m(r,ip,v) = 1 ;

* ----- Equation (P-61)

pvaeq(r,ip,v)$(ava(r,ip,"Old") ne 0)..
   pva(r,ip,v)**(1-sigmav(r,ip,v))
      =e= ahkte(r,ip,v)*phkte(r,ip,v)**(1-sigmav(r,ip,v))
       +  al(r,ip,v)*awage(r,ip)**(1-sigmav(r,ip,v)) ;

pva.fx(r,ip,v)$(ava(r,ip,"Old") eq 0) = pva0(r,ip,"Old") ;
pvaeq.m(r,ip,v) = 1 ;

*
*  Disaggregation of the labor demand bundle
*

* ----- Equation (P-62)

labdveq(r,l,ip)$(ald(r,l,ip) ne 0)..
   labdv(r,l,ip)*wage(r,l,ip)**sigmal(r,ip) =e=
      ald(r,l,ip)*(lambdal(r,l,ip)**(sigmal(r,ip)-1))*ld(r,ip)*awage(r,ip)**sigmal(r,ip) ;

labdv.fx(r,l,ip)$(ald(r,l,ip) eq 0) = 0 ;
labdveq.m(r,l,ip) = 1 ;

* ----- Equation (P-63)

awageeq(r,ip)$(al(r,ip,"Old") ne 0)..
   awage(r,ip)
      =e= (sum(l,ald(r,l,ip)*(wage(r,l,ip)/lambdal(r,l,ip))**(1-sigmal(r,ip))))**(1/(1-sigmal(r,ip))) ;

awage.fx(r,ip)$(al(r,ip,"Old") eq 0) = awage0(r,ip) ;
awageeq.m(r,ip) = 1 ;


*
*  Disaggregation of hkte bundle
*

* ----- Equation (P-64)

xepeq(r,ip,v)$(ae(r,ip,"Old") ne 0)..
   xep(r,ip,v)*pep(r,ip,v)**sigmae(r,ip,v) =e= ae(r,ip,v)*hkte(r,ip,v)
                                         *  phkte(r,ip,v)**sigmae(r,ip,v) ;

xep.fx(r,ip,v)$(ae(r,ip,"Old") eq 0) = 0 ;
xepeq.m(r,ip,v) = 1 ;

* ----- Equation (P-65)

hkteq(r,ip,v)$(ahkt(r,ip,"Old") ne 0)..
   hkt(r,ip,v)*phkt(r,ip,v)**sigmae(r,ip,v) =e= ahkt(r,ip,v)*hkte(r,ip,v)
                                        *  phkte(r,ip,v)**sigmae(r,ip,v) ;

hkt.fx(r,ip,v)$(ahkt(r,ip,"Old") eq 0) = 0 ;
hkteq.m(r,ip,v) = 1 ;

* ----- Equation (P-66)

phkteeq(r,ip,v)$(ahkte(r,ip,"Old") ne 0)..
   phkte(r,ip,v)**(1-sigmae(r,ip,v))
      =e= ae(r,ip,v)*pep(r,ip,v)**(1-sigmae(r,ip,v))
       +  ahkt(r,ip,v)*phkt(r,ip,v)**(1-sigmae(r,ip,v)) ;

phkte.fx(r,ip,v)$(ahkte(r,ip,"Old") eq 0) = phkte0(r,ip,"Old") ;
phkteeq.m(r,ip,v) = 1 ;

*
*  25-APR-2000
*  Addition of human capital
*
*  Disaggregation of hkt bundle
*

* ----- Equation (P-67)

hdeq(r,ip)$(ah(r,ip,"Old") ne 0)..
   labdv(r,"HSk",ip) =e= sum(v,ah(r,ip,v)*(lambdal(r,"HSk",ip)**(sigmah(r,ip,v)-1))
            *  hkt(r,ip,v)*(phkt(r,ip,v)/wage(r,"HSk",ip))**sigmah(r,ip,v)) ;

labdv.fx(r,"HSk",ip)$(ah(r,ip,"Old") eq 0) = 0 ;
hdeq.m(r,ip) = 1 ;

* ----- Equation (P-68)

kteq(r,ip,v)$(akt(r,ip,"Old") ne 0)..
   kt(r,ip,v)*pkt(r,ip,v)**sigmah(r,ip,v) =e= akt(r,ip,v)*hkt(r,ip,v)
                                           *  phkt(r,ip,v)**sigmah(r,ip,v) ;

kt.fx(r,ip,v)$(akt(r,ip,"Old") eq 0) = 0 ;
kteq.m(r,ip,v) = 1 ;

* ----- Equation (P-69)

phkteq(r,ip,v)$(ahkt(r,ip,"Old") ne 0)..
   phkt(r,ip,v)**(1-sigmah(r,ip,v))
      =e=  ah(r,ip,v)*(wage(r,"HSk",ip)/lambdal(r,"HSk",ip))**(1-sigmah(r,ip,v))
       +   akt(r,ip,v)*pkt(r,ip,v)**(1-sigmah(r,ip,v)) ;

phkt.fx(r,ip,v)$(ahkt(r,ip,"Old") eq 0) = phkt0(r,ip,"Old") ;
phkteq.m(r,ip,v) = 1 ;

*
*  Disaggregation of kt bundle
*

* ----- Equation (P-70)

kapdveq(r,ip,v)$(ak(r,ip,"Old") ne 0)..
   kapdv(r,ip,v)*rent(r,ip,v)**sigmak(r,ip,v) =e= ak(r,ip,v)*kt(r,ip,v)
                                            * (lambdak(r,ip,v)**(sigmak(r,ip,v)-1))
                                            * pkt(r,ip,v)**sigmak(r,ip,v) ;

kapdv.fx(r,ip,v)$(ak(r,ip,"Old") eq 0) = 0 ;
kapdveq.m(r,ip,v) = 1 ;

* ----- Equation (P-71)

tdeq(r,ip)$(at(r,ip,"Old") ne 0)..
   td(r,ip) =e= sum(v,at(r,ip,v)*(lambdat(r,ip)**(sigmak(r,ip,v)-1))
            *  kt(r,ip,v)*(pkt(r,ip,v)/pt(r,ip))**sigmak(r,ip,v)) ;

td.fx(r,ip)$(at(r,ip,"Old") eq 0) = 0 ;
tdeq.m(r,ip) = 1 ;

* ----- Equation (P-72)

ffeq(r,ip)$(af(r,ip,"Old") ne 0)..
   ff(r,ip) =e= sum(v,af(r,ip,v)*(lambdaf(r,ip)**(sigmak(r,ip,v)-1))
            *  kt(r,ip,v)*(pkt(r,ip,v)/pf(r,ip))**sigmak(r,ip,v)) ;

ff.fx(r,ip)$(af(r,ip,"Old") eq 0) = 0 ;
ffeq.m(r,ip) = 1 ;

* ----- Equation (P-73)

pkteq(r,ip,v)$(akt(r,ip,"Old") ne 0)..
   pkt(r,ip,v)**(1-sigmak(r,ip,v))
      =e=  at(r,ip,v)*(pt(r,ip)/lambdat(r,ip))**(1-sigmak(r,ip,v))
       +   af(r,ip,v)*(pf(r,ip)/lambdaf(r,ip))**(1-sigmak(r,ip,v))
       +   ak(r,ip,v)*(rent(r,ip,v)/lambdak(r,ip,v))**(1-sigmak(r,ip,v)) ;

pkt.fx(r,ip,v)$(akt(r,ip,"Old") eq 0) = pkt0(r,ip,"Old") ;
pkteq.m(r,ip,v) = 1 ;

*
*  Armington disaggregation of the Leontief matrix
*

* ----- Equation (P-74)

xapeq1(r,nf,ip)$(a(r,nf,ip) ne 0)..
   xap(r,nf,ip) =e= a(r,nf,ip)*nd(r,ip) ;

xap.fx(r,i,ip)$(xap0(r,i,ip) eq 0) = 0 ;
xapeq1.m(r,nf,ip) = 1 ;

* ----- Equation (P-75)

pndeq1(r,ip)$(and(r,ip,"Old") ne 0 and ArmFlag eq 1)..
   pnd(r,ip) =e= sum(nf, a(r,nf,ip)*pap(r,nf,ip)) ;

pndeq1.m(r,ip) = 1 ;

pndeq2(r,ip)$(and(r,ip,"Old") ne 0 and ArmFlag eq 0)..
   pnd(r,ip) =e= sum(nf, a(r,nf,ip)*(1+mtxadj(r,nf)*patax(r,nf,ip)+atxadj(r,nf))*pa(r,nf)) ;

pndeq2.m(r,ip) = 1 ;

pnd.fx(r,ip)$(and(r,ip,"Old") eq 0) = pnd0(r,ip) ;

* ----- Equation (P-76)

xapeq2(r,e,ip)$(aep(r,e,ip,"Old") ne 0 and ArmFlag eq 1)..
   xap(r,e,ip) =e= sum(v,aep(r,e,ip,v)*(lambdaep(r,e,ip)**(sigmaep(r,ip,v)-1))
               *  xep(r,ip,v)*(pep(r,ip,v)/pap(r,e,ip))**sigmaep(r,ip,v)) ;

xapeq2.m(r,e,ip) = 1 ;

xapeq3(r,e,ip)$(aep(r,e,ip,"Old") ne 0 and ArmFlag eq 0)..
   xap(r,e,ip) =e= sum(v,aep(r,e,ip,v)*xep(r,ip,v)*(lambdaep(r,e,ip)**(sigmaep(r,ip,v)-1))
               *  (pep(r,ip,v)/((1+mtxadj(r,e)*patax(r,e,ip)+atxadj(r,e))*pa(r,e)))**sigmaep(r,ip,v)) ;

xapeq3.m(r,e,ip) = 1 ;

* ----- Equation (P-77)

pepeq1(r,ip,v)$(ae(r,ip,"Old") ne 0 and ArmFlag eq 1)..
   pep(r,ip,v)**(1-sigmaep(r,ip,v))
      =e= sum(e,aep(r,e,ip,v)*(pap(r,e,ip)/lambdaep(r,e,ip))**(1-sigmaep(r,ip,v))) ;

pepeq1.m(r,ip,v) = 1 ;

pepeq2(r,ip,v)$(ae(r,ip,"Old") ne 0 and ArmFlag eq 0)..
   pep(r,ip,v)**(1-sigmaep(r,ip,v))
      =e= sum(e,aep(r,e,ip,v)*((1+mtxadj(r,e)*patax(r,e,ip)+atxadj(r,e))*pa(r,e)/lambdaep(r,e,ip))**(1-sigmaep(r,ip,v))) ;

pepeq2.m(r,ip,v) = 1 ;

pep.fx(r,ip,v)$(ae(r,ip,"Old") eq 0) = pep0(r,ip,"Old") ;

*  Armington Decomposition in production (all sectors)

xdpeq(r,i,j)$(xdp0(r,i,j) ne 0 and ArmFlag eq 1)..
   xdp(r,i,j)*(pd(r,i)*(1+pdtax(r,i,j)))**sigmamp(r,i,j) =e=
      apd(r,i,j)*xap(r,i,j)*pap(r,i,j)**sigmamp(r,i,j) ;

xdp.fx(r,i,j)$(xdp0(r,i,j) eq 0 and ArmFlag eq 1) = 0 ;
xdpeq.m(r,i,j) = 1 ;

xmpeq(r,i,j)$(xmp0(r,i,j) ne 0 and ArmFlag eq 1)..
   xmp(r,i,j)*(pmt(r,i)*(1+pmtax(r,i,j)))**sigmamp(r,i,j) =e=
      apm(r,i,j)*xap(r,i,j)*pap(r,i,j)**sigmamp(r,i,j) ;

xmp.fx(r,i,j)$(xmp0(r,i,j) eq 0 and ArmFlag eq 1) = 0 ;
xmpeq.m(r,i,j) = 1 ;

papeq(r,i,j)$(xap0(r,i,j) ne 0 and ArmFlag eq 1)..
   pap(r,i,j)**(1-sigmamp(r,i,j))
      =e= (apd(r,i,j)*(pd(r,i)*(1+pdtax(r,i,j)))**(1-sigmamp(r,i,j))
       +   apm(r,i,j)*(pmt(r,i)*(1+pmtax(r,i,j)))**(1-sigmamp(r,i,j))) ;

pap.fx(r,i,j)$(xap0(r,i,j) eq 0 and ArmFlag eq 1) = pap0(r,i,j) ;
papeq.m(r,i,j) = 1 ;

* --------------------------------------------------------------------
*
*  Income distribution equations
*
* --------------------------------------------------------------------

* ----- Equation (Y-1)

LandYeq(r)$(LandY0(r) ne 0)..
   LandY(r)   =e= sum(i,npt(r,i)*td(r,i)) ;

LandY.fx(r)$(LandY0(r) eq 0) = 0 ;
LandYeq.m(r) = 1 ;

* ----- Equation (Y-2)

FFactYeq(r)$(FFactY0(r) ne 0)..
   FFactY(r)  =e= sum(i,pf(r,i)*ff(r,i)) ;

FFactY.fx(r)$(FFactY0(r) eq 0) = 0 ;
FFactYeq.m(r) = 1 ;

* ----- Equation (Y-3)

LabYeq(r,ll)$(LabY0(r,ll) ne 0)..
   LabY(r,ll) =e= sum(i,nwage(r,ll,i)*(labdv(r,ll,i)+labdf(r,ll,i))) ;

LabY.fx(r,ll)$(LabY0(r,ll) eq 0) = 0 ;
LabYeq.m(r,ll) = 1 ;

* ----- Equation (Y-4)

KapYeq(r)..
   KapY(r)    =e= sum(i,sum(v,nrent(r,i,v)*kapdv(r,i,v)) + nrent(r,i,"Old")*kapdf(r,i))
               +  sum(i,profit(r,i)) ;

KapY.fx(r)$(KapY0(r) eq 0) = 0 ;
KapYeq.m(r) = 1 ;

* ----- Equation (Y-5)

yheq(r,h)$(yh0(r,h) ne 0)..
   yh(r,h) =e= phiLnd(r,h)*LandY(r) + phiFF(r,h)*FFactY(r)
            +  sum(ll,phiLab(r,h,ll)*LabY(r,ll)) + phiKap(r,h)*KapY(r)
            -  deprec(r,h) + pabs(r)*trg(r,h) ;

yh.fx(r,h)$(yh0(r,h) eq 0) = 0 ;
yheq.m(r,h) = 1 ;

* ----- Equation (Y-6)

*!!!!! Need to clean this up for multiple households

deprYeq(r,h)$(deprec0(r) ne 0)..
   deprec(r,h) =e= phiKap(r,h)*fdepr(r)*pfd(r,"Inv")*kstock(r) ;

deprec.fx(r,h)$(deprec0(r) eq 0) = 0 ;
deprYeq.m(r,h) = 1 ;

* ----- Equation (Y-7)

ydeq(r,h)$(yd0(r,h) ne 0)..
   yd(r,h) =e= (1-chik(r)*kappah(r,h))*yh(r,h) ;

yd.fx(r,h)$(yd0(r,h) eq 0) = 0 ;
ydeq.m(r,h) = 1 ;

* ----- Equation (Y-8)

yceq1(r,h)$(yc0(r,h) ne 0 and ifELES eq 1)..
   yc(r,h) =e= yd(r,h) ;

yceq1.m(r,h) = 1 ;

yceq2(r,h)$(yc0(r,h) ne 0 and ifELES ne 1)..
   yc(r,h) =e= yd(r,h) - savh(r,h) ;

yceq2.m(r,h) = 1 ;

yc.fx(r,h)$(yc0(r,h) eq 0) = 0 ;

* --------------------------------------------------------------------
*
*  Household demand system
*
* --------------------------------------------------------------------

* ----- Equation (D-1)

supyeq(r,h)$(supy0(r,h) ne 0)..
   supy(r,h) =e= yc(r,h) - hpop(r,h)*sum(k,theta(r,k,h)*pc(r,k,h)) ;

supyeq.m(r,h) = 1 ;

supy.fx(r,h)$(supy0(r,h) eq 0) = 0 ;

* ----- Equation (D-2)

xceq(r,k,h)$(fxconsflag(r,k,h) eq 0)..
   pc(r,k,h)*(xc(r,k,h)-hpop(r,h)*theta(r,k,h)) =e= mu(r,k,h)*supy(r,h) ;

xceq.m(r,k,h) = 1 ;

xc.fx(r,k,h)$(fxconsflag(r,k,h) eq 1) = 0 ;

pceq(r,k,h)$(fxconsflag(r,k,h) eq 0)..
   pc(r,k,h)**(1-sigmac(r,k,h)) =e= sum(i,acons(r,i,k,h)*pac(r,i,h)**(1-sigmac(r,k,h))) ;

pceq.m(r,k,h) = 1 ;
pc.fx(r,k,h)$(fxconsflag(r,k,h) eq 1) = pc0(r,k,h) ;

xaceq(r,i,h)$(xac0(r,i,h) ne 0)..
   xac(r,i,h) =e= sum(k,acons(r,i,k,h)*xc(r,k,h)*(pc(r,k,h)/pac(r,i,h))**sigmac(r,k,h)) ;

xaceq.m(r,i,h) = 1 ;

xac.fx(r,i,h)$(xac0(r,i,h) eq 0) = 0 ;

* ----- Equations needed for AIDADS

mueq(r,k,h)$(fxconsflag(r,k,h) eq 0 and ifELES eq 3)..
   mu(r,k,h)*(1+exp(uad(r,h))) =e= alphaAD(r,k,h) + betaAD(r,k,h)*exp(uad(r,h)) ;

mueq.m(r,k,h) = 1 ;
mu.fx(r,k,h)$(fxconsflag(r,k,h) ne 0) = 0 ;

uadeq(r,h)$(yc0(r,h) ne 0 and ifELES eq 3)..
   uad(r,h) + log(aad(r,h)) + 1 =e= sum(k,mu(r,k,h)*log(xc(r,k,h)-hpop(r,h)*theta(r,k,h))) ;

uadeq.m(r,h) = 1 ;
uad.fx(r,h)$(yc0(r,h) eq 0) = uad0(r,h) ;

* ----- Equation (D-3)

savheq1(r,h)$(savh0(r,h) ne 0 and ifELES eq 1)..
   savh(r,h) =e= yc(r,h) - sum(k, pc(r,k,h)*xc(r,k,h)) ;

savheq1.m(r,h) = 1 ;

savheq2(r,h)$(savh0(r,h) ne 0 and ifELES ne 1)..
   savh(r,h) =e= aps(r,h)*yd(r,h) ;

savheq2.m(r,h) = 1 ;

savh.fx(r,h)$(savh0(r,h) eq 0) = 0 ;

apseq(r,h)$(savh0(r,h) ne 0 and ifELES ne 1)..
   aps(r,h) =e= alphas(r,h)
             +  betas(r)*apsLag(r,h)
             +  betag(r)*(log(rgdpmp(r)) - log(rgdpmplag(r)*pop(r,"Tot")/popLag(r,"Tot")))
             +  betay(r)*deprat(r,"L15")
             +  betae(r)*deprat(r,"G65")
             +  betar(r)*(trent(r)/cpi(r,h)) ;

aps.fx(r,h)$(savh0(r,h) eq 0) = 0 ;
apseq.m(r,h) = 1 ;

* ----- Equation (D-4)

cpieq(r,h)$(yd0(r,h) ne 0)..
   cpi(r,h)*sum(k,pc0(r,k,h)*xc(r,k,h)) =e= sum(k,pc(r,k,h)*xc(r,k,h)) ;

cpieq.m(r,h) = 1 ;

cpi.fx(r,h)$(yd0(r,h) eq 0) = cpi0(r,h) ;

* ----- Equations for agent-specific Armington agents

xdceq(r,i,h)$(xdc0(r,i,h) ne 0 and ArmFlag eq 1)..
   xdc(r,i,h)*(pd(r,i)*(1+cdtax(r,i,h)))**sigmamc(r,i,h)
      =e= acd(r,i,h)*xac(r,i,h)*pac(r,i,h)**sigmamc(r,i,h) ;

xdc.fx(r,i,h)$(xdc0(r,i,h) eq 0 and ArmFlag eq 1) = 0 ;
xdceq.m(r,i,h) = 1 ;

xmceq(r,i,h)$(xmc0(r,i,h) ne 0 and ArmFlag eq 1)..
   xmc(r,i,h)*(pmt(r,i)*(1+cmtax(r,i,h)))**sigmamc(r,i,h)
      =e= acm(r,i,h)*xac(r,i,h)*pac(r,i,h)**sigmamc(r,i,h) ;

xmc.fx(r,i,h)$(xmc0(r,i,h) eq 0 and ArmFlag eq 1) = 0 ;
xmceq.m(r,i,h) = 1 ;

paceq1(r,i,h)$(xac0(r,i,h) ne 0 and ArmFlag eq 1)..
   pac(r,i,h)**(1-sigmamc(r,i,h))
      =e= (acd(r,i,h)*(pd(r,i)*(1+cdtax(r,i,h)))**(1-sigmamc(r,i,h))
       +   acm(r,i,h)*(pmt(r,i)*(1+cmtax(r,i,h)))**(1-sigmamc(r,i,h))) ;

paceq1.m(r,i,h) = 1 ;

paceq2(r,i,h)$(xac0(r,i,h) ne 0 and ArmFlag eq 0)..
   pac(r,i,h) =e= (1+mtxadj(r,i)*catax(r,i,h)+atxadj(r,i))*pa(r,i) ;

paceq2.m(r,i,h) = 0 ;

pac.fx(r,i,h)$(xac0(r,i,h) eq 0) = pac0(r,i,h) ;


* --------------------------------------------------------------------
*
*  Other final demand system
*
* --------------------------------------------------------------------

* ----- Equation (D-5)

xafeq(r,i,f)$(xaf0(r,i,f) ne 0)..
   xaf(r,i,f) =e= afa(r,i,f)*fdvol(r,f) ;

xaf.fx(r,i,f)$(xaf0(r,i,f) eq 0) = 0 ;
xafeq.m(r,i,f) = 1 ;

* ----- Equation (D-6)

pfdeq1(r,f)$(fdvol0(r,f) ne 0 and ArmFlag eq 1)..
   pfd(r,f) =e= sum(i,afa(r,i,f)*paf(r,i,f)) ;

pfdeq1.m(r,f) = 1 ;

pfdeq2(r,f)$(fdvol0(r,f) ne 0 and ArmFlag eq 0)..
   pfd(r,f) =e= sum(i,afa(r,i,f)*(1+fatax(r,i,f))*pa(r,i)) ;

pfdeq2.m(r,f) = 1 ;

pfd.fx(r,f)$(fdvol0(r,f) eq 0) = pfd0(r,f) ;

* ----- Equations for agent-specific Armington agent

xdfeq(r,i,f)$(xdf0(r,i,f) ne 0 and ArmFlag eq 1)..
   xdf(r,i,f)*(pd(r,i)*(1+fdtax(r,i,f)))**sigmamf(r,i,f)
      =e= afdd(r,i,f)*xaf(r,i,f)*paf(r,i,f)**sigmamf(r,i,f) ;

xdf.fx(r,i,f)$(xdf0(r,i,f) eq 0 and ArmFlag eq 1) = 0 ;
xdfeq.m(r,i,f) = 1 ;

xmfeq(r,i,f)$(xmf0(r,i,f) ne 0 and ArmFlag eq 1)..
   xmf(r,i,f)*(pmt(r,i)*(1+fmtax(r,i,f)))**sigmamf(r,i,f)
      =e= afdm(r,i,f)*xaf(r,i,f)*paf(r,i,f)**sigmamf(r,i,f) ;

xmf.fx(r,i,f)$(xmf0(r,i,f) eq 0 and ArmFlag eq 1) = 0 ;
xmfeq.m(r,i,f) = 1 ;

pafeq(r,i,f)$(xaf0(r,i,f) ne 0 and ArmFlag eq 1)..
   paf(r,i,f)**(1-sigmamf(r,i,f))
      =e= (afdd(r,i,f)*(pd(r,i)*(1+fdtax(r,i,f)))**(1-sigmamf(r,i,f))
       +   afdm(r,i,f)*(pmt(r,i)*(1+fmtax(r,i,f)))**(1-sigmamf(r,i,f))) ;

paf.fx(r,i,f)$(xaf0(r,i,f) eq 0 and ArmFlag eq 1) = paf0(r,i,f) ;
pafeq.m(r,i,f) = 1 ;

* --------------------------------------------------------------------
*
*  Trade equations
*
* --------------------------------------------------------------------

* --------------------------------------------------------------------
*
*  Import demand -- Nested Armington structure
*
* --------------------------------------------------------------------

*
*  Armington aggregate demand
*

* ----- Equation (T-1)

xaeq(r,i)$(ArmFlag eq 0 and xa0(r,i) ne 0)..
   xa(r,i) =e= sum(j,xap(r,i,j)) + sum(h,xac(r,i,h)) + sum(f,xaf(r,i,f)) ;

xa.fx(r,i)$(xa0(r,i) eq 0 and ArmFlag eq 0) = 0 ;
xaeq.m(r,i) = 1 ;

pdeq1(r,i)$(xd0(r,i) ne 0 and ArmFlag eq 1)..
   xd(r,i) =e= sum(j,xdp(r,i,j)) + sum(h,xdc(r,i,h)) + sum(f,xdf(r,i,f)) ;

pd.fx(r,i)$(xd0(r,i) eq 0) = pd0(r,i) ;

pdeq1.m(r,i) = 1 ;

* ----- Equation (T-2)

pdeq2(r,i)$(AIDSFlag(r,i) eq 0 and (ad(r,i) ne 0) and ArmFlag eq 0 and sigmam(r,i) ne inf)..
*  xd(r,i)*pd(r,i)**sigmam(r,i) =e= ad(r,i)*xa(r,i)
*                                * (pa(r,i)-emitax(r)*emicoef(r,i))**sigmam(r,i) ;

   xd(r,i)*pd(r,i)**sigmam(r,i) =e= thetad(r,i)*pd(r,i)**sigmam(r,i)
                                 +  ad(r,i)*(pa(r,i)**(sigmam(r,i)-1))
                                 *  (pa(r,i)*xa(r,i) - thetad(r,i)*pd(r,i) - thetam(r,i)*pmt(r,i)) ;

* pd.lo(r,i) = 0.01 ;
pdeq2.m(r,i) = 1 ;

pdeq3(r,i)$(AIDSFlag(r,i) eq 0 and (xd0(r,i) ne 0) and ArmFlag eq 0 and sigmam(r,i) eq inf)..
   pd(r,i) =e= pa(r,i) + emitax(r)*emicoef(r,i) ;


pdeq3.m(r,i) = 1 ;

pdeq4(r,i)$(AIDSFlag(r,i) eq 2 and xd0(r,i) ne 0)..
   pd(r,i)*xd(r,i) =e= pa(r,i)*xa(r,i)*(ad(r,i) + gdd(r,i)*log(pd(r,i))
                    +  gdm(r,i)*log(pmt(r,i)) + betad(r,i)*log(xa(r,i))) ;

pdeq4.m(r,i) = 1 ;

* ----- Equation (T-3)

xmteq1(r,i)$(xmt0(r,i) ne 0 and ArmFlag eq 1)..
   xmt(r,i) =e= sum(j,xmp(r,i,j)) + sum(h,xmc(r,i,h)) + sum(f,xmf(r,i,f)) ;

xmt.fx(r,i)$(xmt0(r,i) eq 0) = 0 ;

xmteq1.m(r,i) = 1 ;

xmteq2(r,i)$(AIDSFlag(r,i) eq 0 and xmt0(r,i) ne 0 and ArmFlag eq 0 and sigmam(r,i) ne inf)..
*  xmt(r,i)*pmt(r,i)**sigmam(r,i) =e= am(r,i)*xa(r,i)
*                                  * (pa(r,i)-emitax(r)*emicoef(r,i))**sigmam(r,i) ;

   xmt(r,i)*pmt(r,i)**sigmam(r,i) =e= thetam(r,i)*pmt(r,i)**sigmam(r,i)
                                 +  am(r,i)*(pa(r,i)**(sigmam(r,i)-1))
                                 *  (pa(r,i)*xa(r,i) - thetad(r,i)*pd(r,i) - thetam(r,i)*pmt(r,i)) ;

xmteq2.m(r,i) = 1 ;

xmteq3(r,i)$(AIDSFlag(r,i) eq 0 and xmt0(r,i) ne 0 and ArmFlag eq 0 and sigmam(r,i) eq inf)..
   pmt(r,i) =e= pa(r,i) + emitax(r)*emicoef(r,i) ;

xmteq3.m(r,i) = 1 ;

xmteq4(r,i)$(AIDSFlag(r,i) eq 2 and xmt0(r,i) ne 0)..
   pmt(r,i)*xmt(r,i) =e= pa(r,i)*xa(r,i)*(am(r,i) + gmd(r,i)*log(pd(r,i))
                      +  gmm(r,i)*log(pmt(r,i)) + betam(r,i)*log(xa(r,i))) ;


* ----- Equation (T-4)

paeq1(r,i)$(AIDSFlag(r,i) eq 0 and ArmFlag eq 0 and sigmam(r,i) ne inf and xa0(r,i) ne 0)..
*   (pa(r,i) -  emitax(r)*emicoef(r,i))**((1-sigmam(r,i)))
*      =e= (ad(r,i)*pd(r,i)**(1-sigmam(r,i)) + am(r,i)*pmt(r,i)**(1-sigmam(r,i))) ;
    pa(r,i)**(1-sigmam(r,i))
       =e= (ad(r,i)*pd(r,i)**(1-sigmam(r,i)) + am(r,i)*pmt(r,i)**(1-sigmam(r,i))) ;

*  pa(r,i)*xa(r,i) =g= pd(r,i)*xd(r,i) + pmt(r,i)*xmt(r,i) ;

* pa.lo(r,i)   = 0.01 ;
paeq1.m(r,i) = 1 ;

paeq2(r,i)$(AIDSFlag(r,i) eq 0 and ArmFlag eq 0 and sigmam(r,i) eq inf and xa0(r,i) ne 0)..
   xa(r,i) =e= xd(r,i) + xmt(r,i) ;

paeq2.m(r,i) = 1 ;

pa.fx(r,i)$(xa0(r,i) eq 0) = pa0(r,i) ;

paeq4(r,i)$(AIDSFlag(r,i) eq 2 and xa0(r,i) ne 0)..
   log(pa(r,i)) =e= a0(r,i) + ad(r,i)*log(pd(r,i)) + am(r,i)*log(pmt(r,i))
                 +  0.5*(gdd(r,i)*log(pd(r,i))*log(pd(r,i)) + gdm(r,i)*log(pd(r,i))*log(pmt(r,i))
                 +       gmd(r,i)*log(pmt(r,i))*log(pd(r,i)) + gmm(r,i)*log(pmt(r,i))*log(pmt(r,i))) ;

*
*  Armington demand by region of origin, i.e. world trade flow
*

*
* ----- First tier Armington import equations

* ----- Equation (T-5)

xm1eq1(r,r1,i)$(AIDSFlag(r,i) eq 0 and beta1(r,r1,i) ne 0 and sigmaw1(r,i) ne inf)..
   xm1(r,r1,i)*pm1(r,r1,i)**sigmaw1(r,i) =e= beta1(r,r1,i)*xmt(r,i)*pmt(r,i)**sigmaw1(r,i) ;

xm1eq1.m(r,r1,i) = 1 ;
xm1.fx(r,r1,i)$(beta1(r,r1,i) eq 0) = 0 ;

xm1eq2(r,r1,i)$(AIDSFlag(r,i) eq 0 and xm10(r,r1,i) ne 0 and sigmaw1(r,i) eq inf)..
   pm1(r,r1,i) =e= pmt(r,i) ;

xm1eq2.m(r,r1,i) = 1 ;

* ----- Equation (T-6)

pmteq1(r,i)$(AIDSFlag(r,i) eq 0 and xmt0(r,i) ne 0 and sigmaw1(r,i) ne inf)..
   pmt(r,i)**(1-sigmaw1(r,i)) =e= sum(r1,beta1(r,r1,i)*pm1(r,r1,i)**(1-sigmaw1(r,i))) ;

pmteq1.m(r,i) = 1 ;
pmt.fx(r,i)$(xmt0(r,i) eq 0) = pmt0(r,i) ;

pmteq2(r,i)$(AIDSFlag(r,i) eq 0 and xmt0(r,i) ne 0 and sigmaw1(r,i) eq inf)..
   xmt(r,i) =e= sum(r1,xm1(r,r1,i)) ;

* ----- Second tier Armington import equations

* ----- Equation (T-7)

xm2eq1(r,r1,r2,i)$(AIDSFlag(r,i) eq 0 and mapr1(r1,r2) and beta2(r,r2,i) ne 0 and sigmaw2(r,r1,i) ne inf)..
   xm2(r,r2,i)*pm2(r,r2,i)**sigmaw2(r,r1,i) =e= beta2(r,r2,i)*xm1(r,r1,i)*pm1(r,r1,i)**sigmaw2(r,r1,i) ;

xm2eq1.m(r,r1,r2,i) = 1 ;
xm2.fx(r,r2,i)$(beta2(r,r2,i) eq 0) = 0 ;

xm2eq2(r,r1,r2,i)$(AIDSFlag(r,i) eq 0 and mapr1(r1,r2) and beta2(r,r2,i) ne 0 and sigmaw2(r,r1,i) eq inf)..
   pm2(r,r2,i) =e= pm1(r,r1,i) ;

xm2eq2.m(r,r1,r2,i) = 1 ;

* ----- Equation (T-8)

pm1eq1(r,r1,i)$(AIDSFlag(r,i) eq 0 and xm10(r,r1,i) ne 0 and sigmaw2(r,r1,i) ne inf)..
   pm1(r,r1,i)**(1-sigmaw2(r,r1,i)) =e= sum(r2$mapr1(r1,r2), beta2(r,r2,i)*pm2(r,r2,i)**(1-sigmaw2(r,r1,i))) ;

pm1eq1.m(r,r1,i) = 1 ;
pm1.fx(r,r1,i)$(xm10(r,r1,i) eq 0) = pm10(r,r1,i) ;

pm1eq2(r,r1,i)$(AIDSFlag(r,i) eq 0 and xm10(r,r1,i) ne 0 and sigmaw2(r,r1,i) eq inf)..
   xm1(r,r1,i) =e= sum(r2$mapr1(r1,r2), xm2(r,r2,i)) ;

pm1eq2.m(r,r1,i) = 1 ;

* ----- Third tier Armington import demand equations

* ----- Equation (T-9)

wtfeq1(rp,r,r2,i)$(AIDSFlag(r,i) eq 0 and mapr2(r2,rp) and amw(rp,r,i) ne 0 and sigmaw(r,r2,i) ne inf)..
   lambdaw(rp,r,i)*wtf(rp,r,i)*
      (er(rp,r)*wpe(rp,r,i)*(1+tmarg(rp,r,i))*(1+tar(rp,r,i)+tar_p(rp,r,i))/lambdaw(rp,r,i))**sigmaw(r,r2,i)
      =e= amw(rp,r,i)*xm2(r,r2,i)*pm2(r,r2,i)**sigmaw(r,r2,i) ;

wtfeq1.m(rp,r,r2,i) = 1 ;
wtf.fx(r,rp,i)$(amw(r,rp,i) eq 0) = 0 ;

wtfeq2(rp,r,r2,i)$(AIDSFlag(r,i) eq 0 and mapr2(r2,rp) and amw(rp,r,i) ne 0 and sigmaw(r,r2,i) eq inf)..
   er(rp,r)*wpe(rp,r,i)*(1+tmarg(rp,r,i))*(1+tar(rp,r,i)+tar_p(rp,r,i)) =e= lambdaw(rp,r,i)*pm2(r,r2,i) ;

wtfeq2.m(rp,r,r2,i) = 1 ;

* ----- Equation (T-10)

pm2eq1(r,r2,i)$(AIDSFlag(r,i) eq 0 and xm20(r,r2,i) ne 0 and sigmaw(r,r2,i) ne inf)..
    pm2(r,r2,i)**((1-sigmaw(r,r2,i)))
       =e= (sum(rp$mapr2(r2,rp),amw(rp,r,i)*(er(rp,r)*wpe(rp,r,i)
        *    (1+tmarg(rp,r,i))*(1+tar(rp,r,i)+tar_p(rp,r,i))/lambdaw(rp,r,i))**(1-sigmaw(r,r2,i)))) ;

pm2eq1.m(r,r2,i) = 1 ;

pm2.fx(r,r2,i)$(xm20(r,r2,i) eq 0) = pmt0(r,i) ;

pm2eq2(r,r2,i)$(AIDSFlag(r,i) eq 0 and xmt0(r,i) ne 0 and sigmaw(r,r2,i) eq inf)..
   sum(rp$mapr2(r2,rp),lambdaw(rp,r,i)*wtf(rp,r,i)) =e= xm2(r,r2,i) ;

pm2eq2.m(r,r2,i) = 1 ;

*
*  Decomposition of domestic and import demand using AIDS
*

pmAIDSeq1(rp,r,i)$(AIDSFlag(r,i) eq 1 and (share0(rp,r,i) ne 0) and (ord(rp) ne ord(r)))..
   pmAIDS(rp,r,i) =e= er(rp,r)*wpe(rp,r,i)*(1+tmarg(rp,r,i))*(1+tar(rp,r,i)) ;

pmAIDSeq1.m(rp,r,i) = 1 ;

pmAIDS.fx(rp,r,i)$(AIDSFlag(r,i) eq 1 and share0(rp,r,i) eq 0) = pmAIDS0(rp,r,i) ;

pmAIDSeq2(r,r,i)$(AIDSFlag(r,i) eq 1 and share0(r,r,i) ne 0)..
   pmAIDS(r,r,i) =e= pdm(r,i) ;

pmAIDSeq2.m(r,r,i) = 1 ;

pdmeq(r,i)$(xdm0(r,i) ne 0 and AIDSFlag(r,i) eq 1)..
   pdm(r,i)**(1-sigmab(r,i)) =e=
        add(r,i)*pd(r,i)**(1-sigmab(r,i))
      + adm(r,i)*(er(r,r)*wpe(r,r,i)*(1+tmarg(r,r,i))*(1+tar(r,r,i)))**(1-sigmab(r,i)) ;

pdm.fx(r,i)$(xdm0(r,i) eq 0 and AIDSFlag(r,i) eq 1) = pdm0(r,i) ;
pdmeq.m(r,i) = 1 ;

pAIDSeq(r,i)$(xdm0(r,i) ne 0 and AIDSFlag(r,i) eq 1)..
   log(pa(r,i)) =e= alpha0(r,i) + sum(rp,alpha(rp,r,i)*log(pmAIDS(rp,r,i)))
                +  0.5*sum(rp,sum(rpp,gamma(rp,rpp,r,i)*log(pmAIDS(rp,r,i))*log(pmAIDS(rpp,r,i)))) ;

pa.fx(r,i)$(xdm0(r,i) eq 0 and AIDSFLAG(r,i) eq 1) = pa0(r,i) ;
pAIDSeq.m(r,i) = 1 ;

shareeq(rp,r,i)$(AIDSFlag(r,i) eq 1 and share0(rp,r,i) ne 0)..
   share(rp,r,i) =e= alpha(rp,r,i)+sum(rpp,gamma(rp,rpp,r,i)*log(pmAIDS(rpp,r,i)))
                  +  beta(rp,r,i)*log(xa(r,i)) ;

share.fx(rp,r,i)$(AIDSFlag(r,i) eq 1 and share0(rp,r,i) eq 0) = 0 ;
shareeq.m(rp,r,i) = 1 ;

wtfeq3(rp,r,i)$(AIDSFlag(r,i) eq 1 and (share0(rp,r,i) ne 0) and (ord(rp) ne ord(r)))..
   pmAIDS(rp,r,i)*lambdaw(rp,r,i)*wtf(rp,r,i) =e= share(rp,r,i)*(pa(r,i)*xa(r,i)) ;

wtfeq3.m(rp,r,i) = 1 ;

xdmeq(r,i)$(xdm0(r,i) ne 0 and AIDSFlag(r,i) eq 1)..
   xdm(r,i)*pdm(r,i) =e= share(r,r,i)*(pa(r,i)*xa(r,i)) ;

xdm.fx(r,i)$(AIDSFlag(r,i) eq 1 and xdm0(r,i) eq 0) = 0 ;
xdmeq.m(r,i) = 1 ;

pdeq5(r,i)$(AIDSFlag(r,i) eq 1 and xd0(r,i) ne 0)..
   xd(r,i)*pd(r,i)**sigmab(r,i) =e= add(r,i)*xdm(r,i)*pdm(r,i)**sigmab(r,i) ;

pdeq5.m(r,i) = 1 ;

wtfeq4(r,r,i)$(AIDSFlag(r,i) eq 1 and (amw(r,r,i) ne 0))..
   lambdaw(r,r,i)*wtf(r,r,i)*(er(r,r)*wpe(r,r,i)*(1+tmarg(r,r,i))*(1+tar(r,r,i))/lambdaw(r,r,i))**sigmab(r,i) =e=
      adm(r,i)*xdm(r,i)*pdm(r,i)**sigmab(r,i) ;

wtfeq4.m(r,r,i) = 1 ;

* --------------------------------------------------------------------
*
*  Implementation of TRQs
*
*  DvdM 2-Jan-2003
*
* --------------------------------------------------------------------

* ----- Equation (T-7)

wtf_ineq(rp,r,i)$(trqFlag(rp,r,i) ne 0)..
   wtf_q(rp,r,i) =g= wtf_in(rp,r,i) ;

tar_p.lo(rp,r,i) = 0 ;
tar_p.fx(r,rp,i)$(trqFlag(r,rp,i) eq 0) = 0 ;

* ----- Equation (T-8)

tar_peq(rp,r,i)$(trqFlag(rp,r,i) ne 0)..
   tar_out(rp,r,i) =g= tar(rp,r,i) + tar_p(rp,r,i) ;

wtf_out.lo(rp,r,i) = 0 ;
wtf_out.fx(rp,r,i)$(trqFlag(rp,r,i) eq 0) = 0 ;

* ----- Equation (T-9)

wtf_outeq(rp,r,i)$(amw(rp,r,i) ne 0 and trqFlag(rp,r,i) ne 0)..
   lambdaw(rp,r,i)*wtf(rp,r,i) =e= wtf_in(rp,r,i) + wtf_out(rp,r,i) ;

wtf_in.fx(rp,r,i)$(amw(rp,r,i) eq 0)  = 0 ;
wtf_out.fx(rp,r,i)$(amw(rp,r,i) eq 0) = 0 ;

* --------------------------------------------------------------------
*
*  Nested export supply system
*
* --------------------------------------------------------------------

*
*  Aggregate CET
*

* ----- Equation (T-10)

xdeq1(r,i)$(axd(r,i) ne 0 and sigmax(r,i) ne inf)..
   xd(r,i)*pp(r,i)**sigmax(r,i)
      =e= axd(r,i)*(xp(r,i)-xmarg(r,i))*pd(r,i)**sigmax(r,i) ;

xdeq1.m(r,i) = 1 ;

xd.fx(r,i)$(axd(r,i) eq 0) = 0 ;

xdeq2(r,i)$(axd(r,i) ne 0 and sigmax(r,i) eq inf)..
   pd(r,i) =e= pp(r,i) ;

xdeq2.m(r,i) = 1 ;

* ----- Equation (T-11)

eseq1(r,i)$(axe(r,i) ne 0 and sigmax(r,i) ne inf)..
   es(r,i)*pp(r,i)**sigmax(r,i)
      =e= axe(r,i)*(xp(r,i)-xmarg(r,i))*pet(r,i)**sigmax(r,i) ;

eseq1.m(r,i) = 1 ;

es.fx(r,i)$(axe(r,i) eq 0) = 0 ;

eseq2(r,i)$(axe(r,i) ne 0 and sigmax(r,i) eq inf)..
   pet(r,i) =e= pp(r,i) ;

eseq2.m(r,i) = 1 ;

* ----- Equation (T-12)

xpeq1(r,i)$(sigmax(r,i) ne inf and axp(r,i) ne 0)..
   pp(r,i)**(1+sigmax(r,i)) =e= (axd(r,i)*pd(r,i)**(1+sigmax(r,i))
                             +   axe(r,i)*pet(r,i)**(1+sigmax(r,i))) ;

xpeq1.m(r,i) = 1 ;

xp.fx(r,i)$(axp(r,i) eq 0) = 0 ;

xpeq2(r,i)$(sigmax(r,i) eq inf and axp(r,i) ne 0)..
   xp(r,i) =e= xd(r,i) + es(r,i) + xmarg(r,i) ;

xpeq2.m(r,i) = 1 ;

*
*  CET by region of destination
*

* ----- Equation (T-13)

tm_peq(r,rp,i)$(trqFlag(r,rp,i) ne 0 and wtf_q0(r,rp,i) gt 0 and chiTRQ(r,rp,i) ne 1)..
   tm_p(r,rp,i) =e= (1-chitrq(r,rp,i))
      * (wpe(r,rp,i)*(1+tmarg(r,rp,i))/lambdaw(r,rp,i))*tar_p(r,rp,i)*(wtf_q(r,rp,i)/wtf(r,rp,i)) ;

tm_p.fx(r,rp,i)$(trqFlag(r,rp,i) eq 0 or wtf_q0(r,rp,i) eq 0 or chiTRQ(r,rp,i) eq 1) = 0 ;
tm_peq.m(r,rp,i) = 1 ;

* ----- Equation (T-14)

wpeeq1(r,rp,i)$(aew(r,rp,i) ne 0 and sigmaz(r,i) ne inf)..
   wtf(r,rp,i)*pet(r,i)**sigmaz(r,i)
      =e= aew(r,rp,i)*es(r,i)*(tm_p(r,rp,i) + wpe(r,rp,i)/(1+etax(r,rp,i)))**sigmaz(r,i) ;

wpeeq1.m(r,rp,i) = 1 ;

wpe.fx(r,rp,i)$(aew(r,rp,i) eq 0) = wpe0(r,rp,i) ;

wpeeq2(r,rp,i)$(aew(r,rp,i) ne 0 and sigmaz(r,i) eq inf)..
   wpe(r,rp,i) =e= (1+etax(r,rp,i))*(pet(r,i) - tm_p(r,rp,i)) ;

* wpe.lo(r,rp,i) = 0.01 ;
wpeeq2.m(r,rp,i) = 1 ;

* ----- Equation (T-15)

peteq1(r,i)$(es0(r,i) ne 0 and sigmaz(r,i) ne inf)..
   pet(r,i)**(1+sigmaz(r,i))
      =e= sum(rp,aew(r,rp,i)*(tm_p(r,rp,i) + wpe(r,rp,i)/(1+etax(r,rp,i)))**(1+sigmaz(r,i))) ;

peteq1.m(r,i) = 1 ;

pet.fx(r,i)$(es0(r,i) eq 0) = pet0(r,i) ;

peteq2(r,i)$(es0(r,i) ne 0 and sigmaz(r,i) eq inf)..
   es(r,i) =e= sum(rp,wtf(r,rp,i)) ;

peteq2.m(r,i) = 1 ;

* --------------------------------------------------------------------
*
*  Trade prices
*
* --------------------------------------------------------------------

* ----- Equation (T-16)

peeq(r,rp,i)$(aew(r,rp,i) ne 0)..
   wpe(r,rp,i) =e= pe(r,rp,i)*(1+etax(r,rp,i)) ;

pe.fx(r,rp,i)$(aew(r,rp,i) eq 0) = pe0(r,rp,i) ;
peeq.m(r,rp,i) = 1 ;

* ----- Equation (T-17)

wpmeq(r,rp,i)$(aew(r,rp,i) ne 0)..
   lambdaw(r,rp,i)*wpm(r,rp,i) =e= wpe(r,rp,i)*(1+tmarg(r,rp,i)) ;

wpm.fx(r,rp,i)$(amw(r,rp,i) eq 0) = wpm0(r,rp,i) ;
wpmeq.m(r,rp,i) = 1 ;

* ----- Equation (T-18)

pmeq(r,rp,i)$(amw(r,rp,i) ne 0)..
   pm(r,rp,i) =e= er(r,rp)*wpm(r,rp,i)*(1+tar(r,rp,i)+tar_p(rp,r,i)) ;

pm.fx(r,rp,i)$(amw(r,rp,i) eq 0) = pm0(r,rp,i) ;
pmeq.m(r,rp,i) = 1 ;

* --------------------------------------------------------------------
*
*  International trade and transport services
*
* --------------------------------------------------------------------

* Aggregate international demand

* ----- Equation (T-19)

xwmargeq..
   xwmarg*pwmarg =e= sum(i,sum(r,sum(rp,tmarg(r,rp,i)*wpe(r,rp,i)*wtf(r,rp,i)))) ;

xwmargeq.m = 1 ;

* Allocation of aggregate international demand across regions

* ----- Equation (T-20)

xtmargeq(r)$(xtmarg0(r) ne 0)..
   xtmarg(r)*ptmarg(r)**sigmat =e= atmarg(r)*xwmarg*pwmarg**sigmat ;

xtmarg.fx(r)$(xtmarg0(r) eq 0) = 0 ;
xtmargeq.m(r) = 1 ;

* International price of trade and transport services

* ----- Equation (T-21)

pwmargeq..
   pwmarg**(1-sigmat) =e= sum(r,atmarg(r)*ptmarg(r)**(1-sigmat)) ;

* pwmarg.lo = 0.01 ;
pwmargeq.m = 1 ;

* Regional price of trade and transport services

* ----- Equation (T-22)

ptmargeq(r)$(xtmarg0(r) ne 0)..
   ptmarg(r) =g= sum(i,amarg(r,i)*pp(r,i)) ;

ptmarg.lo(r) = 0.01 ;
ptmarg.fx(r)$(xtmarg0(r) eq 0) = ptmarg0(r) ;
ptmargeq.m(r) = 1 ;

* Sectoral demand for regional goods and services

* ----- Equation (T-23)

xmargeq(r,i)$(amarg(r,i) ne 0)..
   xmarg(r,i) =e= amarg(r,i)*xtmarg(r) ;

xmarg.fx(r,i)$(amarg(r,i) eq 0) = 0 ;
xmargeq.m(r,i) = 1 ;

* --------------------------------------------------------------------
*
*  Emission equations
*
* --------------------------------------------------------------------

emitoteq(r)..
   emitot(r) =e= sum(i, emicoef(r,i)*xa(r,i)) ;

emitaxeq(r)$(emitaxFlag(r) eq 0)..
   emitax(r) =e= p*emitax0(r) ;

* --------------------------------------------------------------------
*
*  Domestic closure equations
*
* --------------------------------------------------------------------

* Government revenues

* ----- Equation (C-1)

greveq1(r)$(ArmFlag eq 1)..
   GRev(r) =e= sum(i,ptax(r,i)*px(r,i)*xp(r,i))
            +  sum(j,sum(i, pd(r,i)*pdtax(r,i,j)*xdp(r,i,j)))
            +  sum(j,sum(i, pmt(r,i)*pmtax(r,i,j)*xmp(r,i,j)))
            +  sum(h,sum(i, pd(r,i)*cdtax(r,i,h)*xdc(r,i,h)))
            +  sum(h,sum(i, pmt(r,i)*cmtax(r,i,h)*xmc(r,i,h)))
            +  sum(f,sum(i, pd(r,i)*fdtax(r,i,f)*xdf(r,i,f)))
            +  sum(f,sum(i, pmt(r,i)*fmtax(r,i,f)*xmf(r,i,f)))
            +  sum(rp,sum(i,er(rp,r)*(wpe(rp,r,i)*(1+tmarg(rp,r,i))/lambdaw(rp,r,i))*tar(rp,r,i)
                        * (lambdaw(rp,r,i)*wtf(rp,r,i) - wtf_out(rp,r,i))))
            +  sum(rp,sum(i,er(rp,r)*(wpe(rp,r,i)*(1+tmarg(rp,r,i))/lambdaw(rp,r,i))*tar_out(rp,r,i)*wtf_out(rp,r,i)))
            +  sum(rp,sum(i,er(rp,r)*chitrq(rp,r,i)*(wpe(rp,r,i)*(1+tmarg(rp,r,i))/lambdaw(rp,r,i))*tar_p(rp,r,i)*wtf_q(rp,r,i)))
            +  sum(rp,sum(i,(wpe(r,rp,i)*etax(r,rp,i)/(1+etax(r,rp,i)))*wtf(r,rp,i)))
            +  sum(i, sum(ll, wagetax(r,ll,i)*nwage(r,ll,i)*(labdv(r,ll,i)+labdf(r,ll,i))))
            +  sum(i, sum(v, KapTax(r,i,v)*nrent(r,i,v)*kapdv(r,i,v))
            +                KapTax(r,i,"Old")*nrent(r,i,"Old")*kapdf(r,i))
            +  sum(i, LndTax(r,i)*npt(r,i)*td(r,i))
            +  sum(h, chik(r)*kappah(r,h)*yh(r,h))
            +  emitax(r)*emitot(r) ;

greveq1.m(r) = 1 ;

greveq2(r)$(ArmFlag eq 0)..
   GRev(r) =e= sum(i,ptax(r,i)*px(r,i)*xp(r,i))
            +  sum(j,sum(i, pa(r,i)*(mtxadj(r,i)*patax(r,i,j)+atxadj(r,i))*xap(r,i,j)))
            +  sum(h,sum(i, pa(r,i)*(mtxadj(r,i)*catax(r,i,h)+atxadj(r,i))*xac(r,i,h)))
            +  sum(f,sum(i, pa(r,i)*fatax(r,i,f)*xaf(r,i,f)))
            +  sum(rp,sum(i,er(rp,r)*(wpe(rp,r,i)*(1+tmarg(rp,r,i))/lambdaw(rp,r,i))
                                     * (tar(rp,r,i)*(lambdaw(rp,r,i)*wtf(rp,r,i) - wtf_out(rp,r,i)) + tar_out(rp,r,i)*wtf_out(rp,r,i))))
            +  sum(rp,sum(i,er(rp,r)*chitrq(rp,r,i)*(wpe(rp,r,i)*(1+tmarg(rp,r,i))/lambdaw(rp,r,i))
                                     *tar_p(rp,r,i)*wtf_q(rp,r,i)))
            +  sum(rp,sum(i,(wpe(r,rp,i)*etax(r,rp,i)/(1+etax(r,rp,i)))*wtf(r,rp,i)))
            +  sum(i, sum(ll, wagetax(r,ll,i)*nwage(r,ll,i)*(labdv(r,ll,i)+labdf(r,ll,i))))
            +  sum(i, sum(v, KapTax(r,i,v)*nrent(r,i,v)*kapdv(r,i,v))
            +                KapTax(r,i,"Old")*nrent(r,i,"Old")*kapdf(r,i))
            +  sum(i, LndTax(r,i)*npt(r,i)*td(r,i))
            +  sum(h, chik(r)*kappah(r,h)*yh(r,h))
            +  emitax(r)*emitot(r) ;

greveq2.m(r) = 1 ;

* ----- Equation (C-2)

savgeq(r)..
   savg(r) =e= GRev(r) - pfd(r,"Gov")*fdvol(r,"Gov") - sum(h,pabs(r)*trg(r,h)) ;

savgeq.m(r) = 1 ;

* ----- Equation (C-3)

rsgeq(r)..
   pabs(r)*rsg(r) =e= savg(r) ;

rsgeq.m(r) = 1 ;

* ----- Equation (C-4)

fdvolgoveq(r)$(calflag eq 1)..
   fdvol(r,"Gov") =e= agx(r)*rgdpmp(r) ;
*  fdvol(r,"Gov") =e= tgLag(r)*(1 + ggdp(r))**gap ;

fdvolgoveq.m(r) = 1 ;

* ----- Saving-investment equilibrium

* ----- Equation (C-5)

savfeq(r)$(KFlowFlag eq 0)..
   savf(r) =e= p*savfbar(r) ;

savfeq.m(r) = 1 ;

invsheq(r)$(KFlowFlag eq 1)..
   invsh(r) =e= lambdainv(r)*chiInv(r)*((psavw/p)**epsI(r))
             *  ((trent(r)/wrr)**epsrr(r))
             *  ((1+ggdp(r))**epsY(r))
             +  (1 - lambdainv(r))*invshlag(r) ;

invsheq.m(r) = 1 ;

* ----- Equation (C-6)

psavweq$(KFlowFlag eq 1)..
   sum(r,savf(r)) =e= 0 ;

psavweq.m = 1 ;

* ----- Equation (C-7)

fdvolinveq(rres)..
   pfd(rres,"Inv")*fdvol(rres,"Inv")
      =e= sum(h,savh(rres,h)) + savg(rres) + savf(rres) + sum(h,Deprec(rres,h)) ;

fdvolinveq.m(r) = 1 ;

* ----- Equation (C-8)

inveq(r)..
   fdvol(r,"Inv")*pfd(r,"Inv") =e= invsh(r)*gdpmp(r) ;

inveq.m(r) = 1 ;

* ----- Definition of numeraire

* ----- Equation (C-9)

peq..
   p*sum(manu,sum(oecd,sum(rp,sum(rsav,er(rp,rsav)*wpe0(oecd,rp,manu)*wtf0(oecd,rp,manu)))))
      =e= sum(manu,sum(oecd,sum(rp,sum(rsav,er(rp,rsav)*wpe(oecd,rp,manu)*wtf0(oecd,rp,manu))))) ;

peq.m = 1 ;

* ----- Equation (C-10)

wrreq..
   wrr*sum(r,kstock(r)) =e= sum(r,trent(r)*kstock(r)) ;

wrreq.m = 1 ;

* --------------------------------------------------------------------
*
*  Equilibrium conditions
*
* --------------------------------------------------------------------

*
*  Labor market clearing conditions
*

*
*  Modified 10-Mar-2003 by DvdM
*           Removed labor supply curve
*           Added labor market segmentation
*           Added minimum wage and unemployment

* ----- Equation (F-1)

lsrureq(r,ll)$(labs0(r,ll,"Rur") ne 0)..
   labs(r,ll,"Rur") =e= LabsLag(r,ll,"Rur")*(1+glab(r,ll,"Rur"))**gap - migr(r,ll) ;

lsrureq.m(r,ll) = 1 ;

* ----- Equation (F-2)

lsurbeq(r,ll)$(labs0(r,ll,"Urb") ne 0)..
   labs(r,ll,"Urb") =e= LabsLag(r,ll,"Urb")*(1+glab(r,ll,"Urb"))**gap + migr(r,ll) ;

lsurbeq.m(r,ll) = 1 ;

* ----- Equation (F-3)

lstoteq(r,ll)$(labs0(r,ll,"Tot") ne 0)..
   labs(r,ll,"Tot") =e= sum(gs,labs(r,ll,gs)) ;

lstoteq.m(r,ll) = 1 ;

labs.fx(r,ll,gz)$(labs0(r,ll,gz) eq 0) = 0 ;

* ----- Equation (F-4)

avgweq(r,ll,gz)$(labs0(r,ll,gz) ne 0 and omegam(r,ll) ne inf)..
*   avgw(r,ll,gz)*sum(i$mapg(i,gz),labdv(r,ll,i)+labdf(r,ll,i)) =e=
*      sum(i$mapg(i,gz),nwage(r,ll,i)*(labdv(r,ll,i)+labdf(r,ll,i))) ;
   avgw(r,ll,gz) =e=
       sum(i$mapg(i,gz),nwage(r,ll,i)*(labdv(r,ll,i)+labdf(r,ll,i)))
     / sum(i$mapg(i,gz),labdv(r,ll,i)+labdf(r,ll,i)) ;

avgw.fx(r,ll,gz)$(labs0(r,ll,gz) eq 0 or omegam(r,ll) eq inf) = 1 ;
avgweq.m(r,ll,gz) = 1 ;

* ----- Equation (F-5)

migreq(r,ll)$(omegam(r,ll) ne inf and labs0(r,ll,"Rur") ne 0)..
   migr(r,ll)*((1-ue(r,ll,"Rur"))*avgw(r,ll,"Rur"))**omegam(r,ll) =e=
      chiMigr(r,ll)*((1-ue(r,ll,"Urb"))*avgw(r,ll,"Urb"))**omegam(r,ll) ;

migreq.m(r,ll) = 1 ;
migr.fx(r,ll)$(omegam(r,ll) eq inf or Labs0(r,ll,"Rur") eq 0) = 0 ;

* ----- Equation (F-6)

twageToteq1(r,ll)$(labs0(r,ll,"Tot") ne 0 and omegam(r,ll) eq inf and UEFlag(r,ll) ne 1)..
   twage(r,ll,"Tot") =g= wmin(r,ll,"Tot") ;

ueTot.lo(r,ll)$(labs0(r,ll,"Tot") ne 0 and omegam(r,ll) eq inf) = 0 ;
*twageToteq1.m(r,ll) = 1 ;

twageToteq2(r,ll)$(labs0(r,ll,"Tot") ne 0 and omegam(r,ll) ne inf)..
   twage(r,ll,"Tot") =e= avgw(r,ll,"Tot") ;

twageToteq2.m(r,ll) = 1 ;

twageToteq3(r,ll)$(labs0(r,ll,"Tot") ne 0 and omegam(r,ll) eq inf and UEFlag(r,ll) eq 1)..
   twage(r,ll,"Tot") =e= wmin(r,ll,"Tot") ;

twageToteq3.m(r,ll) = 1 ;

* ----- Equation (F-7)

twageeq1(r,ll,gs)$(omegam(r,ll) ne inf and labs0(r,ll,gs) gt 0)..
   twage(r,ll,gs) =g= wmin(r,ll,gs) ;

ue.lo(r,ll,gs)$(omegam(r,ll) ne inf and labs0(r,ll,gs) gt 0) = 0 ;
*twageeq1.m(r,ll,gs) = 1 ;

twageeq2(r,ll,gs)$(omegam(r,ll) eq inf and labs0(r,ll,gs) ne 0)..
   twage(r,ll,gs) =e= twage(r,ll,"Tot") ;

twageeq2.m(r,ll,gs) = 1 ;

twage.fx(r,ll,gz)$(labs0(r,ll,gz) eq 0) = twage0(r,ll,gz) ;

* ----- Equation (F-8)

wminToteq(r,ll)$(labs0(r,ll,"Tot") ne 0 and omegam(r,ll) eq inf and amin0(r,ll,"Tot") ne 0)..
   wmin(r,ll,"Tot") =e=
      amin(r,ll,"Tot") * (pabs(r)**omegap(r,ll,"Tot"))
                       *  ((1-ueTot(r,ll))**omegaue(r,ll,"Tot")) ;

wminToteq.m(r,ll) = 1 ;
wmin.fx(r,ll,"Tot")$(omegam(r,ll) ne inf)    = wmin0(r,ll,"Tot") ;

* ----- Equation (F-9)

wmineq1(r,ll,gs)$(omegam(r,ll) ne inf and labs0(r,ll,gs) ne 0 and amin0(r,ll,gs) ne 0)..
   wmin(r,ll,gs) =e=
      amin(r,ll,gs) * (pabs(r)**omegap(r,ll,gs))
                    * ((1-ue(r,ll,gs))**omegaue(r,ll,gs)) ;

wmineq1.m(r,ll,gs) = 1 ;

wmineq2(r,ll,gs)$(omegam(r,ll) eq inf and labs0(r,ll,gs) ne 0 and amin0(r,ll,gs) ne 0)..
   wmin(r,ll,gs) =e= wmin(r,ll,"Tot") ;

wmineq2.m(r,ll,gs) = 1 ;

wmin.fx(r,ll,gz)$(labs0(r,ll,gz) eq 0) = 0 ;

wmin.fx(r,ll,gz)$(amin0(r,ll,gz) eq 0) = 0.01*avgw0(r,ll,gz) ;
amin.fx(r,ll,gz)$(amin0(r,ll,gz) eq 0) = 0 ;

* ----- Equation (F-10)

ueeq(r,ll,gs)$(labs0(r,ll,gs) ne 0 and omegam(r,ll) ne inf)..
   ue(r,ll,gs)*(labs(r,ll,gs)) =e= labs(r,ll,gs)
      - sum(i$mapg(i,gs),labdv(r,ll,i)+labdf(r,ll,i)) ;

ueToteq(r,ll)$(labs0(r,ll,"Tot") ne 0 and omegam(r,ll) eq inf)..
   ueTot(r,ll)*(labs(r,ll,"Tot")) =e= labs(r,ll,"Tot")
      - sum(i$mapg(i,"Tot"),labdv(r,ll,i)+labdf(r,ll,i)) ;

ueToteq.m(r,ll) = 1 ;
ueTot.fx(r,ll)$(labs0(r,ll,"Tot") eq 0) = 0 ;
ue.fx(r,ll,gz)$(labs0(r,ll,gz) eq 0) = 0 ;

* ----- Equation (F-11)

nwageeq(r,ll,i)$(labdv0(r,ll,i) ne 0)..
   nwage(r,ll,i) =e= wdist(r,ll,i)*sum(gs$mapg(i,gs),twage(r,ll,gs)) ;

nwage.fx(r,ll,i)$(labdv0(r,ll,i) eq 0) = nwage0(r,ll,i) ;
nwageeq.m(r,ll,i) = 1 ;

* ----- Equation (F-12)

wageeq(r,ll,i)$(labdv0(r,ll,i) ne 0)..
   wage(r,ll,i) =g= nwage(r,ll,i)*(1+wagetax(r,ll,i)) ;

wage.fx(r,ll,i)$(labdv0(r,ll,i) eq 0) = wage0(r,ll,i) ;
wageeq.m(r,ll,i) = 1 ;
wage.lo(r,ll,i)$(labdv0(r,ll,i) ne 0) = 0.01*wage0(r,ll,i) ;

wdisteq(r,ll,i)$(wageBarg(r,ll,i) eq 1 and labdv0(r,ll,i) ne 0)..
   (wdist(r,ll,i)-1)*(1-delta(r,ll,i))*sum(v,sigmav(r,i,v)*labdv(r,ll,i)) =e=
      wdist(r,ll,i)*delta(r,ll,i)*(labdv(r,ll,i)-L0(r,ll,i)) ;

wdist.fx(r,ll,i)$(wageBarg(r,ll,i) eq 1 and labdv0(r,ll,i) eq 0) = wdist0(r,ll,i) ;
wdisteq.m(r,ll,i) = 1 ;

*
*  Land market
*

*  Aggregate supply

tlandeq1(r)$(leps0(r) ne inf and LandMax(r) eq inf and tland0(r) ne 0)..
   tland(r)*pabs(r)**leps0(r) =e= ats(r)*ptland(r)**leps0(r) ;

tland.fx(r)$(tland0(r) eq 0) = 0 ;
tlandeq1.m(r) = 1 ;

tlandeq2(r)$(leps0(r) eq inf and tland0(r) ne 0)..
   ptland(r) =e= pabs(r)*ptland0(r) ;

tlandeq2.m(r) = 1 ;

tlandeq3(r)$(leps0(r) ne inf and LandMax(r) ne inf and tland0(r) ne 0)..
   tland(r)*(1+ats(r)*exp(-gammats(r)*(ptland(r)/pabs(r)))) =e= landmax(r) ;

*  Sectoral equilibrium

ptlandeq1(r)$(omegatl(r) ne inf and tland0(r) ne 0)..
   ptland(r)**(1+omegatl(r)) =e= sum(i,alnd(r,i)*npt(r,i)**(1+omegatl(r))) ;

ptland.fx(r)$(tland0(r) eq 0) = ptland0(r) ;
ptlandeq1.m(r) = 1 ;

ptlandeq2(r)$(omegatl(r) eq inf and tland0(r) ne 0)..
   tland(r) =e= sum(i,td(r,i)) ;

ptlandeq2.m(r) = 1 ;

tseq1(r,i)$(alnd(r,i) ne 0 and omegatl(r) ne inf)..
   ts(r,i)*ptland(r)**omegatl(r)
      =e= alnd(r,i)*tland(r)*npt(r,i)**omegatl(r) ;

ts.fx(r,i)$(alnd(r,i) eq 0) = 0 ;
tseq1.m(r,i) = 1 ;

tseq2(r,i)$(alnd(r,i) ne 0 and omegatl(r) eq inf)..
   npt(r,i) =e= ptland(r) ;

tseq2.m(r,i) = 1 ;

pteq(r,i)$(alnd(r,i) ne 0)..
   td(r,i) =e= ts(r,i) ;

pt.fx(r,i)$(alnd(r,i) eq 0) = pt0(r,i) ;
pteq.m(r,i) = 1 ;

npteq(r,i)$(alnd(r,i) ne 0)..
   pt(r,i) =e= npt(r,i)*(1+LndTax(r,i)) ;

npt.fx(r,i)$(alnd(r,i) eq 0) = 1 ;
npteq.m(r,i) = 1 ;

*
*  Sector specific factor
*

fseq1(r,i)$(afs(r,i) ne 0 and omegaf(r,i) ne inf)..
   fs(r,i)*pabs(r)**omegaf(r,i) =e= afs(r,i)*pf(r,i)**omegaf(r,i) ;

fs.fx(r,i)$(afs(r,i) eq 0) = 0 ;
fseq1.m(r,i) = 1 ;

fseq2(r,i)$(afs(r,i) ne 0 and omegaf(r,i) eq inf)..
   pf(r,i) =e= pf0(r,i)*pabs(r) ;

fseq2.m(r,i) = 1 ;

pfeq(r,i)$(afs(r,i) ne 0)..
   fs(r,i) =e= ff(r,i) ;

pf.fx(r,i)$(afs(r,i) eq 0) = pf0(r,i) ;
pfeq.m(r,i) = 1 ;

*
*  Capital market equilibrium
*

* Comparative static mode -- use CET supply function

kapseq1(r,i)$(card(v) eq 1 and omegak(r) ne inf and omegak(r) ne 0 and kaps0(r,i) ne 0)..
   kaps(r,i)*trent(r)**omegak(r) =e= akap(r,i)*tkaps(r)*nrent(r,i,"Old")**omegak(r) ;

kaps.fx(r,i)$(kaps0(r,i) eq 0 and card(v) eq 1) = 0 ;
kapseq1.m(r,i) = 1 ;

kapseq2(r,i,v)$(card(v) eq 1 and omegak(r) eq inf and kaps0(r,i) ne 0)..
   nrent(r,i,v) =e= trent(r) ;

kapseq2.m(r,i,v) = 1 ;

trenteq1(r)$(card(v) eq 1 and omegak(r) ne inf and omegak(r) ne 0)..
   trent(r)**(1+omegak(r)) =e= sum(i,akap(r,i)*nrent(r,i,"Old")**(1+omegak(r))) ;

trenteq1.m(r) = 1 ;

trenteq2(r)$(card(v) eq 1 and omegak(r) eq inf)..
   tkaps(r) =e= sum(i,sum(v,kapdv(r,i,v)) + kapdf(r,i)) ;

trenteq2.m(r) = 1 ;

renteq1(r,i)$(card(v) eq 1 and kaps0(r,i) ne 0)..
   sum(v,kapdv(r,i,v)) + kapdf(r,i) =e= kaps(r,i) ;

rent.fx(r,i,v)$(kaps0(r,i) eq 0 and card(v) eq 1) = rent0(r,i,"Old") ;
nrent.fx(r,i,v)$(kaps0(r,i) eq 0 and card(v) eq 1) = nrent0(r,i,"Old") ;
renteq1.m(r,i) = 1 ;

* Dynamic mode

*  Calculate capital/output ratio

kxrateq(r,i)$(ak(r,i,"Old") ne 0)..
   kxrat(r,i)*xpv(r,i,"Old") =g= kapdv(r,i,"Old") ;

kxrat.fx(r,i)$(ak(r,i,"Old") eq 0) =  0 ;
kxrat.lo(r,i)$(ak(r,i,"Old") ne 0) = 0.01*kxrat0(r,i) ;
kxrateq.m(r,i) = 1 ;

* Determine the equilbrium rate of return on old capital in declining sectors,
* it cannot exceed 1.

rrateq(r,i)$(card(v) ne 1 and ak(r,i,"Old") ne 0)..
*  rrat(r,i) =l= (kxrat(r,i)*xp(r,i)/kaps0(r,i))**(1/InvElas(r,i)) ;
   rrat(r,i)**(InvElas(r,i)) =l= (kxrat(r,i)*xp(r,i)/kaps0(r,i)) ;
*  InvElas(r,i)*log(rrat(r,i)) =l= log((kxrat(r,i)*xp(r,i)/kaps0(r,i))) ;

rrat.fx(r,i)$(card(v) ne 1 and ak(r,i,"Old") eq 0) = 1 ;
rrateq.m(r,i) = 1 ;

*  rrat(r,i) =e= min(rratLag(r,i)*(kapdv(r,i,"Old")/kaps0(r,i))**(1/InvElas(r,i)),1) ;
*  rrat(r,i) =e= min((kapdv(r,i,"Old")/kaps0(r,i))**(1/InvElas(r,i)),1) ;
*  kapdv(r,i,"Old") =l= kaps0(r,i)*rrat(r,i)**InvElas(r,i) ;

* Determine the equilibrium rental rate on "new" capital

trenteq3(r)$(card(v) ne 1)..
   sum(i,sum(v,kapdv(r,i,v)) + kapdf(r,i)) =e= tkaps(r) ;

trenteq3.m(r) = 1 ;

* Set the vintage rental rates

renteq2(r,i,Old)$(card(v) ne 1 and ak(r,i,"Old") ne 0)..
   nrent(r,i,Old) =e= trent(r)*rrat(r,i) ;

renteq2.m(r,i,Old) = 1 ;

renteq3(r,i,New)$(card(v) ne 1 and ak(r,i,"Old") ne 0)..
   nrent(r,i,New) =e= trent(r) ;

renteq3.m(r,i,New) = 1 ;

nrenteq(r,i,v)$(ak(r,i,"Old") ne 0)..
   rent(r,i,v) =e= nrent(r,i,v)*(1+KapTax(r,i,v)) ;

nrenteq.m(r,i,v) = 1 ;

nrent.fx(r,i,v)$(ak(r,i,"Old") eq 0) = nrent0(r,i,v) ;
rent.fx(r,i,v)$(ak(r,i,"Old") eq 0)  = rent0(r,i,v) ;

*
*  Determination of output by vintage
*

* In comparative static mode, the following equation sets old output to total output
* In dynamic mode, this essentially determines the new vintage output

xpveq1(r,i)$(axp(r,i) ne 0)..
   xp(r,i) =g= sum(v,xpv(r,i,v)) ;

xp.fx(r,i)$(axp(r,i) eq 0) = 0 ;
xp.lo(r,i)$(axp(r,i) ne 0) = 0.01*xp0(r,i) ;
xpveq1.m(r,i) = 1 ;

* Dynamic -- old output cannot exceed total output

*xpveq2(r,i,Old)$(card(v) ne 1 and axp(r,i) ne 0)..
*   xpv(r,i,Old) =e= min(xp(r,i), kaps0(r,i)/kxrat(r,i)) ;

xpveq2(r,i)$(card(v) ne 1 and axp(r,i) ne 0)..
   xpv(r,i,"Old")*kxrat(r,i) =e= kaps0(r,i)*rrat(r,i)**InvElas(r,i) ;

xpveq2.m(r,i) = 1 ;

xpv.fx(r,i,Old)$(axp(r,i) eq 0) = 0 ;
xpv.fx(r,i,"New")$(ak(r,i,"Old") eq 0) = 0 ;

* --------------------------------------------------------------------
*
*  Capital stock equations
*
* --------------------------------------------------------------------

ginveq(r)$(CompFlag eq 0)..
   fdvol(r,"Inv") =e= tiLag(r)*(1+ginv(r))**gap ;

ginveq.m(r) = 1 ;

* For step size equal to 1

kstockeq1(r)$(gap eq 1 and CompFlag eq 0)..
   kstock(r) =e= (1-depr(r))*kstockLag(r) + tiLag(r) ;

kstockeq1.m(r) = 1 ;

* For step sizes greater than 1

kstockeq2(r)$(gap ne 1)..
   kstock(r)*(ginv(r)+depr(r))
      =e= (ginv(r)+depr(r))*kstockLag(r)*(1-depr(r))**gap
       +  tiLag(r)*((1+ginv(r))**gap - (1-depr(r))**gap) ;

kstockeq2.m(r) = 1 ;

tkapseq(r)$(CompFlag eq 0)..
   tkaps(r) =e= krat(r)*kstock(r) ;

tkapseq.m(r) = 1 ;

* --------------------------------------------------------------------
*
*  Definition of real GDP and GDP deflator
*
* --------------------------------------------------------------------

rgdpmpeq1(r)$(ArmFlag eq 1)..
   rgdpmp(r) =e= sum(i,sum(h,pac0(r,i,h)*xac(r,i,h)))
              +  sum(i,sum(f,paf0(r,i,f)*xaf(r,i,f)))
              +  sum(i,sum(rp,wpe0(r,rp,i)*wtf(r,rp,i)))
              +  ptmarg0(r)*xtmarg(r)
              -  sum(i,sum(rp,wpm0(rp,r,i)*lambdaw(rp,r,i)*wtf(rp,r,i))) ;

rgdpmpeq1.m(r) = 1 ;

rgdpmpeq2(r)$(ArmFlag eq 0)..
   rgdpmp(r) =e= sum(i,sum(h,(1+catax0(r,i,h))*pa0(r,i)*xac(r,i,h)))
              +  sum(i,sum(f,(1+fatax0(r,i,f))*pa0(r,i)*xaf(r,i,f)))
              +  sum(i,sum(rp,wpe0(r,rp,i)*wtf(r,rp,i)))
              +  ptmarg0(r)*xtmarg(r)
              -  sum(i,sum(rp,wpm0(rp,r,i)*lambdaw(rp,r,i)*wtf(rp,r,i))) ;

rgdpmpeq2.m(r) = 1 ;

gdpmpeq1(r)$(ArmFlag eq 1)..
   gdpmp(r) =e= sum(i,sum(h,pac(r,i,h)*xac(r,i,h)))
             +  sum(i,sum(f,paf(r,i,f)*xaf(r,i,f)))
             +  sum(i,sum(rp,wpe(r,rp,i)*wtf(r,rp,i)))
             +  ptmarg(r)*xtmarg(r)
             -  sum(i,sum(rp,wpe(rp,r,i)*(1+tmarg(rp,r,i))*lambdaw(rp,r,i)*wtf(rp,r,i))) ;

gdpmpeq1.m(r) = 1 ;

gdpmpeq2(r)$(ArmFlag eq 0)..
   gdpmp(r) =e= sum(i,sum(h,(1+mtxadj(r,i)*catax(r,i,h)+atxadj(r,i))*pa(r,i)*xac(r,i,h)))
             +  sum(i,sum(f,(1+fatax(r,i,f))*pa(r,i)*xaf(r,i,f)))
             +  sum(i,sum(rp,wpe(r,rp,i)*wtf(r,rp,i)))
             +  ptmarg(r)*xtmarg(r)
             -  sum(i,sum(rp,wpe(rp,r,i)*(1+tmarg(rp,r,i))*lambdaw(rp,r,i)*wtf(rp,r,i))) ;

gdpmpeq2.m(r) = 1 ;

rgdpeq(r)..
   rgdp(r) =e= sum(i,(g(r,i)/g0(r,i))*(lambdat(r,i)*npt0(r,i)*td(r,i)
            +        lambdaf(r,i)*pf0(r,i)*ff(r,i)
            +        sum(ll,lambdal(r,ll,i)*nwage0(r,ll,i)*labdv(r,ll,i))
            +        sum(v,lambdak(r,i,v)*nrent0(r,i,v)*kapdv(r,i,v))))
            +  sum(i,sum(ll,nwage0(r,ll,i)*labdf0(r,ll,i))
            +        nrent0(r,i,"Old")*kapdf(r,i)) ;

rgdpeq.m(r) = 1 ;

pgdpeq(r)..
   pgdp(r)*rgdp(r) =e= sum(h,yh(r,h) + deprec(r,h) - pgdp(r)*trg(r,h))
                    -  sum(i,profit(r,i)) ;

pgdpeq.m(r) = 1 ;

pabseq1(r)$(ArmFlag ne 0)..
   pabs(r)*sum(i, sum(j, pap0(r,i,j)*xap0(r,i,j)) + sum(h, pac0(r,i,h)*xac0(r,i,h)) + sum(f, paf0(r,i,f)*xaf0(r,i,f)))
      =e= sum(i, sum(j, pap(r,i,j)*xap0(r,i,j)) + sum(h, pac(r,i,h)*xac0(r,i,h)) + sum(f, paf(r,i,f)*xaf0(r,i,f))) ;

pabseq2.m(r) = 1 ;

pabseq2(r)$(ArmFlag eq 0)..
   pabs(r)*sum(i, pa0(r,i)*xa0(r,i)) =e= sum(i, pa(r,i)*xa0(r,i)) ;

pabseq2.m(r) = 1 ;

* --------------------------------------------------------------------
*
*  Dynamic equations
*
* --------------------------------------------------------------------

ggdpeq(r)$(CompFlag eq 0)..
   rgdpmp(r) =e= rgdpmpLag(r)*(1 + ggdp(r))**gap ;

ggdpeq.m(r) = 1 ;

lambdakeq(r,ik,v)$((CalFlag eq 1 or GDPFX(r)) and KProdFlag eq 1)..
   lambdak(r,ik,v) =e= lambdaklag(r,ik,v)*(1+prodshft(r,ik)+gk(r))**gap ;

lambdakeq.m(r,ik,v) = 1 ;

kaplabeq(r)..
   kaplab(r)*sum(i,G(r,i)*sum(ll,wage0(r,ll,i)*lambdal(r,ll,i)*labdv(r,ll,i)) + sum(ll,wage0(r,ll,i)*labdf0(r,ll,i)))
      =e= sum(i,G(r,i)*sum(v,rent0(r,i,v)*lambdak(r,i,v)*kapdv(r,i,v)) + rent0(r,i,"Old")*kapdf(r,i)) ;

kaplabeq.m(r) = 1 ;

lambdaleq1(r,ll,ik)$(labdv0(r,ll,ik) ne 0 and gap eq 1)..
   lambdal(r,ll,ik) =g= lambdallag(r,ll,ik)
                     *  (1+gl(r)+prodshft(r,ik)+chip(r,ik)) ;

lambdaleq2(r,ll,ik)$(labdv0(r,ll,ik) ne 0 and gap ne 1)..
   lambdal(r,ll,ik) =e= lambdallag(r,ll,ik)
                     *  (1+gl(r)+prodshft(r,ik)+chip(r,ik))**gap ;

lambdal.fx(r,ll,ik)$(labdv0(r,ll,ik) eq 0) = lambdal.l(r,ll,ik) ;
lambdal.lo(r,ll,ik)$(labdv0(r,ll,ik) ne 0) = 0.01 ;
lambdaleq1.m(r,ll,ik) = 1 ;
lambdaleq2.m(r,ll,ik) = 1 ;

chipeq1(r,i)$(etap(r,i) eq 1 and axe(r,i) gt 0)..
   chip(r,i)*xp(r,i) =e= phip(r,i)*es(r,i) ;

chipeq2(r,i)$(etap(r,i) > 0 and etap(r,i) ne 1 and axe(r,i) gt 0)..
   chip(r,i)*xp(r,i)**etap(r,i) =e= phip(r,i)*es(r,i)**etap(r,i) ;

chip.fx(r,i)$(etap(r,i) eq 0 or axe(r,i) eq 0) = chip.l(r,i) ;
chipeq1.m(r,i) = 1 ;
chipeq2.m(r,i) = 1 ;

phipeq(r,ik)$(etap(r,ik) > 0 and axe(r,ik) gt 0 and CalFlag eq 1)..
   (1-alphap(r,ik))*chip(r,ik) =e= alphap(r,ik)*(gl(r)+prodshft(r,ik)) ;

phipeq.m(r,ik) = 1 ;
phip.fx(r,i)$(axe(r,i) eq 0) = 0 ;

* Agricultural productivity, uniform across factors of production

agprodeq(r,ink)$(etap(r,ink) > 0 and xp0(r,ink) gt 0 and CalFlag ne 1)..
   agprod(r,ink) =e= (1+chip(r,ink)+prodshft(r,ink))**gap ;

agprodeq.m(r,ink) = 1 ;

lamlageq(r,ll,ink)$(etap(r,ink) > 0 and labdv0(r,ll,ink) gt 0 and CalFlag ne 1)..
   lambdal(r,ll,ink) =e= lambdallag(r,ll,ink)*agprod(r,ink) ;

lamlageq.m(r,ll,ink) = 1 ;

lamkageq(r,ink,v)$(etap(r,ink) > 0 and kapd0(r,ink) gt 0 and CalFlag ne 1)..
   lambdak(r,ink,v) =e= lambdaklag(r,ink,v)*agprod(r,ink) ;

lamkageq.m(r,ink,v) = 1 ;

lamtageq(r,ink)$(etap(r,ink) > 0 and at(r,ink,"Old") gt 0 and CalFlag ne 1)..
   lambdat(r,ink) =e= lambdatlag(r,ink)*agprod(r,ink) ;

lamtageq.m(r,ink) = 1 ;

lamfageq(r,ink)$(etap(r,ink) > 0 and af(r,ink,"Old") gt 0 and CalFlag ne 1)..
   lambdaf(r,ink) =e= lambdaflag(r,ink)*agprod(r,ink) ;

lamfageq.m(r,ink) = 1 ;


* --------------------------------------------------------------------
*
*  Objective function = current year + Walras' Law
*
* --------------------------------------------------------------------

objeq..
*  obj =e= year + sum(r,
*             sum(i,sum(rp,wpe(rp,r,i)*(1+tmarg(rp,r,i))*wtf(rp,r,i)))
*       -     sum(i,sum(rp,wpe(r,rp,i)*wtf(r,rp,i)))
*       -     ptmarg(r)*xtmarg(r) - savf(r)) ;
   obj =e= year ;

objeq.m = 1 ;

* --------------------------------------------------------------------
*
*  Definition of models
*
* --------------------------------------------------------------------

rrat.up(r,i) = 1 ;

model comp /

* Equilibrium prices
pteq, npteq, ptlandeq1, ptlandeq2, pfeq,
trenteq1, trenteq2, trenteq3, renteq1, renteq2, renteq3, nrenteq,
rrateq.rrat,
*rrateq,
* Trade prices
tm_peq, wpeeq1, wpeeq2, peteq1, peteq2,
pm2eq1, pm2eq2, pm1eq1, pm1eq2, pmteq1, pmteq2, ptmargeq.ptmarg, pwmargeq, peq,
paeq1, paeq2, paeq4, papeq, paceq1, paceq2, pceq, cpieq,
pafeq, pdeq1, pdeq2, pdeq3, pdeq4, pfdeq1, pfdeq2,
pmAIDSeq1, pmAIDSeq2, pdmeq, pAIDSeq,
* Crop production price equations
pndcreq1, pndcreq2, pfertcreq1, pfertcreq2, pepcreq1, pepcreq2, pktcreq, phktcreq,
phktecreq, phktefcreq, awagecreq, pvacreq,
* Livestock production price equations
pndlveq1, pndlveq2, pfeedlveq1, pfeedlveq2, peplveq1, peplveq2, pktlveq, phktlveq,
phktelveq, ptfdlveq, awagelveq, pktellveq, pvalveq,
* Other production price equations
pndeq1, pndeq2, pepeq1, pepeq2, pkteq, phkteq, phkteeq, awageeq, pvaeq,
uvcveq, uvceq,
* Top level nest equations
ndeq, vaeq,
* Market price equations
aceq, pxeq, ppeq.pp, profiteq,
* Crop production equations
ldcreq, hktefcreq, labdvcreq, hktecreq, fertcreq, xepcreq, hktcreq, ktcreq,
hdcreq, tdcreq, ffcreq, kapdvcreq, xapcreq1, xapcreq2, xapcreq3, xapcreq4, xapcreq5,
* Livestock production equations
ktellveq, tfdlveq, feedlveq, tdlveq, ldlveq, hktelveq, labdvlveq, xeplveq,
hktlveq, ktlveq, hdlveq, fflveq, kapdvlveq, xaplveq1, xaplveq2, xaplveq3, xaplveq4, xaplveq5,
* Production equations
ldeq, hkteeq, labdveq, xepeq, hkteq, kteq, hdeq, tdeq, ffeq, kapdveq,
xapeq1, xapeq2, xapeq3, xdpeq, xmpeq,
* Emission equations
* emitoteq, emitaxeq,
* Income identities
LandYeq, FFactYeq, LabYeq, KapYeq, deprYeq, yheq, ydeq, yceq1, apseq, savheq2, yceq2,
GReveq1, GReveq2, savgeq, rsgeq, fdvolgoveq, savfeq, wrreq, fdvolinveq, invsheq, inveq, psavweq,
* Consumer demand equations
supyeq, xceq, xaceq, mueq, uadeq,
xdceq, xmceq, savheq1,
* Final demand equations
xafeq, xdfeq, xmfeq,
* Domestic and export supply equations
xdeq1, xdeq2, eseq1, eseq2, xpeq1, xpeq2,
* Import equations
xmteq1, xmteq2, xmteq3, xmteq4,
xm1eq1, xm1eq2, xm2eq1, xm2eq2, wtfeq1, wtfeq2,
shareeq, wtfeq3, xdmeq, pdeq5, wtfeq4,
wtf_ineq.tar_p, tar_peq.wtf_out, wtf_outeq,
* Trade service equations
xwmargeq, xtmargeq, xmargeq,
* Numeraire, price indices, and gdp
rgdpmpeq1, rgdpmpeq2, gdpmpeq1, gdpmpeq2, rgdpeq, pgdpeq, pabseq1, pabseq2,
* Equilibrium conditions for goods
xaeq,
* Labor equilibrium conditions
avgweq, migreq, lsrureq, lsurbeq, lstoteq,
twagetoteq1.uetot, twagetoteq2, twagetoteq3, twageeq1.ue, twageeq2, wmintoteq, wmineq1, wmineq2,
ueeq, ueToteq, nwageeq, wageeq.wage, wdisteq,
* Equilibrium conditions for land
tlandeq1, tlandeq2, tlandeq3, tseq1, tseq2,
* Equilibrium conditions for sector specific factor
fseq1, fseq2,
* Equilibrium conditions for capital using CET
kapseq1, kapseq2,
* Output allocation by vintage
kxrateq.kxrat, xpveq1.xp, xpveq2,
* Dynamic equations
* Determination of aggregate capital stock
ginveq, kstockeq1, kstockeq2, tkapseq,
ggdpeq, lambdakeq, kaplabeq, lambdaleq1.lambdal, lambdaleq2, chipeq1, chipeq2, phipeq,
agprodeq, lamlageq, lamkageq, lamtageq, lamfageq
* Objective function
*,objeq
/ ;

comp.holdfixed = 1 ;
option bratio  = 0 ;
