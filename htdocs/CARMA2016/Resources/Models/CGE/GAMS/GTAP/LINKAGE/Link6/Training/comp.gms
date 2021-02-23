* --------------------------------------------------------------------
*
*  LINK5 -- LINKAGE Applied General Equilibrium Model
*
*  Comparative Static Model
*  ------------------------
*
*  Based on GTAP Version 5.3
*
* --------------------------------------------------------------------

$Title COMP

set sim  Simulation title / Comp / ;

* ----- Output files

file csv           / 'COMP.csv' /
scalar ifCSV       / 1 / ;
scalar ifCSVhdr    / 1 / ;

file wtfcsv        / 'WTF.csv' /
scalar ifWTF       / 1 / ;
scalar ifWTFhdr    / 1 / ;

file samcsv        / 'SAM.csv' /
scalar ifSAM       / 1 / ;
scalar ifSAMhdr    / 1 / ;

file yelascsv      / 'Yelas.csv' /
scalar ifYelas     / 1 / ;
scalar ifYelashdr  / 1 / ;

* --------------------------------------------------------------------
*
*  Define the "time" scope of the model
*
* --------------------------------------------------------------------

sets
   t     time horizon     / Base, Check, Homog /
   tt(t) solution periods / Check, Homog /
   t0(t) base period      / Base /
   tr(t) reporting years  / Base, Check, Homog /
   ;

parameters
   years(t)
   year
   gap ;

years(t) = ord(t) ;
gap = 1 ;

* ----- Scale options

scalar bscale Model scale      / 1e-06 / ;
scalar rscale Output scale     / 1e+06 / ;
scalar pscale Population scale / 1e-03 / ;

* ----- Input data files

$include "train.dat"
$include "trainprm.dat"

* ----- Specification flags
*
*  Set ArmFlag to 1 to have agent specific Armington decomposition
*      ArmFlag to 0 to have aggregate Armington specification
*

scalar ArmFlag / 0 / ;

*  Set CalFlag to 1 for dynamic calibration
*      CalFlag to 0 for pre-calibrated trends

scalar CalFlag  / 0 / ;

*  Set KProdFlag to 1 to determine endogenously K productivity
*      KProdFlag to 0 for exogenous K productivity

scalar KProdFlag  / 0 / ;

*  Set CompFlag to 1 to delete capital accumulation equations
*      CompFlag to 0 to include capital accumulation equations

scalar CompFlag / 1 / ;

*  Set KFlowFlag to 0 for exogenous capital flows
*      KFlowFlag to 1 for endogenous capital flows

scalar KFlowFlag / 0 / ;

*  Consumer demand system flag
*  ifELES eq 1 Use the ELES system
*  ifELES eq 2 Use the LES system
*  ifELES eq 3 Use the AIDADS system

scalar ifELES consumer demand system flag / 1 / ;

* ---- Market structure flags

*      0 -- CRTS and perfect competition, includes constant markup
*      1 -- IRTS and contestable markets

parameter marketFlag(r,i) Type of market structure ;
marketFlag(r,i) = 0 ;

parameter AIDSFlag(r,i) Flag to determine import specification ;
AIDSFlag(r,i) = 0 ;

*  AIDS flag set to 1 to implement AIDS in import demand
*  AIDS flag set to 0 for nested CES implementation

parameter AIDSFlag(r,i) Flag to determine import specification ;
AIDSFlag(r,i) = 0 ;

*  Wage bargaining flag, set to 1 to have endogenous wage distribution
*                        set to 0 to have exogenoug relative wages

parameter wageBarg(r,ll,i) Wage bargaining flag ;
wageBarg(r,ll,i) = 0 ;

sets
   v(v1)   Useful vintage       / Old /
   old(v1) Old capital vintage  / Old /
   new(v1) New capital vintage
   vc(v1)  Calibration vintage  / Old /
   ;

   new(v1)  = not Old(v1) ;

$include "decl.gms"
$include "stats.gms"

$include "cal.gms"
$include "init.gms"
$include "model.gms"
$include "zero.gms"

etap(r,i) = 0 ;
gT(r,i,t) = 0 ;
gtT(r,t)  = 0 ;
gfT(r,t)  = 0 ;

* ---- Loop over all years

options limcol=1000, limrow=1000 ;
options solprint=off ;

loop(t,

   year  = years(t) ;
   obj.l = year ;

   if (ord(t) gt 1,

* --------------------------------------------------------------------
*
*  Update the lagged variables
*
* --------------------------------------------------------------------

      if(Compflag ne 1,
         rgdpmpLag(r)       = rgdpmp.l(r) ;
         popLag(r,tranche)  = pop.l(r,tranche) ;
      ) ;
      rgdpLag(r)         = rgdp.l(r) ;
*     invshlag(r)        = invsh.l(r) ;
      lambdakLag(r,i,v)  = lambdak.l(r,i,v) ;
      lambdalLag(r,ll,i) = lambdal.l(r,ll,i) ;
      lambdatLag(r,i)    = lambdat.l(r,i) ;
      lambdafLag(r,i)    = lambdaf.l(r,i) ;
*     For compstat exercises, the investment lags and kstock lags shouldn't
*     be modified.
      rratLag(r,i)       = rrat.l(r,i) ;
*     tiLag(r)           = fdvol.l(r,"Inv") ;
*     kstockLag(r)       = kstock.l(r) ;
   ) ;

   if (CalFlag eq 0,
      fdvol.fx(r,"Gov") = fdvol0(r,"Gov") ;
   ) ;

   if (CompFlag eq 1,
      kstock.fx(r) = kstock0(r) ;
      ginv.fx(r)   = ginv0(r) ;
      tkaps.fx(r)  = tkaps0(r) ;
   ) ;

   if (ord(t) ge 2,

* ----- Define the shocks

      if(ord(t) eq 3,
         p.fx = 1.2*p0 ;
*        tar.fx(r,"usa","manuf") = 0 ;
      ) ;

      if(ord(t) gt 1, solve comp using mcp ; ) ;

      display pp.l, wage.l, pgdp.l ;

   ) ;
$include "postsim.gms"
$include 'sam.gms'
$include 'wtf.gms'
$include 'report.gms'
$include "yelas.gms"
) ;
