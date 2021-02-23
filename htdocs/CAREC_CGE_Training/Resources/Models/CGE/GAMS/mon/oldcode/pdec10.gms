$comment *


* --
* --  Prototype Pakistan CGE Model: Dynamic Version
* --
* --
* --            David Roland-Holst
* --
* --            April, 2007
* --
* --
* --

$Title PakDecomp
* -- Decompose project effects for medium case

set allsim / Base, VOC, Prod, Ice, Fin, Low, High / ;
set sim(allsim) / Base, VOC, Prod, Ice, Fin / ;

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

file reportfile / PakDecomp.csv / ;
file samfile    / samPakDecomp.csv / ;
file pakscn     / pakparm.gms / ;


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

put samfile ;
if (Header eq 1, put 'Scenario,year,rlab,clab,value' / ; ) ;

samfile.pc   = 5 ;
samfile.pw = 255 ;
samfile.nj =   1 ;
samfile.nw =  15 ;
samfile.nd =   9 ;
samfile.nz =   0 ;
samfile.nr =   0 ;

* ----- Model output options

options limcol=0, limrow=0 ;
options solprint=off ;

* ---- Verbose output for CSV File
parameter icsv /0/ ;

* ----- Input the base SAM and aggregate

*$include "paghh.gms"
$include "pag10h.gms"

* ----- Calibrate, initialize and define the model

$include decl.gms
$include cal.gms
$include init.gms

*$include "pm.gms"
$include "pakmod.gms"

* ----- Load the dynamic definitions

$include "scen10.gms"

glT(t) = 0 ;
scen(t,"gdp") = 5 ;
Scen(t,"depr") = 4 ;
*Scen(t,"AgProd") = 0 ;
*Scen(t,"pop") = 0 ;
*lscen(t,l) = 0 ;
chil(manu,l) = 0.0;

set et(i) Experimental sectors for productivity growth /
ARoadTr
*AOtherTr
*ACommServ
/ ;

parameter exup / 1.25 / ;

display "Results" ;

* ----- Run the simulations

loop(sim,

$ontext
if(ord(sim) eq 1,
	tmg.fx(k,"d") = .01*sum(i$mapc(i,k),scpar("2007",i,"lossb")) ;
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

voc(k,j) = 1 ;

*loop(t$(Ord(t) le 10),
loop(t,

*## Configure Dynamic Calibration
$include dyncal.gms

display lambdal.l, lambdak.l, lambdat.l ;

if (ord(sim) le 4, 
 ae(k,r) = (1+(Ord(sim)-1)*.02*ggdp.l)*ae(k,r) ; 
) ;
if (ord(sim) eq 5, 
 ae(k,r) = (1+(Ord(sim)-2)*.02*ggdp.l)*ae(k,r) ; 
) ;

* -- 1=Baseline
   	taxadjh.fx = taxadjh.l ;
   	tp.lo("ARoadTr") = -inf ;
   	tp.up("ARoadTr") = +inf ;


* -- 2=VOC
if(ord(sim) eq 2,
      	if (ord(t) eq 7,
      	voc(k,"ARoadTr") = sum(i$mapc(i,k),scpar("2007",i,"vocm")) ;
	display voc ;
	chk1 = sum(k,a(k,"ARoadTr")) ;
	a(k,"ARoadTr")$voc(k,"ARoadTr") = .7*a(k,"ARoadTr") ;
 	a(k,"ARoadTr") = a(k,"ARoadTr")*chk1/sum(kk,a(kk,"ARoadTr")) ;
*	tmg.fx(k,"d") = .01*sum(i$mapc(i,k),scpar(t,i,"lossm")) ;
      	lambdallag("ARoadTr",l)  = 1.1*lambdallag("ARoadTr",l) ;
      	lambdak.fx("ARoadTr",kt) = 1.1*lambdak.l("ARoadTr",kt) ;
      	lambdat.fx("ARoadTr",lt) = 1.1*lambdat.l("ARoadTr",lt) ;
$ontext
	display tmg.l ;
	tmg0(k,"d") = tmg.l(k,"d") ;
      	lambdallag(et,l)  = 1.67*lambdallag(et,l) ;
      	lambdak.fx(et,kt) = 1.67*lambdak.l(et,kt) ;
      	lambdat.fx(et,lt) = 1.67*lambdat.l(et,lt) ;
      	xf.fx("govt") = xf.l("govt")+ costrec(t,"capm") + costrec(t,"mocm") ;
      	lambdallag(i,l)  = (1+marg(i))*lambdallag(i,l) ;
      	lambdak.fx(i,kt) = (1+marg(i))*lambdak.l(i,kt) ;
      	lambdat.fx(i,lt) = (1+marg(i))*lambdat.l(i,lt) ;
   	taxadjh.fx = taxadjh.l ;
   	tp.lo("ARoadTr") = -inf ;
   	tp.up("ARoadTr") = +inf ;
$offtext
	) ;
*	ae(k,r) = (1+3*exup*ggdp.l)*ae(k,r) ; 
) ;

* -- 3=Prod
if(ord(sim) eq 3,
      	if (ord(t) eq 7,
      	voc(k,"ARoadTr") = sum(i$mapc(i,k),scpar("2007",i,"vocm")) ;
	display voc ;
	chk1 = sum(k,a(k,"ARoadTr")) ;
	a(k,"ARoadTr")$voc(k,"ARoadTr") = .7*a(k,"ARoadTr") ;
 	a(k,"ARoadTr") = a(k,"ARoadTr")*chk1/sum(kk,a(kk,"ARoadTr")) ;
*	a(k,"ARoadTr") = a(k,"ARoadTr")*chk1/sum(kk,a(kk,"ARoadTr")) ;
*	tmg.fx(k,"d") = .01*sum(i$mapc(i,k),scpar(t,i,"lossm")) ;
      	lambdallag("ARoadTr",l)  = 1.1*lambdallag("ARoadTr",l) ;
      	lambdak.fx("ARoadTr",kt) = 1.1*lambdak.l("ARoadTr",kt) ;
      	lambdat.fx("ARoadTr",lt) = 1.1*lambdat.l("ARoadTr",lt) ;

      	lambdallag(et,l)  = 1.67*lambdallag(et,l) ;
      	lambdak.fx(et,kt) = 1.67*lambdak.l(et,kt) ;
      	lambdat.fx(et,lt) = 1.67*lambdat.l(et,lt) ;
$ontext
	display tmg.l ;
	tmg0(k,"d") = tmg.l(k,"d") ;
      	lambdallag(i,l)  = (1+marg(i))*lambdallag(i,l) ;
      	lambdak.fx(i,kt) = (1+marg(i))*lambdak.l(i,kt) ;
      	lambdat.fx(i,lt) = (1+marg(i))*lambdat.l(i,lt) ;

      	xf.fx("govt") = xf.l("govt")+ costrec(t,"capm") + costrec(t,"mocm") ;
      	lambdallag(i,l)  = (1+marg(i))*lambdallag(i,l) ;
      	lambdak.fx(i,kt) = (1+marg(i))*lambdak.l(i,kt) ;
      	lambdat.fx(i,lt) = (1+marg(i))*lambdat.l(i,lt) ;
   	taxadjh.fx = taxadjh.l ;
   	tp.lo("ARoadTr") = -inf ;
   	tp.up("ARoadTr") = +inf ;
$offtext
	) ;
*	ae(k,r) = (1+3*exup*ggdp.l)*ae(k,r) ; 
) ;

* -- 4=Ice
if(ord(sim) eq 4,
      	if (ord(t) eq 7,
      	voc(k,"ARoadTr") = sum(i$mapc(i,k),scpar("2007",i,"vocm")) ;
	display voc ;
	chk1 = sum(k,a(k,"ARoadTr")) ;
	a(k,"ARoadTr")$voc(k,"ARoadTr") = .7*a(k,"ARoadTr") ;
 	a(k,"ARoadTr") = a(k,"ARoadTr")*chk1/sum(kk,a(kk,"ARoadTr")) ;
*	tmg.fx(k,"d") = .01*sum(i$mapc(i,k),scpar(t,i,"lossm")) ;
      	lambdallag("ARoadTr",l)  = 1.1*lambdallag("ARoadTr",l) ;
      	lambdak.fx("ARoadTr",kt) = 1.1*lambdak.l("ARoadTr",kt) ;
      	lambdat.fx("ARoadTr",lt) = 1.1*lambdat.l("ARoadTr",lt) ;

      	lambdallag(et,l)  = 1.67*lambdallag(et,l) ;
      	lambdak.fx(et,kt) = 1.67*lambdak.l(et,kt) ;
      	lambdat.fx(et,lt) = 1.67*lambdat.l(et,lt) ;

	display tmg.l ;
	tmg0(k,"d") = tmg.l(k,"d") ;
      	lambdallag(i,l)  = (1+marg(i))*lambdallag(i,l) ;
      	lambdak.fx(i,kt) = (1+marg(i))*lambdak.l(i,kt) ;
      	lambdat.fx(i,lt) = (1+marg(i))*lambdat.l(i,lt) ;
$ontext
      	xf.fx("govt") = xf.l("govt")+ costrec(t,"capm") + costrec(t,"mocm") ;
   	taxadjh.fx = taxadjh.l ;
   	tp.lo("ARoadTr") = -inf ;
   	tp.up("ARoadTr") = +inf ;
$offtext
	) ;
*	ae(k,r) = (1+3*exup*ggdp.l)*ae(k,r) ; 
) ;

* -- 5=Fin
if(ord(sim) eq 5,
      	if (ord(t) eq 7,
      	voc(k,"ARoadTr") = sum(i$mapc(i,k),scpar("2007",i,"vocm")) ;
	display voc ;
	chk1 = sum(k,a(k,"ARoadTr")) ;
	a(k,"ARoadTr")$voc(k,"ARoadTr") = .7*a(k,"ARoadTr") ;
 	a(k,"ARoadTr") = a(k,"ARoadTr")*chk1/sum(kk,a(kk,"ARoadTr")) ;
*	tmg.fx(k,"d") = .01*sum(i$mapc(i,k),scpar(t,i,"lossm")) ;
      	lambdallag("ARoadTr",l)  = 1.1*lambdallag("ARoadTr",l) ;
      	lambdak.fx("ARoadTr",kt) = 1.1*lambdak.l("ARoadTr",kt) ;
      	lambdat.fx("ARoadTr",lt) = 1.1*lambdat.l("ARoadTr",lt) ;

      	lambdallag(et,l)  = 1.67*lambdallag(et,l) ;
      	lambdak.fx(et,kt) = 1.67*lambdak.l(et,kt) ;
      	lambdat.fx(et,lt) = 1.67*lambdat.l(et,lt) ;

	display tmg.l ;
	tmg0(k,"d") = tmg.l(k,"d") ;
      	lambdallag(i,l)  = (1+marg(i))*lambdallag(i,l) ;
      	lambdak.fx(i,kt) = (1+marg(i))*lambdak.l(i,kt) ;
      	lambdat.fx(i,lt) = (1+marg(i))*lambdat.l(i,lt) ;

	ntcip = costrec(t,"caph") + costrec(t,"moch") ;
      	xf.fx("govt") = xf.l("govt")+ ntcip ;
   	taxadjh.fx = taxadjh.l ;
   	tp.lo("ARoadTr") = -inf ;
   	tp.up("ARoadTr") = +inf ;
	) ;
*	ae(k,r) = (1+3*exup*ggdp.l)*ae(k,r) ; 
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
) ;
display glt, lambdal.l, lambdallag, chil ;
) ;