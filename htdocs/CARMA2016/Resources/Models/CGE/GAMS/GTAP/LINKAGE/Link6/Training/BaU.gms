* --------------------------------------------------------------------
*
*  LINK5 -- Applied General Equilibrium Model
*
*  Dynamic Calibration -- BaU Scenario
*  -----------------------------------
*
*  Based on GTAP Version 5.4
*
* --------------------------------------------------------------------

$Title BaU

set sim / BaU / ;

* ----- Output files

file csv           / 'BaU.csv' /
scalar ifCSV       / 1 / ;
scalar ifCSVhdr    / 1 / ;

file tab           / 'BaUTab.csv' /
scalar iftab       / 1 / ;
scalar ifTabhdr    / 1 / ;

file wtfcsv        / 'WTFBaU.csv' /
scalar ifWTF       / 1 / ;
scalar ifWTFhdr    / 1 / ;

file samcsv        / 'SAMBaU.csv' /
scalar ifSAM       / 1 / ;
scalar ifSAMhdr    / 1 / ;

file gms           / 'BaUout.dat' /
scalar ifgms       / 1 / ;
gms.ap = 0 ;

file yelascsv      / 'YelasBaU.csv' /
scalar ifYelas     / 0 / ;
scalar ifYelashdr  / 1 / ;

file savecal       / 'reftrn.gms' /

file debug         / 'debug.csv' / ;
scalar ifDebug     / 1 / ;

if (ifDebug,
   put debug ;
   put "Country,Qualifier,Partner,Sector,Variable,Value" / ;

   debug.pc   = 5 ;
   debug.pw = 255 ;
   debug.nj =   1 ;
   debug.nw =  15 ;
   debug.nd =   9 ;
   debug.nz =   0 ;
   debug.nr =   0 ;
) ;

* --------------------------------------------------------------------
*
*  Define the time horizon -- 1997 is the base
*
* --------------------------------------------------------------------

 Sets
   t       Time framework       / 1997*2015 /
   tt(t)   Simulation periods   / 1998*2015 /
   t0(t)   Base year            / 1997 /
   tr(t)   Reporting years      / 1997*2015 /
   ;

 Parameters
   year     Current year
   gap      Step size
   niter(t) Number of iteration steps per period
   iter3    Iteration counter
   ;

 parameter years(t) /
   1997  1997
   1998  1998
   1999  1999
   2000  2000
   2001  2001
   2002  2002
   2003  2003
   2004  2004
   2005  2005
   2006  2006
   2007  2007
   2008  2008
   2009  2009
   2010  2010
   2011  2011
   2012  2012
   2013  2013
   2014  2014
   2015  2015
/ ;

year = 1997 ;
gap  = 1 ;

* ----- Scale options

scalar bscale Model scale      / 1e-06 / ;
scalar rscale Output scale     / 1e+06 / ;
scalar pscale Population scale / 1e-03 / ;

* ----- Input data files

$include "train.dat"
$include "trainprm.dat"
$include "trainscn.dat"

$onempty
*$include 'reftrn.gms'
$offempty

* ----- Cut the shocked years into small pieces for convergence reasons

parameter niter(t) /
   1997  1
   1998  1
   1999  1
   2000  1
   2001  1
   2002  1
   2003  1
   2004  1
   2005  1
   2006  1
   2007  1
   2008  1
   2009  1
   2010  1
   2011  1
   2012  1
   2013  1
   2014  1
   2015  1
/ ;

* ----- Specification flags
*
*  Set ArmFlag to 1 to have agent specific Armington decomposition
*      ArmFlag to 0 to have aggregate Armington specification
*

scalar ArmFlag / 0 / ;

*  Set CalFlag to 1 for dynamic calibration
*      CalFlag to 0 for pre-calibrated trends

scalar CalFlag  / 1 / ;

*  Set KProdFlag to 1 to determine endogenously K productivity
*      KProdFlag to 0 for exogenous K productivity

scalar KProdFlag  / 0 / ;

*  Set CompFlag to 1 to delete capital accumulation equations
*      CompFlag to 0 to include capital accumulation equations

scalar CompFlag / 0 / ;

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
   v(v1)   Useful vintage       / Old, New /
   old(v1) Old capital vintage  / Old /
   new(v1) New capital vintage
   vc(v1)  Calibration vintage  / New /
   ;
new(v1)  = not Old(v1) ;

$include "decl.gms"
$include "stats.gms"

$include "cal.gms"
$include "init.gms"
$include "model.gms"
$include "zero.gms"

* ----- Loop over the remaining years

options limcol=0, limrow=0 ;
options solprint=off ;

loop(t$(years(t) le 2015),

*  Load the standard looping statements here

$include "iterLoop.gms"

*  Include any special shocks here...

   if (ord(t) gt 1,

      for(iter3=1 to niter(t) by 1,

         if (niter(t) gt 1,
            tar.fx(r,rp,i)  = tarT(r,rp,i,t-1) - ((tarT(r,rp,i,t)-tarT(r,rp,i,t-1))/(niter(t)-1))*(niter(t)-iter3) ;
            etax.fx(r,rp,i) = etaxT(r,rp,i,t-1) - ((etaxT(r,rp,i,t)-etaxT(r,rp,i,t-1))/(niter(t)-1))*(niter(t)-iter3) ;
         else
            tar.fx(r,rp,i)  = tarT(r,rp,i,t) ;
            etax.fx(r,rp,i) = etaxT(r,rp,i,t) ;
         ) ;

         solve comp using mcp ;

         put screen ;
         put //, "End of solver: Year - ", years(t):4:0, " Iteration - ", iter3:2:0, " of ", niter(t):2:0, " iterations" // ;
         putclose ;
      ) ;

   ) ;

$include "postsim.gms"
$include "report.gms"
$include "wtf.gms"
$include "sam.gms"
$include "yelas.gms"
) ;

$include "tables.gms"
$include "savtrn.gms"
