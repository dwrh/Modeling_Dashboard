if(ifCSV ne 0,

   put csv ;

   if(ord(t) eq 1,

      if(ifCSVhdr ne 0,
         put 'Scenario,Region,Variable,Sector,Qualifier,Year,Value' / ;
      ) ;

*     Setup the parameters for csv

      csv.pc   = 5 ;
      csv.pw = 255 ;
      csv.nj =   1 ;
      csv.nw =  15 ;
      csv.nd =   9 ;
      csv.nz =   0 ;
      csv.nr =   0 ;
   ) ;

* ----- loop over the regions and output the data

   loop(sim, loop(r,
      put sim.tl, r.tl, 'gdpmp',      '', 'M1', t.tl, gdpmpt(r,t)     / ;
      put sim.tl, r.tl, 'rgdpmp',     '', 'M1', t.tl, rgdpmpt(r,t)    / ;
      put sim.tl, r.tl, 'rgdp',       '', 'M1', t.tl, rgdpt(r,t)      / ;
      put sim.tl, r.tl, 'rgdpmp_ppp', '', 'M1', t.tl, rgdpmp_ppp(r,t) / ;
      put sim.tl, r.tl, 'ToT%',       '', 'M1', t.tl, (totPT(r,t)) / ;
      put sim.tl, r.tl, 'gdp_pc',     '', 'M1', t.tl, gdp_pc(r,t)     / ;
      put sim.tl, r.tl, 'gdp_pc_ppp', '', 'M1', t.tl, gdp_pc_ppp(r,t) / ;
      put sim.tl, r.tl, 'tkaps',      '', 'M1', t.tl, tkapsT(r,t)     / ;
      put sim.tl, r.tl, 'tlabs',      '', 'M1', t.tl, (rscale*sum(ll,(1-ue.l(r,ll,"Tot"))*labs.l(r,ll,"Tot"))) / ;
      put sim.tl, r.tl, 'cons',       '', 'M1', t.tl, const(r,t)      / ;
      put sim.tl, r.tl, 'gov',        '', 'M1', t.tl, govt(r,t)       / ;
      put sim.tl, r.tl, 'inv',        '', 'M1', t.tl, invt(r,t)       / ;
      put sim.tl, r.tl, 'invsh',      '', 'M1', t.tl, (100*invsh.l(r)) / ;
      put sim.tl, r.tl, 'exp',        '', 'M1', t.tl, expt(r,t)       / ;
      put sim.tl, r.tl, 'imp',        '', 'M1', t.tl, impt(r,t)       / ;

      put sim.tl, r.tl, 'pgdpmp',     '', 'M1', t.tl, pgdpmpt(r,t)    / ;
      put sim.tl, r.tl, 'pgdp',       '', 'M1', t.tl, pgdpt(r,t)      / ;
      put sim.tl, r.tl, 'pabs',       '', 'M1', t.tl, pabst(r,t)      / ;
      put sim.tl, r.tl, 'cpi',        '', 'M1', t.tl, cpit(r,t)       / ;
      put sim.tl, r.tl, 'gpi',        '', 'M1', t.tl, gpit(r,t)       / ;
      put sim.tl, r.tl, 'zpi',        '', 'M1', t.tl, zpit(r,t)       / ;
      put sim.tl, r.tl, 'epi',        '', 'M1', t.tl, epit(r,t)       / ;
      put sim.tl, r.tl, 'mpi',        '', 'M1', t.tl, mpit(r,t)       / ;
      put sim.tl, r.tl, 'tot',        '', 'M1', t.tl, tott(r,t)       / ;
      put sim.tl, r.tl, 'aRent',      '', 'M1', t.tl, arentT(r,t)     / ;

      put sim.tl, r.tl, 'savg',       '', 'M2', t.tl, savgT(r,t)      / ;
      put sim.tl, r.tl, 'savf',       '', 'M2', t.tl, savfT(r,t)      / ;
      put sim.tl, r.tl, 'psavw',      '', 'M2', t.tl, (psavw.l)       / ;
      put sim.tl, r.tl, 'wrr',        '', 'M2', t.tl, (wrr.l)         / ;
      put sim.tl, r.tl, 'tland',      '', 'M2', t.tl, tlandT(r,t)     / ;
      put sim.tl, r.tl, 'ptland',     '', 'M2', t.tl, ptland.l(r)     / ;
      if(leps0(r) ne inf and landmax(r) eq inf and tland0(r) ne 0,
         put sim.tl, r.tl, 'leps',      '', 'M2', t.tl, leps0(r)     / ;
      ) ;
      if(leps0(r) ne inf and landmax(r) ne inf and tland0(r) ne 0,
         put sim.tl, r.tl, 'leps',      '', 'M2', t.tl, (gammats(r)*ats(r)*(ptland.l(r)/pabs.l(r))
            /(ats(r) + exp(gammats(r)*(ptland.l(r)/pabs.l(r)))))      / ;
         put sim.tl, r.tl, 'landMax',   '', 'M2', t.tl, (landMax(r)/tland.l(r)) / ;
      ) ;
      put sim.tl, r.tl, 'chik',       '', 'M2', t.tl, (chik.l(r))     / ;
      put sim.tl, r.tl, 'Walras',     '', 'M2', t.tl, WalrasT(r,t)    / ;

      put sim.tl, r.tl, 'kstock',     '', 'M3', t.tl, kstockT(r,t)    / ;
      put sim.tl, r.tl, 'gk',         '', 'M3', t.tl, gkT(r,t)        / ;
      put sim.tl, r.tl, 'gl',         '', 'M3', t.tl, glT(r,t)        / ;
      put sim.tl, r.tl, 'lalloc',     '', 'M3', t.tl, lalloc(r,t)     / ;
      put sim.tl, r.tl, 'kalloc',     '', 'M3', t.tl, kalloc(r,t)     / ;
      put sim.tl, r.tl, 'talloc',     '', 'M3', t.tl, talloc(r,t)     / ;
      put sim.tl, r.tl, 'lprod',      '', 'M3', t.tl, lprod(r,t)      / ;
      put sim.tl, r.tl, 'kprod',      '', 'M3', t.tl, kprod(r,t)      / ;
      put sim.tl, r.tl, 'tprod',      '', 'M3', t.tl, tprod(r,t)      / ;
      put sim.tl, r.tl, 'fprod',      '', 'M3', t.tl, fprod(r,t)      / ;
      put sim.tl, r.tl, 'lgrowth',    '', 'M3', t.tl, lgrowth(r,t)    / ;
      put sim.tl, r.tl, 'kgrowth',    '', 'M3', t.tl, kgrowth(r,t)    / ;
      put sim.tl, r.tl, 'tgrowth',    '', 'M3', t.tl, tgrowth(r,t)    / ;
      put sim.tl, r.tl, 'fgrowth',    '', 'M3', t.tl, fgrowth(r,t)    / ;


*     put sim.tl, r.tl, 'emitot', '', '', t.tl, emitotT(r,t) / ;
*     put sim.tl, r.tl, 'emitax', '', '', t.tl, emitaxT(r,t) / ;
*     loop(i,
*        put sim.tl, r.tl, 'emitaxad'  i.tl, '',  t.tl, emitaxadT(r,i,t)  / ; ) ;


      loop(tranche, put sim.tl, r.tl, 'pop',    tranche.tl, 'M1', t.tl, (pop.l(r,tranche)) / ; )
      loop(tranche, put sim.tl, r.tl, 'deprat', tranche.tl, 'M2', t.tl, (deprat.l(r,tranche)) / ; )

      loop(h, put sim.tl, r.tl, 'hpop',  h.tl, 'H1',  t.tl, hpopT(r,h,t)  / ; ) ;
      loop(h, put sim.tl, r.tl, 'savh',  h.tl, 'H1',  t.tl, savhT(r,h,t)  / ; ) ;
      loop(h, put sim.tl, r.tl, 'aps',   h.tl, 'H1',  t.tl, (aps.l(r,h))  / ; ) ;
      loop(h, put sim.tl, r.tl, 'deprY', h.tl, 'H1',  t.tl, deprYT(r,h,t) / ; ) ;
      loop(h, put sim.tl, r.tl, 'yd',    h.tl, 'H1',  t.tl, ydT(r,h,t)    / ; ) ;
      loop(h, put sim.tl, r.tl, 'hcpi',  h.tl, 'H1',  t.tl, (cpi.l(r,h))  / ; ) ;

      loop(h, put sim.tl, r.tl, 'ryd',   h.tl, 'W1',  t.tl, rydT(r,h,t)   / ; ) ;
      loop(h, put sim.tl, r.tl, 'E1',    h.tl, 'W1',  t.tl, E1T(r,h,t)    / ; ) ;
      loop(h, put sim.tl, r.tl, 'E2',    h.tl, 'W1',  t.tl, E2T(r,h,t)    / ; ) ;
      loop(h, put sim.tl, r.tl, 'E3',    h.tl, 'W1',  t.tl, E3T(r,h,t)    / ; ) ;
      loop(h, put sim.tl, r.tl, 'E4',    h.tl, 'W1',  t.tl, E4T(r,h,t)    / ; ) ;
      loop(h, put sim.tl, r.tl, 'E5',    h.tl, 'W1',  t.tl, E5T(r,h,t)    / ; ) ;
      loop(h, put sim.tl, r.tl, 'E6',    h.tl, 'W1',  t.tl, E6T(r,h,t)    / ; ) ;

      loop(h, put sim.tl, r.tl, 'AE1',   h.tl, 'W2',  t.tl, AE1T(r,h,t)   / ; ) ;
      loop(h, put sim.tl, r.tl, 'AE2',   h.tl, 'W2',  t.tl, AE2T(r,h,t)   / ; ) ;
      loop(h, put sim.tl, r.tl, 'AE3',   h.tl, 'W2',  t.tl, AE3T(r,h,t)   / ; ) ;
      loop(h, put sim.tl, r.tl, 'AE4',   h.tl, 'W2',  t.tl, AE4T(r,h,t)   / ; ) ;
      loop(h, put sim.tl, r.tl, 'u',     h.tl, 'W2',  t.tl, u1(r,h,t)     / ; ) ;
      loop(h, put sim.tl, r.tl, 'Au',    h.tl, 'W2',  t.tl, Au1(r,h,t)    / ; ) ;

      put sim.tl, r.tl, 'GE1',   '', 'W2',  t.tl, GE1T(r,t)   / ;
      put sim.tl, r.tl, 'GE2',   '', 'W2',  t.tl, GE2T(r,t)   / ;
      put sim.tl, r.tl, 'GE3',   '', 'W2',  t.tl, GE3T(r,t)   / ;
      put sim.tl, r.tl, 'GE4',   '', 'W2',  t.tl, GE4T(r,t)   / ;
      put sim.tl, r.tl, 'Gu',    '', 'W2',  t.tl, gu1(r,t)    / ;

      loop(i, put sim.tl, r.tl, 'ld'    , i.tl, 'V1', t.tl, ldT(r,i,t)    / ; ) ;
      loop(i, put sim.tl, r.tl, 'kapd'  , i.tl, 'V1', t.tl, kapdT(r,i,t)  / ; ) ;
      loop(i, put sim.tl, r.tl, 'rent'  , i.tl, 'V1', t.tl, rentT(r,i,t)  / ; ) ;
      loop(i, put sim.tl, r.tl, 'nrent' , i.tl, 'V1', t.tl, (rentT(r,i,t)/(1+KapTax.l(r,i,"Old")))  / ; ) ;
      loop(i, put sim.tl, r.tl, 'pt'    , i.tl, 'V1', t.tl, ptT(r,i,t)     / ; ) ;
      loop(i, put sim.tl, r.tl, 'npt'   , i.tl, 'V1', t.tl, (npt.l(r,i))   / ; ) ;
      loop(i, put sim.tl, r.tl, 'px',     i.tl, 'V1', t.tl, pxT(r,i,t)     / ; ) ;
      loop(i, put sim.tl, r.tl, 'ac',     i.tl, 'V1', t.tl, ac.l(r,i)      / ; ) ;
      loop(i, put sim.tl, r.tl, 'uvc',    i.tl, 'V1', t.tl, uvc.l(r,i)     / ; ) ;
      loop(i, put sim.tl, r.tl, 'markup', i.tl, 'V1', t.tl, markup.l(r,i)  / ; ) ;

      loop(gz, put sim.tl, r.tl, 'va1',  gz.tl, 'V4', t.tl, va1T(r,gz,t)   / ; ) ;
      loop(gz, put sim.tl, r.tl, 'rva1', gz.tl, 'V4', t.tl, rva1T(r,gz,t)  / ; ) ;
      loop(gz, put sim.tl, r.tl, 'va2',  gz.tl, 'V4', t.tl, va2T(r,gz,t)   / ; ) ;
      loop(gz, put sim.tl, r.tl, 'rva2', gz.tl, 'V4', t.tl, rva2T(r,gz,t)  / ; ) ;

      loop(gz, put sim.tl, r.tl, 'pp1', gz.tl,  'V4', t.tl, pp1T(r,gz,t)  / ; ) ;
      loop(gz, put sim.tl, r.tl, 'pa1', gz.tl,  'V4', t.tl, pa1T(r,gz,t)  / ; ) ;

      loop(i$(ffT(r,i,t) ne 0), put sim.tl, r.tl, 'pf', i.tl, 'V1', t.tl, pfT(r,i,t) / ; ) ;
      loop(i$(ffT(r,i,t) ne 0), put sim.tl, r.tl, 'ff', i.tl, 'V1', t.tl, ffT(r,i,t) / ; ) ;

      loop(i, put sim.tl, r.tl, 'exprod', i.tl, 'V2', t.tl, exprodT(r,i,t) / ; ) ;
      loop(i, put sim.tl, r.tl, 'avgexp', i.tl, 'V2', t.tl, avgexpT(r,i,t) / ; ) ;
      loop(i, put sim.tl, r.tl, 'chip',   i.tl, 'V2', t.tl, chipT(r,i,t)   / ; ) ;

      loop(ll$(ord(ll) eq 1), loop(i, put sim.tl, r.tl, 'lambdal', i.tl, 'V2', t.tl, (lambdal.l(r,ll,i)) / ; ) ; ) ;
      loop(v$(ord(v) eq 1),   loop(i, put sim.tl, r.tl, 'lambdak', i.tl, 'V2', t.tl, (lambdak.l(r,i,v))  / ; ) ; ) ;

      loop(i, put sim.tl, r.tl, 'swage', i.tl, 'V3', t.tl, swageT(r,i,t) / ; ) ;
      loop(i, put sim.tl, r.tl, 'srent', i.tl, 'V3', t.tl, srentT(r,i,t) / ; ) ;
      loop(i, put sim.tl, r.tl, 'spap',  i.tl, 'V3', t.tl, spapT(r,i,t)  / ; ) ;
      loop(i, put sim.tl, r.tl, 'slab',  i.tl, 'V3', t.tl, slabT(r,i,t)  / ; ) ;
      loop(i, put sim.tl, r.tl, 'skap',  i.tl, 'V3', t.tl, skapT(r,i,t)  / ; ) ;
      loop(i, put sim.tl, r.tl, 'sland', i.tl, 'V3', t.tl, slandT(r,i,t) / ; ) ;
      loop(i, put sim.tl, r.tl, 'sfact', i.tl, 'V3', t.tl, sfactT(r,i,t) / ; ) ;
      loop(i, put sim.tl, r.tl, 'snd',   i.tl, 'V3', t.tl, sndT(r,i,t)   / ; ) ;

      loop(i, put sim.tl, r.tl, 'xp'   , i.tl, 'S1', t.tl, xpT(r,i,t)    / ; ) ;
      loop(i, put sim.tl, r.tl, 'es'   , i.tl, 'S1', t.tl, esT(r,i,t)    / ; ) ;
      loop(i, put sim.tl, r.tl, 'xd'   , i.tl, 'S1', t.tl, xdT(r,i,t)    / ; ) ;
      loop(i, put sim.tl, r.tl, 'xm'   , i.tl, 'S1', t.tl, xmtT(r,i,t)   / ; ) ;
      loop(i, put sim.tl, r.tl, 'xa'   , i.tl, 'S1', t.tl, xaT(r,i,t)    / ; ) ;
      loop(i, put sim.tl, r.tl, 'pp'   , i.tl, 'S1', t.tl, ppT(r,i,t)    / ; ) ;
*     loop(i, put sim.tl, r.tl, 'ac'   , i.tl, 'S1', t.tl, ac.l(r,i)     / ; ) ;
*     loop(i, put sim.tl, r.tl, 'px'   , i.tl, 'S1', t.tl, px.l(r,i)     / ; ) ;
*     loop(i, put sim.tl, r.tl, 'uvc'  , i.tl, 'S1', t.tl, uvc.l(r,i)    / ; ) ;
      loop(i, put sim.tl, r.tl, 'ppe'  , i.tl, 'S1', t.tl, ppeT(r,i,t)   / ; ) ;
      loop(i, put sim.tl, r.tl, 'pd'   , i.tl, 'S1', t.tl, pdT(r,i,t)    / ; ) ;
      loop(i, put sim.tl, r.tl, 'pmt'  , i.tl, 'S1', t.tl, pmtT(r,i,t)   / ; ) ;
      loop(i, put sim.tl, r.tl, 'pa'   , i.tl, 'S1', t.tl, paT(r,i,t)    / ; ) ;
      loop(i, put sim.tl, r.tl, 'profit', i.tl, 'S1', t.tl, (rscale*profit.l(r,i)) / ; ) ;

      loop(ia, put sim.tl, r.tl, 'SectExp', ia.tl, 'S2', t.tl, (rscale*sum(i$mapi(ia,i),sum(rp,wpe0(r,rp,i)*wtf.l(r,rp,i)))) / ; ) ;
      loop(ia, put sim.tl, r.tl, 'SectImp', ia.tl, 'S2', t.tl, (rscale*sum(i$mapi(ia,i),sum(rp,wpm0(rp,r,i)*wtf.l(rp,r,i)))) / ; ) ;

      loop(i$(kaptax.l(r,i,"Old") ne 0), put sim.tl, r.tl, 'KapTax', i.tl, 'S2', t.tl,  (100*KapTax.l(r,i,"Old"))  / ; ) ;
      loop(i$(LndTax.l(r,i) ne 0), put sim.tl, r.tl, 'LndTax', i.tl, 'S2', t.tl,  (100*LndTax.l(r,i))  / ; ) ;
      loop(i$(ptax.l(r,i) ne 0), put sim.tl, r.tl, 'ptax', i.tl, 'S2', t.tl,  (100*ptax.l(r,i))  / ; ) ;

      loop(i, put sim.tl, r.tl, 'wepit', i.tl, 'S2', t.tl, wepiT(r,i,t)  / ; ) ;
      loop(i, put sim.tl, r.tl, 'wmpit', i.tl, 'S2', t.tl, wmpiT(r,i,t)  / ; ) ;

      loop(i,
         work = sum(rp$(ord(rp) ne ord(r)),wpe0(r,rp,i)*wtf0(r,rp,i)) ;
        if (work ne 0,
           put sim.tl, r.tl, 'wepitx', i.tl, 'S2', t.tl,
              (sum(rp$(ord(rp) ne ord(r)), wpe.l(r,rp,i)*wtf0(r,rp,i))/work)  / ;
        ) ;
      ) ;

      loop(i,
         work = sum(rp$(ord(rp) ne ord(r)),wpm0(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i)) ;
         if (work ne 0,
            put sim.tl, r.tl, 'wmpitx', i.tl, 'S2', t.tl,
               (sum(rp$(ord(rp) ne ord(r)), wpm.l(rp,r,i)*lambdaw(rp,r,i)*wtf0(rp,r,i))/work)  / ;
         ) ;
      ) ;

      loop(i, put sim.tl, r.tl, 'xap'  , i.tl, 'S2', t.tl, xapT(r,i,t)   / ; ) ;
      loop(i, put sim.tl, r.tl, 'xaf'  , i.tl, 'S2', t.tl, xafT(r,i,t)   / ; ) ;

      loop(gz, loop(ll$(labs0(r,ll,gz) ne 0), put sim.tl, r.tl, 'labs',  ll.tl, gz.tl, t.tl, (rscale*labs.l(r,ll,gz))  / ; )) ;
      put sim.tl, r.tl, "labfpr",    '', 'L2', t.tl, (100*rscale*sum(ll,sum(gs,labs.l(r,ll,gs)))/pop.l(r,"g15")) / ;
      put sim.tl, r.tl, "labfprtot", '', 'L2', t.tl, (100*rscale*sum(ll,sum(gs,labs.l(r,ll,gs)))/pop.l(r,"Tot")) / ;
      loop(i,  loop(ll$(labdv0(r,ll,i) ne 0), put sim.tl, r.tl, 'labd',  ll.tl, i.tl,  t.tl, (rscale*(labdv.l(r,ll,i)+labdf.l(r,ll,i)))  / ; )) ;
      loop(i,  loop(ll$(labdv0(r,ll,i) ne 0), put sim.tl, r.tl, 'wage',  ll.tl, i.tl,  t.tl, (wage.l(r,ll,i))  / ; )) ;
      loop(gz, loop(ll$(labs0(r,ll,gz) ne 0), put sim.tl, r.tl, 'twage', ll.tl, gz.tl, t.tl, twage.l(r,ll,gz) / ; )) ;
      loop(gz, loop(ll$(labs0(r,ll,gz) ne 0), put sim.tl, r.tl, 'awage', ll.tl, gz.tl, t.tl, avgw.l(r,ll,gz) / ; )) ;
      loop(gz, loop(ll$(labs0(r,ll,gz) ne 0), put sim.tl, r.tl, 'ue',    ll.tl, gz.tl, t.tl, ue.l(r,ll,gz) / ; )) ;
      loop(gz, loop(ll$(labs0(r,ll,gz) ne 0), put sim.tl, r.tl, 'wmin',  ll.tl, gz.tl, t.tl, wmin.l(r,ll,gz) / ; )) ;
      loop(ll, put sim.tl, r.tl, "migr", ll.tl, "L1", t.tl, (rscale*migr.l(r,ll)) / ; ) ;

      loop(k,loop(h, put sim.tl, r.tl, 'xc'   ,  k.tl, h.tl, t.tl, xcT(r,k,h,t)   / ; )) ;
      loop(k,loop(h, put sim.tl, r.tl, 'pc'   ,  k.tl, h.tl, t.tl, pcT(r,k,h,t)   / ; )) ;
*     loop(k,loop(h, put sim.tl, r.tl, 'mpc'   , k.tl, h.tl, t.tl, mpcT(r,k,h,t)   / ; )) ;
*     loop(k,loop(h, put sim.tl, r.tl, 'theta' , k.tl, h.tl, t.tl, thetaT(r,k,h,t) / ; )) ;
*     loop(k,loop(h, put sim.tl, r.tl, 'eta'   , k.tl, h.tl, t.tl, etaT(r,k,h,t)   / ; )) ;

      if(0 and ord(t) eq 1,
         loop(i,loop(j$(xap0(r,i,j) ne 0), put sim.tl, r.tl, 'xap',   i.tl, j.tl, 'Benchmark', (rscale*xap.l(r,i,j)) / ; )) ;
         loop(i,loop(j$(patax0(r,i,j) ne 0), put sim.tl, r.tl, 'patax', i.tl, j.tl, 'Benchmark',  patax.l(r,i,j)      / ; )) ;
         loop(i, put sim.tl, r.tl,        'pa',    i.tl, '',   'Benchmark', (pa.l(r,i))          / ; ) ;

         loop(i$(kaptax.l(r,i,"Old") ne 0), put sim.tl, r.tl, 'KapTax', i.tl, '', 'Benchmark',  KapTax.l(r,i,"Old")                   / ; ) ;
         loop(i$(kapdT(r,i,t) ne 0), put sim.tl, r.tl, 'nrent',  i.tl, '', 'Benchmark', (rentT(r,i,t)/(1+KapTax.l(r,i,"Old"))) / ; ) ;
         loop(i$(kapdT(r,i,t) ne 0), put sim.tl, r.tl, 'kapd',   i.tl, '', 'Benchmark', (kapdT(r,i,t))                   / ; ) ;

         loop(i$(LndTax.l(r,i) ne 0), put sim.tl, r.tl, 'LndTax', i.tl, '', 'Benchmark',  LndTax.l(r,i)                 / ; ) ;
         loop(i$(td.l(r,i) ne 0), put sim.tl, r.tl, 'pt',     i.tl, '', 'Benchmark', (ptT(r,i,t)/(1+LndTax.l(r,i))) / ; ) ;
         loop(i$(td.l(r,i) ne 0), put sim.tl, r.tl, 'td',     i.tl, '', 'Benchmark', (rscale*td.l(r,i))              / ; ) ;

         loop(i$(ptax.l(r,i) ne 0), put sim.tl, r.tl, 'ptax', i.tl, '', 'Benchmark', ptax.l(r,i)       / ; ) ;
         loop(i$(xp.l(r,i) ne 0), put sim.tl, r.tl, 'px',   i.tl, '', 'Benchmark', px.l(r,i)         / ; ) ;
         loop(i$(xp.l(r,i) ne 0), put sim.tl, r.tl, 'xp',   i.tl, '', 'Benchmark', (rscale*xp.l(r,i)) / ; ) ;
      ) ;


      loop(gi,loop(gts, put sim.tl, r.tl, 'GovAcct' , gi.tl, gts.tl,  t.tl, GovAcctT(r,gi,gts,t)   / ; )) ;

*  End of r loop

   ) ;

*  Global variables

   loop(i, put sim.tl, 'GBL', 'AWP', i.tl, '', t.tl, AWPT(i,t) / ; ) ;
   loop(i,
      work = sum(r,sum(rp$(ord(r) ne ord(rp)), wpe0(r,rp,i)*wtf0(r,rp,i))) ;
      if (work ne 0,
         put sim.tl, 'GBL', 'AWPX', i.tl, '', t.tl,
            (sum(r,sum(rp$(ord(r) ne ord(rp)),wpe.l(r,rp,i)*wtf0(r,rp,i)))/work) / ;
      ) ;
   ) ;

*  End of 'sim' loop
   ) ;

*  End of ifCSV
) ;
