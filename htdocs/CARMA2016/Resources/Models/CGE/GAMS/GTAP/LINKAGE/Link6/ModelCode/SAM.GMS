if(ifSAM ne 0,
   put samcsv ;
   if(ord(t) eq 1,
      if(ifSAMhdr ne 0,
         put 'Region,rlab,clab,year,Value' / ;
      ) ;

* ----- Setup the parameters for the csv

      samcsv.pc   = 5 ;
      samcsv.pw = 255 ;
      samcsv.nj =   1 ;
      samcsv.nw =  15 ;
      samcsv.nd =   9 ;
      samcsv.nz =   0 ;
      samcsv.nr =   0 ;
   ) ;

* ----- Dump the regional sam's in CSV format

   loop(r,

*     Commodity demand

      if(ArmFlag,
         loop(j,
            swork(i) = pd.l(r,i)*xdp.l(r,i,j) + pmt.l(r,i)*xmp.l(r,i,j) ;
            loop(i, put r.tl,i.tl,j.tl,t.tl,(rscale*swork(i)) / ; ) ;
         ) ;
         swork(j) = sum(i,pdtax.l(r,i,j)*pd.l(r,i)*xdp.l(r,i,j)
                  +       pmtax.l(r,i,j)*pmt.l(r,i)*xmp.l(r,i,j)) ;
         loop(j, put r.tl,"itax",j.tl,t.tl, (rscale*swork(j)) / ; ) ;
         total = sum(j,swork(j)) ;

         loop(h,
            swork(i) = pd.l(r,i)*xdc.l(r,i,h) + pmt.l(r,i)*xmc.l(r,i,h) ;
            loop(i, put r.tl,i.tl,h.tl,t.tl,(rscale*swork(i)) / ; ) ;
            work = sum(i,cdtax.l(r,i,h)*pd.l(r,i)*xdc.l(r,i,h)
                 +       cmtax.l(r,i,h)*pmt.l(r,i)*xmc.l(r,i,h)) ;
            put r.tl,"itax", h.tl, t.tl, (rscale*work) / ;
            total = total + work ;
         ) ;

         swork(i) = pd.l(r,i)*xdf.l(r,i, "gov") + pmt.l(r,i)*xmf.l(r,i,"gov") ;
         loop(i, put r.tl,i.tl,"gov",t.tl, (rscale*swork(i)) / ; ) ;
         work = sum(i,fdtax.l(r,i,"gov")*pd.l(r,i)*xdf.l(r,i,"gov")
              +       fmtax.l(r,i,"gov")*pmt.l(r,i)*xmf.l(r,i,"gov")) ;
         put r.tl,"itax", "gov", t.tl, (rscale*work) / ;
         total = total + work ;

         swork(i) = pd.l(r,i)*xdf.l(r,i, "inv") + pmt.l(r,i)*xmf.l(r,i,"inv") ;
         loop(i, put r.tl,i.tl,"inv",t.tl, (rscale*swork(i)) / ; ) ;
         work = sum(i,fdtax.l(r,i,"inv")*pd.l(r,i)*xdf.l(r,i,"inv")
              +       fmtax.l(r,i,"inv")*pmt.l(r,i)*xmf.l(r,i,"inv")) ;
         put r.tl,"itax", "inv", t.tl, (rscale*work) / ;
         total = total + work ;
         put r.tl,"gov", "itax", t.tl, (rscale*total) / ;
      else
         loop(j,
            swork(i) = pa.l(r,i)*xap.l(r,i,j) ;
            loop(i, put r.tl,i.tl,j.tl,t.tl, (rscale*swork(i)) / ; ) ;
         ) ;
         swork(j) = sum(i,(mtxadj.l(r,i)*patax.l(r,i,j)+atxadj.l(r,i))*pa.l(r,i)*xap.l(r,i,j)) ;
         loop(j, put r.tl,"itax",j.tl,t.tl, (rscale*swork(j)) / ; ) ;
         total = sum(j,swork(j)) ;

         loop(h,
            swork(i) = pa.l(r,i)*xac.l(r,i,h) ;
            loop(i, put r.tl,i.tl,h.tl,t.tl, (rscale*swork(i)) / ; ) ;
            work = sum(i,(mtxadj.l(r,i)*catax.l(r,i,h)+atxadj.l(r,i))*pa.l(r,i)*xac.l(r,i,h)) ;
            put r.tl,"itax", h.tl, t.tl, (rscale*work) / ;
            total = total + work ;
         ) ;

         swork(i) = pa.l(r,i)*xaf.l(r,i,"gov") ;
         loop(i, put r.tl,i.tl,"gov",t.tl, (rscale*swork(i)) / ; ) ;
         work = sum(i,fatax.l(r,i,"gov")*pa.l(r,i)*xaf.l(r,i,"gov")) ;
         put r.tl,"itax", "gov", t.tl, (rscale*work) / ;
         total = total + work ;

         swork(i) = pa.l(r,i)*xaf.l(r,i,"inv") ;
         loop(i, put r.tl,i.tl,"inv",t.tl,(rscale*swork(i)) / ; ) ;
         work = sum(i,fatax.l(r,i,"inv")*pa.l(r,i)*xaf.l(r,i,"inv")) ;
         put r.tl,"itax", "inv", t.tl, (rscale*work) / ;
         total = total + work ;
         put r.tl,"gov", "itax", t.tl, (rscale*total) / ;
      ) ;

      swork(i) = -sum(rp,pe.l(r,rp,i)*etax.l(r,rp,i)*wtf.l(r,rp,i)) ;
      loop(i, put r.tl,i.tl,"etax",t.tl,(rscale*swork(i)) / ; ) ;
      work = sum(i,swork(i)) ;
      put r.tl, "etax", "gov", t.tl, (rscale*work) / ;
      swork(i) = sum(rp,wpe.l(r,rp,i)*wtf.l(r,rp,i)) ;
      loop(i, put r.tl,i.tl,"row",t.tl,(rscale*swork(i)) / ; ) ;
      swork(i) = pp.l(r,i)*xmarg.l(r,i) ;
      loop(i, put r.tl,i.tl,"marg",t.tl,(rscale*swork(i)) / ; ) ;
      work = sum(i,swork(i)) ;
      put r.tl, "marg", "row", t.tl, (rscale*work) / ;

*     Factor remuneration

      loop(ll,
         loop(j, put r.tl,ll.tl,j.tl,t.tl, (rscale*wage.l(r,ll,j)*(labdv.l(r,ll,j)+labdf.l(r,ll,j))) / ; ) ;
         loop(h,
            put r.tl, h.tl, ll.tl, t.tl, (rscale*phiLab(r,h,ll)
               * sum(j,nwage.l(r,ll,j)*(labdv.l(r,ll,j)+labdf.l(r,ll,j)))) / ;
         ) ;
         put r.tl, "gov", ll.tl, t.tl, (rscale*sum(j,wagetax.l(r,ll,j)
               * nwage.l(r,ll,j)*(labdv.l(r,ll,j)+labdf.l(r,ll,j)))) / ;
      ) ;

      loop(j, put r.tl, "lnd", j.tl, t.tl, (rscale*npt.l(r,j)*td.l(r,j)) / ; ) ;
      loop(j, put r.tl, "lndTax", j.tl, t.tl, (rscale*LndTax.l(r,j)*npt.l(r,j)*td.l(r,j)) / ; ) ;
      loop(h, put r.tl, h.tl, "lnd", t.tl, (rscale*phiLnd(r,h)*sum(j,npt.l(r,j)*td.l(r,j))) / ; ) ;
      put r.tl, "gov", "lndTax", t.tl, (rscale*sum(j, LndTax.l(r,j)*npt.l(r,j)*td.l(r,j))) / ;

      swork(j) = pf.l(r,j)*ff.l(r,j) ;
      loop(j, put r.tl,"fct",j.tl,t.tl,(rscale*swork(j)) / ; ) ;
      work = sum(j,swork(j)) ;
      loop(h, put r.tl, h.tl, "fct", t.tl, (rscale*phiFF(r,h)*work) / ; ) ;

      loop(j, put r.tl,"kap",j.tl,t.tl, (rscale*(sum(v,nrent.l(r,j,v)*kapdv.l(r,j,v))
                                                     + nrent.l(r,j,"Old")*kapdf.l(r,j))) / ; ) ;

      loop(j, put r.tl,"profit",j.tl,t.tl, (rscale*profit.l(r,j)) / ; ) ;

      loop(j, put r.tl,"kapTax",j.tl,t.tl, (rscale*(sum(v,KapTax.l(r,j,v)*nrent.l(r,j,v)*kapdv.l(r,j,v))
                                                  + KapTax.l(r,j,"Old")*nrent.l(r,j,"Old")*kapdf.l(r,j))) / ; ) ;

      loop(h, put r.tl, h.tl, "kap", t.tl, (rscale*(phiKap(r,h)*(sum(j,sum(v,nrent.l(r,j,v)*kapdv.l(r,j,v))
                                              + nrent.l(r,j,"Old")*kapdf.l(r,j))))) / ; ) ;

      loop(h, put r.tl, h.tl, "profit", t.tl, (rscale*phiKap(r,h)*sum(j,profit.l(r,j))) / ; ) ;

      put r.tl, "gov", "kapTax", t.tl, (rscale*sum(j, sum(v, KapTax.l(r,j,v)*nrent.l(r,j,v)*kapdv.l(r,j,v))
         +KapTax.l(r,j,"Old")*nrent.l(r,j,"Old")*kapdf.l(r,j))) / ;

      loop(j, put r.tl,"gov",j.tl,t.tl, (rscale*ptax.l(r,j)*px.l(r,j)*xp.l(r,j)) / ; ) ;

*     Imports and tariffs

      loop(j, put r.tl, "tar", j.tl, t.tl, (rscale*
         sum(rp,tar.l(rp,r,j)*wpm.l(rp,r,j)*wtf_in.l(rp,r,j)
              + tar_out.l(rp,r,j)*wpm.l(rp,r,j)*wtf_out.l(rp,r,j))) / ; ) ;

      put r.tl, "gov", "tar", t.tl, (rscale*
         sum(j,sum(rp,tar.l(rp,r,j)*wpm.l(rp,r,j)*wtf_in.l(rp,r,j)
                    + tar_out.l(rp,r,j)*wpm.l(rp,r,j)*wtf_out.l(rp,r,j)))) / ;

      loop(j, put r.tl, "row", j.tl, t.tl, (rscale*sum(rp,wpm.l(rp,r,j)*lambdaw(rp,r,j)*wtf.l(rp,r,j))) / ; ) ;

*     loop(j, put r.tl,"emiTax",j.tl,t.tl, (rscale*emitax.l(r)*emicoef(r,j)*xa.l(r,j)) / ; ) ;
*     put r.tl, "gov", "emiTax", t.tl, (rscale*sum(j,emitax.l(r)*emicoef(r,j)*xa.l(r,j))) / ;

*     Macro closure

      loop(h, put r.tl, "gov", h.tl, t.tl, (rscale*chik.l(r)*kappah.l(r,h)*yh.l(r,h)) / ; ) ;

      loop(h, put r.tl, "inv", h.tl,  t.tl, (rscale*savh.l(r,h)) / ; ) ;
      loop(h, put r.tl, "depr", h.tl, t.tl, (rscale*deprec.l(r,h)) / ; ) ;
      put r.tl, "inv",  "depr", t.tl, (rscale*sum(h,deprec.l(r,h))) / ;

      loop(h, put r.tl, h.tl, "gov", t.tl, (rscale*pgdp.l(r)*trg.l(r,h)) / ; ) ;

      if (savf.l(r) ge 0,
         put r.tl, "inv", "row", t.tl, (rscale*savf.l(r)) / ;
      else
         put r.tl, "row", "inv", t.tl, (-rscale*savf.l(r)) / ;
      ) ;

      if (savg.l(r) ge 0,
         put r.tl, "inv", "gov", t.tl, (rscale*savg.l(r)) / ;
      else
         put r.tl, "gov", "inv", t.tl, (-rscale*savg.l(r)) / ;
      ) ;

*     Premium income

      loop(i,
         put r.tl, "premy", i.tl, t.tl,
            (rscale*sum(rp,wpm.l(rp,r,i)*tar_p.l(rp,r,i)*wtf_q.l(rp,r,i))) / ;
         put r.tl, i.tl, "premy", t.tl,
            (rscale*sum(rp,(1-chitrq(r,rp,i))*wpm.l(r,rp,i)*tar_p.l(r,rp,i)*wtf_q.l(r,rp,i))) / ;
      ) ;

      put r.tl, "gov", "premy", t.tl,
            (rscale*sum(rp,sum(i,chitrq(rp,r,i)*wpm.l(rp,r,i)*tar_p.l(rp,r,i)*wtf_q.l(rp,r,i)))) / ;

      put r.tl, "row", "premy", t.tl,
            (rscale*sum(rp,sum(i,(1-chitrq(rp,r,i))*wpm.l(rp,r,i)*tar_p.l(rp,r,i)*wtf_q.l(rp,r,i)))) / ;

      put r.tl, "premy", "row", t.tl,
            (rscale*sum(rp,sum(i,(1-chitrq(r,rp,i))*wpm.l(r,rp,i)*tar_p.l(r,rp,i)*wtf_q.l(r,rp,i)))) / ;
   ) ;
) ;
