* -- postsim.gms
* --
* -- This file produces simulation results in Excel compatible CSV files
* -- Two files are produced for each interval, a reportfile containing desired simulation variables,
* --      and a samfile containing complete Social Accounting Matrices
* --


* ----- Output the SAM

put samfile ;

*$include 'sam.gms'

* ----- Output the results

put reportfile ;

rscale = scale ;

* ----- Sectoral results

loop(i, put system.title, t.tl, 'xp',      i.tl, '', 'S1', (rscale*xp.l(i)) / ; ) ;
loop(i, put system.title, t.tl, 'pp',      i.tl, '', 'S2', (pp.l(i)) / ; ) ;
loop(i$icsv, put system.title, t.tl, 'px',      i.tl, '', 'S2', (px.l(i)) / ; ) ;
loop(i$icsv, put system.title, t.tl, 'va',      i.tl, '', 'S1', (rscale*va.l(i)) / ; ) ;
loop(i$icsv, put system.title, t.tl, 'pva',     i.tl, '', 'S2', (pva.l(i)) / ; ) ;
loop(k$icsv, put system.title, t.tl, 'int',     k.tl, '', 'S1', (rscale*sum(j,xap.l(k,j))) / ; ) ;
loop(kt$icsv,
   loop(i, put system.title, t.tl, 'kd',      i.tl, kt.tl, 'S1', (rscale*kd.l(i,kt)) / ; ) ;
   loop(i, put system.title, t.tl, 'rent',    i.tl, kt.tl, 'S2', (rent.l(i,kt)) / ; ) ;
   loop(i, put system.title, t.tl, 'lambdak', i.tl, kt.tl, 'S2', (lambdak.l(i,kt)) / ; ) ;
   loop(i, put system.title, t.tl, 'tfk',     i.tl, kt.tl, 'S2', (tfk.l(i,kt)) / ; ) ;
) ;
loop(lt$icsv,
   loop(i, put system.title, t.tl, 'td',      i.tl, lt.tl, 'S1', (rscale*td.l(i,lt)) / ; ) ;
   loop(i, put system.title, t.tl, 'pt',      i.tl, lt.tl, 'S2', (pt.l(i,lt)) / ; ) ;
   loop(i, put system.title, t.tl, 'lambdat', i.tl, lt.tl, 'S2', (lambdat.l(i,lt)) / ; ) ;
   loop(i, put system.title, t.tl, 'tft',     i.tl, lt.tl, 'S2', (tft.l(i,lt)) / ; ) ;
) ;

loop(l$icsv,
   loop(i, put system.title, t.tl, 'ld',      i.tl, l.tl, 'L1', (rscale*ld.l(i,l)) / ; ) ;
   loop(i, put system.title, t.tl, 'lambdal', i.tl, l.tl, 'L2', (lambdal.l(i,l)) / ; ) ;
   loop(i, put system.title, t.tl, 'wage',    i.tl, l.tl, 'L2', (wage.l(i,l)) / ; ) ;
   loop(i, put system.title, t.tl, 'tfl',     i.tl, l.tl, 'L2', (tfl.l(i,l)) / ; ) ;
) ;

loop(k, put system.title, t.tl, 'x',          k.tl, '', 'S1', (rscale*x.l(k)) / ; ) ;
loop(h,
   loop(k, put system.title, t.tl, 'xac',     h.tl, k.tl,  'H1', (rscale*xac.l(k,h)) / ; ) ;
) ;

loop(f$icsv,
   loop(k, put system.title, t.tl, 'xaf',     k.tl, f.tl, 'S1', (rscale*xaf.l(k,f)) / ; ) ;
   put system.title, t.tl, 'pf',     f.tl, '', 'M2', (pf.l(f)) / ;
   put system.title, t.tl, 'xf',     f.tl, '', 'M1', (rscale*xf.l(f)) / ;
   put system.title, t.tl, 'yf',     f.tl, '', 'M1', (rscale*yf.l(f)) / ;
) ;

loop(k, 
put system.title, t.tl, 'xa',  k.tl, '', 'S1', (rscale*xa.l(k)) / ; 
put system.title, t.tl, 'xd',  k.tl, '', 'S1', (rscale*xdd.l(k)) / ;
put system.title, t.tl, 'xmt', k.tl, '', 'S1', (rscale*xmt.l(k)) / ;
put system.title, t.tl, 'xet', k.tl, '', 'S1', (rscale*xet.l(k)) / ;
put$icsv system.title, t.tl, 'p',   k.tl, '', 'S2', (p.l(k))   / ;
put$icsv system.title, t.tl, 'pa',  k.tl, '', 'S2', (pa.l(k))  / ;
put$icsv system.title, t.tl, 'pd',  k.tl, '', 'S2', (pd.l(k))  / ;
put$icsv system.title, t.tl, 'pmt', k.tl, '', 'S2', (pmt.l(k)) / ;
put$icsv system.title, t.tl, 'pet', k.tl, '', 'S2', (pet.l(k)) / ;

     loop(r, put system.title, t.tl, "xm", k.tl, r.tl, "S3", (rscale*xm.l(k,r)) / ; ) ;
     loop(r, put system.title, t.tl, "xe", k.tl, r.tl, "S3", (rscale*xe.l(k,r)) / ; ) ;
) ;

loop(i$icsv, put system.title, t.tl, 'tp',  i.tl, '', 'S2', (tp.l(i)) / ; ) ;
loop(k$icsv, loop(j, put system.title, t.tl, 'tcp',  k.tl, j.tl, 'S2', (tcp.l(k,j)) / ; )) ;
loop(k$icsv, loop(h, put system.title, t.tl, 'tcc',  k.tl, h.tl, 'S2', (tcc.l(k,h)) / ; )) ;
loop(k$icsv, loop(f, put system.title, t.tl, 'tcf',  k.tl, f.tl, 'S2', (tcf.l(k,f)) / ; )) ;
loop(mg$icsv, loop(k, put system.title, t.tl, 'tmg', k.tl, mg.tl, 'S2', (tmg.l(k,mg)) / ; ) ; ) ;

* ----- Macro variables

put system.title, t.tl, 'gdpmp',    '', '', 'M1', (rscale*gdpmp.l) / ;
put system.title, t.tl, 'rgdpmp',   '', '', 'M1', (rscale*rgdpmp.l) / ;
put system.title, t.tl, 'pgdpmp',   '', '', 'M2', (pgdpmp.l) / ;

put system.title, t.tl, 'tcons',   '', '', 'M1', (rscale*sum(k,sum(h,(1+tcc0(k,h))*pa0(k)*xac.l(k,h)))) / ;
put system.title, t.tl, 'tinv',    '', '', 'M1', (rscale*sum(k,(1+tcf0(k,"Capacct"))*pa0(k)*xaf.l(k,"Capacct"))) / ;
*put system.title, t.tl, 'ttrdmg',  '', '', 'M1', (rscale*sum(k,(1+tcf0(k,"trdmg"))*pa0(k)*xaf.l(k,"trdmg"))) / ;
put system.title, t.tl, 'texp',    '', '', 'M1', (rscale*er0*sum(k,sum(r,wpe0(k,r)*xe.l(k,r)))) / ;
put system.title, t.tl, 'timp',    '', '', 'M1', (rscale*er0*sum(k,sum(r,wpm0(k,r)*xm.l(k,r)))) / ;

put system.title, t.tl, 'pcons',   '', '', 'M1', (100*sum(k,sum(h,(1+tcc.l(k,h))*pa.l(k)*xac0(k,h)))
                                                     /sum(k,sum(h,(1+tcc0(k,h))*pa0(k)*xac0(k,h)))) / ;
*if (xf0("GIV") ne 0, put system.title, t.tl, 'pgov',    '', '', 'M1',
*   (100*sum(k,(1+tcf.l(k,"GIV"))*pa.l(k)*xaf0(k,"GIV"))/sum(k,(1+tcf0(k,"GIV"))*pa0(k)*xaf0(k,"GIV"))) / ; ) ;
if (xf0("Capacct") ne 0, put system.title, t.tl, 'pinv',    '', '', 'M1',
   (100*sum(k,(1+tcf.l(k,"Capacct"))*pa.l(k)*xaf0(k,"Capacct"))/sum(k,(1+tcf0(k,"Capacct"))*pa0(k)*xaf0(k,"Capacct"))) / ; ) ;
*if (xf0("ginvs") ne 0, put system.title, t.tl, 'pzig',    '', '', 'M1',
*   (100*sum(k,(1+tcf.l(k,"ginvs"))*pa.l(k)*xaf0(k,"ginvs"))/sum(k,(1+tcf0(k,"ginvs"))*pa0(k)*xaf0(k,"ginvs"))) / ; ) ;
*if (xf0("inventory") ne 0, put system.title, t.tl, 'pdst',    '', '', 'M1',
*   (100*sum(k,(1+tcf.l(k,"inventory"))*pa.l(k)*xaf0(k,"inventory"))/sum(k,(1+tcf0(k,"inventory"))*pa0(k)*xaf0(k,"inventory"))) / ; ) ;
*if (xf0("trdmg") ne 0, put system.title, t.tl, 'ptrdmg',    '', '', 'M1',
*   (100*sum(k,(1+tcf.l(k,"trdmg"))*pa.l(k)*xaf0(k,"trdmg"))/sum(k,(1+tcf0(k,"trdmg"))*pa0(k)*xaf0(k,"trdmg"))) / ; ) ;

put system.title, t.tl, 'pexp',    '', '', 'M1', (100*er.l*sum(k,sum(r,wpe.l(k,r)*xe0(k,r)))/(er0*sum(k,sum(r,wpe0(k,r)*xe0(k,r))))) / ;
put system.title, t.tl, 'pimp',    '', '', 'M1', (100*er.l*sum(k,sum(r,wpm.l(k,r)*xm0(k,r)))/(er0*sum(k,sum(r,wpm0(k,r)*xm0(k,r))))) / ;

put system.title, t.tl, 'gdpfc',    '', '', 'M1', (rscale*gdpfc.l) / ;
put system.title, t.tl, 'rgdpfc',   '', '', 'M1', (rscale*rgdpfc.l) / ;
put system.title, t.tl, 'pgdpfc',   '', '', 'M2', (pgdpfc.l) / ;
put system.title, t.tl, 'pk',       '', '', 'M2', (pk.l) / ;
put system.title, t.tl, 'pland',    '', '', 'M2', (pland.l) / ;
put system.title, t.tl, 'ggdp',     '', '', 'M2', (ggdp.l) / ;
put system.title, t.tl, 'gl',       '', '', 'M2', (gl.l) / ;

loop(kt,put system.title, t.tl, 'ky',   kt.tl, '', 'M1', (rscale*ky.l(kt)) / ; ) ;
loop(lt,put system.title, t.tl, 'ty',   lt.tl, '', 'M1', (rscale*ty.l(lt)) / ; ) ;

loop(e$icsv,
   put system.title, t.tl, 'cy',       e.tl, '', 'M1', (rscale*cy.l(e)) / ;
   put system.title, t.tl, 'savc',     e.tl, '', 'M1', (rscale*savc.l(e)) / ;
   put system.title, t.tl, 'ctrw',     e.tl, '', 'M1', (rscale*ctrw.l(e)) / ;
   put system.title, t.tl, 'kappac',   e.tl, '', 'M2', (kappac.l(e)) / ;
   put system.title, t.tl, 'csavrate', e.tl, '', 'M2', (csavrate.l(e)) / ;
) ;

put system.title, t.tl, 'tary',  '', '', 'M1', (rscale*tary.l)  / ;
put system.title, t.tl, 'rtary', '', '', 'M1', (rscale*rtary.l) / ;
put system.title, t.tl, 'tmadj', '', '', 'M1', (tmadj.l)        / ;
put system.title, t.tl, 'gy',    '', '', 'M1', (rscale*gy.l)    / ;
put system.title, t.tl, 'gexp',  '', '', 'M1', (rscale*gexp.l)  / ;
put system.title, t.tl, 'savg',  '', '', 'M1', (rscale*savg.l)  / ;
put system.title, t.tl, 'rsg',   '', '', 'M1', (rscale*rsg.l)   / ;

loop(kt, put system.title, t.tl, 'tks',   kt.tl, '', 'M1', (rscale*tks.l(kt)) / ; ) ;
loop(kt, put system.title, t.tl, 'ptks',  kt.tl, '', 'M2', (ptks.l(kt)) / ; ) ;

put system.title, t.tl, 'savf', '', '', 'M1', (rscale*savf.l) / ;

put system.title, t.tl, 'plev', '', '', 'M2', (plev.l) / ;
put system.title, t.tl, 'er',   '', '', 'M2', (er.l) / ;

put system.title, t.tl, 'taxadjh',  '', '', 'M2', (taxadjh.l) / ;

loop(l, put system.title, t.tl, 'ly', l.tl, '', 'M3', (rscale*ly.l(l)) / ; ) ;

loop(h, 
put system.title, t.tl, 'yh',   h.tl, '', 'H1', (rscale*yh.l(h)) / ; 
put system.title, t.tl, 'yd',   h.tl, '', 'H1', (rscale*yd.l(h)) / ; 
put$icsv system.title, t.tl, 'savh', h.tl, '', 'H1', (rscale*savh.l(h)) / ; 
put$icsv system.title, t.tl, 'pop',  h.tl, '', 'H1', (pop.l(h)) / ; 
put$icsv system.title, t.tl, 'htr',  h.tl, '', 'H1', (rscale*htr.l(h)) / ; 
put$icsv system.title, t.tl, 'htrh', h.tl, '', 'H1', (rscale*sum(hh,htrh.l(h,hh))) / ; 
put$icsv system.title, t.tl, 'htrw', h.tl, '', 'H1', (rscale*htrw.l(h)) / ; 

put system.title, t.tl, 'gtrh',   h.tl, '', 'H1', (rscale*gtrh.l(h)) / ;
put system.title, t.tl, 'cpi',    h.tl, '', 'H2', (cpi.l(h)) / ; 
put system.title, t.tl, 'kappah', h.tl, '', 'H2', (kappah.l(h)) / ; 
) ;

* ----- Trade block

loop(r$icsv,
   loop(k, put system.title, t.tl, 'xm', k.tl, r.tl, 'T1', (rscale*xm.l(k,r)) / ; ) ;
   loop(k, put system.title, t.tl, 'xe', k.tl, r.tl, 'T1', (rscale*xe.l(k,r)) / ; ) ;

   loop(k, put system.title, t.tl, 'pm',     k.tl, r.tl, 'T2', (pm.l(k,r)) / ; ) ;
   loop(k, put system.title, t.tl, 'wpm',    k.tl, r.tl, 'T2', (wpm.l(k,r)) / ; ) ;
   loop(k, put system.title, t.tl, 'pe',     k.tl, r.tl, 'T2', (pe.l(k,r)) / ; ) ;
   loop(k, put system.title, t.tl, 'wpe',    k.tl, r.tl, 'T2', (wpe.l(k,r)) / ; ) ;
   loop(k, put system.title, t.tl, 'wpendx', k.tl, r.tl, 'T2', (wpendx.l(k,r)) / ; ) ;

   loop(k, put system.title, t.tl, 'tm', k.tl, r.tl, 'T2', (tm.l(k,r)) / ; ) ;
   loop(k, put system.title, t.tl, 'te', k.tl, r.tl, 'T2', (te.l(k,r)) / ; ) ;
) ;

* ----- Factor block

loop(gz$icsv,
   loop(l$(ls.l(l,gz) ne 0), put system.title, t.tl, "ls",    l.tl, gz.tl, 'L3', (ls.l(l,gz)/pscale) / ;) ;
   loop(l$(ls.l(l,gz) ne 0), put system.title, t.tl, "ewage", l.tl, gz.tl, 'L4', (ewage.l(l,gz)) / ;) ;
) ;

loop(l$icsv, put system.title, t.tl, "migr", l.tl, '', 'L3', (migr.l(l)/pscale) / ;) ;
