* ----------------------------------------------------------------------
*
*     File to dump world trade flows and its various components
*
* ----------------------------------------------------------------------

if (ifWTF ne 0,
   put wtfcsv ;
   if (ord(t) eq 1,
      if(ifWTFhdr ne 0,
         put 'Scenario,Sector,Exporter,Importer,Variable,Year,Value' / ;
      ) ;

*     ----- Reset parameters for wtfcsv

      wtfcsv.pc   = 5 ;
      wtfcsv.pw = 255 ;
      wtfcsv.nj =   1 ;
      wtfcsv.nw =  15 ;
      wtfcsv.nd =   9 ;
      wtfcsv.nz =   0 ;
      wtfcsv.nr =   0 ;
   ) ;

   loop(sim,

   if (1,
      loop(ra,loop(rap,loop(ia,
         put sim.tl,ia.tl,ra.tl,rap.tl,'wtf_pe',  t.tl,(rscale*sum(r$mapr(ra,r),sum(rp$mapr(rap,rp),sum(i$mapi(ia,i),wtf.l(r,rp,i)*pe.l(r,rp,i))))) / ;
         put sim.tl,ia.tl,ra.tl,rap.tl,'wtf_wpe', t.tl,(rscale*sum(r$mapr(ra,r),sum(rp$mapr(rap,rp),sum(i$mapi(ia,i),wtf.l(r,rp,i)*wpe.l(r,rp,i))))) / ;
         put sim.tl,ia.tl,ra.tl,rap.tl,'wtf_wpm', t.tl,(rscale*sum(r$mapr(ra,r),sum(rp$mapr(rap,rp),sum(i$mapi(ia,i),wtf.l(r,rp,i)*wpm.l(r,rp,i))))) / ;
         put sim.tl,ia.tl,ra.tl,rap.tl,'wtf_pm',  t.tl,(rscale*sum(r$mapr(ra,r),sum(rp$mapr(rap,rp),sum(i$mapi(ia,i),wtf.l(r,rp,i)*pm.l(r,rp,i))))) / ;
         work = sum(r$mapr(ra,r),sum(rp$mapr(rap,rp),sum(i$mapi(ia,i),tar.l(r,rp,i)*wtf.l(r,rp,i)*wpm.l(r,rp,i)))) ;
         if (work ne 0,
            work = 100*work/sum(r$mapr(ra,r),sum(rp$mapr(rap,rp),sum(i$mapi(ia,i),wtf.l(r,rp,i)*wpm.l(r,rp,i)))) ;
            put sim.tl,ia.tl,ra.tl,rap.tl,'tar', t.tl, work / ;
         ) ;
         work = sum(r$mapr(ra,r),sum(rp$mapr(rap,rp),sum(i$mapi(ia,i),etax.l(r,rp,i)*wtf.l(r,rp,i)*pe.l(r,rp,i)))) ;
         if (work ne 0,
            work = 100*work/sum(r$mapr(ra,r),sum(rp$mapr(rap,rp),sum(i$mapi(ia,i),wtf.l(r,rp,i)*pe.l(r,rp,i)))) ;
            put sim.tl,ia.tl,ra.tl,rap.tl,'etax', t.tl, work / ;
         ) ;
      ))) ;
   else
      loop(r,loop(rp,loop(i$(wtf.l(r,rp,i) ne 0),
         put sim.tl,i.tl,r.tl,rp.tl,'wtf_pe',  t.tl,(rscale*wtf.l(r,rp,i)*pe.l(r,rp,i)) / ;
         put sim.tl,i.tl,r.tl,rp.tl,'wtf_wpe', t.tl,(rscale*wtf.l(r,rp,i)*wpe.l(r,rp,i)) / ;
         put sim.tl,i.tl,r.tl,rp.tl,'wtf_wpm', t.tl,(rscale*lambdaw(r,rp,i)*wtf.l(r,rp,i)*wpm.l(r,rp,i)) / ;
         put sim.tl,i.tl,r.tl,rp.tl,'wtf_pm',  t.tl,(rscale*lambdaw(r,rp,i)*wtf.l(r,rp,i)*pm.l(r,rp,i)) / ;
         put sim.tl,i.tl,r.tl,rp.tl,'tar',     t.tl,(100*tar.l(r,rp,i)) / ;
         put sim.tl,i.tl,r.tl,rp.tl,'etax',    t.tl,(100*etax.l(r,rp,i)) / ;
      ))) ;
   ) ;

   loop(r,loop(rp,loop(i$(wtf.l(r,rp,i) ne 0),
      put sim.tl,i.tl,r.tl,rp.tl,'tar_out', t.tl,(100*tar_out.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'tar_p',   t.tl,(100*tar_p.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'pm',      t.tl,(pm.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'wpe',     t.tl,(wpe.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'wpm',     t.tl,(wpm.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'pe',      t.tl,(pe.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'pestar',  t.tl,(tm_p.l(r,rp,i) + pe.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'wtf_s',   t.tl,(rscale*wtf.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'wtf_d',   t.tl,(rscale*lambdaw(r,rp,i)*wtf.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'lambdaw', t.tl,(lambdaw(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'wtf_in',  t.tl,(rscale*wtf_in.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'wtf_q',   t.tl,(rscale*wtf_q.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'wtf_out', t.tl,(rscale*wtf_out.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'chiTRQ',  t.tl,(100*chiTRQ(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'premY',   t.tl,(rscale*wtf_q.l(r,rp,i)*wpm.l(r,rp,i)*tar_p.l(r,rp,i)) / ;
      put sim.tl,i.tl,r.tl,rp.tl,'tm_p',    t.tl,(tm_p.l(r,rp,i)) / ;
   ))) ;
   ) ;
) ;
