if (ord(t) eq 1,

*  Define the necessary lags

      lambdalLag(i,l)  = lambdal0(i,l) ;
      lambdakLag(i,kt)  = lambdak0(i,kt) ;
      lambdatLag(i,lt)  = lambdat0(i,lt) ;
      rgdpmpLag        = rgdpmp0 ;
      xaplag(k,j)      = xap0(k,j) ;
      xaclag(k,h)      = xac0(k,h) ;

* Update exogenous variables

      als(l,"Tot") = als(l,"Tot") ;
*      als(l,"Tot") = als(l,"Tot")*(1+0.01*lScen(t,l)) ;

      pop.fx(h)    = pop0(h) ;

      xf.fx("gov") = xf0("gov") ;

      tk.fx        = tk0 ;
      ksup.fx      = (ksup0/tk0)*tk0 ;

      land.fx      = land0 ;

      ars(i)       = ars(i) ;

      tmg.fx(k,mg) = tmg0(k,mg) ;

*  Update agricultural productivity

      lambdal.fx(np,l)  = lambdal0(np,l) ;
      lambdak.fx(np,kt) = lambdak0(np,kt) ;
      lambdat.fx(np,lt) = lambdat0(np,lt) ;
      lambdal.lo(ip,l)  = -inf ;
      lambdak.lo(ip,kt) = -inf ;
      lambdat.lo(ip,lt) = -inf ;
      lambdal.up(ip,l)  = +inf ;
      lambdak.up(ip,kt) = +inf ;
      lambdat.up(ip,lt) = +inf ;

else

*     Define the necessary lags

      lambdalLag(i,l)  = lambdal.l(i,l) ;
      lambdakLag(i,kt)  = lambdak.l(i,kt) ;
      lambdatLag(i,lt)  = lambdat.l(i,lt) ;
      rgdpmpLag        = rgdpmp.l ;
      xaplag(k,j)      = xap.l(k,j) ;
      xaclag(k,h)      = xac.l(k,h) ;


*     Update exogenous variables

      als(l,"Tot") = als(l,"Tot")*(1+0.01*Scen(t,"pop")) ;
*      als(l,"Tot") = als(l,"Tot")*(1+0.01*lScen(t,l)) ;

      pop.fx(h)    = pop.l(h)*(1+0.01*Scen(t,"Pop")) ;

      xf.fx("gov") = (xf.l("gov") - ntcip)*(1+0.01*Scen(t,"GDP"))**step(t) + ntcip ;

      tk.fx        = (1-0.01*Scen(t,"depr"))*tk.l + xf.l("inv") ;
*      tk.fx        = tk.l*(1+0.01*Scen(t,"Pop")) ;
      ksup.fx      = (ksup0/tk0)*tk.l ;

      land.fx      = (1+0.01*Scen(t,"LandR"))*land.l ;

      ars(i)       = (1+0.01*Scen(t,"natr"))*ars(i) ;

      tmg.fx(k,mg) = (1+0.01*Scen(t,"Margin"))*tmg.l(k,mg) ;

*     Update agricultural productivity

      lambdal.fx(ag,l)  = (1+0.01*Scen(t,"AgProd"))*lambdal.l(ag,l) ;
      lambdak.fx(ag,kt) = (1+0.01*Scen(t,"AgProd"))*lambdak.l(ag,kt) ;
      lambdat.fx(ag,lt) = (1+0.01*Scen(t,"AgProd"))*lambdat.l(ag,lt) ;

);

*  Fiscal Closure
*    1. Endogenous Government Saving, fixed taxes
*   	rsg.lo = -inf ;
*   	rsg.up = +inf ;
*   	taxadjh.fx = taxadjh0 ;
*    2. Fixed Government Saving, lump sum redistribution
   	taxadjh.lo = -inf ;
   	taxadjh.up = +inf ;
   	rsg.fx = rsg0 ;

*     Endogenize labor productivity growth for the BaU, else
*     Endogenize GDP growth

      if (CalFlag eq 1,

         gl.lo = -inf ;
         gl.up = +inf ;

         if (ord(t) eq 2, gl.l = 0.01 ; ) ;

         ggdp.fx = 0.01*Scen(t,"GDP") ;

      else

         gl.fx = glT(t) ;

         ggdp.lo = -inf ;
         ggdp.up = +inf ;

      ) ;

