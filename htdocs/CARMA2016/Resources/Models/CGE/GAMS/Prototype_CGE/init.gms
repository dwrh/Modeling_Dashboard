* ------------------------------------------------------------------------------
*
* Initialize model variables
*
* ------------------------------------------------------------------------------

* ----- Production block

   nd.l(i)         = nd0(i) ;
   va.l(i)         = va0(i) ;
   px.l(i)         = px0(i) ;
   pp.l(i)         = pp0(i) ;

   xap.l(k,j)      = xap0(k,j) ;
   pnd.l(i)        = pnd0(i) ;

   kl.l(i)         = kl0(i) ;
   ttd.l(i)        = ttd0(i) ;
   rd.l(i)         = rd0(i) ;
   pva.l(i)        = pva0(i) ;

   usk.l(i)        = usk0(i) ;
   ksk.l(i)        = ksk0(i) ;
   pkl.l(i)        = pkl0(i) ;

   skl.l(i)        = skl0(i) ;
   ktd.l(i)        = ktd0(i) ;
   pksk.l(i)       = pksk0(i) ;

   ld.l(i,l)       = ld0(i,l) ;
   pusk.l(i)       = pusk0(i) ;
   pskl.l(i)       = pskl0(i) ;

   kd.l(i,kt)      = kd0(i,kt) ;
   pktd.l(i)       = pktd0(i) ;

   td.l(i,lt)      = td0(i,lt) ;
   pttd.l(i)       = pttd0(i) ;

   xp.l(i)         = xp0(i) ;
   p.l(k)          = p0(k) ;

* ----- Income block

   ly.l(l)         = ly0(l) ;
   ky.l(kt)        = ky0(kt) ;
   ty.l(lt)        = ty0(lt) ;
   ry.l            = ry0 ;

   ktre.l(kt)      = ktre0(kt) ;
   ktrh.l(kt)      = ktrh0(kt) ;
   ktrw.l(kt)      = ktrw0(kt) ;

   cy.l(e)         = cy0(e) ;
   savc.l(e)       = savc0(e) ;
   ctrh.l(e)       = ctrh0(e) ;
   ctrw.l(e)       = ctrw0(e) ;

   yh.l(h)         = yh0(h) ;
   yd.l(h)         = yd0(h) ;
   htr.l(h)        = htr0(h) ;
   htrh.l(h,hh)    = htrh0(h,hh) ;
   htrw.l(h)       = htrw0(h) ;

* ----- Demand block

   xac.l(k,h)      = xac0(k,h) ;
   savh.l(h)       = savh0(h) ;
   cpi.l(h)        = cpi0(h) ;

   xaf.l(k,f)      = xaf0(k,f) ;
   pf.l(f)         = pf0(f) ;
   yf.l(f)         = yf0(f) ;

* ----- Trade block

   xa.l(k)         = xa0(k) ;
   xdd.l(k)        = xdd0(k) ;
   xmt.l(k)        = xmt0(k) ;
   pa.l(k)         = pa0(k) ;

   pm.l(k,r)       = pm0(k,r) ;
   xm.l(k,r)       = xm0(k,r) ;
   pmt.l(k)        = pmt0(k) ;

   pe.l(k,r)       = pe0(k,r) ;
   xds.l(k)        = xds0(k) ;
   xet.l(k)        = xet0(k) ;
   x.l(k)          = x0(k) ;

   xe.l(k,r)       = xe0(k,r) ;
   pet.l(k)        = pet0(k) ;

   ed.l(k,r)       = ed0(k,r) ;

* ----- Domestic trade and transport margins

   ytmg.l(k,mg)    = ytmg0(k,mg) ;
   xtmg.l(k,mg)    = xtmg0(k,mg) ;
   xamg.l(k,kk,mg) = xamg0(k,kk,mg) ;
   ptmg.l(k,mg)    = ptmg0(k,mg) ;

* ----- Goods market equilibrium

   pd.l(k)         = pd0(k) ;
   wpe.l(k,r)      = wpe0(k,r) ;

* ----- Government accounts

   tary.l          = tary0 ;
   rtary.l         = rtary0 ;
   gy.l            = gy0 ;
   gexp.l          = gexp0 ;
   savg.l          = savg0 ;
   taxadjh.l       = taxadjh0 ;
   taxadjc.l       = taxadjc0 ;

* ----- Closure

   xf.l(f)         = xf0(f) ;
   plev.l          = plev0 ;
   walras          = walras0 ;

* ----- Factor block

   ls.l(l,gz)      = ls0(l,gz) ;
   ewage.l(l,gz)   = ewage0(l,gz) ;
   wage.l(i,l)     = wage0(i,l) ;

   migr.l(l)       = migr0(l) ;
   awage.l(l,gz)   = awage0(l,gz) ;

   tks.l(kt)       = tks0(kt) ;
   pk.l            = pk0 ;

   ks.l(i,kt)      = ks0(i,kt) ;
   ptks.l(kt)      = ptks0(kt) ;
   rent.l(i,kt)    = rent0(i,kt) ;

   tts.l(lt)       = tts0(lt) ;
   pland.l         = pland0 ;

   ts.l(i,lt)      = ts0(i,lt) ;
   ptts.l(lt)      = ptts0(lt) ;
   pt.l(i,lt)      = pt0(i,lt) ;

   rs.l(i)         = rs0(i) ;
   pr.l(i)         = pr0(i) ;

* ----- Macro variables

   gdpmp.l         = gdpmp0 ;
   rgdpmp.l        = rgdpmp0 ;
   pgdpmp.l        = pgdpmp0 ;
   gdpfc.l         = gdpfc0 ;
   rgdpfc.l        = rgdpfc0 ;
   pgdpfc.l        = pgdpfc0 ;

* ----- Growth variables

   ggdp.l          = ggdp0 ;
   lambdal.l(i,l)  = lambdal0(i,l) ;
   lambdak.l(i,kt)  = lambdak0(i,kt) ;
   lambdat.l(i,lt)  = lambdat0(i,lt) ;
   geg.l(k,j)      = geg0(k,j) ;
   gce.l(k,h)       =gce0(k,h) ;

* ----- Growth factors

   gl.fx            = gl0 ;
*   lambdak.fx(i,kt) = lambdak0(i,kt) ;
*   lambdat.fx(i,lt) = lambdat0(i,lt) ;
   lambdar.fx(i)    = lambdar0(i) ;
   ksup.fx          = ksup0 ;
   tk.fx            = tk0 ;
   land.fx          = land0 ;
   pop.fx(h)        = pop0(h) ;
   glab.fx(l,gz)    = glab0(l,gz) ;

* ----- Trade prices

   wpm.fx(k,r)     = wpm0(k,r) ;
   wpendx.fx(k,r)  = wpendx0(k,r) ;
   er.fx           = er0 ;

* ----- Policy variables

   rsg.fx          = rsg0 ;
   tp.fx(i)        = tp0(i) ;
   tcp.fx(k,j)     = tcp0(k,j) ;
   tcc.fx(k,h)     = tcc0(k,h) ;
   tcf.fx(k,f)     = tcf0(k,f) ;
   kappah.fx(h)    = kappah0(h) ;
   gtrh.fx(h)      = gtrh0(h) ;
   kappac.fx(e)    = kappac0(e) ;

   tmadj.fx        = tmadj0 ;
   tm.fx(k,r)      = tm0(k,r) ;
   te.fx(k,r)      = te0(k,r) ;

   tfl.fx(j,l)     = tfl0(j,l) ;
   tfk.fx(j,kt)    = tfk0(j,kt) ;
   tft.fx(j,lt)    = tft0(j,lt) ;
   tfr.fx(j)       = tfr0(j) ;

* ----- Miscellaneous variables

   wtrh.fx(h)      = wtrh0(h) ;
   wtrg.fx         = wtrg0 ;
   gtrw.fx         = gtrw0 ;
   ctrw.l(e)       = ctrw0(e) ;
   savf.fx         = savf0 ;
   csavrate.fx(e)  = csavrate0(e) ;
   tmg.fx(k,mg)    = tmg0(k,mg) ;

