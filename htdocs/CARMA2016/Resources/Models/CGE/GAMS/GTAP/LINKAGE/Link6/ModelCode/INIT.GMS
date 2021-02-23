
* --------------------------------------------------------------------
*
*  LINKAGE -- LINKAGE Applied General Equilibrium Model
*
*  Variable Initialisation
*  -----------------------
*
*  Based on GTAP Version 5.0
*
* --------------------------------------------------------------------

* --------------------------------------------------------------------
*
*  Initialisation of production structure variables
*
* --------------------------------------------------------------------

*
*  Crop-specific production variables
*

hktef.l(r,cr,v)  = hktef0(r,cr,v) ;
phktef.l(r,cr,v) = phktef0(r,cr,v) ;
fert.l(r,cr)     = fert0(r,cr) ;
pfert.l(r,cr)    = pfert0(r,cr) ;

*
*  Livestock-specific production variables
*

ktel.l(r,lv,v)   = ktel0(r,lv,v) ;
pktel.l(r,lv,v)  = pktel0(r,lv,v) ;
tfd.l(r,lv,v)    = tfd0(r,lv,v) ;
ptfd.l(r,lv,v)   = ptfd0(r,lv,v) ;
feed.l(r,lv)     = feed0(r,lv) ;
pfeed.l(r,lv)    = pfeed0(r,lv) ;

nd.l(r,i)      = nd0(r,i) ;
va.l(r,i,v)    = va0(r,i,v) ;
uvcv.l(r,i,v)  = uvcv0(r,i,v) ;
uvc.l(r,i)     = uvc0(r,i) ;
ac.l(r,i)      = ac0(r,i) ;
px.l(r,i)      = px0(r,i) ;
cdr.l(r,i)     = cdr0(r,i) ;
loop(r,loop(i,
   if(marketFlag(r,i) eq 0,
*     CRTS and fixed markups
      markup.fx(r,i) = markup0(r,i) ;
      profit.l(r,i)  = profit0(r,i) ;
   elseif (marketFlag(r,i) eq 1),
*     IRTS and contestable markets
      markup.l(r,i)  = markup0(r,i) ;
      profit.fx(r,i) = 0 ;
   ) ;
)) ;
pp.l(r,i)      = pp0(r,i) ;

nfirm.fx(r,i)    = nfirm0(r,i) ;
labdf.fx(r,ll,i) = labdf0(r,ll,i) ;
kapdf.fx(r,i)    = kapdf0(r,i) ;

ld.l(r,i)      = ld0(r,i) ;
hkte.l(r,i,v)  = hkte0(r,i,v) ;
pva.l(r,i,v)   = pva0(r,i,v) ;

labdv.l(r,ll,i) = labdv0(r,ll,i) ;
labdf.l(r,ll,i) = labdf0(r,ll,i) ;
awage.l(r,i)    = awage0(r,i) ;

xep.l(r,i,v)   = xep0(r,i,v) ;
hkt.l(r,i,v)   = hkt0(r,i,v) ;
kt.l(r,i,v)    = kt0(r,i,v) ;
phkte.l(r,i,v) = phkte0(r,i,v) ;
phkt.l(r,i,v)  = phkt0(r,i,v) ;

td.l(r,i)      = td0(r,i) ;
ff.l(r,i)      = ff0(r,i) ;
kapdv.l(r,i,v) = kapdv0(r,i,v) ;
kapdf.l(r,i)   = kapdf0(r,i) ;
pkt.l(r,i,v)   = pkt0(r,i,v) ;

xap.l(r,i,j)   = xap0(r,i,j) ;
pnd.l(r,i)     = pnd0(r,i) ;
pep.l(r,i,v)   = pep0(r,i,v) ;

xdp.l(r,i,j)   = xdp0(r,i,j) ;
xmp.l(r,i,j)   = xmp0(r,i,j) ;
pap.l(r,i,j)   = pap0(r,i,j) ;

* --------------------------------------------------------------------
*
*  Initialisation of income identities
*
* --------------------------------------------------------------------

landY.l(r)       = landY0(r) ;
FFactY.l(r)      = FFactY0(r) ;
LabY.l(r,ll)     = LabY0(r,ll) ;
KapY.l(r)        = KapY0(r) ;
yh.l(r,h)        = yh0(r,h) ;
*!!!! Needs to be modified for multiple households
deprec.l(r,h)    = phiKap(r,h)*deprec0(r) ;
yd.l(r,h)        = yd0(r,h) ;
yc.l(r,h)        = yc0(r,h) ;

* --------------------------------------------------------------------
*
*  Initialisation of consumer demand variables
*
* --------------------------------------------------------------------

pc.l(r,k,h)  = pc0(r,k,h) ;
xc.l(r,k,h)  = xc0(r,k,h) ;
supy.l(r,h)  = supy0(r,h) ;
xac.l(r,i,h) = xac0(r,i,h) ;
savh.l(r,h)  = savh0(r,h) ;
aps.l(r,h)   = aps0(r,h) ;
xdc.l(r,i,h) = xdc0(r,i,h) ;
xmc.l(r,i,h) = xmc0(r,i,h) ;
pac.l(r,i,h) = pac0(r,i,h) ;
cpi.l(r,h)   = cpi0(r,h) ;

if (ifELES ne 3,
   mu.fx(r,k,h) = mpc(r,k,h) ;
) ;
uad.l(r,h) = uad0(r,h) ;

* --------------------------------------------------------------------
*
*  Initialisation of other final demand variables
*
* --------------------------------------------------------------------

xaf.l(r,i,f) = xaf0(r,i,f) ;
pfd.l(r,f)   = pfd0(r,f) ;
xdf.l(r,i,f) = xdf0(r,i,f) ;
xmf.l(r,i,f) = xmf0(r,i,f) ;
paf.l(r,i,f) = paf0(r,i,f) ;

* --------------------------------------------------------------------
*
*  Initialisation of import variables
*
* --------------------------------------------------------------------

xa.l(r,i)    = xa0(r,i) ;
pd.l(r,i)    = pd0(r,i) ;
xmt.l(r,i)   = xmt0(r,i) ;
pa.l(r,i)    = pa0(r,i) ;

wtf.l(r,rp,i)     = wtf0(r,rp,i) ;
wtf_in.l(r,rp,i)  = wtf_in0(r,rp,i) ;
wtf_out.l(r,rp,i) = wtf_out0(r,rp,i) ;

xm1.l(r,r1,i)     = xm10(r,r1,i) ;
pm1.l(r,r1,i)     = pm10(r,r1,i) ;
xm2.l(r,r2,i)     = xm20(r,r2,i) ;
pm2.l(r,r2,i)     = pm20(r,r2,i) ;

shr.l(r,rp,i) = shr0(r,rp,i) ;
pmt.l(r,i)    = pmt0(r,i) ;

* AIDS specific variables

pmAIDS.l(rp,r,i) = pmAIDS0(rp,r,i) ;
share.l(rp,r,i)  = share0(rp,r,i) ;
pdm.l(r,i)       = pdm0(r,i) ;
xdm.l(r,i)       = xdm0(r,i) ;

* --------------------------------------------------------------------
*
*  Initialisation of domestic and export supply variables
*
* --------------------------------------------------------------------

xd.l(r,i)     = xd0(r,i) ;
es.l(r,i)     = es0(r,i) ;
xp.l(r,i)     = xp0(r,i) ;
axp(r,i)      = xp0(r,i) ;

wpe.l(r,rp,i) = wpe0(r,rp,i) ;
pet.l(r,i)    = pet0(r,i) ;

* --------------------------------------------------------------------
*
*  Initialisation of import prices and demand
*
* --------------------------------------------------------------------

tar_p.l(r,rp,i)  = tar_p0(r,rp,i) ;
tm_p.l(r,rp,i)   = tm_p0(r,rp,i) ;
pe.l(r,rp,i)     = pe0(r,rp,i) ;
wpm.l(r,rp,i)    = wpm0(r,rp,i) ;
pm.l(r,rp,i)     = pm0(r,rp,i) ;
er.fx(r,rp)      = er0(r,rp) ;

* --------------------------------------------------------------------
*
*  Initialisation of trade service variables
*
* --------------------------------------------------------------------

xwmarg.l     = xwmarg0 ;
xtmarg.l(r)  = xtmarg0(r) ;
pwmarg.l     = pwmarg0 ;
xmarg.l(r,i) = xmarg0(r,i) ;
ptmarg.l(r)  = ptmarg0(r) ;

* --------------------------------------------------------------------
*
*  Initialisation of emission variables
*
* --------------------------------------------------------------------

emitot.fx(r)  = emitot0(r) ;
emitax.fx(r)  = emitax0(r) ;

* --------------------------------------------------------------------
*
*  Initialisation of domestic closure variables
*
* --------------------------------------------------------------------


GRev.l(r)    = GRev0(r) ;
savg.l(r)    = savg0(r) ;
rsg.fx(r)    = rsg0(r) ;
fdvol.l(r,f) = fdvol0(r,f) ;
invsh.l(r)   = invsh0(r) ;
p.fx         = p0 ;
psavw.l      = psavw0 ;
wrr.l        = wrr0 ;

* --------------------------------------------------------------------
*
*  Initialisation of labour market equilibrium variables
*
* --------------------------------------------------------------------

glab.fx(r,ll,gz)   = glab0(r,ll,gz) ;
avgw.l(r,ll,gz)    = avgw0(r,ll,gz) ;
migr.l(r,ll)       = migr0(r,ll) ;
amin.fx(r,ll,gz)   = amin0(r,ll,gz) ;
ue.l(r,ll,gz)      = ue0(r,ll,gz) ;
ueTot.l(r,ll)      = ue0(r,ll,"Tot") ;
labs.l(r,ll,gz)    = labs0(r,ll,gz) ;
twage.l(r,ll,gz)   = twage0(r,ll,gz) ;
wmin.l(r,ll,gz)    = wmin0(r,ll,gz) ;
wage.l(r,ll,i)     = wage0(r,ll,i) ;
nwage.l(r,ll,i)    = nwage0(r,ll,i) ;
wdist.l(r,ll,i)    = wdist0(r,ll,i) ;
wdist.fx(r,ll,i)$(wageBarg(r,ll,i) eq 0) = wdist0(r,ll,i) ;

* --------------------------------------------------------------------
*
*  Initialisation of land market equilibrium variables
*
* --------------------------------------------------------------------

tland.l(r)   = tland0(r) ;
ptland.l(r)  = ptland0(r) ;
ts.l(r,i)    = ts0(r,i) ;
pt.l(r,i)    = pt0(r,i) ;
npt.l(r,i)   = npt0(r,i) ;

* --------------------------------------------------------------------
*
*  Initialisation of sector-specific factor equilibrium variables
*
* --------------------------------------------------------------------

fs.l(r,i)    = fs0(r,i) ;
pf.l(r,i)    = pf0(r,i) ;

* --------------------------------------------------------------------
*
*  Initialisation of capital market equilibrium variables
*
* --------------------------------------------------------------------

kaps.l(r,i)    = kaps0(r,i) ;
rrat.l(r,i)    = rrat0(r,i) ;
trent.l(r)     = trent0(r) ;
rent.l(r,i,v)  = rent0(r,i,v) ;
nrent.l(r,i,v) = nrent0(r,i,v) ;

kxrat.l(r,i)   = kxrat0(r,i) ;
xpv.l(r,i,v)   = xpv0(r,i,v) ;

ginv.l(r)      = ginv0(r) ;
kstock.l(r)    = kstock0(r) ;
tkaps.l(r)     = tkaps0(r) ;

* --------------------------------------------------------------------
*
*  Initialisation of GDP definitions
*
* --------------------------------------------------------------------

rgdpmp.l(r) = rgdpmp0(r) ;
gdpmp.l(r)  = gdpmp0(r) ;
rgdp.l(r)   = rgdp0(r) ;
pgdp.l(r)   = pgdp0(r) ;
pabs.l(r)   = pabs0(r) ;

* --------------------------------------------------------------------
*
*  Initialisation of dynamic variables
*
* --------------------------------------------------------------------

ggdp.l(r)            = 0 ;
gk.fx(r)             = 0 ;
lambdak.fx(r,i,v)    = 1 ;

kaplab.l(r)          = kaplab0(r) ;
gl.fx(r)             = 0 ;
lambdal.l(r,ll,i)    = 1 ;
lambdal.fx(r,ll,ink) = 1 ;
chip.fx(r,i)         = 0 ;
phip.fx(r,i)         = phip0(r,i) ;
prodshft(r,i)        = 0 ;
agprod.l(r,ink)      = agprod0(r,ink) ;

* --------------------------------------------------------------------
*
*  Initialisation of other (exogenous) variables
*
* --------------------------------------------------------------------

savf.l(r)        = savf0(r) ;
savf.l(rsav)     = -sum(rres,savf0(rres)) ;
savfbar.fx(r)    = savf.l(r) ;

obj.l = 0 ;

* --------------------------------------------------------------------
*
*  Initialisation of policy variables
*
* --------------------------------------------------------------------

wagetax.fx(r,ll,i) = wagetax0(r,ll,i) ;
KapTax.fx(r,i,v)   = KapTax0(r,i,v) ;
LndTax.fx(r,i)     = LndTax0(r,i) ;

pdtax.fx(r,i,j) = pdtax0(r,i,j) ;
pmtax.fx(r,i,j) = pmtax0(r,i,j) ;
patax.fx(r,i,j) = patax0(r,i,j) ;

ptax.fx(r,i)    = ptax0(r,i) ;

etax.fx(r,rp,i)    = etax0(r,rp,i) ;
tar.fx(r,rp,i)     = tar0(r,rp,i) ;
tar_out.fx(r,rp,i) = tar_out0(r,rp,i) ;
wtf_q.fx(r,rp,i)   = wtf_q0(r,rp,i) ;

tarT(r,rp,i,t)  = tar0(r,rp,i) ;
etaxT(r,rp,i,t) = etax0(r,rp,i) ;

cdtax.fx(r,i,h) = cdtax0(r,i,h) ;
cmtax.fx(r,i,h) = cmtax0(r,i,h) ;
catax.fx(r,i,h) = catax0(r,i,h) ;

mtxadj.fx(r,i)  = 1 ; mtxadj.fx(r,i) = 1 ;
atxadj.fx(r,i)  = 0 ; atxadj.fx(r,i) = 0 ;

kappah.fx(r,h)  = kappah0(r,h) ;
chik.l(r)      = chik0(r) ;
trg.fx(r,h)     = trg0(r,h) ;

fdtax.fx(r,i,f) = fdtax0(r,i,f) ;
fmtax.fx(r,i,f) = fmtax0(r,i,f) ;
fatax.fx(r,i,f) = fatax0(r,i,f) ;

tmarg.fx(r,rp,i) = tmarg0(r,rp,i) ;

* --------------------------------------------------------------------
*
*  Initialisation of dynamic variables
*
* --------------------------------------------------------------------

hpop.fx(r,h)         = hpop0(r,h) ;
pop.fx(r,tranche)    = pop0(r,tranche) ;
deprat.fx(r,tranche) = deprat0(r,tranche) ;

lambdat.fx(r,i)      = 1 ;
lambdaf.fx(r,i)      = 1 ;
lambdaep.fx(r,e,j)   = 1 ;
lambdaft.fx(r,ft,cr) = 1 ;
lambdafd.fx(r,fd,lv) = 1 ;


* --------------------------------------------------------------------
*
*  Initialisation of lagged variables for calculating growth factors
*
* --------------------------------------------------------------------

labshr(r,ll,i)      = nwage0(r,ll,i)*lambdal.l(r,ll,i)*labdv.l(r,ll,i)/rgdp.l(r) ;
labslag(r,ll,"Rur") = (labs.l(r,ll,"Rur") + migr.l(r,ll))/(1+glab.l(r,ll,"Rur")) ;
labslag(r,ll,"Urb") = (labs.l(r,ll,"Urb") - migr.l(r,ll))/(1+glab.l(r,ll,"Urb")) ;
labslag(r,ll,"Tot") = sum(gs,labslag(r,ll,gs)) ;
emplLag(r,ll,"Tot") = (1-ue0(r,ll,"Tot"))*labslag(r,ll,"Tot") ;
labdlag(r,ll,i)     = labdv.l(r,ll,i) ;


kapshr(r,i)  = sum(v,rent.l(r,i,v)*kapdv.l(r,i,v))/rgdp.l(r) ;
kapslag(r)   = tkaps.l(r) ;
kapdlag(r,i) = sum(v,kapdv.l(r,i,v)) ;


lndshr(r,i)  = pt.l(r,i)*td.l(r,i)/rgdp.l(r) ;
lndslag(r)   = tland.l(r) ;
lnddlag(r,i) = td.l(r,i) ;

ffcshr(r,i)  = pf.l(r,i)*ff.l(r,i)/rgdp.l(r) ;
ffcslag(r)   = sum(i,ff.l(r,i)) ;

* --------------------------------------------------------------------
*
*  Initialisation of time-based parameters
*
* --------------------------------------------------------------------

mpcT(r,k,h,t0)   = mpc(r,k,h) ;
thetaT(r,k,h,t0) = theta(r,k,h) ;
gkT(r,t0)     = gk.l(r) ;
glT(r,t0)     = gl.l(r) ;
tgT(r,t0)     = fdvol.l(r,"Gov") ;
phipT(r,i,t0) = phip.l(r,i) ;
chipT(r,i,t0) = chip.l(r,i) ;

if (CompFlag ne 1,
   rgdpmpLag(r)      = rgdpmp.l(r) ;
   popLag(r,tranche) = pop.l(r,tranche) ;
) ;
rgdpLag(r)         = rgdp.l(r) ;
lambdakLag(r,i,v)  = lambdak.l(r,i,v) ;
lambdalLag(r,ll,i) = lambdal.l(r,ll,i) ;
lambdatLag(r,i)    = lambdat.l(r,i) ;
lambdafLag(r,i)    = lambdaf.l(r,i) ;
tiLag(r)           = fdvol.l(r,"Inv") ;
tgLag(r)           = fdvol.l(r,"Gov") ;
kstockLag(r)       = kstock.l(r) ;
