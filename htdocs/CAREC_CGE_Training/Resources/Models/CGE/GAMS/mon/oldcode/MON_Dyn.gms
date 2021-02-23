$comment *


* --
* --  Prototype Mongolia CGE Model: Dynamic Version
* --
* --
* --            David Roland-Holst
* --
* --            December, 2009
* --
* --
* --

$Title MON1
* -- Decompose project effects for medium case

set allsim / Base, ElCN / ;
set sim(allsim) / Base, ElCN / ;

parameter ivb Verbose Output /0/ ;
parameter echk /1.0/ ;
parameter CalFlag Flag determining nature of dynamic scenarios ;
parameter iann Annual Results Posted /1/ ;

* Set CalFlag to 1 to calibrate labor productivity, 0 otherwise

CalFlag = 1 ;

parameter Header Flag determining whether to output header records in output files ;

* Set Header to 1 to output header in output file

Header = 1 ;

*----- Declare the output file names

file reportfile / MON1.csv / ;
file samfile    / samMON1.csv / ;
file MON1scn     / MON1scn.gms / ;


* --------------------------------------------------------------------------------------------------
*
*  Initialize output files
*
* --------------------------------------------------------------------------------------------------

put reportfile ;
if (Header eq 1, put 'Scenario,year,variable,sector,qualifier,type,value' / ; ) ;

reportfile.pc   = 5 ;
reportfile.pw = 255 ;
reportfile.nj =   1 ;
reportfile.nw =  15 ;
reportfile.nd =   9 ;
reportfile.nz =   0 ;
reportfile.nr =   0 ;

* ----- Model output options

options limcol=0, limrow=0 ;
options solprint=off ;

* ---- Verbose output for CSV File
parameter icsv /0/ ;

* ----- Input the base SAM and aggregate

$include "MON20_Input.dat"

* ----- Calibrate, initialize and define the model

$include decl.gms
$include cal.gms
$include init.gms

$include "MON_model.gms"

* ----- Load the dynamic definitions

$include "scen10.gms"

glT(t) = 0 ;
scen(t,"gdp") = 5 ;
*Scen(t,"depr") = 3.5;
*Scen(t,"AgProd") = 0 ;
*Scen(t,"pop") = 0 ;
*lscen(t,l) = 0 ;
chil(manu,l) = 0.0;

set et(i) Experimental sectors for productivity growth /
*ATrade
ATransp
*AComm
/ ;

parameter exup / 1.25 / ;

display "Results" ;

* ----- Run the simulations

loop(sim,

$ontext
if(ord(sim) eq 1,
	tmg.fx(k,"d") = .01*sum(i$mapc(i,k),scpar("2008",i,"lossb")) ;
	display tmg.l ;
	tmg0(k,"d") = tmg.l(k,"d") ;
) ;
$offtext

ntcip = 0 ;

$include "cal.gms"
$include "init.gms"

     calflag = 0 ;
     if (ord(sim) le 1,
     calflag = 1 ;
     ) ;

voc(k,j) = 0 ;
*xf.fx("govt") = xf0("govt") ;

*loop(t$(Ord(t) le 10),
loop(t,
*loop(t$(ord(t) le 13),

*## Configure Dynamic Calibration
*if (ord(sim) ge 1 and ord(t) ge 20, Scen(t,"depr") = 3.4 ; ) ;
$include dyncal.gms

display lambdal.l, lambdak.l, lambdat.l ;

*if (ord(sim) ge 2, 
* ae(k,r) = (1+.06*ggdp.l)*ae(k,r) ; 
*) ;

* -- 1=Baseline
*   	taxadjh.fx = taxadjh.l ;
*          tp.lo("ATransp") = -inf ;
*          tp.up("ATransp") = +inf ;



* -- 2=Low
if(ord(sim) eq 2,
 ae("CElecPwr",r) = (1+.4)*ae("CElecPwr",r) ; 
) ;

* -- 3=Medium
if(ord(sim) eq 3,
) ;

* -- 4=High
if(ord(sim) eq 4,
) ;

      solve cge using mcp ;


* ---- Calculate WALRAS' Law

*walras =  sum(r,sum(k,wpe.l(k,r)*xe.l(k,r)))/er.l + sum(h,wtrh.l(h)) + wtrg.l + savf.l
*        - (sum(r,sum(k,wpm.l(k,r)*xm.l(k,r))) + sum(h,htrw.l(h))/er.l + gtrw.l/er.l
*        +  sum(e,ctrw.l(e))/er.l + sum(kt,ktrw.l(kt))/er.l ) ;

walras =  sum(r,sum(k,wpe.l(k,r)*xe.l(k,r))) + sum(h,wtrh.l(h)) + wtrg.l + savf.l
        - (sum(r,sum(k,wpm.l(k,r)*xm.l(k,r))) + sum(h,htrw.l(h))/er.l + gtrw.l/er.l
        +  sum(e,ctrw.l(e))/er.l + sum(kt,ktrw.l(kt))/er.l ) ;

display walras ;
display savf.l ;


* ----- Save intermediate results

     if (CalFlag eq 1, 
        glT(t) = gl.l ; 
     ) ;

     if (TR(t),
$include 'postsim.gms'
     ) ;
display glt ;
) ;
display glt, lambdal.l, lambdallag, chil ;
) ;