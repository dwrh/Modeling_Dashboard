* --------------------------------------------------------------------
*
*  LINKAGE -- LINKAGE Applied General Equilibrium Model
*
*  Re-calibration "old" share parameters
*  -------------------------------------
*
*  Based on GTAP Version 5.0
*
* --------------------------------------------------------------------
*
* --------------------------------------------------------------------
*
*     Top level nest
*
* --------------------------------------------------------------------

* Re-calibrate the parameters for the XPv bundle, and and ava

  Volume(r,j) = sum(v,xpv.l(r,j,v)) ;
  Price(r,j)$(Volume(r,j)) = sum(v,xpv.l(r,j,v)*uvcv.l(r,j,v))/Volume(r,j) ;

  vol1(r,j) = nd.l(r,j) ;
  vol2(r,j) = sum(v,va.l(r,j,v)) ;
  pr1(r,j)$(vol1(r,j)) = nd.l(r,j)*pnd.l(r,j)/vol1(r,j) ;
  pr2(r,j)$(vol2(r,j)) = sum(v,va.l(r,j,v)*pva.l(r,j,v))/vol2(r,j) ;

  and(r,j,Old)$(Volume(r,j)) = (vol1(r,j)/volume(r,j))*(G(r,j)**(1-sigmap(r,j,Old)))
                             * (pr1(r,j)/Price(r,j))**sigmap(r,j,Old) ;
  ava(r,j,Old)$(Volume(r,j)) = (vol2(r,j)/volume(r,j))*(G(r,j)**(1-sigmap(r,j,Old)))
                             * (pr2(r,j)/Price(r,j))**sigmap(r,j,Old) ;

* --------------------------------------------------------------------
*
*     Crop production structure
*
* --------------------------------------------------------------------

* The old share parameters are re-calibrated in order to be able to re-produce
* the previous periods output with the "old" technology

* display and, ava, al, aktef, afert, akte, ae, akt, at, af, ak, aep ;

* Re-calibrate the parameters for the VA bundle, al and ahktef

  Volume(r,cr) = sum(v,va.l(r,cr,v)) ;
  Price(r,cr)$(Volume(r,cr)) = sum(v,va.l(r,cr,v)*pva.l(r,cr,v))/Volume(r,cr) ;

  vol1(r,cr) = ld.l(r,cr) ;
  vol2(r,cr) = sum(v,hktef.l(r,cr,v)) ;
  pr1(r,cr)$(vol1(r,cr)) = ld.l(r,cr)*awage.l(r,cr)/vol1(r,cr) ;
  pr2(r,cr)$(vol2(r,cr)) = sum(v,hktef.l(r,cr,v)*phktef.l(r,cr,v))/vol2(r,cr) ;

  al(r,cr,Old)$(Volume(r,cr))     = (vol1(r,cr)/volume(r,cr))*(pr1(r,cr)/Price(r,cr))**sigmav(r,cr,Old) ;
  ahktef(r,cr,Old)$(Volume(r,cr)) = (vol2(r,cr)/volume(r,cr))*(pr2(r,cr)/Price(r,cr))**sigmav(r,cr,Old) ;

* Re-calibrate the parameters for the HKTEF bundle, afert and ahkte

  Volume(r,cr) = sum(v,hktef.l(r,cr,v)) ;
  Price(r,cr)$(Volume(r,cr)) = sum(v,hktef.l(r,cr,v)*phktef.l(r,cr,v))/Volume(r,cr) ;

  vol1(r,cr) = fert.l(r,cr) ;
  vol2(r,cr) = sum(v,hkte.l(r,cr,v)) ;
  pr1(r,cr)$(vol1(r,cr)) = pfert.l(r,cr) ;
  pr2(r,cr)$(vol2(r,cr)) = sum(v,hkte.l(r,cr,v)*phkte.l(r,cr,v))/vol2(r,cr) ;

  afert(r,cr,Old)$(Volume(r,cr)) = (vol1(r,cr)/volume(r,cr))*(pr1(r,cr)/Price(r,cr))**sigmaf(r,cr,Old) ;
  ahkte(r,cr,Old)$(Volume(r,cr)) = (vol2(r,cr)/volume(r,cr))*(pr2(r,cr)/Price(r,cr))**sigmaf(r,cr,Old) ;

* Re-calibrate the parameters for the HKTE bundle, ae and ahkt

  Volume(r,cr) = sum(v,hkte.l(r,cr,v)) ;
  Price(r,cr)$(Volume(r,cr)) = sum(v,hkte.l(r,cr,v)*phkte.l(r,cr,v))/Volume(r,cr) ;

  vol1(r,cr) = sum(v,xep.l(r,cr,v)) ;
  vol2(r,cr) = sum(v,hkt.l(r,cr,v)) ;
  pr1(r,cr)$(vol1(r,cr)) = sum(v,xep.l(r,cr,v)*pep.l(r,cr,v))/vol1(r,cr) ;
  pr2(r,cr)$(vol2(r,cr)) = sum(v,hkt.l(r,cr,v)*phkt.l(r,cr,v))/vol2(r,cr) ;

  ae(r,cr,Old)$(Volume(r,cr))   = (vol1(r,cr)/volume(r,cr))*(pr1(r,cr)/Price(r,cr))**sigmae(r,cr,Old) ;
  ahkt(r,cr,Old)$(Volume(r,cr)) = (vol2(r,cr)/volume(r,cr))*(pr2(r,cr)/Price(r,cr))**sigmae(r,cr,Old) ;

* Re-calibrate the parameters for the HKT bundle, ah and akt

  Volume(r,cr) = sum(v,hkt.l(r,cr,v)) ;
  Price(r,cr)$(Volume(r,cr)) = sum(v,hkt.l(r,cr,v)*phkt.l(r,cr,v))/Volume(r,cr) ;

  vol1(r,cr) = labdv.l(r,"HSk",cr) ;
  vol2(r,cr) = sum(v,kt.l(r,cr,v)) ;
  pr1(r,cr)              = wage.l(r,"HSk",cr) ;
  pr2(r,cr)$(vol2(r,cr)) = sum(v,kt.l(r,cr,v)*pkt.l(r,cr,v))/vol2(r,cr) ;

  ah(r,cr,Old)$(Volume(r,cr))   = (lambdal.l(r,"HSk",cr)**(1-sigmah(r,cr,Old)))
                          * (vol1(r,cr)/volume(r,cr))*(pr1(r,cr)/Price(r,cr))**sigmah(r,cr,Old) ;
  akt(r,cr,Old)$(Volume(r,cr)) = (vol2(r,cr)/volume(r,cr))*(pr2(r,cr)/Price(r,cr))**sigmah(r,cr,Old) ;

* Re-calibrate the parameters for the KT bundle, at, af and ak

  Volume(r,cr) = sum(v,kt.l(r,cr,v)) ;
  Price(r,cr)$(Volume(r,cr)) = sum(v,kt.l(r,cr,v)*pkt.l(r,cr,v))/Volume(r,cr) ;

  vol1(r,cr) = sum(v,kapdv.l(r,cr,v)) ;
  pr1(r,cr)$(vol1(r,cr)) = sum(v,kapdv.l(r,cr,v)*rent.l(r,cr,v))/vol1(r,cr) ;

  at(r,cr,Old)$(td.l(r,cr)) = (lambdat.l(r,cr)**(1-sigmak(r,cr,Old)))
                          * (td.l(r,cr)/volume(r,cr))*(pt.l(r,cr)/Price(r,cr))**sigmak(r,cr,Old) ;
  af(r,cr,Old)$(ff.l(r,cr)) = (lambdaf.l(r,cr)**(1-sigmak(r,cr,Old)))
                          * (ff.l(r,cr)/volume(r,cr))*(pf.l(r,cr)/Price(r,cr))**sigmak(r,cr,Old) ;
  ak(r,cr,Old)$(vol1(r,cr)) = (lambdak.l(r,cr,Old)**(1-sigmak(r,cr,Old)))
                          * (vol1(r,cr)/volume(r,cr))*(pr1(r,cr)/Price(r,cr))**sigmak(r,cr,Old) ;

* Re-calibrate the parameters for the energy bundle, aep

  Volume(r,cr) = sum(v,xep.l(r,cr,v)) ;
  Price(r,cr)$(Volume(r,cr)) = sum(v,xep.l(r,cr,v)*pep.l(r,cr,v))/Volume(r,cr) ;

  aep(r,e,cr,Old)$(Volume(r,cr) and ArmFlag eq 1)
     = (lambdaep.l(r,e,cr)**(1-sigmaep(r,cr,Old)))
     * (XAp.l(r,e,cr)/Volume(r,cr))*(PAp.l(r,e,cr)/Price(r,cr))**sigmaep(r,cr,Old) ;

  aep(r,e,cr,Old)$(Volume(r,cr) and ArmFlag eq 0)
     = (lambdaep.l(r,e,cr)**(1-sigmaep(r,cr,Old)))
     * (XAp.l(r,e,cr)/Volume(r,cr))*((1+mtxadj.l(r,e)*patax.l(r,e,cr)+atxadj.l(r,e))*PA.l(r,e)/Price(r,cr))**sigmaep(r,cr,Old) ;

* display and, ava, al, aktef, afert, akte, ae, akt, at, af, ak, aep ;

* --------------------------------------------------------------------
*
*     Livestock production structure
*
* --------------------------------------------------------------------

* The old share parameters are re-calibrated in order to be able to re-produce
* the previous periods output with the "old" technology

* display and, ava, aktel, atfd, afeed, at, al, akte, ae, akt, af, ak, aep ;

* Re-calibrate the parameters for the VA bundle, aktel and aktfd

  Volume(r,lv) = sum(v,va.l(r,lv,v)) ;
  Price(r,lv)$(Volume(r,lv)) = sum(v,va.l(r,lv,v)*pva.l(r,lv,v))/Volume(r,lv) ;

  vol1(r,lv) = sum(v,ktel.l(r,lv,v)) ;
  vol2(r,lv) = sum(v,tfd.l(r,lv,v)) ;
  pr1(r,lv)$(vol1(r,lv)) = sum(v,ktel.l(r,lv,v)*pktel.l(r,lv,v))/vol1(r,lv) ;
  pr2(r,lv)$(vol2(r,lv)) = sum(v,tfd.l(r,lv,v)*ptfd.l(r,lv,v))/vol2(r,lv) ;

  aktel(r,lv,Old)$(Volume(r,lv)) = (vol1(r,lv)/volume(r,lv)) ;
  atfd(r,lv,Old)$(Volume(r,lv))  = (vol2(r,lv)/volume(r,lv)) ;

* Re-calibrate the parameters for the TFD bundle, afeed and at

  Volume(r,lv) = sum(v,tfd.l(r,lv,v)) ;
  Price(r,lv)$(Volume(r,lv)) = sum(v,tfd.l(r,lv,v)*ptfd.l(r,lv,v))/Volume(r,lv) ;

  vol1(r,lv) = feed.l(r,lv) ;
  pr1(r,lv)$(vol1(r,lv)) = pfeed.l(r,lv) ;

  afeed(r,lv,Old)$(Volume(r,lv))  = (vol1(r,lv)/volume(r,lv))
                                  * (pr1(r,lv)/Price(r,lv))**sigmaf(r,lv,Old) ;
  at(r,lv,Old)$(td.l(r,lv)) = (lambdat.l(r,lv)**(1-sigmaf(r,lv,Old)))
                            * (td.l(r,lv)/volume(r,lv))*(pt.l(r,lv)/Price(r,lv))**sigmaf(r,lv,Old) ;

* Re-calibrate the parameters for the KTEL bundle, al and ahkte

  Volume(r,lv) = sum(v,ktel.l(r,lv,v)) ;
  Price(r,lv)$(Volume(r,lv)) = sum(v,ktel.l(r,lv,v)*pktel.l(r,lv,v))/Volume(r,lv) ;

  vol1(r,lv) = ld.l(r,lv) ;
  vol2(r,lv) = sum(v,hkte.l(r,lv,v)) ;
  pr1(r,lv)$(vol1(r,lv)) = ld.l(r,lv)*awage.l(r,lv)/vol1(r,lv) ;
  pr2(r,lv)$(vol2(r,lv)) = sum(v,hkte.l(r,lv,v)*phkte.l(r,lv,v))/vol2(r,lv) ;

  al(r,lv,Old)$(Volume(r,lv))    = (vol1(r,lv)/volume(r,lv))*(pr1(r,lv)/Price(r,lv))**sigmav(r,lv,Old) ;
  ahkte(r,lv,Old)$(Volume(r,lv)) = (vol2(r,lv)/volume(r,lv))*(pr2(r,lv)/Price(r,lv))**sigmav(r,lv,Old) ;

* Re-calibrate the parameters for the HKTE bundle, ae and ahkt

  Volume(r,lv) = sum(v,hkte.l(r,lv,v)) ;
  Price(r,lv)$(Volume(r,lv)) = sum(v,hkte.l(r,lv,v)*phkte.l(r,lv,v))/Volume(r,lv) ;

  vol1(r,lv) = sum(v,xep.l(r,lv,v)) ;
  vol2(r,lv) = sum(v,hkt.l(r,lv,v)) ;
  pr1(r,lv)$(vol1(r,lv)) = sum(v,xep.l(r,lv,v)*pep.l(r,lv,v))/vol1(r,lv) ;
  pr2(r,lv)$(vol2(r,lv)) = sum(v,hkt.l(r,lv,v)*phkt.l(r,lv,v))/vol2(r,lv) ;

  ae(r,lv,Old)$(Volume(r,lv))   = (vol1(r,lv)/volume(r,lv))*(pr1(r,lv)/Price(r,lv))**sigmae(r,lv,Old) ;
  ahkt(r,lv,Old)$(Volume(r,lv)) = (vol2(r,lv)/volume(r,lv))*(pr2(r,lv)/Price(r,lv))**sigmae(r,lv,Old) ;

* Re-calibrate the parameters for the HKT bundle, ah and akt

  Volume(r,lv) = sum(v,hkt.l(r,lv,v)) ;
  Price(r,lv)$(Volume(r,lv)) = sum(v,hkt.l(r,lv,v)*phkt.l(r,lv,v))/Volume(r,lv) ;

  vol1(r,lv) = labdv.l(r,"HSk",lv) ;
  vol2(r,lv) = sum(v,kt.l(r,lv,v)) ;
  pr1(r,lv)              = wage.l(r,"HSk",lv) ;
  pr2(r,lv)$(vol2(r,lv)) = sum(v,kt.l(r,lv,v)*pkt.l(r,lv,v))/vol2(r,lv) ;

  ah(r,lv,Old)$(Volume(r,lv))  = (lambdal.l(r,"HSk",lv)**(1-sigmah(r,lv,Old)))
                          * (vol1(r,lv)/volume(r,lv))*(pr1(r,lv)/Price(r,lv))**sigmah(r,lv,Old) ;
  akt(r,lv,Old)$(Volume(r,lv)) = (vol2(r,lv)/volume(r,lv))*(pr2(r,lv)/Price(r,lv))**sigmah(r,lv,Old) ;

* Re-calibrate the parameters for the KT bundle, af and ak

  Volume(r,lv) = sum(v,kt.l(r,lv,v)) ;
  Price(r,lv)$(Volume(r,lv)) = sum(v,kt.l(r,lv,v)*pkt.l(r,lv,v))/Volume(r,lv) ;

  vol1(r,lv) = sum(v,kapdv.l(r,lv,v)) ;
  pr1(r,lv)$(vol1(r,lv)) = sum(v,kapdv.l(r,lv,v)*rent.l(r,lv,v))/vol1(r,lv) ;

  af(r,lv,Old)$(ff.l(r,lv)) = (lambdaf.l(r,lv)**(1-sigmak(r,lv,Old)))
                          * (ff.l(r,lv)/volume(r,lv))*(pf.l(r,lv)/Price(r,lv))**sigmak(r,lv,Old) ;
  ak(r,lv,Old)$(vol1(r,lv)) = (lambdak.l(r,lv,Old)**(1-sigmak(r,lv,Old)))
                          * (vol1(r,lv)/volume(r,lv))*(pr1(r,lv)/Price(r,lv))**sigmak(r,lv,Old) ;

* Re-calibrate the parameters for the energy bundle, aep

  Volume(r,lv) = sum(v,xep.l(r,lv,v)) ;
  Price(r,lv)$(Volume(r,lv)) = sum(v,xep.l(r,lv,v)*pep.l(r,lv,v))/Volume(r,lv) ;

  aep(r,e,lv,Old)$(Volume(r,lv) and ArmFlag eq 1)
     = (lambdaep.l(r,e,lv)**(1-sigmaep(r,lv,Old)))
     * (XAp.l(r,e,lv)/Volume(r,lv))*(PAp.l(r,e,lv)/Price(r,lv))**sigmaep(r,lv,Old) ;

  aep(r,e,lv,Old)$(Volume(r,lv) and ArmFlag eq 0)
     = (lambdaep.l(r,e,lv)**(1-sigmaep(r,lv,Old)))
     * (XAp.l(r,e,lv)/Volume(r,lv))*((1+mtxadj.l(r,e)*patax.l(r,e,lv)+atxadj.l(r,e))*PA.l(r,e)/Price(r,lv))**sigmaep(r,lv,Old) ;

* display and, ava, aktel, atfd, afeed, at, al, akte, ae, akt, af, ak, aep ;

* --------------------------------------------------------------------
*
*     Manufacturing and Services production structure
*
* --------------------------------------------------------------------

* The old share parameters are re-calibrated in order to be able to re-produce
* the previous periods output with the "old" technology

* display and, ava, al, ahkte, ae, ahkt, ah, akt, at, af, ak, aep ;

* Re-calibrate the parameters for the VA bundle, al and ahkte

  Volume(r,ip) = sum(v,va.l(r,ip,v)) ;
  Price(r,ip)$(Volume(r,ip)) = sum(v,va.l(r,ip,v)*pva.l(r,ip,v))/Volume(r,ip) ;

  vol1(r,ip) = ld.l(r,ip) ;
  vol2(r,ip) = sum(v,hkte.l(r,ip,v)) ;
  pr1(r,ip)$(vol1(r,ip)) = ld.l(r,ip)*awage.l(r,ip)/vol1(r,ip) ;
  pr2(r,ip)$(vol2(r,ip)) = sum(v,hkte.l(r,ip,v)*phkte.l(r,ip,v))/vol2(r,ip) ;

  al(r,ip,Old)$(Volume(r,ip))    = (vol1(r,ip)/volume(r,ip))*(pr1(r,ip)/Price(r,ip))**sigmav(r,ip,Old) ;
  ahkte(r,ip,Old)$(Volume(r,ip)) = (vol2(r,ip)/volume(r,ip))*(pr2(r,ip)/Price(r,ip))**sigmav(r,ip,Old) ;

* Re-calibrate the parameters for the HKTE bundle, ae and ahkt

  Volume(r,ip) = sum(v,hkte.l(r,ip,v)) ;
  Price(r,ip)$(Volume(r,ip)) = sum(v,hkte.l(r,ip,v)*phkte.l(r,ip,v))/Volume(r,ip) ;

  vol1(r,ip) = sum(v,xep.l(r,ip,v)) ;
  vol2(r,ip) = sum(v,hkt.l(r,ip,v)) ;
  pr1(r,ip)$(vol1(r,ip)) = sum(v,xep.l(r,ip,v)*pep.l(r,ip,v))/vol1(r,ip) ;
  pr2(r,ip)$(vol2(r,ip)) = sum(v,hkt.l(r,ip,v)*phkt.l(r,ip,v))/vol2(r,ip) ;

  ae(r,ip,Old)$(Volume(r,ip))   = (vol1(r,ip)/volume(r,ip))*(pr1(r,ip)/Price(r,ip))**sigmae(r,ip,Old) ;
  ahkt(r,ip,Old)$(Volume(r,ip)) = (vol2(r,ip)/volume(r,ip))*(pr2(r,ip)/Price(r,ip))**sigmae(r,ip,Old) ;

* Re-calibrate the parameters for the HKT bundle, ah and akt

  Volume(r,ip) = sum(v,hkt.l(r,ip,v)) ;
  Price(r,ip)$(Volume(r,ip)) = sum(v,hkt.l(r,ip,v)*phkt.l(r,ip,v))/Volume(r,ip) ;

  vol1(r,ip) = labdv.l(r,"HSk",ip) ;
  vol2(r,ip) = sum(v,kt.l(r,ip,v)) ;
  pr1(r,ip)              = wage.l(r,"HSk",ip) ;
  pr2(r,ip)$(vol2(r,ip)) = sum(v,kt.l(r,ip,v)*pkt.l(r,ip,v))/vol2(r,ip) ;

  ah(r,ip,Old)$(Volume(r,ip))   = (lambdal.l(r,"HSk",ip)**(1-sigmah(r,ip,Old)))
                          * (vol1(r,ip)/volume(r,ip))*(pr1(r,ip)/Price(r,ip))**sigmah(r,ip,Old) ;
  akt(r,ip,Old)$(Volume(r,ip)) = (vol2(r,ip)/volume(r,ip))*(pr2(r,ip)/Price(r,ip))**sigmah(r,ip,Old) ;

* Re-calibrate the parameters for the KT bundle, at, af and ak

  Volume(r,ip) = sum(v,kt.l(r,ip,v)) ;
  Price(r,ip)$(Volume(r,ip)) = sum(v,kt.l(r,ip,v)*pkt.l(r,ip,v))/Volume(r,ip) ;

  vol1(r,ip) = sum(v,kapdv.l(r,ip,v)) ;
  pr1(r,ip)$(vol1(r,ip)) = sum(v,kapdv.l(r,ip,v)*rent.l(r,ip,v))/vol1(r,ip) ;

  at(r,ip,Old)$(td.l(r,ip)) = (lambdat.l(r,ip)**(1-sigmak(r,ip,Old)))
                          * (td.l(r,ip)/volume(r,ip))*(pt.l(r,ip)/Price(r,ip))**sigmak(r,ip,Old) ;
  af(r,ip,Old)$(ff.l(r,ip)) = (lambdaf.l(r,ip)**(1-sigmak(r,ip,Old)))
                          * (ff.l(r,ip)/volume(r,ip))*(pf.l(r,ip)/Price(r,ip))**sigmak(r,ip,Old) ;

* display lambdak.l, pr1, price ;

  ak(r,ip,Old)$(vol1(r,ip)) = (lambdak.l(r,ip,Old)**(1-sigmak(r,ip,Old)))
                          * (vol1(r,ip)/volume(r,ip))*(pr1(r,ip)/Price(r,ip))**sigmak(r,ip,Old) ;

* Re-calibrate the parameters for the energy bundle, aep

  Volume(r,ip) = sum(v,xep.l(r,ip,v)) ;
  Price(r,ip)$(Volume(r,ip)) = sum(v,xep.l(r,ip,v)*pep.l(r,ip,v))/Volume(r,ip) ;

  aep(r,e,ip,Old)$(Volume(r,ip) and ArmFlag eq 1)
     = (lambdaep.l(r,e,ip)**(1-sigmaep(r,ip,Old)))
     * (XAp.l(r,e,ip)/Volume(r,ip))*(PAp.l(r,e,ip)/Price(r,ip))**sigmaep(r,ip,Old) ;

  aep(r,e,ip,Old)$(Volume(r,ip) and ArmFlag eq 0)
     = (lambdaep.l(r,e,ip)**(1-sigmaep(r,ip,Old)))
     * (XAp.l(r,e,ip)/Volume(r,ip))*((1+mtxadj.l(r,e)*patax.l(r,e,ip)+atxadj.l(r,e))*PA.l(r,e)/Price(r,ip))**sigmaep(r,ip,Old) ;

* display and, ava, al, ahkte, ae, ahkt, ah, akt, at, af, ak, aep ;

if (ArmEndog eq 1,

*
*  Re-calibrate the first level Armington shares to adjust to evolving market shares
*
   mrktshr1(r,i,"Dom") = pd.l(r,i)*xd.l(r,i)/(pd.l(r,i)*xd.l(r,i)+pmt.l(r,i)*xmt.l(r,i)) ;
   mrktshr1(r,i,"Imp") = pmt.l(r,i)*xmt.l(r,i)/(pd.l(r,i)*xd.l(r,i)+pmt.l(r,i)*xmt.l(r,i)) ;

   loop(r,loop(i,
   if (sigmam(r,i) ne inf,
      ad(r,i) = ((mrktshr1(r,i,"Dom")**(1-thetArm1(r,i)))*(betaArm1(r,i,"Dom")**thetArm1(r,i)))
              / ((mrktshr1(r,i,"Dom")**(1-thetArm1(r,i)))*(betaArm1(r,i,"Dom")**thetArm1(r,i))
              +  (mrktshr1(r,i,"Imp")**(1-thetArm1(r,i)))*(betaArm1(r,i,"Imp")**thetArm1(r,i))) ;
      am(r,i) = ((mrktshr1(r,i,"Imp")**(1-thetArm1(r,i)))*(betaArm1(r,i,"Imp")**thetArm1(r,i)))
              / ((mrktshr1(r,i,"Dom")**(1-thetArm1(r,i)))*(betaArm1(r,i,"Dom")**thetArm1(r,i))
              +  (mrktshr1(r,i,"Imp")**(1-thetArm1(r,i)))*(betaArm1(r,i,"Imp")**thetArm1(r,i))) ;
   ) ;
   ) ) ;

   option decimals = 6 ;
*   display mrktshr1, ad, am ;
   option decimals = 3 ;

$ontext
*
*  Re-calibrate the second level Armington shares to adjust to evolving market shares
*
   mrktshr2(rp,r,i) = 0 ;
   mrktshr2(rp,r,i)$(xmt0(r,i) ne 0) = pm.l(rp,r,i)*lambdaw(rp,r,i)*wtf.l(rp,r,i)/(pmt.l(r,i)*xmt.l(r,i)) ;

   amw(rp,r,i)$(sigmaw(r,i) ne inf and xmt0(r,i) ne 0)
            = ((mrktshr2(rp,r,i)**(1-thetArm2(r,i)))*(betaArm2(rp,r,i)**thetArm2(r,i)))
            / (sum(rpp,(mrktshr2(rpp,r,i)**(1-thetArm2(r,i)))*(betaArm2(rpp,r,i)**thetArm2(r,i)))) ;

*   display amw ;

$offtext
) ;

*
*  Re-calibrate the consumption structure to maintain base year income elasticities
*  Only re-calibrate in the BaU scenario and for years after the second.
*

if(CalFlag eq 1 and ord(t) gt 2 and ifELES eq 1,

   cprice(r,k,h) = pc.l(r,k,h) ;
*
*  20-May-2001: DvdM adjustment of calibration procedure
*
*  First, adjust base year income elasticities in order to keep the elasticity of savings
*  constant
*
*  12-Jun-2001: DvdM use steady state savings rate after first year
*               These are to be found in the base file

   mps(r,h) = etas0(r,h)*savh.l(r,h)/yd.l(r,h) ;
*  mps(r,h) = etas0(r,h)*sssavRate(r,h) ;

*  Calculate shares and adjustment factor for base year income elasticities

   cvolume(r,k,h) = cprice(r,k,h)*xc.l(r,k,h)/yd.l(r,h) ;
   hwork(r,h) = (1-mps(r,h))/sum(k,eta0(r,k,h)*cvolume(r,k,h)) ;

   mpc(r,k,h) = hwork(r,h)*eta0(r,k,h)*cvolume(r,k,h) ;

*  Re-initialize cvolume and hwork

   cvolume(r,k,h) = xc.l(r,k,h) ;
   hwork(r,h)     = yd.l(r,h) ;

*  Initialize theta

   thetav.l(r,k,h) = hpop.l(r,h)*theta(r,k,h) ;

   options solprint=off ;
   solve elescal using mcp ;

   theta(r,k,h) = thetav.l(r,k,h)/hpop.l(r,h) ;
   mu.fx(r,k,h) = mpc(r,k,h) ;

*  display year, mpc, theta ;

   hwork(r,h) = mps(r,h)*yd.l(r,h)/savh.l(r,h) ;
*  display "Imputed income elasticity for saving: ", hwork ;
*  display mps ;
) ;

* ----- Re-calibrate top level Armington

if (0 and ArmEndog ne 1,

   loop(r,loop(i$(xa.l(r,i) ne 0),

      if (yelasArmD(r,i) eq 1 and yelasArmM(r,i) eq 1,

         thetad(r,i) = 0 ;
         thetam(r,i) = 0 ;

      else

         mrktshr1(r,i,"Dom") = pd.l(r,i)*xd.l(r,i)/(pa.l(r,i)*xa.l(r,i)) ;
         mrktshr1(r,i,"Imp") = pmt.l(r,i)*xmt.l(r,i)/(pa.l(r,i)*xa.l(r,i)) ;

         ad(r,i)$(sigmam(r,i) ne inf and xa0(r,i) ne 0)
            = yelasArm(r,i,"Dom")*mrktshr1(r,i,"Dom")*(pa.l(r,i)/pd.l(r,i))**(1-sigmam(r,i)) ;
         am(r,i)$(sigmam(r,i) ne inf and xa0(r,i) ne 0)
            = yelasArm(r,i,"Imp")*mrktshr1(r,i,"Imp")*(pa.l(r,i)/pmt.l(r,i))**(1-sigmam(r,i)) ;

         thetad(r,i) = 0 ;
         thetam(r,i) = (xmt.l(r,i) - am(r,i)*xa.l(r,i)*(pa.l(r,i)/pmt.l(r,i))**sigmam(r,i))
                     / (1 - am(r,i)*(pa.l(r,i)/pmt.l(r,i))**(sigmam(r,i) - 1)) ;
      ) ;
   )) ;
   display mrktshr1, ad, am, thetam, yelasArm ;
) ;


* ----- Reset rental rates...

$ontext
rrat.l(r,i)    = 1 ;
nrent.l(r,i,v) = trent.l(r) ;
rent.l(r,i,v)  = nrent.l(r,i,v)*(1+KapTax.l(r,i,v)) ;
$offtext
