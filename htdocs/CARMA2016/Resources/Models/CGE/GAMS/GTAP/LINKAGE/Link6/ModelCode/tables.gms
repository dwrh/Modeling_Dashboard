set ta(t) / 2011*2015 / ;
set tb(t) / 2006*2015 / ;
set t4lab1 / gdp1997, gdp2005, gdp2015 / ;
set t4lab2 / pop1997, pop2005, pop2015 / ;
set t4lab3 / ndx1997, ndx2005, ndx2015 / ;
set ta4(t) / 1997, 2005, 2015 / ;

set mapta4l1(ta4,t4lab1) /
   1997.gdp1997
   2005.gdp2005
   2015.gdp2015
/ ;
set mapta4l2(ta4,t4lab2) /
   1997.pop1997
   2005.pop2005
   2015.pop2015
/ ;

set mapta4l3(ta4,t4lab3) /
   1997.ndx1997
   2005.ndx2005
   2015.ndx2015
/ ;

if(ifTab ne 0,

   put tab ;

   if(ifTabhdr ne 0,
      put 'Scenario,Table,Region,rlab,clab,Value' / ;
   ) ;

*  Setup the parameters for tab

   tab.pc   = 5 ;
   tab.pw = 255 ;
   tab.nj =   1 ;
   tab.nw =  15 ;
   tab.nd =   9 ;
   tab.nz =   0 ;
   tab.nr =   0 ;

* ----- Table 11

   loop(sim, loop(ra,loop(t$(ord(t) ne 1),
      put sim.tl, "Tab11", ra.tl, t.tl, 'gdp',     (100*sum(r$mapr(ra,r),rgdpt(r,t))/sum(r$mapr(ra,r),rgdpt(r,t-1))-100) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'pop',     (100*sum(r$mapr(ra,r),sum(h,hpopT(r,h,t)))/sum(r$mapr(ra,r),sum(h,hpopT(r,h,t-1)))-100) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'tlabs',   (100*sum(r$mapr(ra,r),tlabst(r,t))/sum(r$mapr(ra,r),tlabst(r,t-1))-100) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'avggl',   (100*sum(r$mapr(ra,r),tlabst(r,t)*avgglt(r,t))/sum(r$mapr(ra,r),tlabst(r,t))) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'tkaps',   (100*sum(r$mapr(ra,r),tkapst(r,t))/sum(r$mapr(ra,r),tkapst(r,t-1))-100) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'avggk',   (100*sum(r$mapr(ra,r),tkapst(r,t)*avggkt(r,t))/sum(r$mapr(ra,r),tkapst(r,t))) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'lgrowth', (100*sum(r$mapr(ra,r),tlabst(r,t)*lgrowth(r,t))/sum(r$mapr(ra,r),tlabst(r,t))) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'lprod',   (100*sum(r$mapr(ra,r),tlabst(r,t)*(lprod(r,t)+lalloc(r,t)))/sum(r$mapr(ra,r),tlabst(r,t))) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'kgrowth', (100*sum(r$mapr(ra,r),tkapst(r,t)*(kgrowth(r,t)+tgrowth(r,t)+fgrowth(r,t)))/sum(r$mapr(ra,r),tkapst(r,t))) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'kprod',   (100*sum(r$mapr(ra,r),tkapst(r,t)*(kprod(r,t)+kalloc(r,t)+tprod(r,t)+talloc(r,t)+fprod(r,t)))/sum(r$mapr(ra,r),tkapst(r,t))) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'xprod',   (100*sum(r$mapr(ra,r),rgdpt(r,t)*(lprod(r,t)+lalloc(r,t)+kprod(r,t)+kalloc(r,t)+tprod(r,t)+talloc(r,t)+fprod(r,t)))/sum(r$mapr(ra,r),rgdpt(r,t))) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'dsavx',   (100*sum(r$mapr(ra,r),sum(h,depryt(r,h,t)+savht(r,h,t)) + savgt(r,t))/sum(r$mapr(ra,r),gdpmpt(r,t))) / ;
      put sim.tl, "Tab11", ra.tl, t.tl, 'tsavx',   (100*sum(r$mapr(ra,r),sum(h,depryt(r,h,t)+savht(r,h,t)) + savgt(r,t) + savft(r,t))/sum(r$mapr(ra,r),gdpmpt(r,t))) / ;
   ))) ;

* ----- Table 12

   gap  = years("2015") - years("2010") ;
   work = 1/gap ;

   loop(sim, loop(ra,
      put sim.tl, "Tab12", "gbl", ra.tl, "gdp",   (100*((sum(r$mapr(ra,r),rgdpt(r,"2015"))/sum(r$mapr(ra,r),rgdpt(r,"2010")))**work - 1)) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, "pop",   (100*((sum(r$mapr(ra,r),sum(h,hpopT(r,h,"2015")))/sum(r$mapr(ra,r),sum(h,hpopT(r,h,"2010"))))**work - 1)) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, "tlabs", (100*((sum(r$mapr(ra,r),tlabst(r,"2015"))/sum(r$mapr(ra,r),tlabst(r,"2010")))**work - 1)) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, "avggl", (100*sum(ta,sum(r$mapr(ra,r),avgglt(r,ta)*tlabst(r,ta))/sum(r$mapr(ra,r),tlabst(r,ta)))/gap) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, "tkaps", (100*((sum(r$mapr(ra,r),tkapst(r,"2015"))/sum(r$mapr(ra,r),tkapst(r,"2010")))**work - 1)) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, "avggk", (100*sum(ta,sum(r$mapr(ra,r),avggkt(r,ta)*tkapst(r,ta))/sum(r$mapr(ra,r),tkapst(r,ta)))/gap) / ;


      put sim.tl, "Tab12", "gbl", ra.tl, 'lgrowth', (100*sum(ta,sum(r$mapr(ra,r),lgrowth(r,ta)*tlabst(r,ta))/sum(r$mapr(ra,r),tlabst(r,ta)))/gap) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, 'lprod',   (100*sum(ta,sum(r$mapr(ra,r),(lprod(r,ta)+lalloc(r,ta))*tlabst(r,ta))/sum(r$mapr(ra,r),tlabst(r,ta)))/gap) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, 'kgrowth', (100*sum(ta,sum(r$mapr(ra,r),(kgrowth(r,ta)+tgrowth(r,ta)+fgrowth(r,ta))*tkapst(r,ta))/sum(r$mapr(ra,r),tkapst(r,ta)))/gap) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, 'kprod',   (100*sum(ta,sum(r$mapr(ra,r),(kprod(r,ta)+kalloc(r,ta)+tprod(r,ta)+talloc(r,ta)+fprod(r,ta))*tkapst(r,ta))/sum(r$mapr(ra,r),tkapst(r,ta)))/gap) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, 'xprod',   (100*sum(ta,sum(r$mapr(ra,r),(lprod(r,ta)+lalloc(r,ta)+kprod(r,ta)+kalloc(r,ta)+tprod(r,ta)+talloc(r,ta)+fprod(r,ta))*rgdpt(r,ta))/sum(r$mapr(ra,r),rgdpt(r,ta)))/gap) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, 'dsavx',   (100*sum(ta,sum(r$mapr(ra,r),(sum(h,depryt(r,h,ta)+savht(r,h,ta)) + savgt(r,ta)))/sum(r$mapr(ra,r),gdpmpt(r,ta)))/gap) / ;
      put sim.tl, "Tab12", "gbl", ra.tl, 'tsavx',   (100*sum(ta,sum(r$mapr(ra,r),(sum(h,depryt(r,h,ta)+savht(r,h,ta)) + savgt(r,ta) + savft(r,ta)))/sum(r$mapr(ra,r),gdpmpt(r,ta)))/gap) / ;
   )) ;

* ----- Table 13

   gap  = years("2015") - years("2005") ;
   work = 1/gap ;

   loop(sim, loop(ra,
      put sim.tl, "Tab13", "gbl", ra.tl, "gdp",   (100*((sum(r$mapr(ra,r),rgdpt(r,"2015"))/sum(r$mapr(ra,r),rgdpt(r,"2005")))**work - 1)) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, "pop",   (100*((sum(r$mapr(ra,r),sum(h,hpopT(r,h,"2015")))/sum(r$mapr(ra,r),sum(h,hpopT(r,h,"2005"))))**work - 1)) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, "tlabs", (100*((sum(r$mapr(ra,r),tlabst(r,"2015"))/sum(r$mapr(ra,r),tlabst(r,"2005")))**work - 1)) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, "avggl", (100*sum(tb,sum(r$mapr(ra,r),avgglt(r,tb)*tlabst(r,tb))/sum(r$mapr(ra,r),tlabst(r,tb)))/gap) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, "tkaps", (100*((sum(r$mapr(ra,r),tkapst(r,"2015"))/sum(r$mapr(ra,r),tkapst(r,"2005")))**work - 1)) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, "avggk", (100*sum(tb,sum(r$mapr(ra,r),avggkt(r,tb)*tkapst(r,tb))/sum(r$mapr(ra,r),tkapst(r,tb)))/gap) / ;


      put sim.tl, "Tab13", "gbl", ra.tl, 'lgrowth', (100*sum(tb,sum(r$mapr(ra,r),lgrowth(r,tb)*tlabst(r,tb))/sum(r$mapr(ra,r),tlabst(r,tb)))/gap) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, 'lprod',   (100*sum(tb,sum(r$mapr(ra,r),(lprod(r,tb)+lalloc(r,tb))*tlabst(r,tb))/sum(r$mapr(ra,r),tlabst(r,tb)))/gap) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, 'kgrowth', (100*sum(tb,sum(r$mapr(ra,r),(kgrowth(r,tb)+tgrowth(r,tb)+fgrowth(r,tb))*tkapst(r,tb))/sum(r$mapr(ra,r),tkapst(r,tb)))/gap) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, 'kprod',   (100*sum(tb,sum(r$mapr(ra,r),(kprod(r,tb)+kalloc(r,tb)+tprod(r,tb)+talloc(r,tb)+fprod(r,tb))*tkapst(r,tb))/sum(r$mapr(ra,r),tkapst(r,tb)))/gap) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, 'xprod',   (100*sum(tb,sum(r$mapr(ra,r),(lprod(r,tb)+lalloc(r,tb)+kprod(r,tb)+kalloc(r,tb)+tprod(r,tb)+talloc(r,tb)+fprod(r,tb))*rgdpt(r,tb))/sum(r$mapr(ra,r),rgdpt(r,tb)))/gap) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, 'dsavx',   (100*sum(tb,sum(r$mapr(ra,r),(sum(h,depryt(r,h,tb)+savht(r,h,tb)) + savgt(r,tb)))/sum(r$mapr(ra,r),gdpmpt(r,tb)))/gap) / ;
      put sim.tl, "Tab13", "gbl", ra.tl, 'tsavx',   (100*sum(tb,sum(r$mapr(ra,r),(sum(h,depryt(r,h,tb)+savht(r,h,tb)) + savgt(r,tb) + savft(r,tb)))/sum(r$mapr(ra,r),gdpmpt(r,tb)))/gap) / ;
   )) ;

* ----- Table 1

   loop(sim, loop(ra,
      loop(t$(years(t) gt 1997 and years(t) le 2005),
         put sim.tl, "Tab1", "gbl", ra.tl, t.tl, (100*((sum(r$mapr(ra,r),rgdpmpt(r,t))/sum(r$mapr(ra,r),rgdpmpt(r,t-1))) - 1)) / ;
      ) ;

      put sim.tl, "Tab1", "gbl", ra.tl, "2000/05", (100*((sum(r$mapr(ra,r),rgdpmpt(r,"2005"))/sum(r$mapr(ra,r),rgdpmpt(r,"2000")))**(1/5) - 1)) / ;
      put sim.tl, "Tab1", "gbl", ra.tl, "2005/10", (100*((sum(r$mapr(ra,r),rgdpmpt(r,"2010"))/sum(r$mapr(ra,r),rgdpmpt(r,"2005")))**(1/5) - 1)) / ;
      put sim.tl, "Tab1", "gbl", ra.tl, "2010/15", (100*((sum(r$mapr(ra,r),rgdpmpt(r,"2015"))/sum(r$mapr(ra,r),rgdpmpt(r,"2010")))**(1/5) - 1)) / ;
      put sim.tl, "Tab1", "gbl", ra.tl, "2005/15", (100*((sum(r$mapr(ra,r),rgdpmpt(r,"2015"))/sum(r$mapr(ra,r),rgdpmpt(r,"2005")))**(1/10) - 1)) / ;
      put sim.tl, "Tab1", "gbl", ra.tl, "2000/15", (100*((sum(r$mapr(ra,r),rgdpmpt(r,"2015"))/sum(r$mapr(ra,r),rgdpmpt(r,"2000")))**(1/15) - 1)) / ;
   )) ;


* ----- Table 2

   loop(sim, loop(ra,
      loop(t$(years(t) gt 1997 and years(t) le 2005),
         put sim.tl, "Tab2", "gbl", ra.tl, t.tl, (100*((sum(r$mapr(ra,r),sum(h,hpopt(r,h,t)))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,t-1)))) - 1)) / ;
      ) ;

      put sim.tl, "Tab2", "gbl", ra.tl, "2000/05", (100*((sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2005")))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2000"))))**(1/5) - 1)) / ;
      put sim.tl, "Tab2", "gbl", ra.tl, "2005/10", (100*((sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2010")))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2005"))))**(1/5) - 1)) / ;
      put sim.tl, "Tab2", "gbl", ra.tl, "2010/15", (100*((sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2015")))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2010"))))**(1/5) - 1)) / ;
      put sim.tl, "Tab2", "gbl", ra.tl, "2005/15", (100*((sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2015")))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2005"))))**(1/10) - 1)) / ;
      put sim.tl, "Tab2", "gbl", ra.tl, "2000/15", (100*((sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2015")))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2000"))))**(1/15) - 1)) / ;
   )) ;

* ----- Table 3

   loop(sim, loop(ra,
      loop(t$(years(t) gt 1997 and years(t) le 2005),
         put sim.tl, "Tab3", "gbl", ra.tl, t.tl, (100*(((sum(r$mapr(ra,r),rgdpmpt(r,t))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,t))))
                                                          / (sum(r$mapr(ra,r),rgdpmpt(r,t-1))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,t-1))))) - 1)) / ;
      ) ;

      put sim.tl, "Tab3", "gbl", ra.tl, "2000/05", (100*(((sum(r$mapr(ra,r),rgdpmpt(r,"2005"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2005"))))
                                                       / (sum(r$mapr(ra,r),rgdpmpt(r,"2000"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2000")))))**(1/5) - 1)) / ;
      put sim.tl, "Tab3", "gbl", ra.tl, "2005/10", (100*(((sum(r$mapr(ra,r),rgdpmpt(r,"2010"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2010"))))
                                                       / (sum(r$mapr(ra,r),rgdpmpt(r,"2005"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2005")))))**(1/5) - 1)) / ;
      put sim.tl, "Tab3", "gbl", ra.tl, "2010/15", (100*(((sum(r$mapr(ra,r),rgdpmpt(r,"2015"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2015"))))
                                                       / (sum(r$mapr(ra,r),rgdpmpt(r,"2010"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2010")))))**(1/5) - 1)) / ;
      put sim.tl, "Tab3", "gbl", ra.tl, "2005/15", (100*(((sum(r$mapr(ra,r),rgdpmpt(r,"2015"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2015"))))
                                                       / (sum(r$mapr(ra,r),rgdpmpt(r,"2005"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2005")))))**(1/10) - 1)) / ;
      put sim.tl, "Tab3", "gbl", ra.tl, "2000/15", (100*(((sum(r$mapr(ra,r),rgdpmpt(r,"2015"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2015"))))
                                                       / (sum(r$mapr(ra,r),rgdpmpt(r,"2000"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2000")))))**(1/15) - 1)) / ;
   )) ;

* ----- Table 4

   loop(sim, loop(ta4,
      work = sum(r,rgdpmpt(r,ta4)) ;
      gap  = sum(r,sum(h,hpopt(r,h,ta4))) ;

      put sim.tl, "Tab4", "gbl", "TOT",
      loop(t4lab1$mapta4l1(ta4,t4lab1), put t4lab1.tl ; ) ;
      put (0.001*work) / ;

      put sim.tl, "Tab4", "gbl", "TOT",
      loop(t4lab2$mapta4l2(ta4,t4lab2), put t4lab2.tl ; ) ;
      put gap / ;

      put sim.tl, "Tab4", "gbl", "TOT",
      loop(t4lab3$mapta4l3(ta4,t4lab3), put t4lab3.tl ; ) ;
      put (work/gap) / ;

      loop(ra,
         put sim.tl, "Tab4", "gbl", ra.tl ;
         loop(t4lab1$mapta4l1(ta4,t4lab1), put t4lab1.tl ; ) ;
         put (100*sum(r$mapr(ra,r),rgdpmpt(r,ta4))/work) / ;
      ) ;

      loop(ra,
         put sim.tl, "Tab4", "gbl", ra.tl ;
         loop(t4lab2$mapta4l2(ta4,t4lab2), put t4lab2.tl ; ) ;
         put (100*sum(r$mapr(ra,r),sum(h, hpopt(r,h,ta4)))/gap) / ;
      ) ;

      loop(ra,
         put sim.tl, "Tab4", "gbl", ra.tl ;
         loop(t4lab3$mapta4l3(ta4,t4lab3), put t4lab3.tl ; ) ;
         put ((sum(r$mapr(ra,r),rgdpmpt(r,ta4))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,ta4))))/(work/gap)) / ;
      ) ;
   )) ;


* ----- Table 5

   loop(sim, loop(ra,
      loop(t$(years(t) gt 1997 and years(t) le 2005),
         put sim.tl, "Tab5", "gbl", ra.tl, t.tl, (100*((sum(r$mapr(ra,r),rgdpmp_ppp(r,t))/sum(r$mapr(ra,r),rgdpmp_ppp(r,t-1))) - 1)) / ;
      ) ;

      put sim.tl, "Tab5", "gbl", ra.tl, "2000/05", (100*((sum(r$mapr(ra,r),rgdpmp_ppp(r,"2005"))/sum(r$mapr(ra,r),rgdpmp_ppp(r,"2000")))**(1/5) - 1)) / ;
      put sim.tl, "Tab5", "gbl", ra.tl, "2005/10", (100*((sum(r$mapr(ra,r),rgdpmp_ppp(r,"2010"))/sum(r$mapr(ra,r),rgdpmp_ppp(r,"2005")))**(1/5) - 1)) / ;
      put sim.tl, "Tab5", "gbl", ra.tl, "2010/15", (100*((sum(r$mapr(ra,r),rgdpmp_ppp(r,"2015"))/sum(r$mapr(ra,r),rgdpmp_ppp(r,"2010")))**(1/5) - 1)) / ;
      put sim.tl, "Tab5", "gbl", ra.tl, "2005/15", (100*((sum(r$mapr(ra,r),rgdpmp_ppp(r,"2015"))/sum(r$mapr(ra,r),rgdpmp_ppp(r,"2005")))**(1/10) - 1)) / ;
      put sim.tl, "Tab5", "gbl", ra.tl, "2000/15", (100*((sum(r$mapr(ra,r),rgdpmp_ppp(r,"2015"))/sum(r$mapr(ra,r),rgdpmp_ppp(r,"2000")))**(1/15) - 1)) / ;
   )) ;


* ----- Table 6

   loop(sim, loop(ra,
      loop(t$(years(t) gt 1997 and years(t) le 2005),
         put sim.tl, "Tab6", "gbl", ra.tl, t.tl, (100*(((sum(r$mapr(ra,r),rgdpmp_ppp(r,t))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,t))))
                                                          / (sum(r$mapr(ra,r),rgdpmp_ppp(r,t-1))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,t-1))))) - 1)) / ;
      ) ;

      put sim.tl, "Tab6", "gbl", ra.tl, "2000/05", (100*(((sum(r$mapr(ra,r),rgdpmp_ppp(r,"2005"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2005"))))
                                                       / (sum(r$mapr(ra,r),rgdpmp_ppp(r,"2000"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2000")))))**(1/5) - 1)) / ;
      put sim.tl, "Tab6", "gbl", ra.tl, "2005/10", (100*(((sum(r$mapr(ra,r),rgdpmp_ppp(r,"2010"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2010"))))
                                                       / (sum(r$mapr(ra,r),rgdpmp_ppp(r,"2005"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2005")))))**(1/5) - 1)) / ;
      put sim.tl, "Tab6", "gbl", ra.tl, "2010/15", (100*(((sum(r$mapr(ra,r),rgdpmp_ppp(r,"2015"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2015"))))
                                                       / (sum(r$mapr(ra,r),rgdpmp_ppp(r,"2010"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2010")))))**(1/5) - 1)) / ;
      put sim.tl, "Tab6", "gbl", ra.tl, "2005/15", (100*(((sum(r$mapr(ra,r),rgdpmp_ppp(r,"2015"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2015"))))
                                                       / (sum(r$mapr(ra,r),rgdpmp_ppp(r,"2005"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2005")))))**(1/10) - 1)) / ;
      put sim.tl, "Tab6", "gbl", ra.tl, "2000/15", (100*(((sum(r$mapr(ra,r),rgdpmp_ppp(r,"2015"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2015"))))
                                                       / (sum(r$mapr(ra,r),rgdpmp_ppp(r,"2000"))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,"2000")))))**(1/15) - 1)) / ;
   )) ;

* ----- Table 7

   loop(sim, loop(ta4,
      work = sum(r,rgdpmp_ppp(r,ta4)) ;
      gap  = sum(r,sum(h,hpopt(r,h,ta4))) ;

      put sim.tl, "Tab7", "gbl", "TOT",
      loop(t4lab1$mapta4l1(ta4,t4lab1), put t4lab1.tl ; ) ;
      put (0.001*work) / ;

      put sim.tl, "Tab7", "gbl", "TOT",
      loop(t4lab2$mapta4l2(ta4,t4lab2), put t4lab2.tl ; ) ;
      put gap / ;

      put sim.tl, "Tab7", "gbl", "TOT",
      loop(t4lab3$mapta4l3(ta4,t4lab3), put t4lab3.tl ; ) ;
      put (work/gap) / ;

      loop(ra,
         put sim.tl, "Tab7", "gbl", ra.tl ;
         loop(t4lab1$mapta4l1(ta4,t4lab1), put t4lab1.tl ; ) ;
         put (100*sum(r$mapr(ra,r),rgdpmp_ppp(r,ta4))/work) / ;
      ) ;

      loop(ra,
         put sim.tl, "Tab7", "gbl", ra.tl ;
         loop(t4lab2$mapta4l2(ta4,t4lab2), put t4lab2.tl ; ) ;
         put (100*sum(r$mapr(ra,r),sum(h, hpopt(r,h,ta4)))/gap) / ;
      ) ;

      loop(ra,
         put sim.tl, "Tab7", "gbl", ra.tl ;
         loop(t4lab3$mapta4l3(ta4,t4lab3), put t4lab3.tl ; ) ;
         put ((sum(r$mapr(ra,r),rgdpmp_ppp(r,ta4))/sum(r$mapr(ra,r),sum(h,hpopt(r,h,ta4))))/(work/gap)) / ;
      ) ;
   )) ;

* ----- Table 8

   loop(sim, loop(ra,loop(t$(ord(t) ne 1),

      put sim.tl, "Tab8", ra.tl, t.tl, 'gdp',     (100*sum(r$mapr(ra,r),rgdpmpt(r,t))/sum(r$mapr(ra,r),rgdpmpt(r,t-1))-100) / ;
      put sim.tl, "Tab8", ra.tl, t.tl, 'cons',    (100*sum(r$mapr(ra,r),const(r,t))/sum(r$mapr(ra,r),const(r,t-1))-100) / ;
      put sim.tl, "Tab8", ra.tl, t.tl, 'gov',     (100*sum(r$mapr(ra,r),govt(r,t))/sum(r$mapr(ra,r),govt(r,t-1))-100) / ;
      put sim.tl, "Tab8", ra.tl, t.tl, 'inv',     (100*sum(r$mapr(ra,r),invt(r,t))/sum(r$mapr(ra,r),invt(r,t-1))-100) / ;
      put sim.tl, "Tab8", ra.tl, t.tl, 'exp',     (100*sum(r$mapr(ra,r),expt(r,t))/sum(r$mapr(ra,r),expt(r,t-1))-100) / ;
      put sim.tl, "Tab8", ra.tl, t.tl, 'imp',     (100*sum(r$mapr(ra,r),impt(r,t))/sum(r$mapr(ra,r),impt(r,t-1))-100) / ;

      put sim.tl, "Tab8", ra.tl, t.tl, 'tot',     (100*(sum(r$mapr(ra,r),totT(r,t)*(expt(r,t)+impt(r,t)))/sum(r$mapr(ra,r),expt(r,t)+impt(r,t)))
                                                      /(sum(r$mapr(ra,r),totT(r,t-1)*(expt(r,t-1)+impt(r,t-1)))/sum(r$mapr(ra,r),expt(r,t-1)+impt(r,t-1)))-100) / ;

      work = sum(r$mapr(ra,r), const(r,t)+govt(r,t)+invt(r,t)+expt(r,t)-impt(r,t)) ;

      put sim.tl, "Tab8", ra.tl, t.tl, 'c_cons',    (100*sum(r$mapr(ra,r),const(r,t)-const(r,t-1))/work) / ;
      put sim.tl, "Tab8", ra.tl, t.tl, 'c_gov',     (100*sum(r$mapr(ra,r),govt(r,t)-govt(r,t-1))/work) / ;
      put sim.tl, "Tab8", ra.tl, t.tl, 'c_inv',     (100*sum(r$mapr(ra,r),invt(r,t)-invt(r,t-1))/work) / ;
      put sim.tl, "Tab8", ra.tl, t.tl, 'c_exp',     (100*sum(r$mapr(ra,r),expt(r,t)-expt(r,t-1))/work) / ;
      put sim.tl, "Tab8", ra.tl, t.tl, 'c_imp',     (-100*sum(r$mapr(ra,r),impt(r,t)-impt(r,t-1))/work) / ;

   ))) ;

* ----- Table 9

   loop(sim, loop(ra, loop(t$(years(t) eq 2010),

*     Calculate export growth in value

      work = sum(r$mapr(ra,r),sum(i,est0(r,i,t)*ppet(r,i,t))) - sum(r$mapr(ra,r),sum(i,est0(r,i,t-10)*ppet(r,i,t-10)))

      loop(ia,
         put sim.tl, "Tab9", ra.tl, ia.tl, (years(t)-10):4:0, (100*sum(r$mapr(ra,r),sum(i$mapi(ia,i),est0(r,i,t-10)*ppet(r,i,t-10)))
                                                            /sum(r$mapr(ra,r),sum(i,est0(r,i,t-10)*ppet(r,i,t-10)))) / ;
         put sim.tl, "Tab9", ra.tl, ia.tl, (years(t)):4:0, (100*sum(r$mapr(ra,r),sum(i$mapi(ia,i),est0(r,i,t)*ppet(r,i,t)))
                                                         /sum(r$mapr(ra,r),sum(i,est0(r,i,t)*ppet(r,i,t)))) / ;
         if(sum(r$mapr(ra,r),sum(i$mapi(ia,i),est0(r,i,t-10)*ppet(r,i,t-10))) ne 0,
            put sim.tl, "Tab9", ra.tl, ia.tl, 'avggr',
               (100*((sum(r$mapr(ra,r),sum(i$mapi(ia,i),est0(r,i,t)*ppet(r,i,t)))
                     /sum(r$mapr(ra,r),sum(i$mapi(ia,i),est0(r,i,t-10)*ppet(r,i,t-10))))**0.1 - 1)) / ;
         else
            put sim.tl, "Tab9", ra.tl, ia.tl, 'avggr', 0.0 / ;
         ) ;

         put sim.tl, "Tab9", ra.tl, ia.tl, 'contgr',
   (100*((sum(r$mapr(ra,r),sum(i$mapi(ia,i),est0(r,i,t)*ppet(r,i,t)))-sum(r$mapr(ra,r),sum(i$mapi(ia,i),est0(r,i,t-10)*ppet(r,i,t-10))))/work)) / ;

      ) ;
   ))) ;
) ;
