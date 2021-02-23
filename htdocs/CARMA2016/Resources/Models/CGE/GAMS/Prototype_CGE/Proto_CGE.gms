$comment *
* cd /users/sam/dropbox/teaching/almaty2016/Prototype_CGE
* /users/sam/GAMSMacOS/gams Proto_CGE pw=150 ps=9999

* --
* --  Prototype Proto_CGE CGE Model: Dynamic Version
* --
* --
* --            David Roland-Holst
* --				 Dominique van der Mensbrugghe
* --            Samuel G. Evans
* --            Cecilia Han Springer
* --
* --            December, 2016
* --
* --
* --

$Title Proto_CGE

* -- Decompose project effects for medium case

set allsim / Baseline, VAT, Sales, Income, Remit, Labor / ;
set sim(allsim) / Baseline, VAT, Sales, Income, Remit, Labor / ;

*-- Scenario Definitions
*--
*-- Baseline - Business as usual (no policy change)
*--
*-- VAT - Levy a Value Added Tax
*--
*-- Sales - Levy a Sales Tax on all Commodities
*--
*-- Income - Levy an Income Tax on All Households and Enterprises
*--
*-- Remit - Increase in Remittance Income
*--
*-- Labor - Labor Productivity Growth
*--


parameter CalFlag Flag determining nature of dynamic scenarios ;
* Set CalFlag to 1 to calibrate labor productivity, 0 otherwise

CalFlag = 1 ;

parameter Header Flag determining whether to output header records in output files ;

* Set Header to 1 to output header in output file

Header = 1 ;

*----- Declare the output file names
file reportfile / Proto_CGE_Results.csv / ;
file samfile    / Proto_CGE_SAM.csv / ;
file Proto_CGEscn     / Proto_CGE_scn.gms / ;


* ----- Model output options

options limcol=0, limrow=0 ;
options solprint=off ;
option solvelink=2;

* ---- Verbose output for CSV File
parameter icsv /0/ ;

* ----- Input the base SAM and aggregate

$include "Proto_3.dat"

* ----- Calibrate, initialize and define the model

$include decl.gms
$include cal.gms
$include init.gms

$include "model.gms"

* ----- Load the dynamic definitions

$include "Scen_2030.dat"

glT(t) = 0 ;
xfT(f,t) = 0 ;  
xafT(k,f,t) = 0 ;
wtrgT(t) = 0 ;

scen(t,"gdp") = 3;
scen(t,"depr") = 2;
Scen(t,"AgProd") = 0 ;
Scen(t,"pop") = 1 ;
lscen(t,l) = 0 ;
chil(manu,l) = 0.0;

set et(i) Experimental sectors for productivity growth ;

display "Results" ;

* ----- Run the simulations

loop(sim,

$include "cal.gms"
$include "init.gms"

     calflag = 0 ;
     if (ord(sim) le 1,
     calflag = 1 ;
     ) ;

ntcip = 0 ;

loop(t$(year(t) le 2030),

if(year(t) ge 2010,


* Levy a VAT
if (ord(sim) eq 2,
chk = .12 ;
tfl.fx(j,l)     = chk ;
tfk.fx(j,kt)    = chk ;
tft.fx(j,lt)    = chk ;
tfr.fx(j)       = chk ;

) ;

* Levy a Sales Tax - Sales
if (ord(sim) eq 3,
chk = .04 ;
tcp.fx(k,j)     = chk ;
tcc.fx(k,h)     = chk ;
tcf.fx(k,f)     = chk ;
) ;

* Levy a Income Tax - Income
chk = .20 ;
if (ord(sim) eq 4,
kappah.fx(h) = chk ;
kappac.fx(e) = chk ;
) ;

chk = .05 ;
if (ord(sim) eq 5,
savf.fx = rgdpmp.l*chk ;
) ;

chk = 1.3 ;
if (ord(sim) eq 6,
glt(t) = chk ;
) ;

);

*## Configure Dynamic Calibration

$include dyncal.gms

      solve Model_dynamic using mcp ;

            put screen ;
            put //, "End of solver: Sim - ", sim.tl, 
            	"  Year - ", t.tl, " Iteration - ", iter3:2:0, " of ", niter(t, sim):2:0, " iterations" // ;
            putclose ;

            if (Model_dynamic.solvestat ne 1 or Model_dynamic.modelstat gt 2,
               Abort$(1) "Model did not solve, aborting..."
            ) ;

* ---- Calculate WALRAS' Law

walras =  sum(r,sum(k,wpe.l(k,r)*xe.l(k,r))) +  sum(h,wtrh.l(h)) + wtrg.l + savf.l
		- sum(r,sum(k,wpm.l(k,r)*xm.l(k,r)))
          - (sum(h,htrw.l(h)) + gtrw.l + sum(e,ctrw.l(e)) + sum(kt,ktrw.l(kt)))/er.l  ;

display walras ;
display savf.l ;

* ----- Save intermediate results

     if (CalFlag eq 1, 
        	glT(t) = gl.l ; 
        	xfT(f,t) = xf.l(f) ;
		xafT(k,f,t) = xaf.l(k,f) ;
		wtrgT(t) = wtrg.l ;
     ) ;

     if (TR(t),
$include 'postsim.gms'
     ) ;
display glt ;
) ;
) ;
