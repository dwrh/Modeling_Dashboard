if(ifYelas ne 0,

   put  yelasCSV ;

   if(ord(t) eq 1,

      if(ifYelashdr ne 0,
         put 'Region,Variable,Sector,Qualifier,Year,Value' / ;
      ) ;

*     Setup the parameters for YELAScsv

      yelasCSV.pc   = 5 ;
      yelasCSV.pw = 255 ;
      yelasCSV.nj =   1 ;
      yelasCSV.nw =  15 ;
      yelasCSV.nd =   9 ;
      yelasCSV.nz =   0 ;
      yelasCSV.nr =   0 ;
   ) ;

* --------------------------------------------------------------------
*
*  Save the consumer demand parameters in Pivot format
*
* --------------------------------------------------------------------

*----- loop over the regions and output the data

   loop(r,
      loop(h,
         loop(k$(xc.l(r,k,h) ne 0),
            put r.tl:3, 'Cons',  k.tl, h.tl, t.tl, (rscale*xc.l(r,k,h)) / ;
            put r.tl:3, 'PC',    k.tl, h.tl, t.tl, pc.l(r,k,h) / ;
            put r.tl:3, 'mpc',   k.tl, h.tl, t.tl, mpc(r,k,h)   / ;
            put r.tl:3, 'theta', k.tl, h.tl, t.tl, (rscale*theta(r,k,h)) / ;
            put r.tl:3, 'eta',   k.tl, h.tl, t.tl, (mpc(r,k,h)*yd.l(r,h)/(pc.l(r,k,h)*xc.l(r,k,h))) / ;
         ) ;

         put r.tl:3, 'Cons',  'Saving', h.tl, t.tl, (rscale*savh.l(r,h))  / ;
         put r.tl:3, 'PC',    'Saving', h.tl, t.tl, (cpi.l(r,h)) / ;
         put r.tl:3, 'mpc',   'Saving', h.tl, t.tl, mps(r,h)     / ;
         put r.tl:3, 'theta', 'Saving', h.tl, t.tl, (0.0)        / ;
         put r.tl:3, 'eta',   'Saving', h.tl, t.tl, (mps(r,h)*yd.l(r,h)/savh.l(r,h))  / ;

         put r.tl:3, 'yd',  '', h.tl, t.tl, (rscale*yd.l(r,h))   / ;
         put r.tl:3, 'pop', '', h.tl, t.tl, hpop.l(r,h)  / ;
      ) ;
   ) ;
) ;
