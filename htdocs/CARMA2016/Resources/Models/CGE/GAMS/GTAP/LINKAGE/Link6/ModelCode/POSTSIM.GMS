* --------------------------------------------------------------------
*
*  LINKAGE -- LINKAGE Applied General Equilibrium Model
*
*  Post-simulation Module
*  ----------------------
*
*  Based on GTAP Version 5.0
*
* --------------------------------------------------------------------

*
*  Calculate Walras' Law
*

* Update price variables which have been eliminated from the model

*wtf.l(rp,r,i) = es.l(rp,i)*shr.l(rp,r,i)*xmt.l(r,i) ;
pe.l(r,rp,i)  = wpe.l(r,rp,i)/(1+etax.l(r,rp,i)) ;
wpm.l(r,rp,i) = wpe.l(r,rp,i)*(1+tmarg.l(r,rp,i))/lambdaw(r,rp,i) ;
pm.l(r,rp,i)  = wpm.l(r,rp,i)*(1+tar.l(r,rp,i)+tar_p.l(r,rp,i)) ;
wtf_in.l(rp,r,i)$(trqFlag(rp,r,i) eq 0) = wtf.l(rp,r,i) ;

* Update trade variables depending on the Armington versus AIDS assumptions

if (ArmFlag eq 0,
   loop(r,loop(i,
      if (AIDSFlag(r,i) eq 1,
         xmt.l(r,i) = sum(rp,pm0(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i)) ;
         pmt.l(r,i) = sum(rp,pm.l(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i)) ;
         pmt.l(r,i) = pmt.l(r,i)/xmt.l(r,i) ;

      else

         xdm.l(r,i) = pd0(r,i)*xd.l(r,i) + pm0(r,r,i)*lambdaw(r,r,i)*wtf.l(r,r,i) ;
         pdm.l(r,i) = pd.l(r,i)*xd.l(r,i) + pm.l(r,r,i)*lambdaw(r,r,i)*wtf.l(r,r,i) ;
         pdm.l(r,i)$(xdm.l(r,i) ne 0) = pdm.l(r,i)/xdm.l(r,i) ;
         pmAIDS.l(rp,r,i)$(ord(rp) ne ord(r)) = pm.l(rp,r,i) ;
         pmAIDS.l(r,r,i) = pdm.l(r,i) ;
         share.l(rp,r,i)$(ord(rp) ne ord(r) and xa.l(r,i) ne 0) =
            (pm.l(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i))/(pa.l(r,i)*xa.l(r,i)) ;
         share.l(r,r,i)$(xa.l(r,i) ne 0) = (pdm.l(r,i)*xdm.l(r,i))/(pa.l(r,i)*xa.l(r,i)) ;
      ) ;
   ));
) ;

walras(r) = rscale*(
            sum(i,sum(rp,wpm.l(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i)))
          - sum(i,sum(rp,wpe.l(r,rp,i)*wtf.l(r,rp,i)))
          + sum(i,sum(rp,(1-chitrq(rp,r,i))*tar_p.l(rp,r,i)*wpm.l(rp,r,i)*wtf_q.l(rp,r,i)))
          - sum(i,sum(rp,(1-chitrq(r,rp,i))*tar_p.l(r,rp,i)*wpm.l(r,rp,i)*wtf_q.l(r,rp,i)))
          - sum(i,pp.l(r,i)*xmarg.l(r,i)) - savf.l(r)
) ;

walrast(r,t) = walras(r) ;
display walras ;

put screen ;
put //, "End of solver: Year - ", years(t):4:0, " Walras - ", (sum(r,Walras(r))):15:6 // ;
putclose ;

* --------------------------------------------------------------------

*
*  Calculate aggregate statistics
*

pap.l(r,i,j)$(ArmFlag eq 0) = pa.l(r,i)*(1+mtxadj.l(r,i)*patax.l(r,i,j)+atxadj.l(r,i)) ;
paf.l(r,i,f)$(ArmFlag eq 0) = pa.l(r,i)*(1+fatax.l(r,i,f)) ;

consT(r,t) = rscale*sum(h,sum(k,pc0(r,k,h)*xc.l(r,k,h))) ;
cpiT(r,t)  = rscale*sum(h,sum(k,pc.l(r,k,h)*xc.l(r,k,h))) ;
govT(r,t)  = rscale*sum(i,paf0(r,i,"Gov")*xaf.l(r,i,"Gov")) ;
gpiT(r,t)  = rscale*sum(i,paf.l(r,i,"Gov")*xaf.l(r,i,"Gov")) ;
invT(r,t)  = rscale*sum(i,paf0(r,i,"Inv")*xaf.l(r,i,"Inv")) ;
zpiT(r,t)  = rscale*sum(i,paf.l(r,i,"Inv")*xaf.l(r,i,"Inv")) ;
expT(r,t)  = rscale*sum(i,sum(rp,wpe0(r,rp,i)*wtf.l(r,rp,i))) ;
epiT(r,t)  = rscale*sum(i,sum(rp,wpe.l(r,rp,i)*wtf.l(r,rp,i))) ;
impT(r,t)  = rscale*sum(i,sum(rp,wpm0(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i))) ;
mpiT(r,t)  = rscale*sum(i,sum(rp,wpm.l(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i))) ;
tgT(r,t)   = fdvol.l(r,"Gov") ;

loop(r,
   loop(i,
      work = sum(rp,wpe0(r,rp,i)*wtf0(r,rp,i)) ;
      if (work ne 0,
         wepiT(r,i,t) = sum(rp,wpe.l(r,rp,i)*wtf0(r,rp,i))/work ;
      else
         wepiT(r,i,t) = 1 ;
      );
   ) ;
) ;

awpT(i,t) = sum(r,sum(rp,wpe0(r,rp,i)*wtf0(r,rp,i))) ;
awpT(i,t)$(awpT(i,t) ne 0) = sum(r,sum(rp,wpe.l(r,rp,i)*wtf0(r,rp,i)))/awpT(i,t) ;

loop(r,
   loop(i,
      work = sum(rp,wpm0(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i)) ;
      if (work ne 0,
         wmpiT(r,i,t) = sum(rp,wpm.l(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i))/work ;
      else
         wmpiT(r,i,t) = 1 = 1 ;
      );
   ) ;
) ;

*loop(r,
*   swork(i) = sum(rp,wpm0(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i)) ;
*   if (swork(i) ne 0,
*      wmpiT(r,i,t) = sum(rp,wpm.l(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i))/swork(i) ;
*   else
*      wmpiT(r,i,t) = 1 ;
*   ) ;
*) ;

gdpMPT(r,t)  = cpiT(r,t)+gpiT(r,t)+zpiT(r,t)+epiT(r,t)-mpiT(r,t)+rscale*ptmarg.l(r)*xtmarg.l(r) ;
rgdpMPT(r,t) = consT(r,t)+govT(r,t)+invT(r,t)+expT(r,t)-impT(r,t)+rscale*ptmarg0(r)*xtmarg.l(r) ;
pgdpMPT(r,t) = gdpMPT(r,t)/rgdpMPT(r,t) ;

rgdpT(r,t) = rscale*rgdp.l(r) ;
pgdpT(r,t) = pgdp.l(r) ;
pabsT(r,t) = 100*pabs.l(r) ;

tkapst(r,t)   = rscale*tkaps.l(r) ;
tlandt(r,t)   = rscale*tland.l(r) ;
kstockt(r,t)  = rscale*kstock.l(r) ;

savft(r,t)   = rscale*savf.l(r) ;

hpopT(r,h,t) = hpop.l(r,h)/pscale ;
tlabsT(r,t)  = rscale*sum(ll,(1-ue.l(r,ll,"Tot"))*labs.l(r,ll,"Tot")) ;

rgdpmp_ppp(r,t) = rgdpmpt(r,t)*ppp0(r) ;
gdp_pc(r,t)     = rgdpmpt(r,t)/(sum(h,hpopT(r,h,t))) ;
gdp_pc_ppp(r,t) = rgdpmp_ppp(r,t)/(sum(h,hpopT(r,h,t))) ;

gkT(r,t)   = 100*gk.l(r) ;
glT(r,t)   = 100*gl.l(r) ;

* Calculate average productivity

loop(r,
   swork(i) = 0 ;

   swork(i) = sum(ll,wage0(r,ll,i)*(labdv.l(r,ll,i)+labdf.l(r,ll,i))) ;
   swork(i)$(swork(i) ne 0)
             = sum(ll,lambdal.l(r,ll,i)*wage0(r,ll,i)*(labdv.l(r,ll,i)+labdf.l(r,ll,i)))
             / swork(i) ;

   swork(i)$(swork(i) ne 0)
             = swork(i)
             / (sum(ll,lambdallag(r,ll,i)*wage0(r,ll,i)*(labdv.l(r,ll,i)+labdf.l(r,ll,i)))
             / sum(ll,wage0(r,ll,i)*(labdv.l(r,ll,i)+labdf.l(r,ll,i)))) ;

   avgglt(r,t) = sum(i,xp.l(r,i)*swork(i))/sum(i,xp.l(r,i)) - 1 ;

   swork(i) = 0 ;

   swork(i) = sum(v,rent0(r,i,"Old")*kapdv.l(r,i,v)) ;
   swork(i)$(swork(i) ne 0)
             = sum(v,lambdak.l(r,i,v)*rent0(r,i,"Old")*kapdv.l(r,i,v))
             / swork(i) ;

   swork(i)$(swork(i) ne 0)
             = swork(i)
             / (sum(v,lambdaklag(r,i,v)*rent0(r,i,"Old")*kapdv.l(r,i,v))
             /  sum(v,rent0(r,i,"Old")*kapdv.l(r,i,v))) ;

   avggkt(r,t) = sum(i,xp.l(r,i)*swork(i))/ sum(i,xp.l(r,i)) - 1 ;
) ;

cpiT(r,t) = cpiT(r,t)/consT(r,t) ;
gpiT(r,t) = gpiT(r,t)/govT(r,t) ;
zpiT(r,t) = zpiT(r,t)/invT(r,t) ;
epiT(r,t) = epiT(r,t)/expT(r,t) ;
mpiT(r,t) = mpiT(r,t)/impT(r,t) ;
totT(r,t) = epiT(r,t)/mpiT(r,t) ;

totPT(r,t) = sum(i,sum(rp,wpe.l(r,rp,i)*wtf0(r,rp,i))) - sum(i,sum(rp,wpe0(r,rp,i)*wtf0(r,rp,i)))
           - (sum(i,sum(rp,wpm.l(rp,r,i)*wtf0(rp,r,i))) - sum(i,sum(rp,wpm0(rp,r,i)*wtf0(rp,r,i)))) ;

totPT(r,t) = rscale*totPT(r,t) ;
ptT(r,i,t)     = pt.l(r,i) ;
pfT(r,i,t)     = pf.l(r,i) ;
ffT(r,i,t)     = rscale*ff.l(r,i) ;
rentT(r,i,t)   = rent.l(r,i,"Old") ;

xpt(r,i,t)    = rscale*xp.l(r,i) ;
ldt(r,i,t)    = rscale*sum(ll,wage0(r,ll,i)*(labdv.l(r,ll,i)+labdf.l(r,ll,i))) ;
kapdt(r,i,t)  = rscale*sum(v,rent0(r,i,v)*kapdv.l(r,i,v)) ;
arentT(r,t)   = sum(i,sum(v,rent.l(r,i,v)*kapdv0(r,i,v)))
              / sum(i,sum(v,rent0(r,i,v)*kapdv0(r,i,v))) ;
xapt(r,i,t)   = rscale*sum(j,xap.l(r,i,j)) ;
xact(r,i,h,t) = rscale*xac.l(r,i,h) ;
xaft(r,i,t)   = rscale*sum(f,xaf.l(r,i,f)) ;
xat(r,i,t)    = rscale*xa.l(r,i) ;
xdt(r,i,t)    = rscale*xd.l(r,i) ;
est(r,i,t)    = rscale*(sum(rp, wpe0(r,rp,i)*wtf.l(r,rp,i)) + pp0(r,i)*xmarg.l(r,i)) ;
xmtt(r,i,t)   = rscale*sum(rp, wpm0(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i)) ;
est0(r,i,t)   = es.l(r,i) ;
xmtt0(r,i,t)  = xmt.l(r,i) ;

ppt(r,i,t)  = pp.l(r,i) ;
pdt(r,i,t)  = pd.l(r,i) ;
ppet(r,i,t) = pet.l(r,i) ;
pat(r,i,t)  = pa.l(r,i) ;
pmtt(r,i,t) = pmt.l(r,i) ;

* Decompose unit costs

loop(r, loop(j$(axp(r,j) ne 0),
   work          = sum(v, xpv.l(r,j,v)) ;

   pxT(r,j,t)    = px.l(r,j) ;

   swageT(r,j,t)$(sum(ll,labdv.l(r,ll,j)) ne 0)
                 = sum(ll, wage.l(r,ll,j)*labdv.l(r,ll,j))/sum(ll,labdv.l(r,ll,j)) ;
   srentT(r,j,t)$(sum(v,kapdv.l(r,j,v)) ne 0)
                 = sum(v, rent.l(r,j,v)*kapdv.l(r,j,v))/sum(v, kapdv.l(r,j,v)) ;
   spapT(r,j,t)$(sum(i, xap.l(r,i,j)) ne 0)
                 = sum(i, pap.l(r,i,j)*xap.l(r,i,j))/sum(i, xap.l(r,i,j)) ;

   slabT(r,j,t)  = sum(ll, labdv.l(r,ll,j))/work ;
   skapT(r,j,t)  = sum(v, kapdv.l(r,j,v))/work ;
   slandT(r,j,t) = td.l(r,j)/work ;
   sfactT(r,j,t) = ff.l(r,j)/work ;
   sndT(r,j,t)   = sum(i, xap.l(r,i,j))/work ;
)) ;

chipT(r,i,t)     = chip.l(r,i) ;
phipT(r,i,t)     = phip.l(r,i) ;
pcT(r,k,h,t)     = pc.l(r,k,h) ;
xcT(r,k,h,t)     = xc.l(r,k,h) ;
mpcT(r,k,h,t)    = mpc(r,k,h) ;
thetaT(r,k,h,t)  = theta(r,k,h) ;
savhT(r,h,t)     = rscale*savh.l(r,h) ;
deprYT(r,h,t)    = rscale*deprec.l(r,h) ;
ydT(r,h,t)       = rscale*yd.l(r,h) ;
rydT(r,h,t)      = rscale*yd.l(r,h)*cpi0(r,h)/cpi.l(r,h) ;
etaT(r,k,h,t)$(xc.l(r,k,h) ne 0) = mpc(r,k,h)*yd.l(r,h)/(pcT(r,k,h,t)*xc.l(r,k,h)) ;
savgT(r,t)       = rscale*savg.l(r) ;

exprodT(r,ik,t) = gl.l(r)+prodshft(r,ik) ;
avgexpT(r,ik,t)$(xp.l(r,ik) ne 0) = es.l(r,ik)/xp.l(r,ik) ;

* Rural urban terms of trade

rva1T(r,gz,t) = rscale*sum(i$mapg(i,gz),(g(r,i)/g0(r,i))*(lambdat.l(r,i)*pt0(r,i)*td.l(r,i)
              +        lambdaf.l(r,i)*pf0(r,i)*ff.l(r,i)
              +        sum(ll,lambdal.l(r,ll,i)*wage0(r,ll,i)*labdv.l(r,ll,i))
              +        sum(v,lambdak.l(r,i,v)*rent0(r,i,v)*kapdv.l(r,i,v)))) ;
va1T(r,gz,t)  = rscale*sum(i$mapg(i,gz),(pt.l(r,i)*td.l(r,i)
              +        pf.l(r,i)*ff.l(r,i)
              +        sum(ll,wage.l(r,ll,i)*labdv.l(r,ll,i))
              +        sum(v,rent.l(r,i,v)*kapdv.l(r,i,v)))) ;

rva2T(r,gz,t) = rscale*sum(i$mapg(i,gz),(g(r,i)/g0(r,i))*(lambdat.l(r,i)*npt0(r,i)*td.l(r,i)
              +        lambdaf.l(r,i)*pf0(r,i)*ff.l(r,i)
              +        sum(ll,lambdal.l(r,ll,i)*nwage0(r,ll,i)*labdv.l(r,ll,i))
              +        sum(v,lambdak.l(r,i,v)*nrent0(r,i,v)*kapdv.l(r,i,v)))) ;
va2T(r,gz,t)  = rscale*sum(i$mapg(i,gz),(npt.l(r,i)*td.l(r,i)
              +        pf.l(r,i)*ff.l(r,i)
              +        sum(ll,nwage.l(r,ll,i)*labdv.l(r,ll,i))
              +        sum(v,nrent.l(r,i,v)*kapdv.l(r,i,v)))) ;

pp1T(r,gz,t)  = sum(i$mapg(i,gz),pp0(r,i)*xp0(r,i)) ;
pp1T(r,gz,t)$(pp1T(r,gz,t) ne 0) = sum(i$mapg(i,gz), pp.l(r,i)*xp0(r,i))/work ;
pa1T(r,gz,t)  = sum(i$mapg(i,gz),pa0(r,i)*xa0(r,i)) ;
pa1T(r,gz,t)$(pa1T(r,gz,t) ne 0) = sum(i$mapg(i,gz), pa.l(r,i)*xa0(r,i))/sum(i$mapg(i,gz),pa0(r,i)*xa0(r,i)) ;

*display savh.l, yd.l ;
*
* Calibrate employment parameters if this is the BaU, assuming
* wage differentials are constant
*

* L0T(r,l,i,t) = (1-((1-delta(r,l,i))/delta(r,l,i))*((wdist.l(r,l,i)

aminT(r,ll,gz,t) = amin.l(r,ll,gz) ;

* Expenditure function calculations

if (ifELES eq 1,

*  Calculate the value of the subsistence minima at the relevant price

   subsmin0(r,h,t) = rscale*hpop.l(r,h)*sum(k, pc0(r,k,h)*theta(r,k,h)) ;
   subsmin1(r,h,t) = rscale*hpop.l(r,h)*sum(k, pcT(r,k,h,t)*theta(r,k,h)) ;

   if (calFlag eq 1, subsminT(r,h,t) = subsmin1(r,h,t)) ;

*  Calculate the adjusted mpc, excluding savings

   Adjmpc(r,k,h) = mpc(r,k,h)/sum(kk,mpc(r,kk,h)) ;

   mps(r,h) = 1 - sum(k,mpc(r,k,h)) ;

*  Calculate the value of the relevant price index

   pindex0(r,h,t)  = sum(k$(mpc(r,k,h) gt 0),mpc(r,k,h)*log(pc0(r,k,h)/mpc(r,k,h))) ;
   Apindex0(r,h,t) = sum(k$(Adjmpc(r,k,h) gt 0), Adjmpc(r,k,h)*log(pc0(r,k,h)/Adjmpc(r,k,h))) ;
   pindex0(r,h,t)$(mps(r,h) gt 0) = pindex0(r,h,t) + mps(r,h)*log(1/mps(r,h)) ;
   pindex0(r,h,t)  = exp(pindex0(r,h,t)) ;
   Apindex0(r,h,t) = exp(Apindex0(r,h,t)) ;

   pindex1(r,h,t)  = sum(k$(mpc(r,k,h) gt 0),mpc(r,k,h)*log(pcT(r,k,h,t)/mpc(r,k,h))) ;
   Apindex1(r,h,t) = sum(k$(Adjmpc(r,k,h) gt 0), Adjmpc(r,k,h)*log(pcT(r,k,h,t)/Adjmpc(r,k,h))) ;
   pindex1(r,h,t)$(mps(r,h) gt 0) = pindex1(r,h,t) + mps(r,h)*log(cpi.l(r,h)/mps(r,h)) ;
   pindex1(r,h,t)  = exp(pindex1(r,h,t)) ;
   Apindex1(r,h,t) = exp(Apindex1(r,h,t)) ;

   if (calFlag eq 1,
      pindexT(r,h,t) = pindex1(r,h,t) ;
      ApindexT(r,h,t) = Apindex1(r,h,t) ;
   ) ;
) ;

* Calculate utility

if(ifELES eq 1,
   loop(h,
      cvolume(r,k,h) = xc.l(r,k,h) - hpop.l(r,h)*theta(r,k,h) ;
      cvolume(r,k,h)$(cvolume(r,k,h) gt 0) = 0 ;
      work = sum(r,sum(k,cvolume(r,k,h))) ;
      if (work ne 0,
         display "Subsistence minima greater than consumption:", cvolume ;
         Abort$(work ne 0) "**** Error while calculating utility" ;
      ) ;
   ) ;


   u1(r,h,t)  = sum(k$(mpc(r,k,h) gt 0),mpc(r,k,h)*log(xc.l(r,k,h)-hpop.l(r,h)*theta(r,k,h))) ;
   Au1(r,h,t) = sum(k$(Adjmpc(r,k,h) gt 0), Adjmpc(r,k,h)*log(xc.l(r,k,h)-hpop.l(r,h)*theta(r,k,h))) ;
   u1(r,h,t)$(mps(r,h) gt 0) = u1(r,h,t) + mps(r,h)*log(savh.l(r,h)/cpi.l(r,h)) ;
   u1(r,h,t)  = rscale*exp(u1(r,h,t)) ;
   Au1(r,h,t) = rscale*exp(Au1(r,h,t)) ;

   if (calFlag eq 1,
      uT(r,h,t)  = u1(r,h,t) ;
      AuT(r,h,t) = Au1(r,h,t) ;
   ) ;

*  Calculate the expenditure function
*
*  Equivalent variation   is defined as E(p0,u1)-E(p0,u0), or E4-E1
*  Compensating variation is defined as E(p1,u1)-E(p1,u0), or E3-E2
*

   e1T(r,h,t)  = subsminT(r,h,t) + ut(r,h,t)*pindexT(r,h,t) ;
   e2T(r,h,t)  = subsmin1(r,h,t) + u1(r,h,t)*pindex1(r,h,t) ;
   e3T(r,h,t)  = subsmin1(r,h,t) + ut(r,h,t)*pindex1(r,h,t) ;
   e4T(r,h,t)  = subsminT(r,h,t) + u1(r,h,t)*pindexT(r,h,t) ;
   Ae1T(r,h,t) = subsminT(r,h,t) + Aut(r,h,t)*ApindexT(r,h,t) ;
   Ae2T(r,h,t) = subsmin1(r,h,t) + Au1(r,h,t)*Apindex1(r,h,t) ;
   Ae3T(r,h,t) = subsmin1(r,h,t) + Aut(r,h,t)*Apindex1(r,h,t) ;
   Ae4T(r,h,t) = subsminT(r,h,t) + Au1(r,h,t)*ApindexT(r,h,t) ;
   e5T(r,h,t)  = subsmin0(r,h,t) + ut(r,h,t)*pindex0(r,h,t) ;
   e6T(r,h,t)  = subsmin0(r,h,t) + u1(r,h,t)*pindex0(r,h,t) ;

* display subsmin0, subsmin1, subsminT, pindex0, pindex1, pindexT, u1, uT ;

) ;

*
* Government expenditure function
*

* Assumes a Leontief technology

gpindex1(r,t) = sum(i, afa(r,i,"Gov")*paf.l(r,i,"Gov")) ;
if (calFlag eq 1,
   gpindexT(r,t) = gpindex1(r,t) ;
) ;

gu1(r,t) = gpiT(r,t)*govT(r,t)/gpindex1(r,t) ;
if (calFlag eq 1,
   guT(r,t) = gu1(r,t) ;
) ;

GE1T(r,t)  = guT(r,t)*gpindexT(r,t) ;
GE2T(r,t)  = gu1(r,t)*gpindex1(r,t) ;
GE3T(r,t)  = guT(r,t)*gpindex1(r,t) ;
GE4T(r,t)  = gu1(r,t)*gpindexT(r,t) ;
* display gut, gpindex1, gu1, gpindext ;
*
* Save the emissions variables
*

emitotT(r,t)     = emitot.l(r) ;
emitaxT(r,t)     = emitax.l(r) ;
emitaxadT(r,i,t) = emicoef(r,i)*emitax.l(r)/pa.l(r,i) ;

loop(r,loop(ll,
   if (omegam(r,ll) eq inf,
      ue.l(r,ll,"Tot") = ueTot.l(r,ll) ;
   ) ;
)) ;

* Decompose growth variables

loop(r,

* Start with labor

   work         = sum(ll,(1-ue.l(r,ll,"Tot"))*labs.l(r,ll,"Tot"))/sum(ll,empllag(r,ll,"Tot"))-1 ;
   lalloc(r,t)  = sum(i,sum(ll$(labdlag(r,ll,i) ne 0),labshr(r,ll,i)*((labdv.l(r,ll,i)/labdlag(r,ll,i)-1)-work))) ;
*  lprod(r,t)   = sum(ik$(labdlag(r,ll,ik) ne 0),labshr(r,ik)
*               *(sum(ll,(((1+gT(r,ik,t)/100)*(1+prodshft(r,ik)+chip.l(r,ik)+glT(r,t)/100))**gap)*labdv.l(r,ll,ik))/sum(ll,labdv.l(r,ll,ik))-1))
*               + sum(ink$(labdlag(r,ink) ne 0),labshr(r,ink)*(sum(ll,((1+gT(r,ink,t)/100)**gap)*labdv.l(r,ll,ink))/sum(ll,labdv.l(r,ll,ink))-1)) ;
   lprod(r,t)   = sum(i, sum(ll$(labdlag(r,ll,i) ne 0),labshr(r,ll,i)*(lambdal.l(r,ll,i)/lambdallag(r,ll,i)-1))) ;
   lgrowth(r,t) = work*sum(i,sum(ll,labshr(r,ll,i))) ;

*  Re-calculate the 'lagged' variables for the next round

   labshr(r,ll,i)   = nwage0(r,ll,i)*lambdal.l(r,ll,i)*labdv.l(r,ll,i)/rgdp.l(r) ;
   labslag(r,ll,gz)$(CompFlag ne 1) = labs.l(r,ll,gz) ;
   empllag(r,ll,gz)$(CompFlag ne 1) = (1-ue.l(r,ll,gz))*labs.l(r,ll,gz) ;
   labdlag(r,ll,i)  = labdv.l(r,ll,i) ;

* Capital

   work         = tkaps.l(r)/kapslag(r) - 1 ;
   kalloc(r,t)  = sum(i$(kapdlag(r,i) ne 0),kapshr(r,i)*((sum(v,kapdv.l(r,i,v))/kapdlag(r,i)-1)-work)) ;
   kprod(r,t)   = sum(ik$(sum(v,kapdv.l(r,ik,v)) ne 0),kapshr(r,ik)*(sum(v,(((1+gT(r,ik,t)/100)*(1+KProdFlag*prodshft(r,ik)+gkT(r,t)/100))**gap)*kapdv.l(r,ik,v))/sum(v,kapdv.l(r,ik,v))-1))
                + sum(ink$(sum(v,kapdv.l(r,ink,v)) ne 0),kapshr(r,ink)*(sum(v,((1+gT(r,ink,t)/100)**gap)*kapdv.l(r,ink,v))/sum(v,kapdv.l(r,ink,v))-1)) ;
   kgrowth(r,t) = work*sum(i,kapshr(r,i)) ;

*  Re-calculate the 'lagged' variables for the next round

   kapshr(r,i)  = g(r,i)*sum(v,rent0(r,i,v)*lambdak.l(r,i,v)*kapdv.l(r,i,v))/rgdp.l(r) ;
   kapslag(r)   = tkaps.l(r) ;
   kapdlag(r,i) = sum(v,kapdv.l(r,i,v)) ;

* Land

   work = 0 ;
   work$(lndslag(r) ne 0) = tland.l(r)/lndslag(r) - 1 ;
   talloc(r,t)  = sum(i$(lnddlag(r,i) ne 0),lndshr(r,i)*((td.l(r,i)/lnddlag(r,i)-1)-work)) ;
   tprod(r,t)   = sum(ik,lndshr(r,ik)*((((1+gT(r,ik,t)/100)*(1+gtT(r,t)/100))**gap)-1))
                + sum(ink,lndshr(r,ink)*(((1+gT(r,ink,t)/100)**gap)-1)) ;
   tgrowth(r,t) = work*sum(i,lndshr(r,i)) ;

*  Re-calculate the 'lagged' variables for the next round

   lndshr(r,i)  = g(r,i)*pt0(r,i)*lambdat.l(r,i)*td.l(r,i)/rgdp.l(r) ;
   lndslag(r)   = tland.l(r) ;
   lnddlag(r,i) = td.l(r,i) ;

* Fixed factors

   work = 0 ;
   work$(ffcslag(r) ne 0) = sum(i,ff.l(r,i))/ffcslag(r) - 1 ;
   fprod(r,t)   = sum(ik$ff0(r,ik),ffcshr(r,ik)*((((1+gT(r,ik,t)/100)*(1+gfT(r,t)/100))**gap)-1))
                + sum(ink$ff0(r,ink),ffcshr(r,ink)*(((1+gT(r,ink,t)/100)**gap)-1)) ;
   fgrowth(r,t) = work*sum(i,ffcshr(r,i)) ;

*  Re-calculate the 'lagged' variables for the next round

   ffcshr(r,i)  = g(r,i)*pf0(r,i)*lambdaf.l(r,i)*ff.l(r,i)/rgdp.l(r) ;
   ffcslag(r)   = sum(i,ff.l(r,i)) ;
) ;

* Calculate the government's accounts

GovAcctT(r,"Output","Tax",t)  = sum(j$(ptax.l(r,j) > 0), ptax.l(r,j)*(1+markup.l(r,j))*px.l(r,j)*xp.l(r,j)) ;
GovAcctT(r,"Output","Subs",t) = sum(j$(ptax.l(r,j) < 0), ptax.l(r,j)*(1+markup.l(r,j))*px.l(r,j)*xp.l(r,j)) ;

if (ArmFlag eq 1,
   GovAcctT(r,"Indprod","Tax",t)  = sum(i,sum(j$(pdtax.l(r,i,j) > 0),pd.l(r,i)*pdtax.l(r,i,j)*xdp.l(r,i,j)))
                                + sum(i,sum(j$(pmtax.l(r,i,j) > 0),pmt.l(r,i)*pmtax.l(r,i,j)*xmp.l(r,i,j))) ;
   GovAcctT(r,"Indprod","Subs",t) = sum(i,sum(j$(pdtax.l(r,i,j) < 0),pd.l(r,i)*pdtax.l(r,i,j)*xdp.l(r,i,j)))
                                + sum(i,sum(j$(pmtax.l(r,i,j) < 0),pmt.l(r,i)*pmtax.l(r,i,j)*xmp.l(r,i,j))) ;
   GovAcctT(r,"IndCons","Tax",t)  = sum(h,sum(i$(cdtax.l(r,i,h) > 0),pd.l(r,i)*cdtax.l(r,i,h)*xdc.l(r,i,h)))
                                + sum(h,sum(i$(cmtax.l(r,i,h) > 0),pmt.l(r,i)*cmtax.l(r,i,h)*xmc.l(r,i,h))) ;
   GovAcctT(r,"IndCons","Subs",t) = sum(h,sum(i$(cdtax.l(r,i,h) < 0),pd.l(r,i)*cdtax.l(r,i,h)*xdc.l(r,i,h)))
                                + sum(h,sum(i$(cmtax.l(r,i,h) < 0),pmt.l(r,i)*cmtax.l(r,i,h)*xmc.l(r,i,h))) ;
   GovAcctT(r,"Exp", "Subs",t)    = -sum(i,(1+fdtax.l(r,i,"Gov"))*pd.l(r,i)*xdf.l(r,i,"Gov")) + sum(i,(1+fmtax.l(r,i,"Gov"))*pmt.l(r,i)*xmf.l(r,i,"Gov")) ;
   GovAcctT(r,"IndGov","Tax",t)   = sum(i$(fdtax.l(r,i,"Gov") > 0),fdtax.l(r,i,"Gov")*pd.l(r,i)*xdf.l(r,i,"Gov"))
                                + sum(i$(fmtax.l(r,i,"Gov") > 0),fmtax.l(r,i,"Gov")*pmt.l(r,i)*xmf.l(r,i,"Gov")) ;
   GovAcctT(r,"IndGov","Subs",t)  = sum(i$(fdtax.l(r,i,"Gov") < 0),fdtax.l(r,i,"Gov")*pd.l(r,i)*xdf.l(r,i,"Gov"))
                                + sum(i$(fmtax.l(r,i,"Gov") < 0),fmtax.l(r,i,"Gov")*pmt.l(r,i)*xmf.l(r,i,"Gov")) ;
   GovAcctT(r,"IndInv","Tax",t)   = sum(i$(fdtax.l(r,i,"Inv") > 0),fdtax.l(r,i,"Inv")*pd.l(r,i)*xdf.l(r,i,"Inv"))
                                + sum(i$(fmtax.l(r,i,"Inv") > 0),fmtax.l(r,i,"Inv")*pmt.l(r,i)*xmf.l(r,i,"Inv")) ;
   GovAcctT(r,"IndInv","Subs",t)  = sum(i$(fdtax.l(r,i,"Inv") < 0),fdtax.l(r,i,"Inv")*pd.l(r,i)*xdf.l(r,i,"Inv"))
                                + sum(i$(fmtax.l(r,i,"Inv") < 0),fmtax.l(r,i,"Inv")*pmt.l(r,i)*xmf.l(r,i,"Inv")) ;
else
   GovAcctT(r,"Indprod","Tax",t)  = sum(i,sum(j$(patax.l(r,i,j) > 0),
                                    pa.l(r,i)*(mtxadj.l(r,i)*patax.l(r,i,j)+atxadj.l(r,i))*xap.l(r,i,j))) ;
   GovAcctT(r,"Indprod","Subs",t) = sum(i,sum(j$(patax.l(r,i,j) < 0),
                                    pa.l(r,i)*(mtxadj.l(r,i)*patax.l(r,i,j)+atxadj.l(r,i))*xap.l(r,i,j))) ;
   GovAcctT(r,"IndCons","Tax",t)  = sum(h,sum(i$(catax.l(r,i,h) > 0),
                                    pa.l(r,i)*(mtxadj.l(r,i)*catax.l(r,i,h)+atxadj.l(r,i))*xac.l(r,i,h))) ;
   GovAcctT(r,"IndCons","Subs",t) = sum(h,sum(i$(catax.l(r,i,h) < 0),
                                    pa.l(r,i)*(mtxadj.l(r,i)*catax.l(r,i,h)+atxadj.l(r,i))*xac.l(r,i,h))) ;
   GovAcctT(r,"Exp", "Subs",t)    = -sum(i,(1+mtxadj.l(r,i)*fatax.l(r,i,"Gov")+atxadj.l(r,i))*pa.l(r,i)*xaf.l(r,i,"Gov")) ;
   GovAcctT(r,"IndGov","Tax",t)   = sum(i$(fatax.l(r,i,"Gov") > 0),
                                    pa.l(r,i)*(mtxadj.l(r,i)*fatax.l(r,i,"Gov")+atxadj.l(r,i))*xaf.l(r,i,"Gov")) ;
   GovAcctT(r,"IndGov","Subs",t)  = sum(i$(fatax.l(r,i,"Gov") < 0),
                                    pa.l(r,i)*(mtxadj.l(r,i)*fatax.l(r,i,"Gov")+atxadj.l(r,i))*xaf.l(r,i,"Gov")) ;
   GovAcctT(r,"IndInv","Tax",t)   = sum(i$(fatax.l(r,i,"Inv") > 0),
                                    pa.l(r,i)*(mtxadj.l(r,i)*fatax.l(r,i,"Inv")+atxadj.l(r,i))*xaf.l(r,i,"Inv")) ;
   GovAcctT(r,"IndInv","Subs",t)  = sum(i$(fatax.l(r,i,"Inv") < 0),
                                    pa.l(r,i)*(mtxadj.l(r,i)*fatax.l(r,i,"Inv")+atxadj.l(r,i))*xaf.l(r,i,"Inv")) ;
) ;

GovAcctT(r,"ImpTax", "Tax",t)  = sum(i,sum(rp$(tar.l(rp,r,i) > 0),tar.l(rp,r,i)*wpm.l(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i))) ;
GovAcctT(r,"ImpTax", "Subs",t) = sum(i,sum(rp$(tar.l(rp,r,i) < 0),tar.l(rp,r,i)*wpm.l(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i))) ;

GovAcctT(r,"ExpTax", "Tax",t)  = sum(i,sum(rp$(etax.l(r,rp,i) > 0),pe.l(r,rp,i)*etax.l(r,rp,i)*wtf.l(r,rp,i))) ;
GovAcctT(r,"ExpTax", "Subs",t) = sum(i,sum(rp$(etax.l(r,rp,i) < 0),pe.l(r,rp,i)*etax.l(r,rp,i)*wtf.l(r,rp,i))) ;

GovAcctT(r,"FctTax", "Tax",t)  = sum(j$(LndTax.l(r,j) > 0), LndTax.l(r,j)*npt.l(r,j)*td.l(r,j))
                             + sum(j,sum(ll$(wagetax.l(r,ll,j) > 0), wagetax.l(r,ll,j)*nwage.l(r,ll,j)*labdv.l(r,ll,j)))
                             + sum(j,sum(v$(KapTax.l(r,j,v) > 0), KapTax.l(r,j,v)*nrent.l(r,j,v)*kapdv.l(r,j,v))) ;
GovAcctT(r,"FctTax", "Subs",t) = sum(j$(LndTax.l(r,j) < 0), LndTax.l(r,j)*npt.l(r,j)*td.l(r,j))
                             + sum(j,sum(ll$(wagetax.l(r,ll,j) < 0), wagetax.l(r,ll,j)*nwage.l(r,ll,j)*labdv.l(r,ll,j)))
                             + sum(j,sum(v$(KapTax.l(r,j,v) < 0), KapTax.l(r,j,v)*nrent.l(r,j,v)*kapdv.l(r,j,v))) ;

GovAcctT(r,"DirTax", "Tax",t)  = sum(h$(kappah.l(r,h) > 0), chik.l(r)*kappah.l(r,h)*yh.l(r,h)) ;
GovAcctT(r,"DirTax", "Subs",t) = sum(h$(kappah.l(r,h) < 0), chik.l(r)*kappah.l(r,h)*yh.l(r,h)) ;

GovAcctT(r,"Exp", "Tax",t)     = savg.l(r) ;

GovAcctT(r,gi,gts,t) = rscale*GovAcctT(r,gi,gts,t) ;

wydt(r,t)         = rscale*sum(h,yd.l(r,h)) ;
wlabdt(r,ll,i,t)  = rscale*(labdv.l(r,ll,i)+labdf.l(r,ll,i)) ;
wnwaget(r,ll,i,t) = nwage.l(r,ll,i) ;
wkapdt(r,i,t)     = rscale*sum(v,kapdv.l(r,i,v)) + kapdf.l(r,i) ;
wnrentt(r,i,t)    = nrent.l(r,i,"Old") ;
wtdt(r,i,t)       = rscale*td.l(r,i) ;
wnptt(r,i,t)      = npt.l(r,i) ;
wfft(r,i,t)       = rscale*ff.l(r,i) ;
wpft(r,i,t)       = pf.l(r,i) ;
wdtt(r,t)         = rscale*sum(h,chik.l(r)*kappah.l(r,h)*yh.l(r,h)) ;
wxact(r,i,h,t)    = rscale*xac.l(r,i,h) ;
wpact(r,i,h,t)    = pac.l(r,i,h) ;
wsavht(r,t)       = rscale*sum(h,savh.l(r,h)) ;

* Calculate the regional SAM's

if(0,

   loop(r,

   sam(is,is1)      = 0 ;
   sam("Comm","Act")$(ArmFlag eq 1) = sum(i,sum(j,pd.l(r,i)*xdp.l(r,i,j)))
                                    + sum(i,sum(j,pmt.l(r,i)*xmp.l(r,i,j))) ;
   sam("Comm","Act")$(ArmFlag eq 0) = sum(i,sum(j,pa.l(r,i)*xap.l(r,i,j))) ;

   sam("itax","Act")$(ArmFlag eq 1) = sum(i,sum(j,pd.l(r,i)*pdtax.l(r,i,j)*xdp.l(r,i,j)))
                                    + sum(i,sum(j,pmt.l(r,i)*pmtax.l(r,i,j)*xmp.l(r,i,j))) ;
   sam("itax","Act")$(ArmFlag eq 0) = sum(i,sum(j,pa.l(r,i)
                                    * (mtxadj.l(r,i)*patax.l(r,i,j)+atxadj.l(r,i))*xap.l(r,i,j))) ;


   sam("fct","Act")  = sum(j,pt.l(r,j)*td.l(r,j) + pf.l(r,j)*ff.l(r,j)) ;
   sam("lab","Act")  = sum(j,sum(ll, wage.l(r,ll,j)*labdv.l(r,ll,j))) ;
   sam("kap","Act")  = sum(j,sum(v,rent.l(r,j,v)*kapdv.l(r,j,v)))
                     + sum(j,markup.l(r,j)*px.l(r,j)*xp.l(r,j)) ;
   sam("gov","Act")  = sum(j,ptax.l(r,j)*(1+markup.l(r,j))*px.l(r,j)*xp.l(r,j)) ;

   sam("act","Comm") = sum(i,pd.l(r,i)*xd.l(r,i)) ;

   sam("tar","Comm") = sum(i,sum(rp,tar.l(rp,r,i)*wpm.l(rp,r,i)*wtf_in.l(rp,r,i)
                     +              tar_out.l(rp,r,i)*wpm.l(rp,r,i)*wtf_out.l(rp,r,i)))
                     + sum(i,sum(rp,chitrq(rp,r,i)*wpm.l(rp,r,i)*tar_p.l(rp,r,i)*wtf_q.l(rp,r,i))) ;

   sam("row","Comm") = sum(i,sum(rp,wpm.l(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i)))
                     + sum(i,sum(rp,(1-chitrq(rp,r,i))*wpm.l(rp,r,i)*tar_p.l(rp,r,i)*wtf_q.l(rp,r,i))) ;

   sam("gov","Comm") = sum(i,emitax.l(r)*emicoef(r,i)*xa.l(r,i)) ;

   sam("hh","fct")  = sum(j,npt.l(r,j)*td.l(r,j)+pf.l(r,j)*ff.l(r,j)) ;
   sam("gov","fct") = sum(j,LndTax.l(r,j)*npt.l(r,j)*td.l(r,j)) ;
   sam("hh","lab")  = sum(j,sum(ll,nwage.l(r,ll,j)*labdv.l(r,ll,j))) ;
   sam("gov","lab") = sum(j,sum(ll,wagetax.l(r,ll,j)*nwage.l(r,ll,j)*labdv.l(r,ll,j))) ;
   sam("hh","kap")  = sum(j,sum(v,nrent.l(r,j,v)*kapdv.l(r,j,v))) + sum(j,markup.l(r,j)*px.l(r,j)*xp.l(r,j)) ;
   sam("gov","kap") = sum(j,sum(v,KapTax.l(r,j,v)*nrent.l(r,j,v)*kapdv.l(r,j,v))) ;

   sam("Comm","hh")$(ArmFlag eq 1) = sum(i,sum(h,pd.l(r,i)*xdc.l(r,i,h)))
                                   + sum(i,sum(h,pmt.l(r,i)*xmc.l(r,i,h))) ;
   sam("Comm","hh")$(ArmFlag eq 0) = sum(h,sum(i,pa.l(r,i)*xac.l(r,i,h))) ;

   sam("itax","hh")$(ArmFlag eq 1) = sum(h,sum(i,pd.l(r,i)*cdtax.l(r,i,h)*xdc.l(r,i,h)))
                                   + sum(h,sum(i,pmt.l(r,i)*cmtax.l(r,i,h)*xmc.l(r,i,h))) ;
   sam("itax","hh")$(ArmFlag eq 0) = sum(h,sum(i,pa.l(r,i)*(mtxadj.l(r,i)*catax.l(r,i,h)+atxadj.l(r,i))*xac.l(r,i,h))) ;

   sam("gov","hh")   = chik.l(r)*sum(h,kappah.l(r,h)*yh.l(r,h)) ;
   sam("inv","hh")   = sum(h,savh.l(r,h)) ;
   sam("depr","hh")  = sum(h,deprec.l(r,h)) ;
   sam("inv","depr") = sum(h,deprec.l(r,h)) ;

   sam("Comm","gov")$(ArmFlag eq 1) = sum(i,pd.l(r,i)*xdf.l(r,i,"Gov"))
                                    + sum(i,pmt.l(r,i)*xmf.l(r,i,"Gov")) ;
   sam("Comm","gov")$(ArmFlag eq 0) = sum(i,pa.l(r,i)*xaf.l(r,i,"Gov")) ;
   sam("hh","gov")                  = pgdp.l(r)*sum(h,trg.l(r,h)) ;

   sam("itax","gov")$(ArmFlag eq 1) = sum(i,pd.l(r,i)*fdtax.l(r,i,"Gov")*xdf.l(r,i,"Gov"))
                                    + sum(i,pmt.l(r,i)*fmtax.l(r,i,"Gov")*xmf.l(r,i,"Gov")) ;
   sam("itax","gov")$(ArmFlag eq 0) = sum(i,pa.l(r,i)*fatax.l(r,i,"Gov")*xaf.l(r,i,"Gov")) ;

   sam("Comm","inv")$(ArmFlag eq 1) = sum(i,pd.l(r,i)*xdf.l(r,i,"Inv"))
                                    + sum(i,pmt.l(r,i)*xmf.l(r,i,"Inv")) ;
   sam("Comm","inv")$(ArmFlag eq 0) = sum(i,pa.l(r,i)*xaf.l(r,i,"Inv")) ;

   sam("itax","inv")$(ArmFlag eq 1) = sum(i,pd.l(r,i)*fdtax.l(r,i,"Inv")*xdf.l(r,i,"Inv"))
                                    + sum(i,pmt.l(r,i)*fmtax.l(r,i,"Inv")*xmf.l(r,i,"Inv")) ;
   sam("itax","inv")$(ArmFlag eq 0) = sum(i,pa.l(r,i)*fatax.l(r,i,"Inv")*xaf.l(r,i,"Inv")) ;

   sam("Act","etax")  = -sum(i,sum(rp,pe.l(r,rp,i)*etax.l(r,rp,i)*wtf.l(r,rp,i))) ;

   sam("Act","row")   = sum(i,sum(rp,wpe.l(r,rp,i)*wtf.l(r,rp,i)))
                      + sum(i,sum(rp,(1-chitrq(r,rp,i))*wpm.l(r,rp,i)*tar_p.l(r,rp,i)*wtf_q.l(r,rp,i))) ;

   sam("Act","marg")  = sum(i,pp.l(r,i)*xmarg.l(r,i)) ;

   sam("gov","itax") = sam("itax","Act")+sam("itax","hh")+sam("itax","Gov")+sam("itax","Inv") ;
   sam("gov","tar")  = sam("tar","comm") ;
   sam("gov","etax") = -sam("act","etax") ;

   sam("marg","row") = sam("Act","marg") ;

   sam("inv","row")$(savf.l(r) ge 0) = savf.l(r) ;
   sam("row","inv")$(savf.l(r) lt 0) = -savf.l(r) ;

   sam("inv","gov")$(savg.l(r) ge 0) = savg.l(r) ;
   sam("gov","inv")$(savg.l(r) lt 0) = -savg.l(r) ;

*  Add up totals
   sam("tot","Act")  = sum(is2,sam(is2,"Act")) ;
   sam("tot","Comm") = sum(is2,sam(is2,"Comm")) ;
   sam("tot","itax") = sum(is2,sam(is2,"itax")) ;
   sam("tot","fct")  = sum(is2,sam(is2,"fct")) ;
   sam("tot","lab")  = sum(is2,sam(is2,"lab")) ;
   sam("tot","kap")  = sum(is2,sam(is2,"kap")) ;
   sam("tot","hh")   = sum(is2,sam(is2,"hh")) ;
   sam("tot","gov")  = sum(is2,sam(is2,"gov")) ;
   sam("tot","inv")  = sum(is2,sam(is2,"inv")) ;
   sam("tot","depr") = sum(is2,sam(is2,"depr")) ;
   sam("tot","tar")  = sum(is2,sam(is2,"tar")) ;
   sam("tot","etax") = sum(is2,sam(is2,"etax")) ;
   sam("tot","marg") = sum(is2,sam(is2,"marg")) ;
   sam("tot","row")  = sum(is2,sam(is2,"row")) ;

   sam(is3,"tot") = sum(is2,sam(is3,is2)) ;
   sam(is,"res")  = sam(is,"tot") - sam("tot",is) ;

   sam(is,is1) = rscale*sam(is,is1) ;

   options decimals = 0 ;
   display sam ;
   options decimals = 6 ;
   ) ;
) ;
