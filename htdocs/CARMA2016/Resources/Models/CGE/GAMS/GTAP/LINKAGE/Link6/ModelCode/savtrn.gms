if(CalFlag eq 1,

*----- Save the capital productivity factor for further simulations

   put  savecal ;

   savecal.pc   = 2 ;
   savecal.pw = 255 ;
   savecal.nj =   1 ;
   savecal.nw =  15 ;
   savecal.nd =  10 ;
   savecal.nz =   0 ;
   savecal.nr =   0 ;

   put "parameter gkT(r,t) Economy wide capital productivity parameter / " // ;
   loop(r,loop(t, put r.tl:10,".", t.tl:4, "     ", gkT(r,t) / ; )) ;
   put "   / ;" / / / ;

   put "parameter glT(r,t) Economy wide labour productivity parameter / " // ;
   loop(r,loop(t, put r.tl:10,".", t.tl:4, "     ", glT(r,t) / ; )) ;
   put "   / ;" / / / ;

   put "parameter tgT(r,t) Volume of government expenditures / " // ;
   loop(r,loop(t, put r.tl:10,".", t.tl:4, "     ", tgT(r,t) / ; )) ;
   put "   / ;" / / / ;

* ----- Save the consumer demand parameters

   put "parameter mpcT(r,k,h,t) Marginal propensity to consume / " // ;
   loop(r,loop(k,loop(h,loop(t, put r.tl:10,".",k.tl:10,".",h.tl:10,".",t.tl:4, "     ", mpcT(r,k,h,t) / ; )))) ;
   put "   / ;" / / / ;

   put "parameter thetaT(r,k,h,t) Population adjusted subsistence minima / " // ;
   loop(r,loop(k,loop(h,loop(t, put r.tl:10,".",k.tl:10,".",h.tl:10,".",t.tl:4, "     ", thetaT(r,k,h,t) / ; )))) ;
   put "   / ;" / / / ;

   put "parameter subsminT(r,h,t) Subsistence minima total at BaU prices / " // ;
   loop(r,loop(h,loop(t, put r.tl:10,".", h.tl:10,".", t.tl:4, "     ", subsminT(r,h,t) / ; ))) ;
   put "   / ;" / / / ;

   put "parameter pindexT(r,h,t) Price index with BaU prices / " // ;
   loop(r,loop(h,loop(t, put r.tl:10,".", h.tl:10,".", t.tl:4, "     ", pindexT(r,h,t) / ; ))) ;
   put "   / ;" / / / ;

   put "parameter ApindexT(r,h,t) Adjusted price index with BaU prices / " // ;
   loop(r,loop(h,loop(t, put r.tl:10,".", h.tl:10,".", t.tl:4, "     ", ApindexT(r,h,t) / ; ))) ;
   put "   / ;" / / / ;

   put "parameter uT(r,h,t) BaU utility levels / " // ;
   loop(r,loop(h,loop(t, put r.tl:10,".", h.tl:10,".", t.tl:4, "     ", uT(r,h,t) / ; ))) ;
   put "   / ;" / / / ;

   put "parameter AuT(r,h,t) BaU adjusted utility levels / " // ;
   loop(r,loop(h,loop(t, put r.tl:10,".", h.tl:10,".", t.tl:4, "     ", AuT(r,h,t) / ; ))) ;
   put "   / ;" / / / ;

   put "parameter gpindexT(r,t) Government expenditure price index with BaU prices / " // ;
   loop(r, loop(t, put r.tl:10,".", t.tl:4, "     ", gpindexT(r,t) / ; )) ;
   put "   / ;" / / / ;

   put "parameter guT(r,t) Government utility in the baseline / " // ;
   loop(r, loop(t, put r.tl:10,".", t.tl:4, "     ", guT(r,t) / ; )) ;
   put "   / ;" / / / ;

   put "parameter esT0(r,i,t) Aggregate export supply / " // ;
   loop(r,loop(i,loop(t, put r.tl:10,".", i.tl:10,".", t.tl:4, "     ", esT0(r,i,t) / ; ))) ;
   put "   / ;" / / / ;

   put "parameter xmtT0(r,i,t) Aggregate import demand / " // ;
   loop(r,loop(i,loop(t, put r.tl:10,".", i.tl:10,".", t.tl:4, "     ", xmtT0(r,i,t) / ; ))) ;
   put "   / ;" / / / ;

   put "parameter chipT(r,i,t) Export sensitive productivity factor / " // ;
   loop(r,loop(i,loop(t, put r.tl:10,".", i.tl:10,".", t.tl:4, "     ", (100*chipT(r,i,t)) / ; ))) ;
   put "   / ;" / / / ;

   put "parameter phipT(r,i,t) Export sensitive productivity shifter / " // ;
   loop(r,loop(i,loop(t, put r.tl:10,".", i.tl:10,".", t.tl:4, "     ", (phipT(r,i,t)) / ; ))) ;
   put "   / ;" / / / ;

   put "parameter aminT(r,ll,gz,t) Minimum wage shift parameter / " // ;
   loop(r,loop(ll,loop(gz,loop(t$(amin.l(r,ll,gz) ne 0),
      put r.tl:10,".",ll.tl:10,".",gz.tl:10,".",t.tl:4, "     ", aminT(r,ll,gz,t) / ; )))) ;
   put "   / ;" / / / ;

) ;
