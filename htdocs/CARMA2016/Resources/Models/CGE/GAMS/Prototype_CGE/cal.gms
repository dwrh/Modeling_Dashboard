* ------------------------------------------------------------------------------
*
* Initialize the variables
*
* ------------------------------------------------------------------------------

* ----- Basic prices

p0(k)       = 1 ;
pa0(k)      = 1 ;
pp0(i)      = 1 ;
pd0(k)      = 1 ;
pmt0(k)     = 1 ;
wpm0(k,r)   = 1 ;
pet0(k)     = 1 ;
wpe0(k,r)   = 1 ;

*wage0(i,l)  = 1 ;
rent0(i,kt) = 1 ;
pt0(i,lt)   = 1 ;
pr0(i)      = 1 ;

plev0       = 1 ;
er0         = 1 ;

* ------------------------------------------------------------------------------
*
* Initialize the trade block
*
* This must be the first step due to the possibility of the law of one price
*
* ------------------------------------------------------------------------------
*
* ----- Second level Armington

tm0(k,r) = sum(k0$(mapk(k0,k)),sum(r0$(mapr(r0,r)),wtf_pm0(r0,k0)-sam0(r0,k0))) ;
xm0(k,r) = sum(k0$(mapk(k0,k)),sum(r0$(mapr(r0,r)),sam0(r0,k0))/(wpm0(k,r)*er0)) ;

tm0(k,r)$(xm0(k,r) ne 0) = tm0(k,r)/(er0*wpm0(k,r)*xm0(k,r)) ;
pm0(k,r) = er0*wpm0(k,r)*(1+tm0(k,r)) ;

* ----- Calculate pre-FOB price of exports

xe0(k,r) = (sum(k0$(mapk(k0,k)),sum(r0$(mapr(r0,r)),sam0(k0,r0))))/(er0*wpe0(k,r)) ;
te0(k,r) = er0*wpe0(k,r)*xe0(k,r) - (sum(k0$(mapk(k0,k)),sum(r0$(mapr(r0,r)),wtf_pe0(r0,k0)))) ;
te0(k,r)$(xe0(k,r) ne 0) = te0(k,r)/(er0*wpe0(k,r)*xe0(k,r) - te0(k,r)) ;
pe0(k,r) = (er0*wpe0(k,r))/(1+te0(k,r)) ;

* ----- Calculate the Armington aggregate

xap0(k,j) = (sum(k0$(mapk(k0,k)),sum(j0$(mapi(j0,j)),sam0(k0,j0))))/pa0(k) ;
xac0(k,h) = sum(h0$maph(h0,h),sum(i$mapik(i,k),sum(i0$mapi(i0,i),sam0(i0,h0)))) ;
*display xac0 ;
xac0(k,h) = (xac0(k,h)+sum(h0$maph(h0,h),sum(k0$mapk(k0,k),sam0(k0,h0))))/pa0(k) ;
*display xac0 ;
*xac0(k,h) = (sum(h0$(maph(h0,h)),sum(k0$(mapk(k0,k)),sam0(k0,h0))))/pa0(k) ;
xaf0(k,f) = sum(k0$mapk(k0,k),sum(f0$mapf(f0,f),sam0(k0,f0)))/pa0(k) ;
**xaf0("CEnergy","gov") = xaf0("CEnergy","gov") + .001 ;
* ----- Calculate the indirect taxes on production and final demand

tcp0(k,j) = sum(k0$(mapk(k0,k)),sum(j0$(mapi(j0,j)),patax0(k0,j0))) ;
tcp0(k,j)$(xap0(k,j) ne 0) = tcp0(k,j)/(pa0(k)*xap0(k,j)) ;

tcc0(k,h) = sum(h0$(maph(h0,h)),sum(k0$(mapk(k0,k)),fdtax0(k0,h0))) ;
tcc0(k,h)$(xac0(k,h) ne 0) = tcc0(k,h)/(pa0(k)*xac0(k,h)) ;

tcf0(k,f) = sum(f0$(mapf(f0,f)),sum(k0$(mapk(k0,k)),fdtax0(k0,f0))) ;
tcf0(k,f)$(xaf0(k,f) ne 0) = tcf0(k,f)/(pa0(k)*xaf0(k,f)) ;


* ----- Initialize the demand for domestic trade and transport services
* !!!!! Assume it is only for one sector for the moment

xamg0(k,kk,"d") = (sum(k0$mapk(k0,k),sum(kk0$mapk(kk0,kk),sam0(k0,kk0))))/pa0(k) ;
ptmg0(kk,"d")   = 1 ;
ytmg0(kk,"d")   = sum(k,pa0(k)*xamg0(k,kk,"d")) ;
xtmg0(kk,"d")   = ytmg0(kk,"d")/ptmg0(kk,"d") ;

xa0(k)  = sum(j,xap0(k,j)) + sum(h,xac0(k,h)) + sum(f,xaf0(k,f)) + sum(kk, xamg0(k,kk,"d")) ;

* ----- Initialize production

* ----- First, aggregate value added

sam(s,ss)  = 0 ;
sam(v,j)   = sum(v0$(mapv(v0,v)),sum(j0$(mapi(j0,j)),sam0(v0,j0))) ;
vatax(v,j) = sum(v0$(mapv(v0,v)),sum(j0$(mapi(j0,j)),vatax0(v0,j0))) ;

* ----- Production will be divided by the relevant price below,
*       after figuring whether the law of one price holds

ld0(j,l)  = sum(l0$(mapv(l0,l)),sum(j0$(mapi(j0,j)),labvol0(j0,l0))) ;
wage0(j,l) = 1 ;
wage0(j,l)$(ld0(j,l) ne 0) = sam(l,j)/ld0(j,l) ;
*display wage0 ;
*ld0(j,l)  = sam(l,j)/wage0(j,l) ;
tfl0(j,l)$(ld0(j,l) gt 0) = vatax(l,j)/(wage0(j,l)*ld0(j,l) - vatax(l,j)) ;

kd0(j,kt) = sam(kt,j)/rent0(j,kt) ;
tfk0(j,kt)$(kd0(j,kt) gt 0) = vatax(kt,j)/(rent0(j,kt)*kd0(j,kt) - vatax(kt,j)) ;

td0(j,lt) = sam(lt,j)/pt0(j,lt) ;
tft0(j,lt)$(td0(j,lt) gt 0) = vatax(lt,j)/(pt0(j,lt)*td0(j,lt) - vatax(lt,j)) ;

rd0(j) = sum(nr,sam(nr,j))/pr0(j) ;
tfr0(j)$(rd0(j) gt 0) = sum(nr,vatax(nr,j)/(pr0(j)*rd0(j) - vatax(nr,j))) ;

*display tfk0, tft0, tfr0 ;

*tp0(j)    = sum(j0$(mapi(j0,j)),sam0("prdtx",j0)) ;
tp0(j) = 0 ;

xp0(j)    = sum(k,(1+tcp0(k,j))*pa0(k)*xap0(k,j)) + sum(l,wage0(j,l)*ld0(j,l))
          + sum(kt,rent0(j,kt)*kd0(j,kt)) + sum(lt,pt0(j,lt)*td0(j,lt)) + pr0(j)*rd0(j) + tp0(j) ;

tp0(j)    = tp0(j)/(xp0(j) - tp0(j)) ;

* ----- Initialize aggregate commodity supply and calibrate

x0(k)     = sum(i$mapik(i,k),xp0(i)) ;

*display xp0, x0 ;

* ----- Calculate the commodity-specific trade margin

tmg0(kk,"d") = ytmg0(kk,"d")/(x0(kk) + sum(r,pm0(kk,r)*xm0(kk,r))) ;
tmg0(kk,mg)  = tmg0(kk,"d") ;

* ----- Calculate aggregate imports

xmt0(k) = sum(r,pm0(k,r)*(1+tmg0(k,"m"))*xm0(k,r))/pmt0(k) ;

* ----- The export price should now reflect the producer price, i.e. net of the margin

pe0(k,r) = pe0(k,r)/(1+tmg0(k,"x")) ;

sigmax(k) = KeyComm(k,"sigmax") ;
sigmaz(k) = KeyComm(k,"sigmaz") ;
sigmac(k) = KeyComm(k,"sigmac") ;
sigmac(k)$(sigmac(k) eq 1) = 1.01 ;

* !!!! Re-base pet0 if the law of one price holds
* !!!! This would pose a problem if there are multiple trading partners with destination
*      specific export tariffs. In such a case, it would be better to use a finite
*      transformation elasticity, even if high.

loop(k$(sigmaz(k) eq inf), loop(r$(ord(r) eq 1), pet0(k) = pe0(k,r) ; ) ; ) ;

* Re-base pd0 if the law of one-price-holds

pd0(k)$(sigmax(k) eq inf) = pet0(k) ;
p0(k)$(sigmax(k) eq inf)  = pet0(k) ;
loop(k$(sigmac(k) eq inf),
   loop(i$mapik(i,k),
      pp0(i) = p0(k) ;
   ) ;
) ;

* Re-base output

xp0(i) = xp0(i)/pp0(i) ;
x0(k)  = x0(k)/p0(k) ;

* ------------------------------------------------------------------------------
*
* Initialize and calibrate the production block
*
* ------------------------------------------------------------------------------

* ----- Initialize prices and productivity parameters

lambdal0(i,l)  = 1 ;
lambdak0(i,kt) = 1 ;
lambdat0(i,lt) = 1 ;
lambdar0(i)    = 1 ;

ac(i,k)   = 0 ;

loop(k,
   if (sigmac(k) ne inf,
      loop(i$mapik(i,k),
         ac(i,k) = (xp0(i)/x0(k))*(pp0(i)/p0(k))**sigmac(k) ;
      ) ;
   ) ;
) ;

* ----- Calibrate the unskilled labor bundle

pusk0(j)  = 1 ;
usk0(j)   = sum(ul,wage0(j,ul)*ld0(j,ul))/pusk0(j) ;
sigmau(j) = KeySect(j,"sigmau") ;
sigmau(j)$(sigmau(j) eq 1) = 1.01 ;
al(j,ul)$(ld0(j,ul) ne 0) = (ld0(j,ul)/usk0(j))*((wage0(j,ul)/pusk0(j))**sigmau(j))*(lambdal0(j,ul)**(1-sigmau(j))) ;

* ----- Calibrate the skilled labor bundle

pskl0(j)  = 1 ;
skl0(j)   = sum(sl,wage0(j,sl)*ld0(j,sl))/pskl0(j) ;
sigmas(j) = KeySect(j,"sigmas") ;
sigmas(j)$(sigmas(j) eq 1) = 1.01 ;
al(j,sl)$(ld0(j,sl) ne 0) = (ld0(j,sl)/skl0(j))*((wage0(j,sl)/pskl0(j))**sigmas(j))*(lambdal0(j,sl)**(1-sigmas(j))) ;

* ----- Calibrate the aggregate capital bundle

pktd0(j) = 1 ;
ktd0(j)  = sum(kt, rent0(j,kt)*kd0(j,kt))/pktd0(j) ;
sigmak(j) = KeySect(j,"sigmak") ;
sigmak(j)$(sigmak(j) eq 1) = 1.01 ;
ak(j,kt)$(kd0(j,kt) ne 0) = (kd0(j,kt)/ktd0(j))*((rent0(j,kt)/pktd0(j))**sigmak(j))*(lambdak0(j,kt)**(1-sigmak(j))) ;

* ----- Calibrate the aggregate land bundle

pttd0(j) = 1 ;
ttd0(j)  = sum(lt, pt0(j,lt)*td0(j,lt))/pttd0(j) ;
sigmat(j) = KeySect(j,"sigmat") ;
sigmat(j)$(sigmat(j) eq 1) = 1.01 ;
at(j,lt)$(td0(j,lt) ne 0) = (td0(j,lt)/ttd0(j))*((pt0(j,lt)/pttd0(j))**sigmat(j))*(lambdat0(j,lt)**(1-sigmat(j))) ;

* ----- Calibrate the KSK bundle

pksk0(j)  = 1 ;
ksk0(j)   = (pktd0(j)*ktd0(j) + pskl0(j)*skl0(j))/pksk0(j) ;
sigmaks(j) = KeySect(j,"sigmaks") ;
sigmaks(j)$(sigmaks(j) eq 1) = 1.01 ;
as(j)$(skl0(j) ne 0)  = (skl0(j)/ksk0(j))*((pskl0(j)/pksk0(j))**sigmaks(j)) ;
akt(j)$(ktd0(j) ne 0) = (ktd0(j)/ksk0(j))*((pktd0(j)/pksk0(j))**sigmaks(j)) ;

* ----- Calibrate the KL bundle

pkl0(j)  = 1 ;
kl0(j)   = (pusk0(j)*usk0(j) + pksk0(j)*ksk0(j))/pkl0(j) ;
sigmakl(j) = KeySect(j,"sigmakl") ;
sigmakl(j)$(sigmakl(j) eq 1) = 1.01 ;
au(j)$(usk0(j) ne 0)  = (usk0(j)/kl0(j))*((pusk0(j)/pkl0(j))**sigmakl(j)) ;
aksk(j)$(kl0(j) ne 0) = (ksk0(j)/kl0(j))*((pksk0(j)/pkl0(j))**sigmakl(j)) ;

* ----- Calibrate the value added bundle

pva0(j)   = 1 ;
va0(j)    = (pkl0(j)*kl0(j) + pr0(j)*rd0(j) + pttd0(j)*ttd0(j))/pva0(j) ;
sigmav(j) = KeySect(j,"sigmav") ;
sigmav(j)$(sigmav(j) eq 1) = 1.01 ;
akl(j)$(kl0(j) ne 0)  = (kl0(j)/va0(j))*((pkl0(j)/pva0(j))**sigmav(j)) ;
att(j)$(ttd0(j) ne 0) = (ttd0(j)/va0(j))*((pttd0(j)/pva0(j))**sigmav(j)) ;
ar(j)$(rd0(j) ne 0)  = (rd0(j)/va0(j))*((pr0(j)/pva0(j))**sigmav(j)) ;

* ----- Calibrate the top level bundle

px0(j)    = pp0(j)/(1+tp0(j)) ;
pnd0(j)   = 1 ;
nd0(j)    = (sum(k,(1+tcp0(k,j))*pa0(k)*xap0(k,j)))/pnd0(j) ;
sigmap(j) = KeySect(j,"sigmap") ;
sigmap(j)$(sigmap(j) eq 1) = 1.01 ;
ava(j)    = (va0(j)/xp0(j))*((pva0(j)/px0(j))**sigmap(j)) ;
and(j)    = (nd0(j)/xp0(j))*((pnd0(j)/px0(j))**sigmap(j)) ;

* ----- Calibrate the IO coefficients

a(k,j)$(nd0(j) ne 0) = xap0(k,j)/nd0(j) ;

* ------------------------------------------------------------------------------
*
* Initialize and calibrate the demand block
*
* ------------------------------------------------------------------------------

* ---- Initialize household variables

htrh0(h,hh) = sum(h0$(maph(h0,h)),sum(hh0$(maph(hh0,hh)),sam0(h0,hh0))) ;
kappah0(h)  = sum(h0$(maph(h0,h)),sam0("dirtx",h0)) ;
taxadjh0    = 1 ;
htrw0(h)    = sum(h0$(maph(h0,h)),sam0("row",h0)) ;
savh0(h)    = sum(h0$(maph(h0,h)),sam0("inv",h0)) ;
*savh0(h)    = sum(h0$(maph(h0,h)),sam0("inv",h0) + sam0("depry",h0)) ;

htr0(h)     = sum(hh,htrh0(hh,h)) + htrw0(h) ;

yh0(h)      = sum(k,(1+tcc0(k,h))*pa0(k)*xac0(k,h)) + htr0(h) + kappah0(h) + savh0(h) ;
yd0(h)      = sum(k,(1+tcc0(k,h))*pa0(k)*xac0(k,h)) + savh0(h) ;

kappah0(h) = kappah0(h)/yh0(h) ;
asav(h)    = savh0(h)/yd0(h) ;

*display yh0, kappah0, yd0 ;

ahtr(h) = htr0(h)/((1-kappah0(h))*yh0(h)) ;
ahtrh(h,hh)$(htr0(hh) ne 0) = htrh0(h,hh)/htr0(hh) ;
ahtrw(h)$(htr0(h) ne 0)     = htrw0(h)/htr0(h) ;

* ----- Calculate the maximum share in domestic transfers to guarantee
*       that the shares add up to 1

loop(h,
   delta = sum(hh, ahtrh(hh,h)) + ahtrw(h) ;

   work = -inf ;
   if (sum(hh,ahtrh(hh,h)) ne 0,
      loop(hh,
         if (ahtrh(hh,h) gt work,
            work = ahtrh(hh,h) ;
            index = ord(hh) ;
         ) ;
      ) ;
   ) ;
   loop(hh$(ord(hh) eq index), ahtrh(hh,h) = ahtrh(hh,h) + (1-delta) ; ) ;
) ;

* ----- Calibrate the ELES system

eta(k,h)$xac0(k,h) = sum(h0$maph(h0,h),sum(k0$mapk(k0,k),eta0(k0,h0)*(xac0(k,h)*(1+tcc0(k,h))*pa0(k))))/
           sum(h0$maph(h0,h),sum(k0$mapk(k0,k),(xac0(k,h)*(1+tcc0(k,h))*pa0(k))));

*display eta ;
if(0,

*  Use the standard ELES calibration

   thetav.l(k,h) = 0.1*xac0(k,h) ;
   share0(k,h)   = (1+tcc0(k,h))*pa0(k)*xac0(k,h)/yd0(h) ;
   mu(k,h)       = eta(k,h)*share0(k,h) ;
   mus(h)  = 1 - sum(k,mu(k,h)) ;
   etas(h)$(savh0(h) ne 0) = mus(h)/(savh0(h)/yd0(h)) ;
*   display mus, etas ;

   solve eles using mcp ;

   theta(k,h) = thetav.l(k,h) ;

else

*  Use the Frisch parameter technique

*  Adjust the eta parameters so that the normalization conditions holds

   eta(k,h)$(xac0(k,h) eq 0) = 0 ;

   share0(k,h)   = (1+tcc0(k,h))*pa0(k)*xac0(k,h)/(yd0(h)-savh0(h)) ;

*   display eta ;

   eta(k,h) = eta(k,h) + share0(k,h)*(1-sum(kk,share0(kk,h)*eta(kk,h)))/sum(kk,share0(kk,h)*share0(kk,h)) ;

*   display eta ;

*  Calibrate mu and theta

   mu(k,h)    = eta(k,h)*share0(k,h) ;
   theta(k,h) = xac0(k,h)*(1+eta(k,h)/frisch(h)) ;

   loop(h, work = 1000000*(sum(k,eta(k,h)*share0(k,h))) ; 
*  display work 
) ;

*   display theta ;
) ;

cpi0(h)      = 1 ;

* ----- Final demand expenditures

pf0(f) = 1 ;
xf0(f) = (sum(k,(1+tcf0(k,f))*pa0(k)*xaf0(k,f)))/pf0(f) ;
yf0(f) = pf0(f)*xf0(f) ;

sigmaf(f)$(sigmaf(f) eq 1) = 1.01 ;
af(k,f)$(xf0(f) ne 0) = (xaf0(k,f)/xf0(f))*((1+tcf0(k,f))*pa0(k)/pf0(f))**sigmaf(f) ;


* ----- Domestic demand for domestic production

xdd0(k) = (pa0(k)*xa0(k) - pmt0(k)*xmt0(k))/((1+tmg0(k,"d"))*pd0(k)) ;

* ----- Calibrate the second level Armington function

sigmaw(k) = KeyComm(k,"sigmaw") ;
sigmaw(k)$(sigmaw(k) eq 1) = 1.01 ;

aw(k,r)$(xmt0(k) ne 0) = (xm0(k,r)/xmt0(k))*(pm0(k,r)*(1+tmg0(k,"m"))/pmt0(k))**sigmaw(k) ;

* ----- Calibrate the first level Armington demand function

sigmam(k) = KeyComm(k,"sigmam") ;
sigmam(k)$(sigmam(k) eq 1) = 1.01 ;

ad(k) = (xdd0(k)/xa0(k))*(pd0(k)*(1+tmg0(k,"d"))/pa0(k))**sigmam(k) ;
am(k) = (xmt0(k)/xa0(k))*(pmt0(k)/pa0(k))**sigmam(k) ;
*display am ;

* ----- Calibrate the export system

xds0(k)  = xdd0(k) ;

xet0(k) = sum(r,pe0(k,r)*xe0(k,r))/pet0(k) ;

* ----- Top level CET

loop(k$(x0(k) ne 0),
   if (sigmax(k) ne inf,
      gd(k) = (xds0(k)/x0(k))*(p0(k)/pd0(k))**sigmax(k) ;
      ge(k) = (xet0(k)/x0(k))*(p0(k)/pet0(k))**sigmax(k) ;
   ) ;
) ;

* ----- Second level CET

loop(k$(xet0(k) ne 0),
   if (sigmaz(k) ne inf,
      gx(k,r) = (xe0(k,r)/xet0(k))*(pet0(k)/pe0(k,r))**sigmaz(k) ;
   ) ;
) ;

* ----- Export demand

ed0(k,r) = xe0(k,r) ;
wpendx0(k,r) = wpe0(k,r) ;
* !!!!! Data entry should be split by region of destination
etae(k,r) = KeyComm(k,"etae") ;
ae(k,r)$(etae(k,r) ne inf) = ed0(k,r)*(wpe0(k,r)/wpendx0(k,r))**etae(k,r) ;
ae0(k,r) = ae(k,r) ;

* ----- Finish updating margin variables

*display xamg0 ;

amg(k,kk,mg)$(xamg0(k,kk,"d") ne 0) = xamg0(k,kk,"d")/xtmg0(kk,"d") ;

ptmg0(k,mg)  = 1 ;
ytmg0(k,"d") = pd0(k)*tmg0(k,"d")*xdd0(k) ;
ytmg0(k,"m") = sum(r,pm0(k,r)*tmg0(k,"m")*xm0(k,r)) ;
ytmg0(k,"x") = sum(r,pe0(k,r)*tmg0(k,"x")*xe0(k,r)) ;
xtmg0(k,mg)  = ytmg0(k,mg)/ptmg0(k,mg) ;
xamg0(k,kk,mg) = amg(k,kk,mg)*xtmg0(kk,mg) ;

*display xamg0 ;

* ------------------------------------------------------------------------------
*
* Initialize and calibrate income distribution
*
* ------------------------------------------------------------------------------

* ----- Capital income

sam(e,v)      = sum(e0$(mape(e0,e)),sum(v0$(mapv(v0,v)),sam0(e0,v0))) ;
sam(h,v)      = sum(h0$(maph(h0,h)),sum(v0$(mapv(v0,v)),sam0(h0,v0))) ;
sam("row",v)  = sum(v0$(mapv(v0,v)),sam0("row",v0)) ;

ky0(kt)   = sum(i,rent0(i,kt)*kd0(i,kt)/(1+tfk0(i,kt))) ;

ktre0(kt) = sum(e,sam(e,kt)) ;
ktrh0(kt) = sum(h,sam(h,kt)) ;
ktrw0(kt) = sam("row",kt) ;

chk1 = sum(kt, ktre0(kt)+ktrh0(kt)+ktrw0(kt)) ;
*display chk1, ky0 ;

$ontext
sam(e,kt) = sam(e,kt)*ky0(kt)/chk1 ;
sam(h,kt) = sam(h,kt)*ky0(kt)/chk1 ;
sam("row",kt) = sam("row",kt)*ky0(kt)/chk1 ;
ktre0(kt) = sum(e,sam(e,kt)) ;
ktrh0(kt) = sum(h,sam(h,kt)) ;
ktrw0(kt) = sam("row",kt) ;
$offtext

* ----- Calibrate the aggregate shares

xkht(kt)  = ktrh0(kt)/ky0(kt) ;
xket(kt)  = ktre0(kt)/ky0(kt) ;
xkwt(kt)  = 1 - xkht(kt) - xket(kt) ;

* ----- Calibrate the sub-aggregate shares

xkh(kt,h)$(ktrh0(kt) ne 0) = sam(h,kt)/ktrh0(kt) ;
xke(kt,e)$(ktre0(kt) ne 0) = sam(e,kt)/ktre0(kt) ;
xkw(kt)$(ktrw0(kt) ne 0)   = sam("row",kt)/ktrw0(kt) ;

chk1 = sum(kt,sum(h, xkh(kt,h))) ;
*display chk1 ;
chk1 = sum(kt,sum(e, xke(kt,e))) ;
*display chk1 ;
chk1 = sum(kt,xkw(kt)) ;
*display chk1 ;

* ---- Make sure the shares sum to 1 by assigning any discrepancy to the highest share

loop(kt,
   if (ktrh0(kt) ne 0,
      delta = sum(h, xkh(kt,h)) ;

      if (sum(h, xkh(kt,h)) ne 0,
         work = -inf ;
         loop(h,
            if (xkh(kt,h) gt work,
               work = xkh(kt,h) ;
               index = ord(h) ;
            ) ;
         ) ;
         loop(h$(ord(h) eq index), xkh(kt,h) = xkh(kt,h) + (1-delta) ; ) ;
      ) ;
   ) ;

   if (ktre0(kt) ne 0,
      delta = sum(e, xke(kt,e)) ;

      work = -inf ;
      loop(e,
         if (xke(kt,e) gt work,
            work = xke(kt,e) ;
            index = ord(e) ;
         ) ;
      ) ;
      loop(e$(ord(e) eq index), xke(kt,e) = xke(kt,e) + (1-delta) ; ) ;
   ) ;

) ;

* ----- Land income

ty0(lt)   = sum(i,pt0(i,lt)*td0(i,lt)/(1+tft0(i,lt))) ;

* ----- Calibrate the sub-aggregate shares

xth(lt,h)$(ty0(lt) ne 0) = sam(h,lt)/ty0(lt) ;

chk1 = sum(lt,sum(h,xth(lt,h))) ;

*display chk1 ;

* ---- Make sure the shares sum to 1 by assigning any discrepancy to the highest share

loop(lt,
   if (ty0(lt) ne 0,
      delta = sum(h, xth(lt,h)) ;

      work = -inf ;
      loop(h,
         if (xth(lt,h) gt work,
            work = xth(lt,h) ;
            index = ord(h) ;
         ) ;
      ) ;
      loop(h$(ord(h) eq index), xth(lt,h) = xth(lt,h) + (1-delta) ; ) ;
   ) ;
) ;

chk1 = sum(lt,sum(h,xth(lt,h))) ;

*display chk1 ;

* ----- Labor income

ly0(l)   = sum(i,wage0(i,l)*ld0(i,l)/(1+tfl0(i,l))) ;

xlh(h,l) = sam(h,l)/ly0(l) ;

* ---- Make sure the shares sum to 1 by assigning any discrepancy to the highest share

loop(l,
   delta = sum(h, xlh(h,l)) ;

   work = -inf ;
   loop(h,
      if (xlh(h,l) gt work,
         work = xlh(h,l) ;
         index = ord(h) ;
      ) ;
   ) ;
   loop(h$(ord(h) eq index), xlh(h,l) = xlh(h,l) + (1-delta) ; ) ;

   delta = sum(h, xlh(h,l)) ;
) ;

* ----- Income from sector specific resource

ry0      = sum(i,pr0(i)*rd0(i)/(1+tfr0(i))) ;

xrh(h)$(ry0 ne 0) = sam(h,"natrs")/ry0 ;

* ---- Make sure the shares sum to 1 by assigning any discrepancy to the highest share

if(ry0 ne 0,
   delta = sum(h, xrh(h)) ;

   work = -inf ;
   loop(h,
      if (xrh(h) gt work,
         work = xrh(h) ;
         index = ord(h) ;
      ) ;
   ) ;
   loop(h$(ord(h) eq index), xrh(h) = xrh(h) + (1-delta) ; ) ;

) ;

* ----- Corporate income

cy0(e)     = sum(kt,xke(kt,e)*ktre0(kt)) ;
taxadjc0  = 1 ;
kappac0(e)$(cy0(e) ne 0) = sum(e0$mape(e0,e),sam0("dirtx",e0)-sam0(e0,"gov"))/cy0(e) ;

savc0(e)                   = sum(e0$mape(e0,e),sam0("inv",e0)) ;
csavrate0(e)$(cy0(e) ne 0) = savc0(e)/((1-kappac0(e))*cy0(e)) ;

ctrh0(e) = sum(h0,sum(e0$mape(e0,e),sam0(h0,e0))) ;
ctrw0(e) = sum(r0,sum(e0$mape(e0,e),sam0(r0,e0)-sam0(e0,r0))) ;

xcht(e)$(cy0(e) ne 0) = ctrh0(e)/((1-kappac0(e))*cy0(e)) ;
xcwt(e)$(cy0(e) ne 0) = 1 - csavrate0(e) - xcht(e) ;

xch(e,h)$(ctrh0(e) ne 0) = sum(h0$maph(h0,h),sum(e0$mape(e0,e),sam0(h0,e0)))/ctrh0(e) ;
xcw(e)$(ctrw0(e) ne 0) = sum(e0$mape(e0,e),sam0("row",e0)-sam0(e0,"row"))/ctrw0(e) ;

* ---- Make sure the shares sum to 1 by assigning any discrepancy to the highest share

loop(e,

   delta = sum(h, xch(e,h)) ;
   work = -inf ;
   loop(h,
      if (xch(e,h) gt work,
         work = xch(e,h) ;
         index = ord(h) ;
      ) ;
   ) ;
   loop(h$(ord(h) eq index), xch(e,h) = xch(e,h) + (1-delta) ; ) ;

) ;

* ----- Other sources of income

gtrh0(h) = sum(h0$(maph(h0,h)),sam0(h0,"gov")) ;
wtrh0(h) = sum(h0$(maph(h0,h)),sam0(h0,"row"))/er0 ;

* ------------------------------------------------------------------------------
*
* Initialize and calibrate government accounts
*
* ------------------------------------------------------------------------------

wtrg0 = sam0("gov","row")/er0 ;

tmadj0 = 1 ;
tary0  = sum(k,sum(r,tmadj0*tm0(k,r)*er0*wpm0(k,r)*xm0(k,r))) ;
rtary0 = tary0 ;

gy0 = sum(i,tp0(i)*px0(i)*xp0(i))
    + sum(k,pa0(k)*(sum(j,tcp0(k,j)*xap0(k,j))+sum(h,tcc0(k,h)*xac0(k,h))+sum(f,tcf0(k,f)*xaf0(k,f))))
    + tary0 + sum(k,sum(r,te0(k,r)*(1+tmg0(k,"x"))*pe0(k,r)*xe0(k,r)))
    + sum(lt,sum(i,tft0(i,lt)*pt0(i,lt)*td0(i,lt)/(1+tft0(i,lt))))
    + sum(kt,sum(i,tfk0(i,kt)*rent0(i,kt)*kd0(i,kt)/(1+tfk0(i,kt))))
    + sum(l,sum(i,tfl0(i,l)*wage0(i,l)*ld0(i,l)/(1+tfl0(i,l))))
    + sum(i,tfr0(i)*pr0(i)*rd0(i)/(1+tfr0(i)))
    + sum(e,kappac0(e)*cy0(e)) + sum(h,kappah0(h)*yh0(h)) + er0*wtrg0 ;

gtrw0 = sam0("row","gov")/er0 ;
gexp0 = yf0("gov") + sum(h,gtrh0(h)) + gtrw0 ;

*display gy0, gexp0, te0 ;
savg0 = gy0 - gexp0 ;
rsg0  = savg0/plev0 ;

* ------------------------------------------------------------------------------
*
* Initialize and calibrate factor markets
*
* ------------------------------------------------------------------------------

* ----- Labor markets

ls0(l,"Tot") = sum(i,ld0(i,l)) ;
ewage0(l,"Tot")$(omegam(l) eq inf) = sum(i,ld0(i,l)*wage0(i,l))/ls0(l,"Tot") ;
phil(i,l)$(omegam(l) eq inf) = wage0(i,l)/ewage0(l,"Tot") ;

als(l,"Tot")$(omegam(l) eq inf) = ls0(l,"Tot")*(plev0/ewage0(l,"Tot"))**omegal(l,"Tot") ;

loop(l$(omegam(l) ne inf),
   awage0(l,gz2) = sum(i$mapg(i,gz2),wage0(i,l)*ld0(i,l)/(1+tfl0(i,l)))
                 / sum(i$mapg(i,gz2),ld0(i,l)) ;
   ewage0(l,gz2) = 1 ;
   loop(gz2,loop(i$mapg(i,gz2), phil(i,l) = wage0(i,l)/ewage0(l,gz2) ; )) ;
   ls0(l,gz2) = sum(i$mapg(i,gz2),ld0(i,l)) ;
   chim(l) = migr0(l)*(awage0(l,"rur")/awage0(l,"urb"))**omegam(l) ;
   lslag(l,"Rur") = (ls0(l,"Rur")+migr0(l))/(1+glab0(l,"Rur")) ;
   lslag(l,"Urb") = (ls0(l,"Urb")-migr0(l))/(1+glab0(l,"Urb")) ;
) ;

* ----- Capital markets

ptks0(kt)  = 1 ;
pk0        = 1 ;
tks0(kt)   = sum(i,rent0(i,kt)*kd0(i,kt)/(1+tfk0(i,kt)))/ptks0(kt) ;
ks0(i,kt)  = kd0(i,kt) ;

*display rent0, kd0, ptks0 ;

ksup0      = sum(kt, ptks0(kt)*tks0(kt))/pk0 ;

loop(kt$(tks0(kt) ne 0),
   if(omegak(kt) ne inf,
      aks(i,kt) = (ks0(i,kt)/tks0(kt))*((1+tfk0(i,kt))*ptks0(kt)/rent0(i,kt))**omegak(kt) ;
   ) ;

   if (omegakt ne inf,
      akst(kt) = (tks0(kt)/ksup0)*(pk0/ptks0(kt))**omegakt ;
   ) ;
) ;

* ----- Land markets

ts0(i,lt) = td0(i,lt) ;
pland0    = 1+0*uniform(0.5,4) ;
ptts0(lt) = 1 ;

tts0(lt) = sum(i,pt0(i,lt)*td0(i,lt)/(1+tft0(i,lt)))/ptts0(lt) ;
land0    = sum(lt,ptts0(lt)*tts0(lt))/pland0 ;

if (land0 ne 0 and omegatl ne inf,
   atts(lt) = (tts0(lt)/land0)*(pland0/ptts0(lt))**omegatl ;
) ;

loop(lt,
   if (tts0(lt) ne 0 and omegat(lt) ne inf,
      ats(i,lt) = (ts0(i,lt)/tts0(lt))*((1+tft0(i,lt))*ptts0(lt)/pt0(i,lt))**omegat(lt) ;
   ) ;
) ;

* ----- Market for sector specific resource

rs0(i) = rd0(i) ;

loop(i$(rs0(i) ne 0),
   if (omegar(i) ne inf,
      ars(i) = rs0(i)*(plev0/pr0(i))**omegar(i) ;
   ) ;
) ;

* ------------------------------------------------------------------------------
*
* Miscellaneous initializations
*
* ------------------------------------------------------------------------------

savf0   = (sam0("inv","row")-sam0("row","inv"))/er0 ;

gdpmp0  = sum(k,sum(h,xac0(k,h)*(1+tcc0(k,h))*pa0(k))) + sum(k,sum(f,pa0(k)*(1+tcf0(k,f))*xaf0(k,f)))
        + sum(k,sum(r,er0*wpe0(k,r)*xe0(k,r)))
        - sum(k,sum(r,er0*wpm0(k,r)*xm0(k,r))) ;

rgdpmp0 = gdpmp0 ;
pgdpmp0 = 1 ;

gdpfc0  = sum(i,sum(l,wage0(i,l)*lambdal0(i,l)*ld0(i,l)))
        + sum(kt,sum(i,rent0(i,kt)*lambdak0(i,kt)*kd0(i,kt)))
        + sum(i,pr0(i)*lambdar0(i)*rd0(i))
        + sum(lt,sum(i,pt0(i,lt)*lambdat0(i,lt)*td0(i,lt))) ;

rgdpfc0 = gdpfc0 ;
pgdpfc0 = 1 ;

pop0(h)   = 0.01*tpop0*sum(h0$(maph(h0,h)),popsh0(h0)) ;
gl0       = 0 ;
ggdp0     = 0 ;
geg0(k,j) = 1 ;
gce0(k,h) = 1 ;
chil(i,l) = 0 ;

* Rescale theta relative to population

theta(k,h) = theta(k,h)/pop0(h) ;

walras0 =  sum(r,sum(k,wpe0(k,r)*xe0(k,r))) + sum(h,wtrh0(h)) + wtrg0 + savf0
        -  sum(r,sum(k,wpm0(k,r)*xm0(k,r))) 
        - (sum(h,htrw0(h)) + gtrw0 + sum(e,ctrw0(e)) + sum(kt,ktrw0(kt)))/er0;
