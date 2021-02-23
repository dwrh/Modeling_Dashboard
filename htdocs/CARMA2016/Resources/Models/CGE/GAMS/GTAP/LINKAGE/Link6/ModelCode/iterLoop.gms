* --------------------------------------------------------------------
*
*  LINK5 -- Applied General Equilibrium Model
*
*  Actions taken at the beginning of each iteration loop in a dynamic
*     scenario.
*
*  Based on GTAP Version 5.4
*
* --------------------------------------------------------------------

* ----- Gap contains the number of years between simulation periods
*       year contains the numeric value of the current year

gap  = years(t) - year ;
year = years(t) ;
obj.l   = year ;

* ----- Re-calibrate production shares for vintage capital

$include "recal.gms"

* --------------------------------------------------------------------
*
*  Update the lagged variables
*
* --------------------------------------------------------------------

rgdpmpLag(r)       = rgdpmp.l(r) ;
popLag(r,tranche)  = pop.l(r,tranche) ;
rgdpLag(r)         = rgdp.l(r) ;
apsLag(r,h)        = aps.l(r,h) ;
lambdakLag(r,i,v)  = lambdak.l(r,i,v) ;
lambdalLag(r,ll,i) = lambdal.l(r,ll,i) ;
lambdatLag(r,i)    = lambdat.l(r,i) ;
lambdafLag(r,i)    = lambdaf.l(r,i) ;
tiLag(r)           = fdvol.l(r,"Inv") ;
tgLag(r)           = fdvol.l(r,"Gov") ;
kstockLag(r)       = kstock.l(r) ;
rratLag(r,i)       = rent.l(r,i,"Old")/rent.l(r,i,"New") ;

* --------------------------------------------------------------------
*
*  Fix the dynamic variables
*
* --------------------------------------------------------------------

hpop.fx(r,h)       = hpop.l(r,h)*(1+gpopT(r,t)/100)**gap ;
loop(r,
*  Make sure population adds up
*  Assume growth rates for population and G15 tranche are good
*  Adjust the dependency rates
   pop.fx(r,"Tot")    = pop.l(r,"Tot")*(1+gpopT(r,t)/100)**gap ;
   pop.fx(r,"G15")    = pop.l(r,"G15")*(1+glabT(r,t)/100)**gap ;
   pop.fx(r,"L15")    = depratT(r,"L15",t)*pop.l(r,"G15") ;
   pop.fx(r,"G65")    = depratT(r,"G65",t)*pop.l(r,"G15") ;
   work = (pop.l(r,"Tot") - pop.l(r,"G15"))
        / (pop.l(r,"G15")*(depratT(r,"L15",t)+depratT(r,"G65",t))) ;
   pop.fx(r,"L15") = pop.l(r,"L15")*work ;
   pop.fx(r,"G65") = pop.l(r,"G65")*work ;
   deprat.fx(r,"L15") = pop.l(r,"L15")/pop.l(r,"G15") ;
   deprat.fx(r,"G65") = pop.l(r,"G65")/pop.l(r,"G15") ;
   deprat.fx(r,"Tot") = deprat.l(r,"L15") + deprat.l(r,"G65") ;
) ;

prodshft(r,i)      = prodshftT(r,i,t)/100 ;
ebar0(r,i)         = esT0(r,i,t) ;

depr(r)            = deprT(r,t) ;

*  Productivity factors

lambdat.fx(r,i)    = lambdat.l(r,i)*(1+gtT(r,t)/100)**gap ;
lambdaf.fx(r,i)    = lambdaf.l(r,i)*(1+gfT(r,t)/100)**gap ;
lambdaep.fx(r,e,j) = lambdaep.l(r,e,j)*(1+geT(r,e,j,t)/100)**gap ;

* !!!! Productivity growth rates for fertilizer and feeds need to be entered

lambdaft.fx(r,ft,cr) = lambdaft.l(r,ft,cr)*(1+0.0/100)**gap ;
lambdafd.fx(r,fd,lv) = lambdafd.l(r,fd,lv)*(1+0.0/100)**gap ;

* !!!! Uniform productivity growth rates need to be entered

*  g(r,cr)      = g(r,cr)*(1+gT(r,t)/100)**gap ;
*  g(r,lv)      = g(r,cr)*(1+gT(r,t)/100)**gap ;
*  g(r,i)        = g(r,i)*(1+gT(r,i,t)/100)**gap ;

if(CalFlag eq 0,

*  Dynamic parameters are pre-calibrated

   mpc(r,k,h)   = mpcT(r,k,h,t) ;
   if (ifELES eq 1, mu.fx(r,k,h) = mpc(r,k,h) ; ) ;
   theta(r,k,h) = thetaT(r,k,h,t) ;

   gk.fx(r)     = gkT(r,t)/100 ;
   gl.fx(r)     = glT(r,t)/100 ;

   if (KProdFlag eq 1,
      lambdak.fx(r,ik,v)  = lambdak.l(r,ik,v)*(1+(prodshftT(r,ik,t)+gkT(r,t))/100)**gap ;
   else
      lambdak.fx(r,ik,v)  = 1 ;
   ) ;

*  The phip shift factor is only calibrated in the BaU scenario

   phip.fx(r,i) = phipT(r,i,t) ;

   loop(r,loop(ik,
      if (etap(r,ik) gt 0,

*        The chip factor is endongenous

         chip.lo(r,ik) = -inf ;
         chip.up(r,ik) = inf ;


*        Give lambdal a good guess

         lambdal.l(r,ll,ik) = lambdal.l(r,ll,ik)*(1+(chipT(r,ik,t)+prodshftT(r,ik,t)+glT(r,t))/100)**gap ;

      else

*        The chip factor is exogenous

         chip.fx(r,ik) = chipT(r,ik,t)/100 ;

*        Give lambdal a good guess

         lambdal.l(r,ll,ik) = lambdallag(r,ll,ik)*(1+(chipT(r,ik,t)+prodshftT(r,ik,t)+glT(r,t))/100)**gap ;
      ) ;
   )) ;

   loop(r,loop(ink,
      if (etap(r,ink) gt 0,

*        The chip factor is endogenous

         chip.lo(r,ink) = -inf ;
         chip.up(r,ink) = +inf ;

         agprod.lo(r,ink) = -inf ;
         agprod.up(r,ink) = +inf ;

         lambdal.lo(r,ll,ink) = -inf ;
         lambdal.up(r,ll,ink) = +inf ;

         lambdak.lo(r,ink,v) = -inf ;
         lambdak.up(r,ink,v) =  inf ;

         lambdat.lo(r,ink)$(at(r,ink,"Old") ne 0) = -inf ;
         lambdat.up(r,ink)$(at(r,ink,"Old") ne 0) =  inf ;
         lambdaf.lo(r,ink)$(af(r,ink,"Old") ne 0) = -inf ;
         lambdaf.up(r,ink)$(af(r,ink,"Old") ne 0) =  inf ;

         prodshft(r,ink) = (1-alphap(r,ink))*gt(r,ink,t)/100 ;


      else

*        Agricutural productivity is exogenous

         chip.fx(r,ink) = chipT(r,ink,t)/100 ;

         agprod.fx(r,ink) = (1+gt(r,ink,t)/100)**gap ;
         lambdal.fx(r,ll,ink) = lambdal.l(r,ll,ink)*agprod.l(r,ink) ;
         lambdak.fx(r,ink,v) = lambdak.l(r,ink,v)*agprod.l(r,ink) ;
         lambdat.fx(r,ink)$(at(r,ink,"Old") ne 0) = lambdat.l(r,ink)*agprod.l(r,ink) ;
         lambdaf.fx(r,ink)$(af(r,ink,"Old") ne 0) = lambdaf.l(r,ink)*agprod.l(r,ink) ;
      ) ;
   )) ;


   fdvol.fx(r,"Gov") =tgT(r,t) ;

else

*  Calibration of productivity, GDP growth is fixed

   ggdp.fx(r)   = ggdpT(r,t)/100 ;
   rgdp.l(r)    = rgdplag(r)*(1+ggdp.l(r))**gap ;

   if (KProdFlag eq 1,
      kaplab.fx(r) = kaplab0(r) ;
      gk.lo(r)     = -inf ;
      gk.up(r)     = +inf ;
      gk.l(r)      = 0.001 ;
   else
      kaplab.lo(r) = -inf ;
      kaplab.up(r) = +inf ;
      lambdak.fx(r,ik,v) = 1.0 ;
      gk.fx(r)     = 0.0 ;
   ) ;

   loop(r,loop(ik,
      if (etap(r,ik) gt 0,

*        The chip factor is endongenous

         chip.lo(r,ik) = -inf ;
         chip.up(r,ik) = inf ;

         phip.lo(r,ik) = -inf ;
         phip.up(r,ik) = inf ;

      else

*        The chip factor is exogenous

         chip.fx(r,ik) = 0 ;
         phip.fx(r,ik)   = 0 ;
      ) ;
   )) ;

*  Update agricultural productivity, assume uniform productivity of factors

   lambdal.fx(r,ll,ink) = lambdal.l(r,ll,ink)*(1+gT(r,ink,t)/100)**gap ;
   lambdak.fx(r,ink,v)  = lambdak.l(r,ink,v)*(1+gT(r,ink,t)/100)**gap ;
   lambdat.fx(r,ink)    = lambdat.l(r,ink)*(1+gT(r,ink,t)/100)**gap ;
   lambdaf.fx(r,ink)    = lambdaf.l(r,ink)*(1+gT(r,ink,t)/100)**gap ;

   chip.fx(r,ink)      = alphap(r,ink)*(gT(r,ink,t)/100) ;
   phip.lo(r,ink)$(etap(r,ink) gt 0) = -inf ;
   phip.up(r,ink)$(etap(r,ink) gt 0) =  inf ;

   fdvol.lo(r,"Gov") = -inf ;
   fdvol.up(r,"Gov") =  inf ;

) ;

*  Update stock variables

*  Labor

glab.fx(r,ll,gs) = 0.01*(glabT(r,t) + glfprT(r,ll,gs,t) + 0.01*glabT(r,t)*glfprT(r,ll,gs,t)) ;
*als(r,l) = als(r,l)*(1+glabT(r,t)/100)**gap ;

*  Land

ats(r) = ats(r)*(1+glandT(r,t)/100)**gap ;

*  Natural resources

afs(r,i) = afs(r,i)*(1+gnatrT(r,t)/100)**gap ;

*  Capital

kaps0(r,i) = (sum(v,kapdv.l(r,i,v)))*(1-depr(r))**gap ;

*  Trade and transport margins

tmarg.fx(r,rp,i) = tmarg.l(r,rp,i)*(1+gMgt(rp,t)/100)**gap ;

if(CalFlag eq 0,

   ggdp.lo(r) = -inf ;
   ggdp.up(r) =  inf ;
   ggdp.l(r)  = ggdpT(r,t)/100.0 ;

else

*----- To use with the include reftrn------------------------------------------

*  gl.l(r)  = glT(r,t)/100.0 ;
*  gk.l(r)  = gkT(r,t)/100.0 ;

*----- To use without the include ---------------------------------------------
   if (years(t) le 1998, gl.l(r)  = ggdpT(r,t)/100 - glabT(r,t)/100 ; ) ;

*     lambdak.l(r,ik,v)  = lambdak.l(r,ik,v)*(1+gk.l(r))**gap ;
*     lambdal.l(r,ll,ik) = lambdal.l(r,ll,ik)*(1+gl.l(r))**gap ;

*------------------------------------------------------------------------------

   gl.lo(r) = -inf ;
   gl.up(r) =  inf ;
) ;

if (years(t) eq 1998,
*  Initialise "new" variables
   work = 0.015 ;
*  Crops
   hktef.l(r,cr,"New") = work*hktef.l(r,cr,"Old") ;

*  Livestock
   tfd.l(r,lv,"New")  = work*tfd.l(r,lv,"Old") ;
   ktel.l(r,lv,"New") = work*ktel.l(r,lv,"Old") ;

*  All
   kapdv.l(r,i,"New") = work*kapdv.l(r,i,"Old") ;
   xpv.l(r,i,"New")   = work*xpv.l(r,i,"Old") ;
   va.l(r,i,"New")    = work*va.l(r,i,"Old") ;
   hkte.l(r,i,"New")  = work*hkte.l(r,i,"Old") ;
   hkt.l(r,i,"New")   = work*hkt.l(r,i,"Old") ;
   kt.l(r,i,"New")    = work*kt.l(r,i,"Old") ;
   xep.l(r,i,"New")   = work*xep.l(r,i,"Old") ;

*  Initialize other variables

   kstock.l(r) = (1-depr(r))*kstockLag(r) + tiLag(r) ;
) ;

ginv.l(r) = ggdpT(r,t)/100 ;

*  ----- Scale variables and equations when necessary

if (ord(t) ge 2,

   comp.scaleopt = 1 ;

*  Scale the final tier Armington equations

   if (ifDebug and ord(t) eq 2,
      put debug ;
      loop(r, loop(r2, loop(rp$mapr2(r2,rp), loop(i$(wtf0(rp,r,i) ne 0 and sigmaw(r,r2,i) ne inf),

         put r.tl, r2.tl, rp.tl, i.tl, "wtf", (pm.l(rp,r,i)**sigmaw(r,r2,i)) / ;
         put r.tl, r2.tl, rp.tl, i.tl, "pm",  (wtf.l(rp,r,i)*sigmaw(r,r2,i)*(pm.l(rp,r,i)**(sigmaw(r,r2,i)-1))) / ;
         put r.tl, r2.tl, rp.tl, i.tl, "xm2", (amw(rp,r,i)*pm2.l(r,r2,i)**sigmaw(r,r2,i)) / ;
         put r.tl, r2.tl, rp.tl, i.tl, "pm2", (amw(rp,r,i)*xm2.l(r,r2,i)*sigmaw(r,r2,i)*pm2.l(r,r2,i)**(sigmaw(r,r2,i)-1)) / ;
         put r.tl, r2.tl, rp.tl, i.tl, "amw", (amw(rp,r,i)) / ;
         put r.tl, r2.tl, rp.tl, i.tl, "xm2", (xm2.l(r,r2,i)) / ;
         put r.tl, r2.tl, rp.tl, i.tl, "pm2", (pm2.l(r,r2,i)) / ;
      )))) ;
   ) ;

   loop(r, loop(r2, loop(rp$mapr2(r2,rp), loop(i$(wtf.l(rp,r,i) ne 0 and sigmaw(r,r2,i) ne inf),

*     Partial derivative wrt to wtf
      work = abs(pm.l(rp,r,i)**sigmaw(r,r2,i)) ;

*     Partial derivative wrt to pm
      work = work + abs(wtf.l(rp,r,i)*sigmaw(r,r2,i)*(pm.l(rp,r,i)**(sigmaw(r,r2,i)-1))) ;

*     Partial derivative wrt to xm2
      work = work + abs(amw(rp,r,i)*pm2.l(r,r2,i)**sigmaw(r,r2,i)) ;

*     Partial derivative wrt to pm2
      work = work + abs(amw(rp,r,i)*xm2.l(r,r2,i)*sigmaw(r,r2,i)*pm2.l(r,r2,i)**(sigmaw(r,r2,i)-1)) ;

      wtfeq1.scale(rp,r,r2,i) = work ;

   )))) ;

*  Scale the final tier Armington price equation

   loop(r, loop(r2, loop(i$(xmt.l(r,i) ne 0 and sigmaw(r,r2,i) ne inf),

*     Partial derivative wrt to pm2
      work = abs((1-sigmaw(r,r2,i))*pm2.l(r,r2,i)**(-sigmaw(r,r2,i))) ;

*     Partial derivative wrt to import price

      loop(rp$mapr2(r2,rp),
         work = work + abs(amw(rp,r,i)*(1-sigmaw(r,r2,i))
              * (pm.l(rp,r,i)**(-sigmaw(r,r2,i)))) ;
      ) ;

      pm2eq1.scale(r,r2,i) = work ;
   ))) ;

*  Scale rrateq

   loop(r, loop(i$(ak(r,i,"Old") ne 0),
      work = kxrat.l(r,i)/(kaps0(r,i))
      if (ifDebug,
         put Debug ;
         put r.tl, '', '', i.tl, "kxrat", (kxrat.l(r,i)) / ;
         put r.tl, '', '', i.tl, "kaps0", (kaps0(r,i)) / ;
         put r.tl, '', '', i.tl, "kx_kaps0", (kxrat.l(r,i)/(kaps0(r,i))) / ;
      ) ;

      rrateq.scale(r,i) = work ;
   )) ;
) ;
