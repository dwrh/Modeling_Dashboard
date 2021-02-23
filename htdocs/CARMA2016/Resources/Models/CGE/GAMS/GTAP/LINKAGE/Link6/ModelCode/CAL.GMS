* --------------------------------------------------------------------
*
*  LINKAGE -- LINKAGE Applied General Equilibrium Model
*
*  Calibration Module
*  ------------------
*
*  Based on GTAP Version 5.0
*
* --------------------------------------------------------------------

* --------------------------------------------------------------------
*
* Define some of the basic sets
*
* --------------------------------------------------------------------

sets
   ag(i)          Agricultural sectors
   ip(i)          Non agricultural sectors
   ink(i)         Sectors with exogenous productivity growth
   nf(i)          Non energy sectors
   nnft(i)        Non energy and non fertilizer sectors in crop production
   nnfd(i)        Non energy and non feed sectors in livestock production
   rres(r)        Non residual regions
   ;

ag(i)   = cr(i) + lv(i) ;
ip(i)   = not (cr(i) + lv(i)) ;
ink(i)  = not ik(i) ;
nf(i)   = not e(i) ;
rres(r) = not rsav(r) ;
nnft(i) = not (e(i) + ft(i)) ;
nnfd(i) = not (e(i) + fd(i)) ;

Alias(ip,jp) ;
Alias(k,kk) ;
alias(rap,ra) ;
*Alias(ii,iii) ;
*Alias(rr,rrr) ;

options decimals = 4 ;

parameters
   work           Temporary working scalar
   total          Temporary working scalar
   swork(i)       Temporary working vector for sectors
   rwork(r)       Temporary working vector for regions
   maximum        Maximum value of a vector
   index          Index of the maximum value
   Volume(r,i)    Aggregate volume in recalibration module
   Price(r,i)     Aggregate price in recalibration module
   Vol1(r,i)      Left side volume of CES bundle in recalibration module
   Pr1(r,i)       Left side price of CES bundle recalibration module
   Vol2(r,i)      Right side volume of CES bundle in recalibration module
   Pr2(r,i)       Right side price of CES bundle recalibration module
   cprice(r,k,h)  Consumer price for recalibration module
   cvolume(r,k,h) Consumer volume for recalibration module
   hwork(r,h)     Temporary working variable for regions and households
   ;

variable
   thetav(r,k,h)  Holding variable for the calibration of the theta parameters
   ;

alias(h,hh) ;

* --------------------------------------------------------------------
*
* Calibrate world trade module:
* ----------------------------
*
*  Step 1: Set up basic prices and define volume of world trade
*
*  Step 2: Calculate domestic to world price wedge
*
*  Step 3: Calculate trade and transport margins
*
*  Step 4: Incorporate tariffs
*
* --------------------------------------------------------------------

xdp0(r,i,j)      = bscale*xdp0(r,i,j) ;
xmp0(r,i,j)      = bscale*xmp0(r,i,j) ;
pdtax0(r,i,j)    = bscale*pdtax0(r,i,j) ;
pmtax0(r,i,j)    = bscale*pmtax0(r,i,j) ;
TaxXP0(r,i)      = bscale*TaxXP0(r,i) ;

wage0(r,ll,i)    = bscale*vaY0(r,ll,i) ;
kapd0(r,i)       = bscale*vaY0(r,"captl",i) ;
land0(r,i)       = bscale*vaY0(r,"landr",i) ;
fctd0(r,i)       = bscale*vaY0(r,"natrs",i) ;
TaxFact0(r,fp,i) = bscale*TaxFact0(r,fp,i) ;
IncDist0(r,h,fp) = bscale*IncDist0(r,h,fp) ;

xdc0(r,i,h)      = bscale*xdc0(r,i,h) ;
xmc0(r,i,h)      = bscale*xmc0(r,i,h) ;
cdtax0(r,i,h)    = bscale*cdtax0(r,i,h) ;
cmtax0(r,i,h)    = bscale*cmtax0(r,i,h) ;
xdg0(r,i)        = bscale*xdg0(r,i) ;
xmg0(r,i)        = bscale*xmg0(r,i) ;
gdtax0(r,i)      = bscale*gdtax0(r,i) ;
gmtax0(r,i)      = bscale*gmtax0(r,i) ;
xdi0(r,i)        = bscale*xdi0(r,i) ;
xmi0(r,i)        = bscale*xmi0(r,i) ;
idtax0(r,i)      = bscale*idtax0(r,i) ;
imtax0(r,i)      = bscale*imtax0(r,i) ;

wtf0(r,rp,i)     = bscale*wtf0(r,rp,i) ;
etax0(r,rp,i)    = wtf0(r,rp,i) - bscale*etax0(r,rp,i) ;
tmarg0(r,rp,i)   = bscale*tmarg0(r,rp,i) - wtf0(r,rp,i) ;
tar0(r,rp,i)     = bscale*tar0(r,rp,i) - tmarg0(r,rp,i) - wtf0(r,rp,i) ;

xmarg0(r,i)      = bscale*xmarg0(r,i) ;

acons0(r,i,k,h)  = bscale*acons0(r,i,k,h) ;

if(ifDepr eq 0,
*  Add net savings and depreciation
*  N.B. Assumes single household version of model!!!!

   savh0(r,h)       = bscale*(savh0(r,h) + deprec0(r)) ;
   deprec0(r)       = 0 ;
else
   savh0(r,h)       = bscale*savh0(r,h) ;
   deprec0(r)       = bscale*deprec0(r) ;
) ;

savg0(r)         = bscale*savg0(r) ;
kstock0(r)       = bscale*kstock0(r) ;

hpop0(r,h)        = pscale*hpop0(r,h) ;
pop0(r,tranche)   = pscale*pop0(r,tranche) ;
popLag(r,tranche) = pscale*popLag(r,tranche) ;

*
* Step 2:  Basic trade prices.
*

* Calibrate the trade margins, this is independent of the price initialization
* The incoming world trade flow matrix is evaluated at world export prices initially
*

*
*  Calibrate the TRQs first
*

trqFlag(rp,r,i)$(wtf0(rp,r,i) eq 0) = 0 ;

loop(r,loop(rp,loop(i,
   if(trqFlag(rp,r,i) ne 0,
      if (inquota0(rp,r,i) lt 1,

*        Nothing to do, we are within quota

         tar_p0(rp,r,i) = 0 ;
         wtf_out0(rp,r,i) = 0 ;
         tm_p0(r,rp,i) = 0 ;

      elseif (inquota0(rp,r,i) eq 1),

*        We are at quota, assume that the premium is known

         wtf_out0(rp,r,i) = 0 ;

*        If the premium is initialized, calibrate the own-share of the income rents

         if (tar_p0(rp,r,i) ne 0,
            chitrq(rp,r,i) = ((1+tar_p0(rp,r,i))*tar0(rp,r,i) - tar_in0(rp,r,i)*(wtf0(rp,r,i)+tmarg0(rp,r,i)))
                           / (tar_p0(rp,r,i)*(wtf0(rp,r,i)+tmarg0(rp,r,i)+tar0(rp,r,i))) ;

*           Calculate the share of the premium sent abroad
            work = (1-chitrq(rp,r,i))*tar_p0(rp,r,i)
                 * (wtf0(rp,r,i)+tmarg0(rp,r,i)+tar0(rp,r,i))
                 / (1+tar_in0(rp,r,i)+tar_p0(rp,r,i)) ;

         else

*           The share is known, calibrate the premium

            tar_p0(rp,r,i) = (tar0(rp,r,i) - tar_in0(rp,r,i)*(wtf0(rp,r,i)+tmarg0(rp,r,i)))
                           / (chitrq(rp,r,i)*(wtf0(rp,r,i)+tmarg0(rp,r,i)) - (1-chitrq(rp,r,i))*tar0(rp,r,i)) ;

            work = (1-chitrq(rp,r,i))*tar_p0(rp,r,i)
                 * (chitrq(rp,r,i)*(wtf0(rp,r,i)+tmarg0(rp,r,i)) - (1-chitrq(rp,r,i))*tar0(rp,r,i))
                 / (chitrq(rp,r,i) - (1-chitrq(rp,r,i))*tar_in0(rp,r,i)) ;
         ) ;

*        Subtract work from the original trade flow figures

         wtf0(rp,r,i)   = wtf0(rp,r,i) - work ;

*        tm_p0 Holds the revenues at this point

         tm_p0(rp,r,i)  = work ;

      elseif (inquota0(rp,r,i) gt 1),

*        We are over-quota
*        !!!! Not yet calibrated

         tar_p0(rp,r,i) = tar_out0(rp,r,i) - tar_in0(rp,r,i) ;
      ) ;

   else

      wtf_q0(rp,r,i)   = 0 ;
      wtf_out0(rp,r,i) = 0 ;
      tar_p0(rp,r,i)   = 0 ;
      tar_out0(rp,r,i) = 0 ;
      chitrq(rp,r,i)   = 0 ;
      tm_p0(rp,r,i)    = 0 ;

   ) ;
))) ;

loop(r, loop(rp, loop(i$wtf0(r,rp,i),
   if(etax0(r,rp,i) eq wtf0(r,rp,i),
      etax0(r,rp,i) = 0 ;
      wtf0(r,rp,i)  = 0 ;
   ) ;
) ) ) ;

loop(r, loop(rp, loop(i$(wtf0(r,rp,i) eq 0),
   if(etax0(r,rp,i) ne 0,
      etax0(r,rp,i) = 0 ;
   ) ;
) ) ) ;

loop(r, loop(rp, loop(i$wtf0(r,rp,i),
   etax0(r,rp,i)$(wtf0(r,rp,i) ne etax0(r,rp,i)) = etax0(r,rp,i)/(wtf0(r,rp,i)-etax0(r,rp,i)) ;
   tmarg0(r,rp,i) = tmarg0(r,rp,i)/wtf0(r,rp,i) ;
   if (trqFlag(r,rp,i) eq 0,
      tar0(r,rp,i)   = tar0(r,rp,i)/((1+tmarg0(r,rp,i))*wtf0(r,rp,i)) ;
   else
      if (inquota0(r,rp,i) lt 1,
         tar0(r,rp,i) = tar0(r,rp,i)/((1+tmarg0(r,rp,i))*wtf0(r,rp,i)) ;
      elseif (inquota0(r,rp,i) ge 1),
         tar0(r,rp,i) = tar_in0(r,rp,i) ;
      ) ;
   ) ;
) ) ) ;

loop(r, loop(i,
   sigmaw(r,r2,i)$(sigmaw(r,r2,i) ge 98) = inf ;
   sigmaz(r,i)$(sigmaz(r,i) ge 98) = inf ;
   loop(r2,
      Abort$(sigmaw(r,r2,i) = inf and sigmaz(r,i) = inf) "Invalid trade elasticities" ;
   ) ;

*  The default
*  Set world export prices to 1

   wpe0(r,rp,i) = 1 ;
   pe0(r,rp,i)  = wpe0(r,rp,i)/(1+etax0(r,rp,i)) ;
   wpm0(r,rp,i) = wpe0(r,rp,i)*(1+tmarg0(r,rp,i))/lambdaw(r,rp,i) ;
   pm0(r,rp,i)  = wpm0(r,rp,i)*(1+tar0(r,rp,i)+tar_p0(r,rp,i)) ;

   wtf0(r,rp,i) = wtf0(r,rp,i)/wpe0(r,rp,i) ;

   tm_p0(r,rp,i)$(tm_p0(r,rp,i) ne 0) = tm_p0(r,rp,i)/wtf0(r,rp,i) ;

   if (AIDSFlag(r,i) eq 0,

      loop(r2,
         if (sigmaw(r,r2,i) = inf,

            loop(rp$mapr2(r2,r),

*              The law of one price holds across import partners or if AIDS
*              Set domestic import prices to 1

               pm0(r,rp,i)  = 1 ;
               wpm0(r,rp,i) = pm0(r,rp,i)/(1+tar0(r,rp,i)+tar_p0(r,rp,i)) ;
               wpe0(r,rp,i) = lambdaw(r,rp,i)*wpm0(r,rp,i)/(1+tmarg0(r,rp,i)) ;
               pe0(r,rp,i)  = wpe0(r,rp,i)/(1+etax0(r,rp,i)) ;

               wtf0(r,rp,i)$(wtf0(r,rp,i) ge 0) = wtf0(r,rp,i)/wpe0(r,rp,i) ;
               tm_p0(r,rp,i)$(tm_p0(r,rp,i) ne 0) = tm_p0(r,rp,i)/wtf0(r,rp,i) ;
            ) ;
         ) ;
      ) ;
   ) ;

   if (AIDSFlag(r,i) eq 1,

*     The law of one price holds across import partners or if AIDS
*     Set domestic import prices to 1

      pm0(r,rp,i)  = 1 ;
      wpm0(r,rp,i) = pm0(r,rp,i)/(1+tar0(r,rp,i)+tar_p0(r,rp,i)) ;
      wpe0(r,rp,i) = lambdaw(r,rp,i)*wpm0(r,rp,i)/(1+tmarg0(r,rp,i)) ;
      pe0(r,rp,i)  = wpe0(r,rp,i)/(1+etax0(r,rp,i)) ;

      wtf0(r,rp,i)$(wtf0(r,rp,i) ge 0) = wtf0(r,rp,i)/wpe0(r,rp,i) ;
      tm_p0(r,rp,i)$(tm_p0(r,rp,i) ne 0) = tm_p0(r,rp,i)/wtf0(r,rp,i) ;
   ) ;

   if (sigmaz(r,i) = inf,

*     The law of one price holds across export markets
*     Set domestic export prices to 1

      wtf0(r,rp,i)$(wtf0(r,rp,i) ne 0) = tm_p0(r,rp,i)+wtf0(r,rp,i)/(1+etax0(r,rp,i)) ;
      tm_p0(r,rp,i)$(tm_p0(r,rp,i) ne 0) = tm_p0(r,rp,i)/wtf0(r,rp,i) ;

      pe0(r,rp,i)  = 1 - tm_p0(r,rp,i) ;
      wpe0(r,rp,i) = pe0(r,rp,i)*(1+etax0(r,rp,i)) ;
      wpm0(r,rp,i) = wpe0(r,rp,i)*(1+tmarg0(r,rp,i))/lambdaw(r,rp,i) ;
      pm0(r,rp,i)  = wpm0(r,rp,i)*(1+tar0(r,rp,i)+tar_p0(r,rp,i)) ;

*     wtf0(r,rp,i) = wtf0(r,rp,i)/wpe0(r,rp,i) ;


   ) ;
) ) ;

* Re-scale variables

work = 1 ;
pe0(r,rp,i)  = work*pe0(r,rp,i) ;
wpe0(r,rp,i) = work*wpe0(r,rp,i) ;
wpm0(r,rp,i) = work*wpm0(r,rp,i) ;
pm0(r,rp,i)  = work*pm0(r,rp,i) ;
wtf0(r,rp,i) = wtf0(r,rp,i)/work ;

* Set the quota etc

wtf_q0(r,rp,i)$(trqFlag(r,rp,i)) = wtf0(r,rp,i)/inquota0(r,rp,i) ;
wtf_in0(r,rp,i) = wtf0(r,rp,i) - wtf_out0(r,rp,i) ;

* display chitrq, tar_in0, wtf_q0, tar_out0, tar_p0, tm_p0 ;

$ontext
file debug   / 'debug.txt' /
put debug ;
put "Variable,Exporter,Importer,Sector,Value" / ;
debug.pc = 5 ;
debug.pw = 255 ;
debug.nj =   1 ;
debug.nw =  15 ;
debug.nd =   9 ;
debug.nz =   0 ;
debug.nr =   0 ;
loop(r,loop(rp,loop(i,
   if(wtf0(r,rp,i) ne 0,
      put "pe",  r.tl, rp.tl, i.tl, pe0(r,rp,i)   / ;
      put "wpe", r.tl, rp.tl, i.tl, wpe0(r,rp,i)  / ;
      put "wpm", r.tl, rp.tl, i.tl, wpm0(r,rp,i)  / ;
      put "pm",  r.tl, rp.tl, i.tl, pm0(r,rp,i)  / ;
      put "wtf", r.tl, rp.tl, i.tl, wtf0(r,rp,i)  / ;
   ) ;
))) ;
$offtext

*display pe0, wtf0, wpe0, etax0, wpm0, tmarg0, pm0, tar0 ;

* --------------------------------------------------------------------
*
* Calibrate the second level Armington structure, ie
*     substitution of imports across regions.
*
* --------------------------------------------------------------------

sigmaw(r,r2,i)$(sigmaw(r,r2,i) eq 1) = 1.01 ;
amw(rp,r,i) = 0 ;

lambdaw0(r,rp,i) = lambdaw(r,rp,i) ;


* Dec-23-2003: Addition of multiple nests, temporary removal of
*              "endogenous" share parameters

pm20(r,r2,i) = 1 ;
xm20(r,r2,i) = (sum(rp$mapr2(r2,rp), pm0(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i)))/pm20(r,r2,i) ;

pm10(r,r1,i) = 1 ;
xm10(r,r1,i) = (sum(r2$mapr1(r1,r2), pm20(r,r2,i)*xm20(r,r2,i)))/pm10(r,r1,i) ;

pmt0(r,i) = 1 ;
xmt0(r,i) = (sum(r1,pm10(r,r1,i)*xm10(r,r1,i)))/pmt0(r,i) ;

option decimals = 6 ;
*display xmt0, pmt0, xm10, pm10, xm20, pm20, wtf0, pm0 ;

* ---- Calibrate the share parameters

loop(r, loop(i,

*  The top tier

   if (xmt0(r,i) ne 0,
      if (sigmaw1(r,i) ne inf,
         beta1(r,r1,i) = (xm10(r,r1,i)/xmt0(r,i))*(pm10(r,r1,i)/pmt0(r,i))**sigmaw1(r,i) ;
      else
         beta1(r,r1,i) = (xm10(r,r1,i)/xmt0(r,i))*(pm10(r,r1,i)/pmt0(r,i)) ;
      ) ;
   ) ;

*  The second tier

   loop(r1$(xm10(r,r1,i) ne 0),
      if (sigmaw2(r,r1,i) ne inf,
         loop(r2$mapr1(r1,r2),
            beta2(r,r2,i) = (xm20(r,r2,i)/xm10(r,r1,i))*(pm20(r,r2,i)/pm10(r,r1,i))**sigmaw2(r,r1,i) ;
         ) ;
      else
         loop(r2$mapr1(r1,r2),
            beta2(r,r2,i) = (xm20(r,r2,i)/xm10(r,r1,i))*(pm20(r,r2,i)/pm10(r,r1,i)) ;
         ) ;
      ) ;
   ) ;

*  The lower tier

   loop(r2$(xm20(r,r2,i) ne 0),
      if (sigmaw(r,r2,i) ne inf,
         loop(rp$mapr2(r2,rp),
            amw(rp,r,i) = (lambdaw(rp,r,i)*wtf0(rp,r,i)/xm20(r,r2,i))
                        * (pm0(rp,r,i)/pm20(r,r2,i))**sigmaw(r,r2,i) ;
         ) ;
      else
         loop(rp$mapr2(r2,rp),
            amw(rp,r,i) = (lambdaw(rp,r,i)*wtf0(rp,r,i)/xm20(r,r2,i))
                        * (pm0(rp,r,i)/pm20(r,r2,i))**sigmaw(r,r2,i) ;
         ) ;
      ) ;
   ) ;
)) ;

* display beta1, beta2, amw ;

option decimals = 3 ;

* Abort$(1) "Temporary" ;

$ontext
* Calibrate the beta parameters

mrktshr2(rp,r,i) = 0 ;
mrktshr2(rp,r,i)$(xmt0(r,i) ne 0) = pm0(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i)/xmt0(r,i) ;

* display mrktshr2, pm0, sigmaw, thetArm2 ;

betaArm2(rp,r,i) = 0 ;
betaArm2(rp,r,i)$(sigmaw(r,i) ne inf and mrktshr2(rp,r,i) ne 0)
            = mrktshr2(rp,r,i)*pm0(rp,r,i)**((sigmaw(r,i)-1)/thetArm2(r,i))
            / (sum(rpp,mrktshr2(rpp,r,i)*pm0(rpp,r,i)**((sigmaw(r,i)-1)/thetArm2(r,i)))) ;

* display betaArm2 ;

amw(rp,r,i)  = 0 ;

if (ArmEndog eq 1,

   amw(rp,r,i) = 0 ;
   amw(rp,r,i)$(sigmaw(r,i) ne inf and mrktshr2(rp,r,i) ne 0)
              = ((mrktshr2(rp,r,i)**(1-thetArm2(r,i)))*(betaArm2(rp,r,i)**thetArm2(r,i)))
              / (sum(rpp,(mrktshr2(rpp,r,i)**(1-thetArm2(r,i)))*(betaArm2(rpp,r,i)**thetArm2(r,i)))) ;

* Calculate pmt0 and xmt0

   pmt0(r,i) = 1 ;
   pmt0(r,i)$(sigmaw(r,i) ne inf) = sum(rp$(amw(rp,r,i) ne 0),amw(rp,r,i)*pm0(rp,r,i)**(1-sigmaw(r,i))) ;

   pmt0(r,i)$(sigmaw(r,i) ne inf and pmt0(r,i) ne 0) = pmt0(r,i)**(1/(1-sigmaw(r,i))) ;
   pmt0(r,i)$(sigmaw(r,i) ne inf and pmt0(r,i) eq 0) = 1 ;

   xmt0(r,i) = xmt0(r,i)/pmt0(r,i) ;

else

   pmt0(r,i) = 1 ;
   xmt0(r,i) = xmt0(r,i)/pmt0(r,i) ;
   amw(rp,r,i)$(sigmaw(r,i) ne inf and xmt0(r,i) ne 0)
              = (lambdaw(rp,r,i)*wtf0(rp,r,i)/xmt0(r,i))*((pm0(rp,r,i)/pmt0(r,i))**sigmaw(r,i)) ;

) ;

amw(rp,r,i)$(sigmaw(r,i) eq inf and xmt0(r,i) ne 0)
           =  mrktshr2(rp,r,i) ;

* display pm0, wtf0, mrktshr2, betaArm2, sigmaw, amw ;

$offtext

* Set the exchange rate to 1

er0(r,rp) = 1 ;

* --------------------------------------------------------------------
*
* Calibrate the second level CET structure for exports, ie
*     across regions
*
* --------------------------------------------------------------------

pet0(r,i) = 1 ;
es0(r,i)  = sum(rp, (tm_p0(r,rp,i)+pe0(r,rp,i))*wtf0(r,rp,i)) ;
es0(r,i)  = es0(r,i)/pet0(r,i) ;
est0(r,i,t0) = es0(r,i) ;

sigmaz(r,i)$(sigmaz(r,i) eq 1) = 1.01 ;
aew(r,rp,i) = 0 ;

loop(r,loop(i, if(sigmaz(r,i) ne inf,

   aew(r,rp,i)$(wtf0(r,rp,i) ne 0) = (wtf0(r,rp,i)/es0(r,i))*(pet0(r,i)/(pe0(r,rp,i)+tm_p0(r,rp,i)))**sigmaz(r,i) ;

*  Check the calculation

*  pet0(r,i) = sum(rp,aew(r,rp,i)*pe0(r,rp,i)**(1+sigmaz(r,i)))**(1/(1+sigmaz(r,i))) ;

else

*  The share coefficients are irrelevant but used in the code
   aew(r,rp,i)$(wtf0(r,rp,i) ne 0) = ((pe0(r,rp,i)+tm_p0(r,rp,i))*wtf0(r,rp,i))/(pet0(r,i)*es0(r,i)) ;

))) ;

* display pet0, es0, aew ;

* Calculate the volume shares

shr0(rp,r,i)$(xmt0(r,i) ne 0 and es0(rp,i) ne 0) = wtf0(rp,r,i)/(es0(rp,i)*xmt0(r,i)) ;

* --------------------------------------------------------------------
*
* Calibrate production structure:
* ------------------------------
*
*  Step 1: Set up basic prices and define input volumes
*
*  Step 2: Define aggregate intermediate demand
*
*  Step 3: Calculate gross output and unit cost
*
*  Step 4: Calibrate nesting structure
*
* --------------------------------------------------------------------

alias(v,vv) ;

nrent0(r,i,v) = 1 ;

* ---- Market structure variables first

* ---- Initialize producer price

pp0(r,i) = 1 ;

* ---- Calculate output at producer price, tax inclusive

loop(r, loop(j,
   work = sum(rp,(1-chitrq(r,rp,j))*wpm0(r,rp,j)*tar_p0(r,rp,j)*wtf_q0(r,rp,j)) ;
*  display work ;
   xp0(r,j) = (sum(i,xdp0(r,i,j)+pdtax0(r,i,j)+xmp0(r,i,j)+pmtax0(r,i,j))
            +  sum(ll,wage0(r,ll,j)) + kapd0(r,j) + land0(r,j) + fctd0(r,j) + TaxXP0(r,j)
            -  0*work)
            /  pp0(r,j) ;
)) ;

* display xp0 ;

* ---- Calculate output tax

ptax0(r,j)$((pp0(r,j)*xp0(r,j) - taxXP0(r,j)) ne 0) =
   taxXP0(r,j)/(pp0(r,j)*xp0(r,j) - taxXP0(r,j)) ;

* ----- Calculate producer price exclusive of tax

px0(r,j) = pp0(r,j)/(1+ptax0(r,j)) ;

* ----- Calculate remaining formulas for market structure

cdr0(r,i)$(marketFlag(r,i) eq 0) = 0 ;

loop(r,loop(i,

   if (xp0(r,i) ne 0,

      if(profit0(r,i) ne NA,

*        ---- Markup is unknown

*        Calculate average cost

         ac0(r,i) = px0(r,i) - profit0(r,i)/xp0(r,i) ;

*        ---- Calculate marginal cost

         uvc0(r,i) = ac0(r,i)*(1-cdr0(r,i)) ;

*        ---- Calculate markup

         markup0(r,i) = px0(r,i)/uvc0(r,i) - 1 ;

      elseif (markup0(r,i) ne NA),

*        ---- Profits are unknown

*        Calculate marginal cost

         uvc0(r,i) = px0(r,i)/(1+markup0(r,i)) ;

         ac0(r,i)  = uvc0(r,i)/(1-cdr0(r,i)) ;

         profit0(r,i) = xp0(r,i)*(px0(r,i) - ac0(r,i)) ;

      else

*        ---- Assume CRTS and perfect competition

         cdr0(r,i)    = 0 ;
         markup0(r,i) = 0 ;
         profit0(r,i) = 0 ;
         work = sum(rp,(1-chitrq(r,rp,i))*wpm0(r,rp,i)*tar_p0(r,rp,i)*wtf_q0(r,rp,i)) ;
*        display work ;
         ac0(r,i)     = px0(r,i) ;
         uvc0(r,i)    = ac0(r,i) + 0*work/xp0(r,i) ;
      ) ;

   else
      markup0(r,i) = 0 ;
      profit0(r,i) = 0 ;
      cdr0(r,i)    = 0 ;
      ac0(r,i)     = 0 ;
      uvc0(r,i)    = 0 ;
   ) ;
)) ;

* display cdr0, markup0, profit0, px0, ac0, uvc0 ;

* ----- Extract profits from capital remuneration

work = 0 ;

loop(r,loop(j$(profit0(r,j) ge 0),

*  Check to see if markup revenue is greater than operating surplus

   if (profit0(r,j) gt kapd0(r,j), work = work + 1 ; ) ;

*  Subtract markup income from operating surplus

   kapd0(r,j) = kapd0(r,j) - profit0(r,j) ;

)) ;

if (work gt 0,
   display profit0, kapd0 ;
   display "At least one sector in one region has negative capital remuneration" ;
   display "due to a high markup level. Check the markup rates and restart." ;
) ;

Abort$(work gt 0) "Invalid markup levels" ;

* Kapd0 contains factor remuneration tax inclusive

KapTax0(r,i,v)$(kapd0(r,i) ne 0)
              = TaxFact0(r,"captl",i)/(kapd0(r,i)-TaxFact0(r,"captl",i)) ;
rent0(r,i,v)  = nrent0(r,i,v)*(1+KapTax0(r,i,v)) ;

* display KapTax0, rent0, nrent0 ;

npt0(r,i)    = 1 ;
LndTax0(r,i) = 0 ;
LndTax0(r,i)$(land0(r,i) ne 0) = TaxFact0(r,"landr",i)/(land0(r,i)-TaxFact0(r,"landr",i)) ;
pt0(r,i)    = npt0(r,i)*(1+LndTax0(r,i)) ;

* display LndTax0, pt0, npt0 ;

pf0(r,i)     = 1 ;

* 25-APR-2000
* The set l is a subset of ll which includes human capital. The variable tlabd
* is the demand for labor which is not considered a complement with capital, but
* labd is defined over all of labor.

* 10-Mar-2003
* Modification for segmented labor market
* DvdM
* The vector wage0 contains labor remuneration, tax inclusive
*
* Assume there are no taxes and labor volumes are equal to the wage rate (tax inclusive)
* The input variable labd0 can be used to input actual labor volumes

* display wage0 ;

wagetax0(r,ll,i) = 0 ;
loop(r,loop(ll,loop(i,
   if (labd0(r,ll,i) eq 0,
      labdv0(r,ll,i) = wage0(r,ll,i) ;
   else
      labdv0(r,ll,i) = labd0(r,ll,i) ;
   ) ;
))) ;

loop(r,loop(ll,loop(i,
   if (labdv0(r,ll,i) ne 0,
      wage0(r,ll,i)  = wage0(r,ll,i)/labdv0(r,ll,i) ;
      nwage0(r,ll,i) = wage0(r,ll,i)/(1+wagetax0(r,ll,i)) ;
   else
      wage0(r,ll,i)  = 1 ;
      nwage0(r,ll,i) = 1 ;
   ) ;
))) ;

* display labdv0, wage0, nwage0 ;

tlabd0(r,i) = sum(l,labdv0(r,l,i)) ;

td0(r,i)        = land0(r,i)/pt0(r,i) ;
ff0(r,i)        = fctd0(r,i)/pf0(r,i) ;
kapdv0(r,i,v)   = 0 ;
kapdv0(r,i,Old) = kapd0(r,i)/rent0(r,i,Old) ;

kaps0(r,i)      = kapd0(r,i) ;

* ----- Extract fixed costs from total costs, assume value added shares obtain

nfirm0(r,j) = 1 ;

loop(r,loop(j,

   if (cdr0(r,j) ne 0,

*     Calculate wage and rental payments

      work = sum(ll,wage0(r,ll,j)*labdv0(r,ll,j)) + rent0(r,j,"Old")*kapdv0(r,j,"Old") ;

      if (work ne 0,
         labdf0(r,ll,j)  = (labdv0(r,ll,j)/work)*xp0(r,j)*(ac0(r,j)-uvc0(r,j))/nfirm0(r,j) ;
         kapdf0(r,j)     = (kapdv0(r,j,"Old")/work)*xp0(r,j)*(ac0(r,j)-uvc0(r,j))/nfirm0(r,j) ;
         labdv0(r,ll,j)  = labdv0(r,ll,j) - labdf0(r,ll,j) ;
         kapdv0(r,j,Old) = kapdv0(r,j,Old) - kapdf0(r,j) ;
      else
         labdf0(r,ll,j) = 0 ;
         kapdf0(r,j)    = 0 ;
         cdr0(r,j)      = 0 ;
      ) ;
   else
      labdf0(r,ll,j) = 0 ;
      kapdf0(r,j)    = 0 ;
   ) ;
)) ;

work = sum(r,sum(ll,sum(j$(labdv0(r,ll,j) < 0 or labdf0(r,ll,j) < 0), 1)))
     + sum(r,sum(j$(kapdv0(r,j,"Old") < 0 or kapdf0(r,j) < 0), 1)) ;

if (work ne 0,
   display labdv0, labdf0, kapdv0, kapdf0 ;
) ;

Abort$(work ne 0) "Negative values in adjusting value added for IRTS module" ;

* display pdtax0, pmtax0 ;

* --------------------------------------------------------------------
*
* Define Armington matrices
* -------------------------
*
* --------------------------------------------------------------------

pd0(r,i)    = 1.0 ;

xdp0(r,i,j) = xdp0(r,i,j)/pd0(r,i) ;
xmp0(r,i,j) = xmp0(r,i,j)/pmt0(r,i) ;

pdtax0(r,i,j)$(xdp0(r,i,j) ne 0) = pdtax0(r,i,j)/(pd0(r,i)*xdp0(r,i,j)) ;
pmtax0(r,i,j)$(xmp0(r,i,j) ne 0) = pmtax0(r,i,j)/(pmt0(r,i)*xmp0(r,i,j)) ;

xdc0(r,i,h) = xdc0(r,i,h)/pd0(r,i) ;
xmc0(r,i,h) = xmc0(r,i,h)/pmt0(r,i) ;

cdtax0(r,i,h)$(xdc0(r,i,h) ne 0) = cdtax0(r,i,h)/(xdc0(r,i,h)*pd0(r,i)) ;
cmtax0(r,i,h)$(xmc0(r,i,h) ne 0) = cmtax0(r,i,h)/(xmc0(r,i,h)*pmt0(r,i)) ;

xdf0(r,i,"Gov") = xdg0(r,i)/pd0(r,i) ;
xmf0(r,i,"Gov") = xmg0(r,i)/pmt0(r,i) ;

fdtax0(r,i,"Gov")$(xdf0(r,i,"Gov") ne 0) = gdtax0(r,i)/(xdf0(r,i,"Gov")*pd0(r,i)) ;
fmtax0(r,i,"Gov")$(xmf0(r,i,"Gov") ne 0) = gmtax0(r,i)/(xmf0(r,i,"Gov")*pmt0(r,i)) ;

xdf0(r,i,"Inv") = xdi0(r,i)/pd0(r,i) ;
xmf0(r,i,"Inv") = xmi0(r,i)/pmt0(r,i) ;

fdtax0(r,i,"Inv")$(xdf0(r,i,"Inv") ne 0) = idtax0(r,i)/(xdf0(r,i,"Inv")*pd0(r,i)) ;
fmtax0(r,i,"Inv")$(xmf0(r,i,"Inv") ne 0) = imtax0(r,i)/(xmf0(r,i,"Inv")*pmt0(r,i)) ;

xd0(r,i)      = sum(j,xdp0(r,i,j)) + sum(h,xdc0(r,i,h)) + sum(f,xdf0(r,i,f)) ;
xd0(r,i)$(xp0(r,i) eq 0) = 0 ;

xmarg0(r,i)   = xmarg0(r,i)/pp0(r,i) ;

*xp0(r,i)      = xd0(r,i)*pd0(r,i) + pet0(r,i)*es0(r,i) + pp0(r,i)*xmarg0(r,i) ;
*xp0(r,i)      = xp0(r,i)/pp0(r,i) ;
*display xp0 ;
xpv0(r,i,v)   = 0 ;
xpv0(r,i,Old) = xp0(r,i) ;

* --------------------------------------------------------------------
*
* Calibrate the aggregate Armington function
*
* --------------------------------------------------------------------

* Mar-23-2001: Addition of "endogenous" share parameters

* Calibrate the beta parameters

sigmam(r,i)$(sigmam(r,i) eq 1)  = 1.01 ;
sigmam(r,i)$(sigmam(r,i) ge 98) = inf ;

xa0(r,i) = pd0(r,i)*xd0(r,i)+pmt0(r,i)*xmt0(r,i) ;
mrktshr1(r,i,m) = 0 ;
mrktshr1(r,i,"Dom")$(xa0(r,i) ne 0) = pd0(r,i)*xd0(r,i)/xa0(r,i) ;
mrktshr1(r,i,"Imp")$(xa0(r,i) ne 0) = 1 - mrktshr1(r,i,"Dom") ;

* display mrktshr1 ;

betaArm1(r,i,m) = 0 ;

loop(r,loop(i,
   if (sigmam(r,i) ne inf,
      betaArm1(r,i,"Dom")$(mrktshr1(r,i,"Dom") ne 0)
                         = mrktshr1(r,i,"Dom")*(pd0(r,i)**((sigmam(r,i)-1)/thetArm1(r,i)))
                         / (mrktshr1(r,i,"Dom")*(pd0(r,i)**((sigmam(r,i)-1)/thetArm1(r,i)))
                         +  mrktshr1(r,i,"Imp")*(pmt0(r,i)**((sigmam(r,i)-1)/thetArm1(r,i)))) ;
      betaArm1(r,i,"Imp")$(mrktshr1(r,i,"Imp") ne 0)
                         = 1 - betaArm1(r,i,"Dom") ;
   ) ;
) ) ;

ad(r,i)  = 0 ;
am(r,i)  = 0 ;

if (ArmEndog eq 1,

   ad(r,i)$(sigmam(r,i) ne inf and mrktshr1(r,i,"Dom") ne 0)
          = ((mrktshr1(r,i,"Dom")**(1-thetArm1(r,i)))*(betaArm1(r,i,"Dom")**thetArm1(r,i)))
          / ((mrktshr1(r,i,"Dom")**(1-thetArm1(r,i)))*(betaArm1(r,i,"Dom")**thetArm1(r,i))
          +  (mrktshr1(r,i,"Imp")**(1-thetArm1(r,i)))*(betaArm1(r,i,"Imp")**thetArm1(r,i))) ;
   am(r,i)$(sigmam(r,i) ne inf and mrktshr1(r,i,"Imp") ne 0)
          = 1 - ad(r,i) ;

* Calculate pa0 and xa0

   pa0(r,i) = 1 ;
   pa0(r,i)$(sigmam(r,i) ne inf and xa0(r,i) ne 0)
           = ad(r,i)*(pd0(r,i)**(1-sigmam(r,i)))+am(r,i)*(pmt0(r,i)**(1-sigmam(r,i))) ;
   pa0(r,i)$(sigmam(r,i) ne inf) = pa0(r,i)**(1/(1-sigmam(r,i))) ;
   xa0(r,i) = xa0(r,i)/pa0(r,i) ;

else

   loop(r,loop(i,
      pa0(r,i) = 1 ;
      xa0(r,i) = (pd0(r,i)*xd0(r,i) + pmt0(r,i)*xmt0(r,i))/pa0(r,i) ;

*     Adjust the income elasticities

      yelasArm(r,i,"Dom") = yelasArmD(r,i) ;
      yelasArm(r,i,"Imp") = yelasArmM(r,i) ;
      work = sum(m1,mrktshr1(r,i,m1)*mrktshr1(r,i,m1)) ;
      work$(work ne 0) = (1 - sum(m1,mrktshr1(r,i,m1)*yelasArm(r,i,m1)))/work ;
      loop(m,
         yelasArm(r,i,m) = yelasArm(r,i,m) + mrktshr1(r,i,m)*work ;
      ) ;

      ad(r,i)$(sigmam(r,i) ne inf and xa0(r,i) ne 0)
         = yelasArm(r,i,"Dom")*mrktshr1(r,i,"Dom")*(pa0(r,i)/pd0(r,i))**(1-sigmam(r,i)) ;
      am(r,i)$(sigmam(r,i) ne inf and xa0(r,i) ne 0)
         = yelasArm(r,i,"Imp")*mrktshr1(r,i,"Imp")*(pa0(r,i)/pmt0(r,i))**(1-sigmam(r,i)) ;

*     ----- !!!! Assume for the moment thetad is 0

      if (yelasArmD(r,i) eq 1 and yelasArmM(r,i) eq 1,
         thetad(r,i) = 0 ;
         thetam(r,i) = 0 ;
      else
         thetad(r,i) = 0 ;
         thetam(r,i) = (xmt0(r,i) - am(r,i)*xa0(r,i)*(pa0(r,i)/pmt0(r,i))**sigmam(r,i))
                     / (1 - am(r,i)*(pa0(r,i)/pmt0(r,i))**(sigmam(r,i) - 1)) ;
      ) ;
   )) ;
) ;

ad(r,i)$(sigmam(r,i) eq inf and xd0(r,i) ne 0)  = mrktshr1(r,i,"Dom") ;
am(r,i)$(sigmam(r,i) eq inf and xmt0(r,i) ne 0) = 1 - ad(r,i) ;

option decimals = 6 ;
* display mrktshr1, betaArm1, sigmam, ad, am, thetad, thetam, pa0, xa0, pd0, xd0, pmt0, xmt0,
*   yelasArm, yelasArmD, yelasArmM ;

* display xa0, xd0, xmt0, pa0, pd0, pmt0 ;

* ----- !!!! TO BE DONE
* ----- Calibrate Armington AIDS function

loop(r,loop(i,
   if (AIDSFlag(r,i) eq 2,
      a0(r,i)    = 0 ;
      betad(r,i) = 0 ;
      betam(r,i) = 0 ;
      gdd(r,i)   = 0 ;
      gdm(r,i)   = 0 ;
      gmm(r,i)   = 0 ;
      gmd(r,i)   = 0 ;
   else
      a0(r,i)    = 0 ;
      betad(r,i) = 0 ;
      betam(r,i) = 0 ;
      gdd(r,i)   = 0 ;
      gdm(r,i)   = 0 ;
      gmm(r,i)   = 0 ;
      gmd(r,i)   = 0 ;
   ) ;
)) ;

* Setup Armington intermediate demand matrix

pap0(r,i,j)$(ArmFlag eq 1) = 1 ;
xap0(r,i,j)$(ArmFlag eq 1) = pd0(r,i)*(1+pdtax0(r,i,j))*xdp0(r,i,j)
                           + pmt0(r,i)*(1+pmtax0(r,i,j))*xmp0(r,i,j) ;
xap0(r,i,j)$(ArmFlag eq 1) = xap0(r,i,j)/pap0(r,i,j) ;

xap0(r,i,j)$(ArmFlag eq 0) = (pd0(r,i)*xdp0(r,i,j)+pmt0(r,i)*xmp0(r,i,j))/pa0(r,i) ;
patax0(r,i,j) = pd0(r,i)*pdtax0(r,i,j)*xdp0(r,i,j)
              + pmt0(r,i)*pmtax0(r,i,j)*xmp0(r,i,j) ;
patax0(r,i,j)$(xap0(r,i,j) ne 0) = patax0(r,i,j)/(xap0(r,i,j)*pa0(r,i)) ;
pap0(r,i,j)$(ArmFlag eq 0) = pa0(r,i)*(1+patax0(r,i,j)) ;

* --------------------------------------------------------------------
*
*   Crop production structure
*
* --------------------------------------------------------------------

a(r,i,j)        = 0 ;
pnd0(r,cr)      = 1 ;
xep0(r,cr,v)    = 0 ;
pep0(r,cr,v)    = 1 ;
pfert0(r,cr)    = 1 ;
fert0(r,cr)     = 0 ;
aft(r,ft,cr)    = 0 ;
pkt0(r,cr,v)    = 1 ;
kt0(r,cr,v)     = 0 ;
ak(r,cr,v)      = 0 ;
at(r,cr,v)      = 0 ;
af(r,cr,v)      = 0 ;
phkt0(r,cr,v)   = 1 ;
hkt0(r,cr,v)    = 0 ;
phkte0(r,cr,v)  = 1 ;
hkte0(r,cr,v)   = 0 ;
phktef0(r,cr,v) = 1 ;
hktef0(r,cr,v)  = 0 ;
awage0(r,cr)    = 1 ;
ald(r,l,cr)     = 0 ;
pva0(r,cr,v)    = 1 ;
va0(r,cr,v)     = 0 ;
uvcv0(r,cr,v)   = uvc0(r,cr) ;

loop(r, loop(cr$(xp0(r,cr) ne 0),

* Calibrate Leontief IO coefficents

   nd0(r,cr)  = sum(nnft,pap0(r,nnft,cr)*xap0(r,nnft,cr)) ;
   nd0(r,cr)  = nd0(r,cr)/pnd0(r,cr) ;

   a(r,nnft,cr)$(nd0(r,cr) ne 0) = xap0(r,nnft,cr)/nd0(r,cr) ;
*  pnd0(r,cr) = sum(nnft,a(r,nnft,cr)*pap0(r,nnft,cr)) ;

*
*  Calibrate energy bundle
*
   xep0(r,cr,Old) = sum(e, pap0(r,e,cr)*xap0(r,e,cr)) ;
   xep0(r,cr,Old) = xep0(r,cr,Old)/pep0(r,cr,Old) ;

   sigmaep(r,cr,v)$(sigmaep(r,cr,v) eq 1) = 1.01 ;
   aep(r,e,cr,v)$(xep0(r,cr,"Old") ne 0)
       = (xap0(r,e,cr)/xep0(r,cr,"Old"))*(pap0(r,e,cr)/pep0(r,cr,"Old"))**sigmaep(r,cr,v) ;

*
*  Calibrate fertilizer bundle
*

   fert0(r,cr)  = sum(ft, pap0(r,ft,cr)*xap0(r,ft,cr)) ;
   fert0(r,cr)  = fert0(r,cr)/pfert0(r,cr) ;

   sigmaft(r,cr) = sigmaa(r,cr) ;
   sigmaft(r,cr)$(sigmaft(r,cr) eq 1) = 1.01 ;
   aft(r,ft,cr)$(fert0(r,cr) ne 0) = (xap0(r,ft,cr)/fert0(r,cr))
                                   * (pap0(r,ft,cr)/pfert0(r,cr))**sigmaft(r,cr) ;

*
*  Calibrate kt factor bundle
*

   kt0(r,cr,Old) = (pt0(r,cr)*td0(r,cr)+pf0(r,cr)*ff0(r,cr)+rent0(r,cr,Old)*kapdv0(r,cr,Old))/pkt0(r,cr,Old) ;

   sigmak(r,cr,v)$(sigmak(r,cr,v) eq 1) = 1.01 ;

   ak(r,cr,v)$(kt0(r,cr,"Old") ne 0) = (kapdv0(r,cr,"Old")/kt0(r,cr,"Old"))*(rent0(r,cr,"Old")/pkt0(r,cr,"Old"))**sigmak(r,cr,v) ;
   at(r,cr,v)$(kt0(r,cr,"Old") ne 0) = (td0(r,cr)/kt0(r,cr,"Old"))*(pt0(r,cr)/pkt0(r,cr,"Old"))**sigmak(r,cr,v) ;
   af(r,cr,v)$(kt0(r,cr,"Old") ne 0) = (ff0(r,cr)/kt0(r,cr,"Old"))*(pf0(r,cr)/pkt0(r,cr,"Old"))**sigmak(r,cr,v) ;

*
* 25-APR-2000
*
* Calibrate the hkt bundle

   hkt0(r,cr,Old) = (wage0(r,"HSk",cr)*labdv0(r,"HSk",cr)
                  + pkt0(r,cr,Old)*kt0(r,cr,Old))/phkt0(r,cr,Old) ;

   if (hkt0(r,cr,"Old") ne 0,
      sigmah(r,cr,v)$(sigmah(r,cr,v) eq 1) = 1.01 ;
      ah(r,cr,v)  = (labdv0(r,"HSk",cr)/hkt0(r,cr,"Old"))
                  * (wage0(r,"HSk",cr)/phkt0(r,cr,"Old"))**sigmah(r,cr,v) ;
      akt(r,cr,v) = (kt0(r,cr,"Old")/hkt0(r,cr,"Old"))
                  * (pkt0(r,cr,"Old")/phkt0(r,cr,"Old"))**sigmah(r,cr,v) ;
   ) ;

*
*     Calibrate hkte bundle
*

   hkte0(r,cr,Old) = (phkt0(r,cr,Old)*hkt0(r,cr,Old) + pep0(r,cr,Old)*xep0(r,cr,Old))/phkte0(r,cr,Old) ;

   if (hkte0(r,cr,"Old") ne 0,
      sigmae(r,cr,v)$(sigmae(r,cr,v) eq 1) = 1.01 ;
      ahkt(r,cr,v) = (hkt0(r,cr,"Old")/hkte0(r,cr,"Old"))*(phkt0(r,cr,"Old")/phkte0(r,cr,"Old"))**sigmae(r,cr,v) ;
      ae(r,cr,v)   = (xep0(r,cr,"Old")/hkte0(r,cr,"Old"))*(pep0(r,cr,"Old")/phkte0(r,cr,"Old"))**sigmae(r,cr,v) ;
   ) ;

*
*  Calibrate hktef bundle
*

   hktef0(r,cr,Old) = (phkte0(r,cr,Old)*hkte0(r,cr,Old)
                    +  pfert0(r,cr)*fert0(r,cr))/phktef0(r,cr,Old) ;

   if (hktef0(r,cr,"Old") ne 0,
      sigmaf(r,cr,v)$(sigmaf(r,cr,v) eq 1) = 1.01 ;
      ahkte(r,cr,v)  = (hkte0(r,cr,"Old")/hktef0(r,cr,"Old"))
                     * (phkte0(r,cr,"Old")/phktef0(r,cr,"Old"))**sigmaf(r,cr,v) ;
      afert(r,cr,v)  = (fert0(r,cr)/hktef0(r,cr,"Old"))
                     * (pfert0(r,cr)/phktef0(r,cr,"Old"))**sigmaf(r,cr,v) ;
   ) ;
*
*  Calibrate the labor bundle
*

   ld0(r,cr) = sum(l,wage0(r,l,cr)*labdv0(r,l,cr))/awage0(r,cr) ;
   sigmal(r,cr)$(sigmal(r,cr) eq 1) = 1.01 ;
   ald(r,l,cr)$(ld0(r,cr) ne 0) =  (labdv0(r,l,cr)/ld0(r,cr))
              * (wage0(r,l,cr)/awage0(r,cr))**sigmal(r,cr) ;

*
*  Calibrate the value added bundle
*

   va0(r,cr,Old) = (phktef0(r,cr,Old)*hktef0(r,cr,Old) + awage0(r,cr)*ld0(r,cr))/pva0(r,cr,Old) ;

   if(va0(r,cr,"old") ne 0,
      sigmav(r,cr,v)$(sigmav(r,cr,v) eq 1) = 1.01 ;
      al(r,cr,v)     = (ld0(r,cr)/va0(r,cr,"Old"))
                     * (awage0(r,cr)/pva0(r,cr,"Old"))**sigmav(r,cr,v) ;
      ahktef(r,cr,v) = (hktef0(r,cr,"Old")/va0(r,cr,"Old"))
                     * (phktef0(r,cr,"Old")/pva0(r,cr,"Old"))**sigmav(r,cr,v) ;
   ) ;

*
*  Calibrate the gross output bundle
*

   if (xp0(r,cr) ne 0,
      uvcv0(r,cr,Old) = pva0(r,cr,Old)*va0(r,cr,Old) + pnd0(r,cr)*nd0(r,cr) ;
      uvcv0(r,cr,Old) = uvcv0(r,cr,Old)/xpv0(r,cr,Old) ;
      uvc0(r,cr)      = sum(v,uvcv0(r,cr,v)*xpv0(r,cr,v))/xp0(r,cr) ;

      sigmap(r,cr,v)$(sigmap(r,cr,v) eq 1) = 1.01 ;
      and(r,cr,v)  = (nd0(r,cr)/xpv0(r,cr,"Old"))*(pnd0(r,cr)/uvcv0(r,cr,"Old"))**sigmap(r,cr,v) ;
      ava(r,cr,v)  = (va0(r,cr,"Old")/xpv0(r,cr,"Old"))*(pva0(r,cr,"Old")/uvcv0(r,cr,"Old"))**sigmap(r,cr,v) ;
   ) ;
) ) ;

display and, ava, nd0, va0, pnd0, pva0, uvc0, xp0 ;

* --------------------------------------------------------------------
*
*   Livestock production structure
*
* --------------------------------------------------------------------

* Calibrate Leontief IO coefficents

pnd0(r,lv) = 1 ;
nd0(r,lv)  = sum(nnfd,pap0(r,nnfd,lv)*xap0(r,nnfd,lv)) ;
nd0(r,lv)  = nd0(r,lv)/pnd0(r,lv) ;

a(r,nnfd,lv) = xap0(r,nnfd,lv)/nd0(r,lv) ;
pnd0(r,lv)   = sum(nnfd,a(r,nnfd,lv)*pap0(r,nnfd,lv)) ;

*
*  Calibrate energy bundle
*

pep0(r,lv,v)  = 1 ;
xep0(r,lv,v)  = 0 ;
xep0(r,lv,Old) = sum(e, pap0(r,e,lv)*xap0(r,e,lv)) ;
xep0(r,lv,Old) = xep0(r,lv,Old)/pep0(r,lv,Old) ;

sigmaep(r,lv,v)$(sigmaep(r,lv,v) eq 1) = 1.01 ;
aep(r,e,lv,v)$(xep0(r,lv,"Old") ne 0)
 = (xap0(r,e,lv)/xep0(r,lv,"Old"))*(pap0(r,e,lv)/pep0(r,lv,"Old"))**sigmaep(r,lv,v) ;

*
*  Calibrate feed bundle
*

pfeed0(r,lv)  = 1 ;
feed0(r,lv)   = 0 ;
feed0(r,lv)   = sum(fd, pap0(r,fd,lv)*xap0(r,fd,lv)) ;
feed0(r,lv)   = feed0(r,lv)/pfeed0(r,lv) ;

sigmafd(r,lv) = sigmaa(r,lv) ;
sigmafd(r,lv)$(sigmafd(r,lv) eq 1) = 1.01 ;
afd(r,fd,lv) = 0 ;
afd(r,fd,lv)$(feed0(r,lv) ne 0) = (xap0(r,fd,lv)/feed0(r,lv))
             * (pap0(r,fd,lv)/pfeed0(r,lv))**sigmafd(r,lv) ;

*
*  Calibrate kt factor bundle
*

pkt0(r,lv,v) = 1 ;
kt0(r,lv,v)  = 0 ;
kt0(r,lv,Old) = (pf0(r,lv)*ff0(r,lv)+rent0(r,lv,Old)*kapdv0(r,lv,Old))/pkt0(r,lv,Old) ;

* display kt0 ;
sigmak(r,lv,v)$(sigmak(r,lv,v) eq 1) = 1.01 ;
ak(r,lv,v)$(kt0(r,lv,"Old") ne 0) = (kapdv0(r,lv,"Old")/kt0(r,lv,"Old"))*(rent0(r,lv,"Old")/pkt0(r,lv,"Old"))**sigmak(r,lv,v) ;
af(r,lv,v)$(kt0(r,lv,"Old") ne 0) = (ff0(r,lv)/kt0(r,lv,"Old"))*(pf0(r,lv)/pkt0(r,lv,"Old"))**sigmak(r,lv,v) ;

*
* APR-25-2000
*
* Calibrate the hkt bundle
*

phkt0(r,lv,v)  = 1 ;
hkt0(r,lv,v)   = 0 ;
hkt0(r,lv,Old) = (wage0(r,"HSk",lv)*labdv0(r,"HSk",lv)
               + pkt0(r,lv,Old)*kt0(r,lv,Old))/phkt0(r,lv,Old) ;

sigmah(r,lv,v)$(sigmah(r,lv,v) eq 1) = 1.01 ;
ah(r,lv,v)$(hkt0(r,lv,"Old") ne 0)
            = (labdv0(r,"HSk",lv)/hkt0(r,lv,"Old"))
            * (wage0(r,"HSk",lv)/phkt0(r,lv,"Old"))**sigmah(r,lv,v) ;
akt(r,lv,v)$(hkt0(r,lv,"Old") ne 0)
            = (kt0(r,lv,"Old")/hkt0(r,lv,"Old"))
            * (pkt0(r,lv,"Old")/phkt0(r,lv,"Old"))**sigmah(r,lv,v) ;

*
*  Calibrate hkte bundle
*

phkte0(r,lv,v)  = 1 ;
hkte0(r,lv,v)   = 0 ;
hkte0(r,lv,Old) = (phkt0(r,lv,Old)*hkt0(r,lv,Old) + pep0(r,lv,Old)*xep0(r,lv,Old))/phkte0(r,lv,Old) ;

sigmae(r,lv,v)$(sigmae(r,lv,v) eq 1) = 1.01 ;
ahkt(r,lv,v)$(hkte0(r,lv,"Old") ne 0)
       = (hkt0(r,lv,"Old")/hkte0(r,lv,"Old"))*(phkt0(r,lv,"Old")/phkte0(r,lv,"Old"))**sigmae(r,lv,v) ;
ae(r,lv,v)$(hkte0(r,lv,"Old") ne 0)
       = (xep0(r,lv,"Old")/hkte0(r,lv,"Old"))*(pep0(r,lv,"Old")/phkte0(r,lv,"Old"))**sigmae(r,lv,v) ;

*
*  Calibrate tfd bundle
*

ptfd0(r,lv,v)  = 1 ;
tfd0(r,lv,v)   = 0 ;
tfd0(r,lv,Old) = (pt0(r,lv)*td0(r,lv)
               + pfeed0(r,lv)*feed0(r,lv))/ptfd0(r,lv,Old) ;

sigmaf(r,lv,v)$(sigmaf(r,lv,v) eq 1) = 1.01 ;
at(r,lv,v)$(tfd0(r,lv,"Old") ne 0) = (td0(r,lv)/tfd0(r,lv,"Old"))
                                   * (pt0(r,lv)/ptfd0(r,lv,"Old"))**sigmaf(r,lv,v) ;
afeed(r,lv,v)$(tfd0(r,lv,"Old") ne 0) = (feed0(r,lv)/tfd0(r,lv,"Old"))
                                      * (pfeed0(r,lv)/ptfd0(r,lv,"Old"))**sigmaf(r,lv,v) ;

* display tfd0 ;

*
*  Calibrate the labor bundle
*

awage0(r,lv) = 1 ;
ld0(r,lv) = sum(l,wage0(r,l,lv)*labdv0(r,l,lv))/awage0(r,lv) ;
sigmal(r,lv)$(sigmal(r,lv) eq 1) = 1.01 ;
ald(r,l,lv) =  (labdv0(r,l,lv)/ld0(r,lv))
            * (wage0(r,l,lv)/awage0(r,lv))**sigmal(r,lv) ;

*
*  Calibrate the ktel bundle
*

pktel0(r,lv,v)  = 1 ;
ktel0(r,lv,v)   = 0 ;
ktel0(r,lv,Old) = (phkte0(r,lv,Old)*hkte0(r,lv,Old) + awage0(r,lv)*ld0(r,lv))/pktel0(r,lv,Old) ;

sigmav(r,lv,v)$(sigmav(r,lv,v) eq 1) = 1.01 ;
al(r,lv,v)    = (ld0(r,lv)/ktel0(r,lv,"Old"))
              * (awage0(r,lv)/pktel0(r,lv,"Old"))**sigmav(r,lv,v) ;
ahkte(r,lv,v) = (hkte0(r,lv,"Old")/ktel0(r,lv,"Old"))
              * (phkte0(r,lv,"Old")/pktel0(r,lv,"Old"))**sigmav(r,lv,v) ;

*
*  Calibrate the value added bundle
*

pva0(r,lv,v)  = 1 ;
va0(r,lv,v)   = 0 ;
va0(r,lv,Old) = (pktel0(r,lv,Old)*ktel0(r,lv,Old)
              + ptfd0(r,lv,Old)*tfd0(r,lv,Old))/pva0(r,lv,Old) ;

atfd(r,lv,v)  = (tfd0(r,lv,"Old")/va0(r,lv,"Old")) ;
aktel(r,lv,v) = (ktel0(r,lv,"Old")/va0(r,lv,"Old")) ;

*
*  Calibrate the gross output bundle
*

uvcv0(r,lv,v)   = 1 ;
uvcv0(r,lv,Old) = pva0(r,lv,Old)*va0(r,lv,Old) + pnd0(r,lv)*nd0(r,lv) ;
uvcv0(r,lv,Old) = uvcv0(r,lv,Old)/xpv0(r,lv,Old) ;
uvc0(r,lv)      = sum(v,uvcv0(r,lv,v)*xpv0(r,lv,v))/xp0(r,lv) ;

sigmap(r,lv,v)$(sigmap(r,lv,v) eq 1) = 1.01 ;
and(r,lv,v)  = (nd0(r,lv)/xpv0(r,lv,"Old"))*(pnd0(r,lv)/uvcv0(r,lv,"Old"))**sigmap(r,lv,v) ;
ava(r,lv,v)  = (va0(r,lv,"Old")/xpv0(r,lv,"Old"))*(pva0(r,lv,"Old")/uvcv0(r,lv,"Old"))**sigmap(r,lv,v) ;

* --------------------------------------------------------------------
*
*   Manufacturing and services production structure
*
* --------------------------------------------------------------------

loop(r,loop(ip$(xp0(r,ip) ne 0),

* Calibrate Leontief IO coefficents

pnd0(r,ip) = 1 ;
nd0(r,ip)  = sum(nf,pap0(r,nf,ip)*xap0(r,nf,ip)) ;
nd0(r,ip)  = nd0(r,ip)/pnd0(r,ip) ;

a(r,nf,ip) = 0 ;
a(r,nf,ip)$(nd0(r,ip) ne 0) = xap0(r,nf,ip)/nd0(r,ip) ;
pnd0(r,ip) = sum(nf,a(r,nf,ip)*pap0(r,nf,ip)) ;

*
*  Calibrate energy bundle
*

pep0(r,ip,v)  = 1 ;
xep0(r,ip,v)  = 0 ;
xep0(r,ip,Old) = sum(e, pap0(r,e,ip)*xap0(r,e,ip)) ;
xep0(r,ip,Old) = xep0(r,ip,Old)/pep0(r,ip,Old) ;

sigmaep(r,ip,v)$(sigmaep(r,ip,v) eq 1) = 1.01 ;
aep(r,e,ip,v)$(xep0(r,ip,"Old") ne 0)
 = (xap0(r,e,ip)/xep0(r,ip,"Old"))*(pap0(r,e,ip)/pep0(r,ip,"Old"))**sigmaep(r,ip,v) ;

*
*  Calibrate kt factor bundle
*

pkt0(r,ip,v) = 1 ;
kt0(r,ip,v)  = 0 ;
kt0(r,ip,Old) = (pt0(r,ip)*td0(r,ip)+pf0(r,ip)*ff0(r,ip)+rent0(r,ip,Old)*kapdv0(r,ip,Old))/pkt0(r,ip,Old) ;

sigmak(r,ip,v)$(sigmak(r,ip,v) eq 1) = 1.01 ;
loop(v$(kt0(r,ip,"Old") ne 0),
   ak(r,ip,v) = (kapdv0(r,ip,"Old")/kt0(r,ip,"Old"))*(rent0(r,ip,"Old")/pkt0(r,ip,"Old"))**sigmak(r,ip,v) ;
   at(r,ip,v) = (td0(r,ip)/kt0(r,ip,"Old"))*(pt0(r,ip)/pkt0(r,ip,"Old"))**sigmak(r,ip,v) ;
   af(r,ip,v) = (ff0(r,ip)/kt0(r,ip,"Old"))*(pf0(r,ip)/pkt0(r,ip,"Old"))**sigmak(r,ip,v) ;
) ;

*
* APR-25-2000
*
* Calibrate the hkt bundle
*

phkt0(r,ip,v)  = 1 ;
hkt0(r,ip,v)   = 0 ;
hkt0(r,ip,Old) = (wage0(r,"HSk",ip)*labdv0(r,"HSk",ip)
               + pkt0(r,ip,Old)*kt0(r,ip,Old))/phkt0(r,ip,Old) ;

sigmah(r,ip,v)$(sigmah(r,ip,v) eq 1) = 1.01 ;

loop(v$(hkt0(r,ip,"Old") ne 0),
   ah(r,ip,v)  = (labdv0(r,"HSk",ip)/hkt0(r,ip,"Old"))
               * (wage0(r,"HSk",ip)/phkt0(r,ip,"Old"))**sigmah(r,ip,v) ;
   akt(r,ip,v) = (kt0(r,ip,"Old")/hkt0(r,ip,"Old"))
               * (pkt0(r,ip,"Old")/phkt0(r,ip,"Old"))**sigmah(r,ip,v) ;
) ;

*
*  Calibrate hkte bundle
*

phkte0(r,ip,v)   = 1 ;
hkte0(r,ip,v)    = 0 ;
hkte0(r,ip,Old)  = (phkt0(r,ip,Old)*hkt0(r,ip,Old) + pep0(r,ip,Old)*xep0(r,ip,Old))/phkte0(r,ip,Old) ;

sigmae(r,ip,v)$(sigmae(r,ip,v) eq 1) = 1.01 ;

loop(v$(hkte0(r,ip,"Old") ne 0),
   ahkt(r,ip,v) = (hkt0(r,ip,"Old")/hkte0(r,ip,"Old"))*(phkt0(r,ip,"Old")/phkte0(r,ip,"Old"))**sigmae(r,ip,v) ;
   ae(r,ip,v)   = (xep0(r,ip,"Old")/hkte0(r,ip,"Old"))*(pep0(r,ip,"Old")/phkte0(r,ip,"Old"))**sigmae(r,ip,v) ;
) ;

*
*  Calibrate the labor bundle
*

awage0(r,ip) = 1 ;
ld0(r,ip) = sum(l,wage0(r,l,ip)*labdv0(r,l,ip))/awage0(r,ip) ;
sigmal(r,ip)$(sigmal(r,ip) eq 1) = 1.01 ;
ald(r,l,ip) = 0 ;

loop(l$(ld0(r,ip) ne 0),
   ald(r,l,ip)$(ld0(r,ip) ne 0) = (labdv0(r,l,ip)/ld0(r,ip))
                                * (wage0(r,l,ip)/awage0(r,ip))**sigmal(r,ip) ;
) ;

*
*  Calibrate the value added bundle
*

pva0(r,ip,v) = 1 ;
va0(r,ip,v)  = 0 ;
va0(r,ip,Old) = (phkte0(r,ip,Old)*hkte0(r,ip,Old) + awage0(r,ip)*ld0(r,ip))/pva0(r,ip,Old) ;

sigmav(r,ip,v)$(sigmav(r,ip,v) eq 1) = 1.01 ;
if(va0(r,ip,"Old") ne 0,
   al(r,ip,v)    = (ld0(r,ip)/va0(r,ip,"Old"))*(awage0(r,ip)/pva0(r,ip,"Old"))**sigmav(r,ip,v) ;
   ahkte(r,ip,v) = (hkte0(r,ip,"Old")/va0(r,ip,"Old"))*(phkte0(r,ip,"Old")/pva0(r,ip,"Old"))**sigmav(r,ip,v) ;
) ;

*
*  Calibrate the gross output bundle
*

* display uvc0, ac0 ;
uvcv0(r,ip,v)   = 1 ;
uvcv0(r,ip,Old) = pva0(r,ip,Old)*va0(r,ip,Old) + pnd0(r,ip)*nd0(r,ip) ;
uvcv0(r,ip,Old) = uvcv0(r,ip,Old)/xpv0(r,ip,Old) ;
uvc0(r,ip)      = sum(v,uvcv0(r,ip,v)*xpv0(r,ip,v))/xp0(r,ip) ;
* display uvc0, uvcv0, ac0 ;

sigmap(r,ip,v)$(sigmap(r,ip,v) eq 1) = 1.01 ;
and(r,ip,v)  = (g(r,ip)**(1-sigmap(r,ip,v)))*(nd0(r,ip)/xpv0(r,ip,"Old"))
             * (pnd0(r,ip)/uvcv0(r,ip,"Old"))**sigmap(r,ip,v) ;
ava(r,ip,v)  = (g(r,ip)**(1-sigmap(r,ip,v)))*(va0(r,ip,"Old")/xpv0(r,ip,"Old"))
             * (pva0(r,ip,"Old")/uvcv0(r,ip,"Old"))**sigmap(r,ip,v) ;

* display and, nd0, pnd0 ;
)) ;

* Calibrate the Armington structure in production

sigmamp(r,i,j)$(sigmamp(r,i,j) eq 1) = 1.01 ;
apd(r,i,j)  = 0 ;
apm(r,i,j)  = 0 ;
apd(r,i,j)$(xap0(r,i,j) ne 0) = (xdp0(r,i,j)/xap0(r,i,j))*(pd0(r,i)*(1+pdtax0(r,i,j))/pap0(r,i,j))**sigmamp(r,i,j) ;
apm(r,i,j)$(xap0(r,i,j) ne 0) = (xmp0(r,i,j)/xap0(r,i,j))*(pmt0(r,i)*(1+pmtax0(r,i,j))/pap0(r,i,j))**sigmamp(r,i,j) ;

* --------------------------------------------------------------------
*
* Calibrate the top level CET structure for allocation of domestic
*     production between domestic supply and export supply
*
* --------------------------------------------------------------------

sigmax(r,i)$(sigmax(r,i) ge 98) = inf ;

loop(r,loop(i$(xp0(r,i) ne 0),
   if(sigmax(r,i) ne inf,
      axd(r,i) = (xd0(r,i)/(xp0(r,i)-xmarg0(r,i)))
               * (pp0(r,i)/pd0(r,i))**sigmax(r,i) ;
      axe(r,i) = 0 ;
      axe(r,i)$(es0(r,i) ne 0) = (es0(r,i)/(xp0(r,i)-xmarg0(r,i)))
                               * (pp0(r,i)/pet0(r,i))**sigmax(r,i) ;

      pp0(r,i) = (axd(r,i)*pd0(r,i)**(1+sigmax(r,i))
               +  axe(r,i)*pet0(r,i)**(1+sigmax(r,i)))**(1/(1+sigmax(r,i))) ;

   else

*     The share coefficients are irrelevant, but are used in the code

      axd(r,i)    = pd0(r,i)*xd0(r,i)/(pp0(r,i)*(xp0(r,i)-xmarg0(r,i))) ;
      axe(r,i)    = pet0(r,i)*es0(r,i)/(pp0(r,i)*(xp0(r,i)-xmarg0(r,i))) ;
   ) ;
) ) ;

* display axd, axe, pp0 ;

* display pd0, xd0, pp0, xp0, xmarg0, pet0, es0 ;

* --------------------------------------------------------------------
*
* Calibrate consumption structure:
* -------------------------------
*
*  Step 1: Set up basic prices and define input volumes
*
*  Step 2: Determine household disposable income
*
*  Step 3: Calibrate ELES system
*
*  Step 4: Set up Armington system in consumption
*
* --------------------------------------------------------------------

pac0(r,i,h)$(ArmFlag eq 1) = 1 ;
xac0(r,i,h)$(ArmFlag eq 1) = pd0(r,i)*(1+cdtax0(r,i,h))*xdc0(r,i,h)+pmt0(r,i)*(1+cmtax0(r,i,h))*xmc0(r,i,h) ;
xac0(r,i,h)$(ArmFlag eq 1) = xac0(r,i,h)/pac0(r,i,h) ;

xac0(r,i,h)$(ArmFlag eq 0) = (pd0(r,i)*xdc0(r,i,h)+pmt0(r,i)*xmc0(r,i,h))/pa0(r,i) ;
catax0(r,i,h) = pd0(r,i)*cdtax0(r,i,h)*xdc0(r,i,h)+pmt0(r,i)*cmtax0(r,i,h)*xmc0(r,i,h) ;
catax0(r,i,h)$(xac0(r,i,h) ne 0) = catax0(r,i,h)/(pa0(r,i)*xac0(r,i,h)) ;
pac0(r,i,h)$(ArmFlag eq 0) = pa0(r,i)*(1+catax0(r,i,h)) ;

* ----- Determine household consumption at the level of consumption goods

pc0(r,k,h) = 1 ;
xc0(r,k,h) = sum(i,acons0(r,i,k,h))/pc0(r,k,h) ;

fxconsflag(r,k,h) = 0 ;
fxconsflag(r,k,h)$(xc0(r,k,h) eq 0) = 1 ;

* ----- Check the consistency of the transition matrix

loop(r,loop(h,
   work = sum(i,pac0(r,i,h)*xac0(r,i,h)) - sum(k,pc0(r,k,h)*xc0(r,k,h)) ;
   if (abs(work/bscale) gt 1,
      Display "Inconsistent transition matrix --> residual = ", work ;
      work = (sum(i,pac0(r,i,h)*xac0(r,i,h))/sum(k,pc0(r,k,h)*xc0(r,k,h))) ;
      xc0(r,k,h) = xc0(r,k,h)*work ;
   ) ;
)) ;

loop(r,loop(h,
   work = sum(i,pac0(r,i,h)*xac0(r,i,h)) - sum(k,pc0(r,k,h)*xc0(r,k,h)) ;
   if (abs(work/bscale) gt 1,
      Display "Inconsistent transition matrix --> residual = ", work ;
   ) ;
)) ;

* display xdc0, xmc0, xac0, cdtax0, cmtax0 ;

*
*  Determine household disposable income
*

landY0(r)    = sum(i,npt0(r,i)*td0(r,i)) ;
ffactY0(r)   = sum(i,pf0(r,i)*ff0(r,i)) ;
labY0(r,ll)  = sum(i,nwage0(r,ll,i)*(labdv0(r,ll,i)+labdf0(r,ll,i))) ;
kapY0(r)     = sum(i,sum(v,nrent0(r,i,v)*kapdv0(r,i,v)) + nrent0(r,i,"old")*kapdf0(r,i)) + sum(i,profit0(r,i)) ;

* Remove the taxes from income distribution

IncDist0(r,h,"captl") = IncDist0(r,h,"captl") - sum(i,sum(v,KapTax0(r,i,v)*nrent0(r,i,v)*kapdv0(r,i,v))
                      + nrent0(r,i,"Old")*kapdf0(r,i)) ;
IncDist0(r,h,"landr") = IncDist0(r,h,"landr") - sum(i,LndTax0(r,i)*npt0(r,i)*td0(r,i)) ;

phiLnd(r,h)$(landY0(r) ne 0)      = IncDist0(r,h,"landr")/LandY0(r) ;
phiFF(r,h)$(FFactY0(r) ne 0)      = IncDist0(r,h,"natrs")/FFactY0(r) ;
phiLab(r,h,ll)$(LabY0(r,ll) ne 0) = IncDist0(r,h,ll)/LabY0(r,ll) ;
phiKap(r,h)$(kapY0(r) ne 0)       = IncDist0(r,h,"captl")/KapY0(r) ;

* display IncDist0, phiLnd, phiFF, phiLab, phiKap ;

* Verify that the shares add up to 1

phiLnd(r,h)$(landY0(r) ne 0)      = phiLnd(r,h)/sum(hh,phiLnd(r,hh)) ;
phiFF(r,h)$(FFactY0(r) ne 0)      = phiFF(r,h)/sum(hh,phiFF(r,hh)) ;
phiLab(r,h,ll)$(LabY0(r,ll) ne 0) = phiLab(r,h,ll)/sum(hh,phiLab(r,hh,ll)) ;
phiKap(r,h)$(kapY0(r) ne 0)       = phiKap(r,h)/sum(hh,phiKap(r,hh)) ;

display phiLnd, phiFF, phiLab, phiKap ;

yh0(r,h)    = phiLnd(r,h)*landY0(r) + phiFF(r,h)*FFactY0(r)
            + sum(ll,phiLab(r,h,ll)*laby0(r,ll)) + phiKap(r,h)*kapy0(r) ;

*!!!! Depreciation needs to be cleaned up for multiple households

yh0(r,h)     = yh0(r,h) - phiKap(r,h)*deprec0(r) ;

* display yh0 ;

*
*  Jun-12-2001 Adjust savings rate in base year
*
loop(r,loop(h,
   yd0(r,h)     = sum(i,pac0(r,i,h)*xac0(r,i,h)) + savh0(r,h) ;
   if (sssavRate(r,h) gt 0,
      yd0(r,h)   = (yd0(r,h)-savh0(r,h))/(1.0-sssavRate(r,h)) ;
      savh0(r,h) = sssavRate(r,h)*yd0(r,h) ;
   ) ;
   kappah0(r,h) = (yh0(r,h) - yd0(r,h))/yh0(r,h) ;
) ) ;
chik0(r) = 1 ;
aps0(r,h) = savh0(r,h)/yd0(r,h) ;

* display savh0, yd0, kappah0 ;

* ----- Define the ELES model for calibration

equations
   thetaeq(r,k,h)   Definition of subsistence minimna
   ;

thetaeq(r,k,h)..
   cvolume(r,k,h)*cprice(r,k,h) =e= thetav(r,k,h)*cprice(r,k,h)
         +  mpc(r,k,h)*(hwork(r,h)-sum(kk,cprice(r,kk,h)*thetav(r,kk,h))) ;

model elescal / thetaeq / ;

if (ifELES eq 1 or ifELES eq 3,
*
*  Calibrate the ELES
*
*  Use GAMS to invert the consumer demand system
*
   Options limcol=0, limrow=0 ;

   mpc(r,k,h) = eta0(r,k,h)*pc0(r,k,h)*xc0(r,k,h)/yd0(r,h) ;
   mps(r,h)   = 1 - sum(k,mpc(r,k,h)) ;

   cprice(r,k,h)  = pc0(r,k,h) ;
   cvolume(r,k,h) = xc0(r,k,h) ;
   hwork(r,h)     = yd0(r,h) ;

   options solprint=off ;
   solve elescal using mcp ;

   theta(r,k,h) = thetav.l(r,k,h)/hpop0(r,h) ;

*  display pc0, xc0, yd0, mpc, mps, theta ;

   etas0(r,h) = mps(r,h)*yd0(r,h)/savh0(r,h) ;
   display "Imputed income elasticity for saving: ", etas0 ;
   display mps ;

*  Initialise supernumerary income

   supy0(r,h) = yd0(r,h) - hpop0(r,h)*sum(k,pc0(r,k,h)*theta(r,k,h)) ;

   frisch(r,h) = -sum(k,pc0(r,k,h)*xc0(r,k,h))/(sum(k,pc0(r,k,h)*xc0(r,k,h))-sum(k,pc0(r,k,h)*theta(r,k,h)*hpop0(r,h))) ;
*  display frisch ;
   yc0(r,h) = yd0(r,h) ;
) ;

if (ifELES eq 2,

   mps(r,h)     = savh0(r,h)/yd0(r,h) ;

   yc0(r,h)     = sum(k,pc0(r,k,h)*xc0(r,k,h)) ;
*  display eta0 ;
   loop(r,loop(h,

      eta0(r,k,h)  = eta0(r,k,h) + (pc0(r,k,h)*xc0(r,k,h))
                   * (yc0(r,h)-sum(kk,(pc0(r,kk,h)*xc0(r,kk,h))*eta0(r,kk,h)))/sum(kk,(pc0(r,kk,h)*xc0(r,kk,h))**2) ;

   )) ;
   mpc(r,k,h)   = eta0(r,k,h)*pc0(r,k,h)*xc0(r,k,h)/yc0(r,h) ;
   theta(r,k,h) = xc0(r,k,h)*(1+eta0(r,k,h)/frisch(r,h)) ;
   theta(r,k,h) = theta(r,k,h)/hpop0(r,h) ;

   supy0(r,h)   = yc0(r,h) - hpop0(r,h)*sum(k,pc0(r,k,h)*theta(r,k,h)) ;

*  display mps, xac0, eta0, mpc, theta ;
) ;

* ----- Based on this initial estimate, calibrate the AIDADS system

Parameters
   yd_a           Initial disposable after saving income
   pc_a(k)        Initial consumer price vector
   cons_a(k)      Initial consumption vector
   s_a(k)         Initial consumption shares
   eta_a0(k)      Initial income elasticity
   eps_a0(k)      Initial own price elasticity
   etaFlag        Endogenize income elasticities
;

variables
   ystar_a        Supernumerary income
   theta_a(k)     Subsistence minima
   mu_a(k)        Marginal propensity to consume
   psi_a          Income elasticity parameter
   alpha_a(k)     Alpha parameters
   beta_a(k)      Beta parameters
   u_a            Utility level
   A_a            Utility shifter
   eps_a(k)       Final own price elasticity
   eta_a(k)       Income elasticity
   obj_a          Objective value
;

Equations
   ystar_aeq      Supernumerary income
   cons_aeq(k)    Consumption equation
   eta_aeq(k)     Income elasticity equation
   psi_aeq        Psi equation
   mu_aeq(k)      MPC equation
   u_aeq          Utility equation
   eps_aeq(k)     Own price elasticity equation
   alpha_aeq      Unitary constraint on alpha parameters
   beta_aeq       Unitary constraint on beta parameters
   etac_aeq       Unitary constraint on income elasticities
   obj_aeq        Objective function
;

etaFlag = 0 ;

ystar_aeq..
   ystar_a =e= yd_a - sum(kk, pc_a(kk)*theta_a(kk)) ;

cons_aeq(k)..
   pc_a(k)*cons_a(k) =e= pc_a(k)*theta_a(k) + mu_a(k)*ystar_a ;

eta_aeq(k)..
   psi_a*s_a(k)*eta_a(k) =e= psi_a*mu_a(k) - (beta_a(k) - alpha_a(k)) ;

psi_aeq..
   psi_a*exp(u_a) =e= exp(u_a)*sum(k,(beta_a(k)-alpha_a(k))*log(cons_a(k)-theta_a(k)))
                   -  (1+exp(u_a))**2 ;

mu_aeq(k)..
   (1+exp(u_a))*mu_a(k) =e= alpha_a(k) + beta_a(k)*exp(u_a) ;

u_aeq..
   u_a =e= sum(k,mu_a(k)*log(cons_a(k)-theta_a(k))) - 1 - log(A_a) ;

eps_aeq(k)..
*  eps_a(k)*cons_a(k) =e= theta_a(k)*(1-mu_a(k)) - cons_a(k) ;
   s_a(k)*yd_a*psi_a*eps_a(k) =e= s_a(k)*yd_a*(beta_a(k)-alpha_a(k))
                               -  psi_a*mu_a(k)*(pc_a(k)*theta_a(k)+ystar_a) ;

alpha_aeq..
   sum(k,alpha_a(k)) =e= 1 ;

beta_aeq..
   sum(k,beta_a(k)) =e= 1 ;

etac_aeq$(etaFlag eq 1)..
   sum(k,eta_a(k)*s_a(k)) =e= 1 ;

obj_aeq..
   obj_a =e= sum(k,(eps_a(k)-eps_a0(k))*(eps_a(k)-eps_a0(k)))
          +  etaFlag*sum(k,(eta_a(k)-eta_a0(k))*(eta_a(k)-eta_a0(k)))
   ;

model aidads / ystar_aeq, cons_aeq, eta_aeq, psi_aeq, mu_aeq,
               u_aeq, eps_aeq, alpha_aeq, beta_aeq, etac_aeq, obj_aeq / ;

aidads.holdfixed = 1 ;

* ----- Loop over all regions and households

file aidadsf / aidads.csv / ;

if (ifELES eq 3,
   put aidadsf ;
   put "region,variable,sector,value" / ;
   aidadsf.pc   = 5 ;
   aidadsf.pw = 255 ;
   aidadsf.nj =   1 ;
   aidadsf.nw =  15 ;
   aidadsf.nd =   9 ;
   aidadsf.nz =   0 ;
   aidadsf.nr =   0 ;

   loop(r,loop(h,

*     ----- Initialize parameters

      mps(r,h) = savh0(r,h)/yd0(r,h) ;
      yc0(r,h) = sum(k,pc0(r,k,h)*xc0(r,k,h)) ;

      eps_a0(k) = hpop0(r,h)*theta(r,k,h)*(1-mpc(r,k,h))/xc0(r,k,h) - 1 ;

      pc_a(k)    = pc0(r,k,h) ;
      cons_a(k)  = xc0(r,k,h) ;
      yd_a       = sum(k,pc_a(k)*cons_a(k)) ;
      s_a(k)     = pc_a(k)*cons_a(k)/yd_a ;

      eta_a0(k)  = eta0(r,k,h) + s_a(k)*(1-sum(kk,s_a(kk)*eta0(r,kk,h)))/sum(kk,s_a(kk)**2) ;

*     display s_a, yd_a, work, eta_a0, eps_a0 ;

*     ----- Initialize variables

      theta_a.l(k) = hpop0(r,h)*theta(r,k,h) ;
      mu_a.l(k)    = mpc(r,k,h) ;
      ystar_a.l    = yd_a - sum(kk,pc_a(kk)*theta_a.l(kk)) ;
      if(ord(r) eq 1 and ord(h) eq 1,
         alpha_a.l(k) = s_a(k) ;
         beta_a.l(k)  = s_a(k) ;
      ) ;
      u_a.fx       = 1 ;
      A_a.l        = 100 ;
      eps_a.l(k)   = eps_a0(k) ;
      psi_a.l      = sum(k,(beta_a.l(k)-alpha_a.l(k))*log(cons_a(k)-theta_a.l(k)))
                   -  (1+exp(u_a.l))*(1+exp(u_a.l))*exp(-u_a.l) ;
      eta_a.l(k)   = eta_a0(k) ;
      obj_a.l      = 0 ;

      alpha_a.lo(k) = 0.00001 ;
      alpha_a.up(k) = 0.99999 ;

      beta_a.lo(k)  = 0.00001 ;
      beta_a.up(k)  = 0.99999 ;

      a_a.lo        = 0.000001 ;
*     u_a.lo        = 0.01 ;

*     theta_a.lo(k) = 0 ;
      theta_a.up(k) = 0.99*cons_a(k) ;

      eta_a.fx(k)$(etaFlag eq 0) = eta_a.l(k) ;

      options limrow=100, limcol=100 ;
      options solprint=on ;
      options nlp = conopt ;
      solve aidads minimizing obj_a using nlp ;

*     display psi_a.l, theta_a.l, mu_a.l, alpha_a.l, beta_a.l, a_a.l, eta_a0, eta_a.l, eps_a.l, eps_a0 ;

      put aidadsf ;
      loop(k,
         put r.tl,"cons",  k.tl, (rscale*cons_a(k)) / ;
         put r.tl,"pc",    k.tl, (pc_a(k)) / ;
         put r.tl,"eta0",  k.tl, (eta0(r,k,h)) / ;
         put r.tl,"eta",   k.tl, (eta_a.l(k)) / ;
         put r.tl,"eps0",  k.tl, (eps_a0(k)) / ;
         put r.tl,"eps",   k.tl, (eps_a.l(k)) / ;
         put r.tl,"theta", k.tl, (rscale*theta_a.l(k)) / ;
         put r.tl,"mu",    k.tl, (mu_a.l(k)) / ;
         put r.tl,"alpha", k.tl, (alpha_a.l(k)) / ;
         put r.tl,"beta",  k.tl, (beta_a.l(k)) / ;
      ) ;

      theta(r,k,h)   = theta_a.l(k)/hpop0(r,h) ;
      mu.l(r,k,h)    = mu_a.l(k) ;
      alphaAD(r,k,h) = alpha_a.l(k) ;
      betaAD(r,k,h)  = beta_a.l(k) ;
      AAD(r,h)       = a_a.l ;
      UAD0(r,h)      = u_a.l ;
      supy0(r,h)     = yc0(r,h) - hpop0(r,h)*sum(k,pc0(r,k,h)*theta(r,k,h)) ;
   )) ;
) ;

*
*  Calibrate the consumer transition matrix
*

acons(r,i,k,h)$(acons0(r,i,k,h) ne 0) =
   ((acons0(r,i,k,h)/pac0(r,i,h))/xc0(r,k,h))*(pac0(r,i,h)/pc0(r,k,h))**sigmac(r,k,h) ;

display acons ;

*
*  Calibrate the consumer Armington demand system
*

sigmamc(r,i,h)$(sigmamc(r,i,h) eq 1) = 1.01 ;
acd(r,i,h)  = 0 ;
acm(r,i,h)  = 0 ;
acd(r,i,h)$(xac0(r,i,h) ne 0)
  = (xdc0(r,i,h)/xac0(r,i,h))*(pd0(r,i)*(1+cdtax0(r,i,h))/pac0(r,i,h))**sigmamc(r,i,h) ;
acm(r,i,h)$(xac0(r,i,h) ne 0)
  = (xmc0(r,i,h)/xac0(r,i,h))*(pmt0(r,i)*(1+cmtax0(r,i,h))/pac0(r,i,h))**sigmamc(r,i,h) ;

*  display acd, acm ;

cpi0(r,h) = 1 ;

* --------------------------------------------------------------------
*
* Calibrate the other final demand vectors
* ----------------------------------------
*
*  Step 1: Set up basic prices and define input volumes
*
*  Step 2: Calibrate share parameters
*
*  Step 3: Set up Armington system in consumption
*
* --------------------------------------------------------------------

paf0(r,i,f)$(ArmFlag eq 1) = 1 ;
xaf0(r,i,f)$(ArmFlag eq 1) = pd0(r,i)*(1+fdtax0(r,i,f))*xdf0(r,i,f)
                           + pmt0(r,i)*(1+fmtax0(r,i,f))*xmf0(r,i,f) ;
xaf0(r,i,f)$(ArmFlag eq 1) = xaf0(r,i,f)/paf0(r,i,f) ;

xaf0(r,i,f)$(ArmFlag eq 0) = (pd0(r,i)*xdf0(r,i,f)+pmt0(r,i)*xmf0(r,i,f))/pa0(r,i) ;
fatax0(r,i,f) = pd0(r,i)*fdtax0(r,i,f)*xdf0(r,i,f)
              + pmt0(r,i)*fmtax0(r,i,f)*xmf0(r,i,f) ;
fatax0(r,i,f)$(xaf0(r,i,f) ne 0) = fatax0(r,i,f)/(xaf0(r,i,f)*pa0(r,i)) ;
paf0(r,i,f)$(ArmFlag eq 0) = pa0(r,i)*(1+fatax0(r,i,f)) ;

*  display xdf0, xmf0, xaf0, fdtax0, fmtax0 ;

*
*  Calibrate share parameters
*

pfd0(r,f)     = 1 ;
fdvol0(r,f)   = sum(i,paf0(r,i,f)*xaf0(r,i,f))/pfd0(r,f) ;

afa(r,i,f) = xaf0(r,i,f)/fdvol0(r,f) ;
pfd0(r,f)  = sum(i, afa(r,i,f)*paf0(r,i,f)) ;

* display af, fdvol0, pfd0 ;

*
*  Calibrate the Armington demand system for final demand
*

sigmamf(r,i,"gov") = sigmamg(r,i) ;
sigmamf(r,i,"inv") = sigmami(r,i) ;
sigmamf(r,i,f)$(sigmamf(r,i,f) eq 1) = 1.01 ;
afdd(r,i,f)$(xaf0(r,i,f))  = (xdf0(r,i,f)/xaf0(r,i,f))*(pd0(r,i)*(1+fdtax0(r,i,f))/paf0(r,i,f))**sigmamf(r,i,f) ;
afdm(r,i,f)$(xaf0(r,i,f))  = (xmf0(r,i,f)/xaf0(r,i,f))*(pmt0(r,i)*(1+fmtax0(r,i,f))/paf0(r,i,f))**sigmamf(r,i,f) ;

* --------------------------------------------------------------------
*
* Calibrate government revenues
*
* --------------------------------------------------------------------

GRev0(r) = sum(i,px0(r,i)*ptax0(r,i)*xp0(r,i))
         + sum(j,sum(i, pd0(r,i)*pdtax0(r,i,j)*xdp0(r,i,j)))
         + sum(j,sum(i, pmt0(r,i)*pmtax0(r,i,j)*xmp0(r,i,j)))
         + sum(h,sum(i, pd0(r,i)*cdtax0(r,i,h)*xdc0(r,i,h)
         +              pmt0(r,i)*cmtax0(r,i,h)*xmc0(r,i,h)))
         + sum(f,sum(i, pd0(r,i)*fdtax0(r,i,f)*xdf0(r,i,f)))
         + sum(f,sum(i, pmt0(r,i)*fmtax0(r,i,f)*xmf0(r,i,f)))
         + sum(rp,sum(i,wpm0(rp,r,i)*tar0(rp,r,i)*lambdaw(rp,r,i)*wtf_in0(rp,r,i)))
         + sum(rp,sum(i,wpm0(rp,r,i)*tar_out0(rp,r,i)*lambdaw(rp,r,i)*wtf_out0(rp,r,i)))
         + sum(rp,sum(i,chitrq(rp,r,i)*wpm0(rp,r,i)*tar_p0(rp,r,i)*lambdaw(rp,r,i)*wtf_q0(rp,r,i)))
         + sum(rp,sum(i,pe0(r,rp,i)*etax0(r,rp,i)*wtf0(r,rp,i)))
         + sum(i, sum(ll, wagetax0(r,ll,i)*nwage0(r,ll,i)*(labdv0(r,ll,i)+labdf0(r,ll,i))))
         + sum(i, sum(v, KapTax0(r,i,v)*nrent0(r,i,v)*kapdv0(r,i,v))
         +               KapTax0(r,i,"Old")*nrent0(r,i,"Old")*kapdf0(r,i))
         + sum(i, LndTax0(r,i)*npt0(r,i)*td0(r,i))
         + sum(h,kappah0(r,h)*yh0(r,h)) ;

savg0(r) = GRev0(r) - pfd0(r,"Gov")*fdvol0(r,"Gov") ;
rsg0(r)  = savg0(r) ;

* display GRev0, savg0 ;

* --------------------------------------------------------------------
*
* Calibrate the world transportation sector
*
* --------------------------------------------------------------------

*
* Calculate the global volume of shipping services
*

pwmarg0 = 1 ;
xwmarg0 = sum(i,sum(r,sum(rp,wpe0(r,rp,i)*tmarg0(r,rp,i)*wtf0(r,rp,i)))) ;
xwmarg0 = xwmarg0/pwmarg0 ;

*
* Calibrate the regional shares of shipping services
*

ptmarg0(r) = 1 ;
xtmarg0(r) = sum(i,pp0(r,i)*xmarg0(r,i)) ;
xtmarg0(r) = xtmarg0(r)/ptmarg0(r) ;

sigmat$(sigmat eq 1) = 1.01 ;
atmarg(r) = (xtmarg0(r)/xwmarg0)*(ptmarg0(r)/pwmarg0)**sigmat ;

*
*  Calibrate the Leontief structure of local production of trade services
*

amarg(r,i) = xmarg0(r,i)/xtmarg0(r) ;

* display xtmarg0, xwmarg0, atmarg, amarg ;

* --------------------------------------------------------------------
*
* Calibrate the AIDS import demand function
*
* --------------------------------------------------------------------

* CES function between domestic goods and intraregional imports

pdm0(r,i) = 1 ;
xdm0(r,i) = (pd0(r,i)*xd0(r,i) + pm0(r,r,i)*lambdaw(r,r,i)*wtf0(r,r,i))/pdm0(r,i) ;
sigmab(r,i)$(sigmab(r,i) eq 1) = 1.01 ;
add(r,i)  = 0 ;
adm(r,i)  = 0 ;
add(r,i)$(xdm0(r,i) ne 0)  = (xd0(r,i)/xdm0(r,i))*(pd0(r,i)/pdm0(r,i))**sigmab(r,i) ;
adm(r,i)$(xdm0(r,i) ne 0)  = (lambdaw(r,r,i)*wtf0(r,r,i)/xdm0(r,i))*(pm0(r,r,i)/pdm0(r,i))**sigmab(r,i) ;

* The following statements insure that the shares will add up to 1.

* display pa0, xa0 ;
xa0(r,i) = (pd0(r,i)*xd0(r,i)+sum(rp,pm0(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i)))/pa0(r,i) ;

* AIDS function

loop(r,loop(i$(AidsFlag(r,i) ne 0),
   pmAIDS0(rp,r,i)$(ord(rp) ne ord(r)) = pm0(rp,r,i) ;
   pmAIDS0(r,r,i)  = pdm0(r,i) ;
   share0(rp,r,i)$(ord(rp) ne ord(r)) = pmAIDS0(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i)/(pa0(r,i)*xa0(r,i)) ;
   share0(r,r,i)   = pmAIDS0(r,r,i)*xdm0(r,i)/(pa0(r,i)*xa0(r,i)) ;
))  ;

* display add, adm, pdm0, xdm0, pd0, xd0, pm0, wtf0, pmAIDS0, share0 ;
* display xmt0, pmt0, xa0, pa0 ;


*  Calibrate the beta parameters based on the income elasticities

*  Re-scale the AIDS income elasticities
*  The formula is based on minimizing the sum of square errors
*

loop(r,loop(i$(AidsFlag(r,i) ne 0),
   yelasAIDS0(rp,r,i)$(share0(rp,r,i) eq 0) = 0 ;
   yelasAIDS(rp,r,i) = yelasAIDS0(rp,r,i)+share0(rp,r,i)
                  * (1-sum(rpp,share0(rpp,r,i)*yelasAIDS0(rpp,r,i)))
                  / sum(rpp,share0(rpp,r,i)*share0(rpp,r,i)) ;
   beta(rp,r,i) = share0(rp,r,i)*(yelasAIDS(rp,r,i)-1) ;
)) ;

* display yelasAIDS0, yelasAIDS, beta ;

*  Set up the calibration program

*  Declare the variables

Variables

alpha0v            The price index shift parameter
alphav(rp)         The share parameters
gammav(rp,rpp)     The cross price parameters
sigmaqv(rp,rpp)    The AIDS substitution elasticities
   ;

*  Declare the holding parameters

parameters

pAIDS0             The aggregate price index
pAIDS(rp)          The component prices
AIDSsh(rp)         The AIDS shares
sig(rp,rpp)        The substitution elasticities
b(rp)              The income parameters
xAIDS0             The aggregate volume
ifTrade(rp)        Trade flag
   ;

*  Declare the equations

Equations

alpha0eq           To determine alpha0
alphaeq(rp)        To determine the share parameters
asumeq             Adding up constraint for the alpha parameters
gsumeq(rp)         Adding up constraint for the gamma parameters
gammaijeq(rp,rpp)  Definition of the off-diagonal gamma parameters
symeq(rp,rpp)      Symmetry conditions
AIDSobjeq          AIDS objective equation
   ;

alpha0eq..
   log(pAIDS0) =e= alpha0v + sum(rp,alphav(rp)*log(pAIDS(rp)))
                +  0.5*sum(rp,sum(rpp,gammav(rp,rpp)*log(pAIDS(rp))*log(pAIDS(rpp)))) ;

alphaeq(rp)$(ifTrade(rp) eq 1)..
   AIDSsh(rp) =e= alphav(rp)+sum(rpp,gammav(rp,rpp)*log(pAIDS(rpp)))
                   +  b(rp)*log(xAIDS0) ;
asumeq..
   sum(rp,alphav(rp)) =e= 1 ;

gsumeq(rp)$(ifTrade(rp) eq 1)..
*gsumeq(rp)..
   sum(rpp,gammav(rpp,rp)) =e= 0 ;

gammaijeq(rp,rpp)$(ord(rp) gt ord(rpp) and ifTrade(rp) eq 1)..
*gammaijeq(rp,rpp)$(ord(rp) gt ord(rpp))..
   sigmaqv(rp,rpp)*AIDSsh(rp)*AIDSsh(rpp) =e= AIDSsh(rp)*AIDSsh(rpp)
      + gammav(rp,rpp) + b(rp)*b(rpp)*log(xAIDS0) ;

symeq(rp,rpp)$(ord(rp) gt ord(rpp) and ifTrade(rp) eq 1)..
*symeq(rp,rpp)$(ord(rp) gt ord(rpp))..
   gammav(rp,rpp) =e= gammav(rpp,rp) ;

AIDSobjeq..
   obj =e= sum(rp$(ifTrade(rp) eq 1),sum(rpp$(ord(rp) gt ord(rpp)),
           (sigmaqv(rp,rpp)-sig(rp,rpp))*(sigmaqv(rp,rpp)-sig(rp,rpp)))) ;

*model aids / alpha0eq, alphaeq, asumeq, gsumeq, gammaijeq, symeq, AIDSobjeq / ;
model aids / gsumeq, gammaijeq, symeq, AIDSobjeq / ;

AIDSFlag(r,i)$(xmt0(r,i) eq 0) = 0 ;

loop(r,loop(i$(AIDSFlag(r,i) eq 1),

*  Initialise the parameters

   pAIDS0      = pa0(r,i) ;
   pAIDS(rp)   = pmAIDS0(rp,r,i) ;
   AIDSsh(rp)  = share0(rp,r,i) ;
   sig(rp,rpp) = sigmaq(rp,rpp,r,i) ;
   b(rp)       = beta(rp,r,i) ;
   xAIDS0      = xa0(r,i) ;
   ifTrade(rp) = 1 ;
   ifTrade(rp)$(share0(rp,r,i) eq 0) = 0 ;

*  Initialise the variables

   alpha0v.l = 0 ;
   alphav.l(rp) = share0(rp,r,i) - beta(rp,r,i)*log(xa0(r,i)) ;
   sigmaqv.l(rp,rpp) = sigmaq(rp,rpp,r,i) ;
   gammav.l(rp,rpp) = 0 ;
   gammav.l(rp,rpp)$(ord(rp) gt ord(rpp) and iftrade(rp)) =
      sigmaqv.l(rp,rpp)*AIDSsh(rp)*AIDSsh(rpp) - AIDSsh(rp)*AIDSsh(rpp) ;
   gammav.l(rpp,rp) = gammav.l(rp,rpp) ;
   gammav.l(rp,rp) = -sum(rpp$(ord(rpp) ne ord(rp)),gammav.l(rpp,rp)) ;
   loop(rp,
      if (ifTrade(rp) eq 0,
         alphav.fx(rp) = 0 ;
         gammav.fx(rp,rpp) = 0 ;
         gammav.fx(rpp,rp) = 0 ;
         sigmaqv.fx(rp,rpp) = 0 ;
         sigmaqv.fx(rpp,rp) = 0 ;
      else
         alphav.lo(rp)      = -inf ;
         gammav.lo(rp,rpp)  = -inf ;
         gammav.lo(rpp,rp)  = -inf ;
         sigmaqv.lo(rp,rpp) = -inf ;
         sigmaqv.lo(rpp,rp) = -inf ;

         alphav.up(rp)      = inf ;
         gammav.up(rp,rpp)  = inf ;
         gammav.up(rpp,rp)  = inf ;
         sigmaqv.up(rp,rpp) = inf ;
         sigmaqv.up(rpp,rp) = inf ;
      ) ;
   ) ;

$ontext
   alpha0eq.m          = 1 ;
   alphaeq.m(rp)       = 1 ;
   asumeq.m            = 1 ;
   gsumeq.m(rp)        = 1 ;
   gammaijeq.m(rp,rpp) = 1 ;
   symeq.m(rp,rpp)     = 1 ;
   AIDSobjeq.m         = 1 ;
$offtext

   options nlp=conopt ;

*  option limcol = 1000, limrow = 1000 ;

   aids.holdfixed = 1 ;

*  display pAIDS0, pAIDS, AIDSsh, sig, b, xAIDS0 ;

   solve aids using NLP minimizing obj ;

*  display ifTrade, sig, b, alpha0v.l, alphav.l, gammav.l, sigmaqv.l ;

$ontext
   alpha0(r,i)        = alpha0v.l ;
   alpha(rp,r,i)      = alphav.l(rp) ;
$offtext
   alpha0(r,i)        = 0 ;
   alpha(rp,r,i)      = share0(rp,r,i) - beta(rp,r,i)*log(xa0(r,i)) ;

   gamma(rp,rpp,r,i)  = gammav.l(rp,rpp) ;
   sigmaq(rp,rpp,r,i) = sigmaqv.l(rp,rpp) ;
   sigmaq(rp,rp,r,i)$(share0(rp,r,i) ne 0)  = 1 - 1/share0(rp,r,i)
                      + (gamma(rp,rp,r,i)+beta(rp,r,i)*beta(rp,r,i)*log(xa0(rp,i)))
                      / (share0(rp,r,i)*share0(rp,r,i)) ;

)) ;

*display sigmaq, alpha0, alpha, gamma ;

parameters
   etaq(rp,rpp,r,i)  The compensated demand elasticities
   epsq(rp,rpp,r,i)  The uncompensated demand elasticities
   kron(rp,rpp,r,i)  The Kronecker variable
   ;

alias(rp11,r) ;
kron(rp,rpp,r,i) = 0 ; kron(rp,rp,r,i) = 1 ;

$ontext

file elas / 'aids.prn' /
put elas ;

*
*  Setup the parameters for the report
*
elas.pc   = 2 ;
elas.pw = 255 ;
elas.nj =   1 ;
elas.nw =  15 ;
elas.nd =   3 ;
elas.nz = 10e-9;
elas.nr =   0 ;


loop(r, loop(i$(AidsFlag(r,i) ne 0),

   epsq(rp,rpp,r,i) = 0 ;
   epsq(rp,rpp,r,i)$(share0(rp,r,i) ne 0)
        = -kron(rp,rpp,r,i) + (gamma(rp,rpp,r,i) - beta(rp,r,i)*alpha(rpp,r,i)
        -  beta(rp,r,i)*sum(rp1,gamma(rpp,rp1,r,i)*log(pmAIDS0(rp1,r,i))))/share0(rp,r,i) ;
   etaq(rp,rpp,r,i) = epsq(rp,rpp,r,i) + share0(rpp,r,i)*yelasAIDS(rp,r,i) ;

   put "Uncompensated price elasticities for the AIDS function" / ;
   put "======================================================" /// ;
   put "Region: ", r.tl / ;
   put "Sector: ", i.tl // ;
   put " ":12 ; loop(rpp, put rpp.tl:>15 ;) ; put // ;
   loop(rp, put rp.tl:<10, "  " ; loop(rpp, put epsq(rp,rpp,r,i):15:8 ; ) ; put / ; ) ;
   put /// ;

   put "Compensated price elasticities for the AIDS function" / ;
   put "====================================================" /// ;
   put "Region: ", r.tl / ;
   put "Sector: ", i.tl // ;
   put " ":12 ; loop(rpp, put rpp.tl:>15 ;) ; put // ;
   loop(rp, put rp.tl:<10, "  " ; loop(rpp, put etaq(rp,rpp,r,i):15:8 ; ) ; put / ; ) ;
   put /// ;

   put "Slutsky substitution elasticities for the AIDS function" / ;
   put "=======================================================" /// ;
   put "Region: ", r.tl / ;
   put "Sector: ", i.tl // ;
   put " ":12 ; loop(rpp, put rpp.tl:>15 ;) ; put // ;
   loop(rp, put rp.tl:<10, "  " ; loop(rpp, put sigmaq(rp,rpp,r,i):15:5 ; ) ; put / ; ) ;
   put /// ;


   etaq(rp,rpp,r,i)$(share0(rpp,r,i) ne 0)
      = sigmaq(rp,rpp,r,i) - etaq(rp,rpp,r,i)/share0(rpp,r,i) ;

   put "Elasticity check" / ;
   put "================" /// ;
   put "Region: ", r.tl / ;
   put "Sector: ", i.tl // ;
   put " ":12 ; loop(rpp, put rpp.tl:>15 ;) ; put // ;
   loop(rp, put rp.tl:<10, "  " ; loop(rpp, put etaq(rp,rpp,r,i):15:8 ; ) ; put / ; ) ;
   put /// ;

   etaq(rp,rpp,r,i) = epsq(rp,rpp,r,i) + share0(rpp,r,i)*yelasAIDS(rp,r,i) ;

   put "Gamma Parameter" / ;
   put "================" /// ;
   put "Region: ", r.tl / ;
   put "Sector: ", i.tl // ;
   put " ":12 ; loop(rpp, put rpp.tl:>15 ;) ; put // ;
   loop(rp, put rp.tl:<10, "  " ; loop(rpp, put gamma(rp,rpp,r,i):15:10 ; ) ; put / ; ) ;
   put /// ;

   put "Alpha Parameter" / ;
   put "===============" /// ;
   put "Region: ", r.tl / ;
   put "Sector: ", i.tl // ;
   loop(rp, put rp.tl:<10, "  " ; put alpha(rp,r,i):15:10 ; put / ; ) ;
   work = sum(rp,alpha(rp,r,i)) ;
   put "Total":<10, "  ", work:15:10 / ;
   put /// ;

) ) ;

* display epsq ;
* Abort$(1) "Halt after calibrating AIDS" ;
$offtext

* --------------------------------------------------------------------
*
* Calibrate foreign saving
*
* --------------------------------------------------------------------

savf0(r) = sum(i,sum(rp,wpm0(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i)))
         + sum(i,sum(rp,wpm0(rp,r,i)*(1-chitrq(rp,r,i))*tar_p0(rp,r,i)*wtf0(rp,r,i)))
         - sum(i,sum(rp,wpm0(r,rp,i)*(1-chitrq(r,rp,i))*tar_p0(r,rp,i)*wtf0(r,rp,i)))
         - sum(i,sum(rp,wpe0(r,rp,i)*wtf0(r,rp,i)))
         - sum(i,pp0(r,i)*xmarg0(r,i)) ;

*display savf0 ;

* Calculate the overall gap on the foreign saving account

work    = sum(r,savf0(r)) ;
* display work ;
maximum = 0 ;
index   = 0 ;

loop(r,
   index$(maximum le abs(savf0(r))) = ord(r) ;
   maximum$(maximum le savf0(r))   = savf0(r) ;
) ;

* display savf0, maximum, index, work ;

loop(r$(ord(r) eq index), savf0(r) = savf0(r) - work ; ) ;

* display fdvol0, deprec0, savh0, savf0, savg0 ;

p0 = 1 ;

rgdpmp0(r) = sum(h,sum(i,pac0(r,i,h)*xac0(r,i,h)))
           + sum(i,sum(f,paf0(r,i,f)*xaf0(r,i,f)))
           + sum(i,sum(rp,wpe0(r,rp,i)*wtf0(r,rp,i)))
           + ptmarg0(r)*xtmarg0(r)
           - sum(i,sum(rp,wpm0(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i))) ;
ggdp0(r)   = 0 ;
GDPFX(r)   = 0 ;
gdpmp0(r)  = rgdpmp0(r) ;

pgdp0(r)   = 1 ;
rgdp0(r)   = sum(i,npt0(r,i)*td0(r,i)+pf0(r,i)*ff0(r,i)
           + sum(ll,wage0(r,ll,i)*(labdv0(r,ll,i)+labdf0(r,ll,i)))
           + sum(v,nrent0(r,i,v)*kapdv0(r,i,v)) + nrent0(r,i,"Old")*kapdf0(r,i)) ;
rgdp0(r)   = rgdp0(r)/pgdp0(r) ;
pabs0(r)   = 1 ;
g0(r,i)    = g(r,i) ;

agx(r)     = fdvol0(r,"Gov")/rgdpmp0(r) ;

* Adjustments for national tax rates

* display kappah0, yh0, Grev0, rgdpmp0, taxGDP0 ;

*!!!! Needs to be taken care of for multiple households

$ontext

loop(r$(taxGDP0(r) ne 0),
   trg0(r)    = (taxGDP0(r)/100)*rgdpmp0(r) - GRev0(r) ;
   kappah0(r) = (kappah0(r)*yh0(r)+trg0(r))/(yh0(r) + trg0(r)) ;
   yh0(r)     = yh0(r) + trg0(r) ;
   GRev0(r)   = GRev0(r) + trg0(r) ;
) ;

* display trg0, kappah0, yh0, Grev0, rgdpmp0 ;

$offtext

trg0(r,h) = 0 ;

* --------------------------------------------------------------------
*
* Calibrate land supply function
*
* --------------------------------------------------------------------

ts0(r,i)   = td0(r,i) ;
ptland0(r) = 1 ;
tland0(r)  = sum(i,npt0(r,i)*td0(r,i))/ptland0(r) ;
omegatl(r)$(omegatl(r) ge 98) = inf ;
alnd(r,i) = 0 ;
alnd(r,i)$(omegatl(r) ne inf and tland0(r) ne 0)
   = (ts0(r,i)/tland0(r))*(ptland0(r)/npt0(r,i))**omegatl(r) ;
alnd(r,i)$(omegatl(r) eq inf and tland0(r) ne 0)
   = (npt0(r,i)*ts0(r,i))/(ptland0(r)*tland0(r)) ;
ats(r) = 0 ;
leps0(r)$(leps0(r) ge 98) = inf ;
ats(r)$(leps0(r) ne inf) = tland0(r)*(pabs0(r)/ptland0(r))**leps0(r) ;

* Calibrate the logistic land supply function

loop(r$(tland0(r) ne 0),
   if (LandMax(r) ne inf and LandMax(r) gt 1 and leps0(r) ne inf,
      LandMax(r) = LandMax(r)*tland0(r) ;
      display Landmax, tland0 ;
      gammats(r) = (leps0(r)/(ptland0(r)/pabs0(r)))*(LandMax(r)/(LandMax(r)-tland0(r))) ;
      ats(r)     = (LandMax(r)/tland0(r) - 1) * exp(gammats(r)*(ptland0(r)/pabs0(r))) ;
   ) ;
) ;

* Calibrate supply function for other sector specific factors

fs0(r,i) = ff0(r,i) ;
afs(r,i) = 0 ;
omegaf(r,i)$(omegaf(r,i) ge 98) = inf ;
afs(r,i)$(omegaf(r,i) ne inf) = fs0(r,i)*(pgdp0(r)/pf0(r,i))**omegaf(r,i) ;
afs(r,i)$(omegaf(r,i) eq inf) = fs0(r,i)*pf0(r,i) ;

* --------------------------------------------------------------------
*
* Calibrate capital supply
*
* --------------------------------------------------------------------

parameter krat(r) Conversion rate of base year capital stock ;
krat(r)  = sum(i,sum(v,nrent0(r,i,v)*kapdv0(r,i,v)) + nrent0(r,i,"Old")*kapdf0(r,i))/kstock0(r) ;
fdepr(r) = deprec0(r)/kstock0(r) ;
*depr(r)  = fdepr(r) ;
* display krat, depr ;

kaps0(r,i) = kapd0(r,i)/rent0(r,i,"Old") ;
trent0(r)  = 1 ;
tkaps0(r)  = sum(i,sum(v,nrent0(r,i,v)*kapdv0(r,i,v)) + nrent0(r,i,"Old")*kapdf0(r,i))/trent0(r) ;
omegak(r)$(omegak(r) eq 1)  = 1.01 ;
omegak(r)$(omegak(r) ge 98) = inf ;
akap(r,i) = 0 ;
akap(r,i)$(omegak(r) ne inf) = (kaps0(r,i)/tkaps0(r))
                             * (trent0(r)/nrent0(r,i,"Old"))**omegak(r) ;

rrat0(r,i) = 1 ;
kxrat0(r,i)$(xpv0(r,i,"Old") ne 0) = kapdv0(r,i,"Old")/xpv0(r,i,"Old") ;

* Initialise the capital per worker variable

kaplab0(r) = sum(i,sum(v,rent0(r,i,v)*kapdv0(r,i,v)) + rent0(r,i,"Old")*kapdf0(r,i))
           / sum(i,sum(ll,wage0(r,ll,i)*(labdv0(r,ll,i)+labdf0(r,ll,i)))) ;

* display kaplab0 ;

* Initialise the lagged variables for the capital accumulation
* function, but this is simply for the sake of the comp stat model

tiLag(r)     = fdvol0(r,"Inv") ;
ginv0(r)     = 0 ;
kstockLag(r) = (kstock0(r)-tiLag(r))/(1-depr(r)) ;

* --------------------------------------------------------------------
*
* Calibrate labor supply
*
* --------------------------------------------------------------------

glab0(r,ll,gz) = 0 ;
labs0(r,ll,gs) = sum(i$mapg(i,gs),labdv0(r,ll,i))/(1-ue0(r,ll,gs)) ;
labs0(r,ll,"Tot") = sum(gs, labs0(r,ll,gs)) ;

avgw0(r,ll,gz)  = 1 ;
avgw0(r,ll,gz)$(labs0(r,ll,gz) ne 0) =
     sum(i$mapg(i,gz),nwage0(r,ll,i)*(labdv0(r,ll,i)+labdf0(r,ll,i)))
   / sum(i$mapg(i,gz),labdv0(r,ll,i)+labdf0(r,ll,i)) ;

loop(r,loop(ll,
   loop(gz,
      if (labs0(r,ll,gz) eq 0,
         wmin0(r,ll,gz) = 0 ;
         ue0(r,ll,gz)   = 0 ;
         omegam(r,ll)   = inf ;
         migr0(r,ll)    = 0 ;
      ) ;
   ) ;
)) ;

loop(r,loop(ll,
   twage0(r,ll,gz) = avgw0(r,ll,gz) ;
   if (omegam(r,ll) ne inf,

*     Labor markets are segmented

      chiMigr(r,ll) = migr0(r,ll)*(((1-ue0(r,ll,"rur"))*avgw0(r,ll,"rur"))
         / ((1-ue0(r,ll,"urb"))*avgw0(r,ll,"urb")))**omegam(r,ll) ;
      loop(gs,
         if(ue0(r,ll,gs) gt 0,
            wmin0(r,ll,gs) = twage0(r,ll,gs) ;
         else
            wmin0(r,ll,gs) = wmin0(r,ll,gs)*twage0(r,ll,gs) ;
         )
      ) ;

   elseif (omegam(r,ll) eq inf),

*     Integrated labor market

      if (ue0(r,ll,"Tot") gt 0,
         wmin0(r,ll,"Tot") = twage0(r,ll,"Tot") ;
      else
         wmin0(r,ll,"Tot") = wmin0(r,ll,"Tot")*twage0(r,ll,"Tot") ;
      ) ;

   ) ;
   if (omegam(r,ll) eq inf,

      twage0(r,ll,gs) = twage0(r,ll,"Tot") ;
      wmin0(r,ll,gs)  = wmin0(r,ll,"Tot") ;

   else

      wmin0(r,ll,"Tot") = 0 ;
   ) ;

)) ;

ue0(r,ll,gz)$(labs0(r,ll,gz) ne 0) = 1 - sum(i$mapg(i,gz),labdv0(r,ll,i)+labdf0(r,ll,i))/labs0(r,ll,gz) ;
amin0(r,ll,gz) = wmin0(r,ll,gz) * (pabs0(r)**(-omegap(r,ll,gz)))
                                * ((1-ue0(r,ll,gz))**(-omegaue(r,ll,gz))) ;

wdist0(r,ll,i)   = 1 ;
loop(gs,
   wdist0(r,ll,i)$(labdv0(r,ll,i) and mapg(i,gs))
      = nwage0(r,ll,i)/twage0(r,ll,gs) ;
) ;

* Calibration of wage bargaining module

wageBarg(r,ll,i) = 0 ;
delta(r,ll,i)    = 0.5 ;

L0(r,ll,i)$(wageBarg(r,ll,i)) = labdv0(r,ll,i)
       * (1-sigmav(r,i,"old")*((1-delta(r,ll,i))/delta(r,ll,i))*((wdist0(r,ll,i)-1)/wdist0(r,ll,i))) ;

* display L0, labd0, wdist0, delta, sigmav ;

$ontext
loop(r,loop(i,loop(ll,$wageBarg(r,ll,i),
work = 1/(1-(delta(r,ll,i)/(1-delta(r,ll,i)))*(labdv0(r,ll,i)-l0(r,ll,i))/(sigmav(r,i,"old")*labdv0(r,ll,i))) ;
work = work - wdist0(r,ll,i) ;
* display work ;
))) ;
$offtext

* --------------------------------------------------------------------
*
* Calibrate productivity factors
*
* --------------------------------------------------------------------

loop(r,loop(i,
   if (xp0(r,i) eq 0 or es0(r,i) eq 0,
      etap(r,i)  = 0 ;
      phip0(r,i) = 0 ;
   ) ;
)) ;
agprod0(r,i) = 1 ;

* --------------------------------------------------------------------
*
* Calibrate investment/savings function
*
* --------------------------------------------------------------------

* ----- Calibrate the savings function

deprat0(r,tranche) = pop0(r,tranche)/pop0(r,"G15") ;
deprat0(r,"ToT")   = (pop0(r,"l15") + pop0(r,"G65"))/pop0(r,"G15") ;

* display pop0, deprat0 ;

rgdpmplag(r) = rgdpmp0(r)/(1+0.01*gdpgr0(r)) ;
$ontext
alphas(r,h)  = (savh0(r,h)/yd0(r,h))
             * (((rgdpmp0(r)/pop0(r,"Tot"))/(rgdpmplag(r)/popLag(r,"Tot")))**(-etag(r)))
             * (deprat0(r,"L15")**(-etay(r)))
             * (deprat0(r,"G65")**(-etae(r)))
             * ((trent0(r)/cpi0(r,h))**(-etar(r))) ;
$offtext

apsLag(r,h) = aps0(r,h) ;

alphas(r,h) = aps0(r,h)
            -  betas(r)*apsLag(r,h)
            -  betag(r)*(log(rgdpmp0(r)) - log(rgdpmplag(r)*pop0(r,"Tot")/popLag(r,"Tot")))
            -  betay(r)*deprat0(r,"L15")
            -  betae(r)*deprat0(r,"G65")
            -  betar(r)*(trent0(r)/cpi0(r,h)) ;

* ----- Calibrate investment function

psavw0    = 1 ;
wrr0      = sum(r,trent0(r)*kstock0(r))/sum(r,kstock0(r)) ;

invsh0(r) = (pfd0(r,"Inv")*fdvol0(r,"Inv")/gdpmp0(r)) ;

* ---- Reset GDP history for comp stat exercise

ggdphist(r)$(CompFlag eq 1) = 0.01*gdpgr0(r) ;

chiInv(r) = invsh0(r)*((trent0(r)/wrr0)**(-epsrr(r)))
          * (psavw0**(-epsI(r)))
          * ((1+ggdphist(r))**(-epsY(r))) ;
invshlag(r) = invsh0(r) ;

* --------------------------------------------------------------------
*
* Calibrate the emissions module
*
* --------------------------------------------------------------------

*  Assume the emissions tax is exogenous and equal to zero in the base year

emitaxFlag(r) = 0 ;
emitax0(r)    = 0 ;

*  Calculate total emissions
*  !!!! Emissions for the moment is based on a single-armington agent specification

emicoef(r,e) = 1 ;
emitot0(r) = sum(i, emicoef(r,i)*xa0(r,i)) ;

* display emicoef, emitot0 ;

*  Re-calibrate the emissions coefficient so that world total emissions are equal
*  to 6000.

work = sum(r,emitot0(r)) ;

if (work ne 0,
   emicoef(r,i) = 6000*emicoef(r,i)/work ;
   emitot0(r) = sum(i, emicoef(r,i)*xa0(r,i)) ;
else
   emicoef(r,i) = 0 ;
   emitot0(r)   = 0 ;
) ;

* display work, emicoef, emitot0 ;
