*##
*## This file creates an aggregated dataset from the 2000 China SAM
*## Also included are a variety of set declarations and initial data for the model
*##

*## Define the aggregate SAM institution sets and subsets

set s /
APerAg
ANPAg
AFoodProc
AOthMfg
AMinUtlCon
ARoadTr
AOtherTr
ACommServ
AOthPrSrv
APubServ
CPerAg
CNPAg
CFoodProc
COthMfg
CMinUtlCon
CRoadTr
COtherTr
CCommServ
COthPrSrv
CPubServ
LabUn
LabSk
Land
Water
Capital
H-LF1
H-LF2
H-LF3
H-MF1
H-MF2
H-MF3
H-SF1
H-SF2
H-SF3
H-0F1
H-0F2
H-0F3
H-AGW1
H-AGW2
H-AGW3
H-NFNP
H-NFP
H-URNP
H-URPR
ENT
GOVT
ITax
TTax
DTax
CapAcct
ROW
Total
/

   i(s) Production sectors /
APerAg
ANPAg
AFoodProc
AOthMfg
AMinUtlCon
ARoadTr
AOtherTr
ACommServ
AOthPrSrv
APubServ
   /

   k(s) Commodities /
CPerAg
CNPAg
CFoodProc
COthMfg
CMinUtlCon
CRoadTr
COtherTr
CCommServ
COthPrSrv
CPubServ
   /

   v(s) Value added accounts /
LabUn
LabSk
Land
Water
Capital
   /

   l(v) Labor types /
LabUn
LabSk
   /

   ul(l) Unskilled labor /
LabUn
   /

   sl(l) Skilled labor /
LabSk
   /

   lt(v) Land types 
  /
      Land      Land remuneration
   /

   kt(v) Capital types /
      Capital      Capital remuneration
   /
   nr(v) Natural resources      /
    Water
                /

   e(s)  Enterprises /
ENT
   /

   fd(s) Final demand accounts /
H-LF1
H-LF2
H-LF3
H-MF1
H-MF2
H-MF3
H-SF1
H-SF2
H-SF3
H-0F1
H-0F2
H-0F3
H-AGW1
H-AGW2
H-AGW3
H-NFNP
H-NFP
H-URNP
H-URPR
ENT
GOVT
*ITax
*TTax
*DTax
CapAcct
   /

   h(fd) Households /
H-LF1
H-LF2
H-LF3
H-MF1
H-MF2
H-MF3
H-SF1
H-SF2
H-SF3
H-0F1
H-0F2
H-0F3
H-AGW1
H-AGW2
H-AGW3
H-NFNP
H-NFP
H-URNP
H-URPR
/

   f(fd) Other final demand accounts /
GOVT
*ITax
*TTax
*DTax
CapAcct
   /

   r(s) Regions /
ROW
   /
;

*sl(l) = not ul(l) ;



*## Define the institution sets and subsets     for the complete 2000 Vietnam SAM

set s0 labels for the micro SAM
/
APaddy
AWheat 
ACotton
ASugarcn
ATobacco
AOthCrop
APulses
APotatoe
AFruits
AVegOth
AOilseed
AOther 
ALvstk
AForest
AFishry
ACoal
AOilGas
AOthMin
AVegOil
AMillng
ABakery
ASugar
AOthPrFd
ABev
ATobProd
AGinCott
ACottyrn
ACotClth
AArtsilk
ATextile
AKnitwr
ACarpets
AGarment 
AOthTxPr
ALeather
AFootwr
AWoodPr
APaperPr
APharma
AFertPst
AChemicl
ARefPet
ARubPlst
AOthChem
ABrckTle
ACement
AOthMnPr
ABasMet
AOthMet
AOthMch
AElecEqp
AOthTr
ASrgInst
AHndcrft 
ASprtsPr
AJewelry
AOthMfg
AElecWat
AGasDist
AConstrc
AWhTrade
ARetTrde
AHotRest
ATrRail
ATrRoadC
ATrRoadP
ATrWat
ATrAir
ATrOth
ACommSv
ABankCen
ABankOth
ABankCrd
ABankNom
AInsrnce
ARealEst
AImpRent
ABusServ
APubAdm
AEducatn 
AHealth
AOthSoSv
APersSrv
CPaddy
CWheat 
CCotton
CSugarcn
CTobacco
COthCrop
CPulses
CPotatoe
CFruits
CVegOth
COilseed
COther 
CLvstk
CForest
CFishry
CCoal
COilGas
COthMin
CVegOil
CMillng
CBakery
CSugar
COthPrFd
CBev
CTobProd
CGinCott
CCottyrn
CCotClth
CArtsilk
CTextile
CKnitwr
CCarpets
CGarment 
COthTxPr
CLeather
CFootwr
CWoodPr
CPaperPr
CPharma
CFertPst
CChemicl
CRefPet
CRubPlst
COthChem
CBrckTle
CCement
COthMnPr
CBasMet
COthMet
COthMch
CElecEqp
COthTr
CSrgInst
CHndcrft 
CSprtsPr
CJewelry
COthMfg
CElecWat
CGasDist
CConstrc
CWhTrade
CRetTrde
CHotRest
CTrRail
CTrRoadC
CTrRoadP
CTrWat
CTrAir
CTrOth
CCommSv
CBankCen
CBankOth
CBankCrd
CBankNom
CInsrnce
CRealEst
CImpRent
CBusServ
CPubAdm
CEducatn 
CHealth
COthSoSv
CPersSrv
LA-AGL
LA-MF1
LA-MF2
LA-MF3
LA-SF1
LA-SF2
LA-SF3
LA-AGW
LA-SKU
LA-SK 
LN-LG1
LN-LG2
LN-LG3
LN-MD1
LN-MD2
LN-MD3
LN-SM1
LN-SM2
LN-SM3
LN-DR1
LN-DR2
LN-DR3
WATER
K-LVST
K-AGR
KFORM
KINF
H-LF1
H-LF2
H-LF3
H-MF1
H-MF2
H-MF3
H-SF1
H-SF2
H-SF3
H-0F1
H-0F2
H-0F3
H-AGW1
H-AGW2
H-AGW3
H-NFNP
H-NFP
H-URNP
H-URPR
ENT
GOVT
ITax
TTax
DTax
CapAcct
ROW
Total
/
     ;

set i0(s0) Activities /
APaddy
AWheat 
ACotton
ASugarcn
ATobacco
AOthCrop
APulses
APotatoe
AFruits
AVegOth
AOilseed
AOther 
ALvstk
AForest
AFishry
ACoal
AOilGas
AOthMin
AVegOil
AMillng
ABakery
ASugar
AOthPrFd
ABev
ATobProd
AGinCott
ACottyrn
ACotClth
AArtsilk
ATextile
AKnitwr
ACarpets
AGarment 
AOthTxPr
ALeather
AFootwr
AWoodPr
APaperPr
APharma
AFertPst
AChemicl
ARefPet
ARubPlst
AOthChem
ABrckTle
ACement
AOthMnPr
ABasMet
AOthMet
AOthMch
AElecEqp
AOthTr
ASrgInst
AHndcrft 
ASprtsPr
AJewelry
AOthMfg
AElecWat
AGasDist
AConstrc
AWhTrade
ARetTrde
AHotRest
ATrRail
ATrRoadC
ATrRoadP
ATrWat
ATrAir
ATrOth
ACommSv
ABankCen
ABankOth
ABankCrd
ABankNom
AInsrnce
ARealEst
AImpRent
ABusServ
APubAdm
AEducatn 
AHealth
AOthSoSv
APersSrv
/ ;

set k0(s0) Commodities /
CPaddy
CWheat 
CCotton
CSugarcn
CTobacco
COthCrop
CPulses
CPotatoe
CFruits
CVegOth
COilseed
COther 
CLvstk
CForest
CFishry
CCoal
COilGas
COthMin
CVegOil
CMillng
CBakery
CSugar
COthPrFd
CBev
CTobProd
CGinCott
CCottyrn
CCotClth
CArtsilk
CTextile
CKnitwr
CCarpets
CGarment 
COthTxPr
CLeather
CFootwr
CWoodPr
CPaperPr
CPharma
CFertPst
CChemicl
CRefPet
CRubPlst
COthChem
CBrckTle
CCement
COthMnPr
CBasMet
COthMet
COthMch
CElecEqp
COthTr
CSrgInst
CHndcrft 
CSprtsPr
CJewelry
COthMfg
CElecWat
CGasDist
CConstrc
CWhTrade
CRetTrde
CHotRest
CTrRail
CTrRoadC
CTrRoadP
CTrWat
CTrAir
CTrOth
CCommSv
CBankCen
CBankOth
CBankCrd
CBankNom
CInsrnce
CRealEst
CImpRent
CBusServ
CPubAdm
CEducatn 
CHealth
COthSoSv
CPersSrv
/ ;

set food0(k0) Food Commodities /
CPaddy
CWheat 
CCotton
CSugarcn
CTobacco
COthCrop
CPulses
CPotatoe
CFruits
CVegOth
COilseed
COther 
CLvstk
CForest
CFishry
/ ;

set manufac0(k0) Manufactured Commodities /
CCoal
COilGas
COthMin
CVegOil
CMillng
CBakery
CSugar
COthPrFd
CBev
CTobProd
CGinCott
CCottyrn
CCotClth
CArtsilk
CTextile
CKnitwr
CCarpets
CGarment 
COthTxPr
CLeather
CFootwr
CWoodPr
CPaperPr
CPharma
CFertPst
CChemicl
CRefPet
CRubPlst
COthChem
CBrckTle
CCement
COthMnPr
CBasMet
COthMet
COthMch
CElecEqp
COthTr
CSrgInst
CHndcrft 
CSprtsPr
CJewelry
COthMfg
/ ;

set services0(k0) Service Commodities /
CElecWat
CGasDist
CConstrc
CWhTrade
CRetTrde
CHotRest
CTrRail
CTrRoadC
CTrRoadP
CTrWat
CTrAir
CTrOth
CCommSv
CBankCen
CBankOth
CBankCrd
CBankNom
CInsrnce
CRealEst
CImpRent
CBusServ
CPubAdm
CEducatn 
CHealth
COthSoSv
CPersSrv
/ ;


Alias(i0,j0) ;

set v0(s0) Factors /
LA-AGL
LA-MF1
LA-MF2
LA-MF3
LA-SF1
LA-SF2
LA-SF3
LA-AGW
LA-SKU
LA-SK 
LN-LG1
LN-LG2
LN-LG3
LN-MD1
LN-MD2
LN-MD3
LN-SM1
LN-SM2
LN-SM3
LN-DR1
LN-DR2
LN-DR3
WATER
K-LVST
K-AGR
KFORM
KINF
/ ;

set l0(v0) Labor types /
LA-AGL
LA-MF1
LA-MF2
LA-MF3
LA-SF1
LA-SF2
LA-SF3
LA-AGW
LA-SKU
LA-SK 
LN-LG1
LN-LG2
LN-LG3
LN-MD1
LN-MD2
LN-MD3
LN-SM1
LN-SM2
LN-SM3
LN-DR1
LN-DR2
LN-DR3
/ ;

set ul0(l0) Unskilled labor /
LA-AGL
LA-MF1
LA-MF2
LA-MF3
LA-SF1
LA-SF2
LA-SF3
LA-AGW
/ ;

set sl0(l0) Skilled labor /
LA-SKU
LA-SK 
LN-LG1
LN-LG2
LN-LG3
LN-MD1
LN-MD2
LN-MD3
LN-SM1
LN-SM2
LN-SM3
LN-DR1
LN-DR2
LN-DR3
/

set kap0(s0) capital goods /
WATER
K-LVST
K-AGR
KFORM
KINF
/

set e0(s0) Enterprises /
ENT
/ ;

set fd0(s0) Final demand accounts /
H-LF1
H-LF2
H-LF3
H-MF1
H-MF2
H-MF3
H-SF1
H-SF2
H-SF3
H-0F1
H-0F2
H-0F3
H-AGW1
H-AGW2
H-AGW3
H-NFNP
H-NFP
H-URNP
H-URPR
GOVT
ITax
TTax
DTax
CapAcct
/ ;

set h0(fd0) Households /
H-LF1
H-LF2
H-LF3
H-MF1
H-MF2
H-MF3
H-SF1
H-SF2
H-SF3
H-0F1
H-0F2
H-0F3
H-AGW1
H-AGW2
H-AGW3
H-NFNP
H-NFP
H-URNP
H-URPR
/ ;

set hr0(fd0) Households /
H-LF1
H-LF2
H-LF3
H-MF1
H-MF2
H-MF3
H-SF1
H-SF2
H-SF3
H-0F1
H-0F2
H-0F3
H-AGW1
H-AGW2
H-AGW3
H-NFNP
H-NFP
H-URNP
H-URPR
/ ;

set hs0(fd0) Subsistence Consumption for Households /
H-LF1
H-LF2
H-LF3
H-MF1
H-MF2
H-MF3
H-SF1
H-SF2
H-SF3
H-0F1
H-0F2
H-0F3
H-AGW1
H-AGW2
H-AGW3
H-NFNP
H-NFP
H-URNP
H-URPR
/ ;

set f0(fd0) Final Demand /
GOVT
ITax
TTax
DTax
CapAcct
/ ;

set r0(s0) Trading partners /
ROW
/ ;

        alias (s0,ss0), (s,ss), (v0,vv0), (j0,jj0), (r0,rr0), (k0,kk0), (fd0,ffd0) ;




*## Define the aggregation mapping sets and subsets

set map(s0,s)  Aggregation mapping /
APaddy	.	ANPAg
AWheat 	.	ANPAg
ACotton	.	ANPAg
ASugarcn	.	ANPAg
ATobacco	.	ANPAg
AOthCrop	.	ANPAg
APulses	.	ANPAg
APotatoe	.	APerAg
AFruits	.	APerAg
AVegOth	.	APerAg
AOilseed	.	ANPAg
AOther 	.	ANPAg
ALvstk	.	APerAg
AForest	.	ANPAg
AFishry	.	APerAg
ACoal	.	AMinUtlCon
AOilGas	.	AMinUtlCon
AOthMin	.	AMinUtlCon
AVegOil	.	AFoodProc
AMillng	.	AFoodProc
ABakery	.	AFoodProc
ASugar	.	AFoodProc
AOthPrFd	.	AFoodProc
ABev	.	AFoodProc
ATobProd	.	AFoodProc
AGinCott	.	AOthMfg
ACottyrn	.	AOthMfg
ACotClth	.	AOthMfg
AArtsilk	.	AOthMfg
ATextile	.	AOthMfg
AKnitwr	.	AOthMfg
ACarpets	.	AOthMfg
AGarment 	.	AOthMfg
AOthTxPr	.	AOthMfg
ALeather	.	AOthMfg
AFootwr	.	AOthMfg
AWoodPr	.	AOthMfg
APaperPr	.	AOthMfg
APharma	.	AOthMfg
AFertPst	.	AOthMfg
AChemicl	.	AOthMfg
ARefPet	.	AOthMfg
ARubPlst	.	AOthMfg
AOthChem	.	AOthMfg
ABrckTle	.	AOthMfg
ACement	.	AOthMfg
AOthMnPr	.	AOthMfg
ABasMet	.	AOthMfg
AOthMet	.	AOthMfg
AOthMch	.	AOthMfg
AElecEqp	.	AOthMfg
AOthTr	.	AOthMfg
ASrgInst	.	AOthMfg
AHndcrft 	.	AOthMfg
ASprtsPr	.	AOthMfg
AJewelry	.	AOthMfg
AOthMfg	.	AOthMfg
AElecWat	.	AMinUtlCon
AGasDist	.	AMinUtlCon
AConstrc	.	AMinUtlCon
AWhTrade	.	ACommServ
ARetTrde	.	ACommServ
AHotRest	.	ACommServ
ATrRail	.	AOtherTr
ATrRoadC	.	ARoadTr
ATrRoadP	.	ARoadTr
ATrWat	.	AOtherTr
ATrAir	.	AOtherTr
ATrOth	.	AOtherTr
ACommSv	.	ACommServ
ABankCen	.	ACommServ
ABankOth	.	ACommServ
ABankCrd	.	ACommServ
ABankNom	.	ACommServ
AInsrnce	.	ACommServ
ARealEst	.	AOthPrSrv
AImpRent	.	AOthPrSrv
ABusServ	.	AOthPrSrv
APubAdm	.	APubServ
AEducatn 	.	APubServ
AHealth	.	APubServ
AOthSoSv	.	AOthPrSrv
APersSrv	.	AOthPrSrv

CPaddy		.	CNPAg
CWheat 		.	CNPAg
CCotton		.	CNPAg
CSugarcn	.	CNPAg
CTobacco	.	CNPAg
COthCrop	.	CNPAg
CPulses		.	CNPAg
CPotatoe	.	CPerAg
CFruits		.	CPerAg
CVegOth		.	CPerAg
COilseed	.	CNPAg
COther 		.	CNPAg
CLvstk		.	CPerAg
CForest		.	CNPAg
CFishry		.	CPerAg
CCoal		.	CMinUtlCon
COilGas		.	CMinUtlCon
COthMin		.	CMinUtlCon
CVegOil		.	CFoodProc
CMillng		.	CFoodProc
CBakery		.	CFoodProc
CSugar		.	CFoodProc
COthPrFd	.	CFoodProc
CBev		.	CFoodProc
CTobProd	.	CFoodProc
CGinCott	.	COthMfg
CCottyrn	.	COthMfg
CCotClth	.	COthMfg
CArtsilk	.	COthMfg
CTextile	.	COthMfg
CKnitwr		.	COthMfg
CCarpets	.	COthMfg
CGarment 	.	COthMfg
COthTxPr	.	COthMfg
CLeather	.	COthMfg
CFootwr		.	COthMfg
CWoodPr		.	COthMfg
CPaperPr	.	COthMfg
CPharma		.	COthMfg
CFertPst	.	COthMfg
CChemicl	.	COthMfg
CRefPet		.	COthMfg
CRubPlst	.	COthMfg
COthChem	.	COthMfg
CBrckTle	.	COthMfg
CCement		.	COthMfg
COthMnPr	.	COthMfg
CBasMet		.	COthMfg
COthMet		.	COthMfg
COthMch		.	COthMfg
CElecEqp	.	COthMfg
COthTr		.	COthMfg
CSrgInst	.	COthMfg
CHndcrft 	.	COthMfg
CSprtsPr	.	COthMfg
CJewelry	.	COthMfg
COthMfg		.	COthMfg
CElecWat	.	CMinUtlCon
CGasDist	.	CMinUtlCon
CConstrc	.	CMinUtlCon
CWhTrade	.	CCommServ
CRetTrde	.	CCommServ
CHotRest	.	CCommServ
CTrRail		.	COtherTr
CTrRoadC	.	CRoadTr
CTrRoadP	.	CRoadTr
CTrWat		.	COtherTr
CTrAir		.	COtherTr
CTrOth		.	COtherTr
CCommSv		.	CCommServ
CBankCen	.	CCommServ
CBankOth	.	CCommServ
CBankCrd	.	CCommServ
CBankNom	.	CCommServ
CInsrnce	.	CCommServ
CRealEst	.	COthPrSrv
CImpRent	.	COthPrSrv
CBusServ	.	COthPrSrv
CPubAdm		.	CPubServ
CEducatn 	.	CPubServ
CHealth		.	CPubServ
COthSoSv	.	COthPrSrv
CPersSrv	.	COthPrSrv
LA-AGL		.	LabUn
LA-MF1		.	LabUn
LA-MF2		.	LabUn
LA-MF3		.	LabUn
LA-SF1		.	LabUn
LA-SF2		.	LabUn
LA-SF3		.	LabUn
LA-AGW		.	LabUn
LA-SKU		.	LabUn
LA-SK 		.	LabUn
LN-LG1		.	LabSk
LN-LG2		.	LabSk
LN-LG3		.	LabSk
LN-MD1		.	LabSk
LN-MD2		.	LabSk
LN-MD3		.	LabSk
LN-SM1		.	LabSk
LN-SM2		.	LabSk
LN-SM3		.	LabSk
LN-DR1		.	LabSk
LN-DR2		.	LabSk
LN-DR3		.	LabSk
WATER		.	Water
K-LVST		.	Capital
K-AGR		.	land
KFORM		.	Capital
KINF		.	Capital
H-LF1	.	 H-LF1
H-LF2	.	 H-LF2
H-LF3	.	 H-LF3
H-MF1	.	 H-MF1
H-MF2	.	 H-MF2
H-MF3	.	 H-MF3
H-SF1	.	 H-SF1
H-SF2	.	 H-SF2
H-SF3	.	 H-SF3
H-0F1	.	 H-0F1
H-0F2	.	 H-0F2
H-0F3	.	 H-0F3
H-AGW1	.	 H-AGW1
H-AGW2	.	 H-AGW2
H-AGW3	.	 H-AGW3
H-NFNP	.	 H-NFNP
H-NFP	.	 H-NFP
H-URNP	.	 H-URNP
H-URPR	.	 H-URPR
ENT		.	ENT
GOVT		.	GOVT
ITax		.	ITax
TTax		.	TTax
DTax		.	DTax
CapAcct		.	CapAcct
ROW		.	ROW
/ ;

set mapi(i0,i)  Aggregation mapping for sectors 
;
mapi(i0,i)$map(i0,i) = yes ;
$ontext
/
APaddy		.	ACereal
AWheat 		.	ACereal
ACotton		.	ACotton
ASugarcn	.	AOthCrop
ATobacco	.	AOthCrop
AOthCrop	.	AOthCrop
APulses		.	AOthCrop
APotatoe	.	AOthCrop
AFruits		.	AFruits
AVegOth		.	AVegOth
AOilseed	.	AOthCrop
AOther 		.	AOther 
ALvstk		.	ALvstk
AForest		.	AOther 
AFishry		.	AOther 
ACoal		.	AMinl
AOilGas		.	AMinl
AOthMin		.	AMinl
AVegOil		.	AFood
AMillng		.	AFood
ABakery		.	AFood
ASugar		.	AFood
AOthPrFd	.	AFood
ABev		.	AFood
ATobProd	.	AFood
AGinCott	.	ATxAp
ACottyrn	.	ATxAp
ACotClth	.	ATxAp
AArtsilk	.	ATxAp
ATextile	.	ATxAp
AKnitwr		.	ATxAp
ACarpets	.	ATxAp
AGarment 	.	ATxAp
AOthTxPr	.	ATxAp
ALeather	.	ATxAp
AFootwr		.	AMfg
AWoodPr		.	AMfg
APaperPr	.	AMfg
APharma		.	AMfg
AFertPst	.	AMfg
AChemicl	.	AMfg
ARefPet		.	AMfg
ARubPlst	.	AMfg
AOthChem	.	AMfg
ABrckTle	.	AMfg
ACement		.	AMfg
AOthMnPr	.	AMfg
ABasMet		.	AMfg
AOthMet		.	AMfg
AOthMch		.	AMfg
AElecEqp	.	AMfg
AOthTr		.	AMfg
ASrgInst	.	AMfg
AHndcrft 	.	AMfg
ASprtsPr	.	AMfg
AJewelry	.	AMfg
AOthMfg		.	AMfg
AElecWat	.	AInf
AGasDist	.	AInf
AConstrc	.	AInf
AWhTrade	.	ADist
ARetTrde	.	ADist
AHotRest	.	AServ
ATrRail		.	ATRail
ATrRoadC	.	ATRoad
ATrRoadP	.	ATRoad
ATrWat		.	ATOth
ATrAir		.	ATAir
ATrOth		.	ATOth
ACommSv		.	ACom
ABankCen	.	AServ
ABankOth	.	AServ
ABankCrd	.	AServ
ABankNom	.	AServ
AInsrnce	.	AServ
ARealEst	.	AServ
AImpRent	.	AServ
ABusServ	.	AServ
APubAdm		.	APub
AEducatn 	.	APub
AHealth		.	APub
AOthSoSv	.	APub
APersSrv	.	AServ
/ ;
$offtext
set mapk(k0,k)  Aggregation mapping for sectors 
;
mapk(k0,k)$map(k0,k) = yes ;
$ontext

set mapk(k0,k)  Aggregation mapping for commodities /
CPaddy		.	CCereal
CWheat 		.	CCereal
CCotton		.	CCotton
CSugarcn	.	COthCrop
CTobacco	.	COthCrop
COthCrop	.	COthCrop
CPulses		.	COthCrop
CPotatoe	.	COthCrop
CFruits		.	CFruits
CVegOth		.	CVegOth
COilseed	.	COthCrop
COther 		.	COther  
CLvstk		.	CLvstk 
CForest		.	COther 
CFishry		.	COther 
CCoal		.	CMinl
COilGas		.	CMinl
COthMin		.	CMinl
CVegOil		.	CFood
CMillng		.	CFood
CBakery		.	CFood
CSugar		.	CFood
COthPrFd	.	CFood
CBev		.	CFood
CTobProd	.	CFood
CGinCott	.	CTxAp
CCottyrn	.	CTxAp
CCotClth	.	CTxAp
CArtsilk	.	CTxAp
CTextile	.	CTxAp
CKnitwr		.	CTxAp
CCarpets	.	CTxAp
CGarment 	.	CTxAp
COthTxPr	.	CTxAp
CLeather	.	CTxAp
CFootwr		.	CTxAp
CWoodPr		.	CMfg
CPaperPr	.	CMfg
CPharma		.	CMfg
CFertPst	.	CMfg
CChemicl	.	CMfg
CRefPet		.	CMfg
CRubPlst	.	CMfg
COthChem	.	CMfg
CBrckTle	.	CMfg
CCement		.	CMfg
COthMnPr	.	CMfg
CBasMet		.	CMfg
COthMet		.	CMfg
COthMch		.	CMfg
CElecEqp	.	CMfg
COthTr		.	CMfg
CSrgInst	.	CMfg
CHndcrft 	.	CMfg
CSprtsPr	.	CMfg
CJewelry	.	CMfg
COthMfg		.	CMfg
CElecWat	.	CInf
CGasDist	.	CInf
CConstrc	.	CInf
CWhTrade	.	CDist
CRetTrde	.	CDist
CHotRest	.	CServ
CTrRail		.	CTRail
CTrRoadC	.	CTRoad
CTrRoadP	.	CTRoad
CTrWat		.	CTOth
CTrAir		.	CTAir
CTrOth		.	CTOth
CCommSv		.	CCom
CBankCen	.	CServ
CBankOth	.	CServ
CBankCrd	.	CServ
CBankNom	.	CServ
CInsrnce	.	CServ
CRealEst	.	CServ
CImpRent	.	CServ
CBusServ	.	CServ
CPubAdm		.	CPub
CEducatn 	.	CPub
CHealth		.	CPub
COthSoSv	.	CPub
CPersSrv	.	CServ
/ ;
$offtext

set mapc0(i0,k0)  Aggregation mapping for sectors /
APaddy		.	CPaddy		
AWheat 		.	CWheat 		
ACotton		.	CCotton		
ASugarcn	.	CSugarcn	
ATobacco	.	CTobacco	
AOthCrop	.	COthCrop	
APulses		.	CPulses		
APotatoe	.	CPotatoe	
AFruits		.	CFruits		
AVegOth		.	CVegOth		
AOilseed	.	COilseed	
AOther 		.	COther 		
ALvstk		.	CLvstk		
AForest		.	CForest		
AFishry		.	CFishry		
ACoal		.	CCoal		
AOilGas		.	COilGas		
AOthMin		.	COthMin		
AVegOil		.	CVegOil		
AMillng		.	CMillng		
ABakery		.	CBakery		
ASugar		.	CSugar		
AOthPrFd	.	COthPrFd	
ABev		.	CBev		
ATobProd	.	CTobProd	
AGinCott	.	CGinCott	
ACottyrn	.	CCottyrn	
ACotClth	.	CCotClth	
AArtsilk	.	CArtsilk	
ATextile	.	CTextile	
AKnitwr		.	CKnitwr		
ACarpets	.	CCarpets	
AGarment 	.	CGarment 	
AOthTxPr	.	COthTxPr	
ALeather	.	CLeather	
AFootwr		.	CFootwr		
AWoodPr		.	CWoodPr		
APaperPr	.	CPaperPr	
APharma		.	CPharma		
AFertPst	.	CFertPst	
AChemicl	.	CChemicl	
ARefPet		.	CRefPet		
ARubPlst	.	CRubPlst	
AOthChem	.	COthChem	
ABrckTle	.	CBrckTle	
ACement		.	CCement		
AOthMnPr	.	COthMnPr	
ABasMet		.	CBasMet		
AOthMet		.	COthMet		
AOthMch		.	COthMch		
AElecEqp	.	CElecEqp	
AOthTr		.	COthTr		
ASrgInst	.	CSrgInst	
AHndcrft 	.	CHndcrft 	
ASprtsPr	.	CSprtsPr	
AJewelry	.	CJewelry	
AOthMfg		.	COthMfg		
AElecWat	.	CElecWat	
AGasDist	.	CGasDist	
AConstrc	.	CConstrc	
AWhTrade	.	CWhTrade	
ARetTrde	.	CRetTrde	
AHotRest	.	CHotRest	
ATrRail		.	CTrRail		
ATrRoadC	.	CTrRoadC		
ATrRoadP	.	CTrRoadP		
ATrWat		.	CTrWat		
ATrAir		.	CTrAir		
ATrOth		.	CTrOth		
ACommSv		.	CCommSv		
ABankCen	.	CBankCen	
ABankOth	.	CBankOth	
ABankCrd	.	CBankCrd	
ABankNom	.	CBankNom	
AInsrnce	.	CInsrnce	
ARealEst	.	CRealEst	
AImpRent	.	CImpRent	
ABusServ	.	CBusServ	
APubAdm		.	CPubAdm		
AEducatn 	.	CEducatn 	
AHealth		.	CHealth		
AOthSoSv	.	COthSoSv	
APersSrv	.	CPersSrv	
/ ;

set mapc(i,k)   Aggregation mapping from activities to commodities /
APerAg	.	CPerAg
ANPAg	.	CNPAg
AFoodProc	.	CFoodProc
AOthMfg	.	COthMfg
AMinUtlCon	.	CMinUtlCon
ARoadTr	.	CRoadTr
AOtherTr	.	COtherTr
ACommServ	.	CCommServ
AOthPrSrv	.	COthPrSrv
APubServ	.	CPubServ
/ ;

set mapv(v0,v)  Aggregation mapping for value added /
LA-AGL		.	LabUn
LA-MF1		.	LabUn
LA-MF2		.	LabUn
LA-MF3		.	LabUn
LA-SF1		.	LabUn
LA-SF2		.	LabUn
LA-SF3		.	LabUn
LA-AGW		.	LabUn
LA-SKU		.	LabUn
LA-SK 		.	LabUn
LN-LG1		.	LabSk
LN-LG2		.	LabSk
LN-LG3		.	LabSk
LN-MD1		.	LabSk
LN-MD2		.	LabSk
LN-MD3		.	LabSk
LN-SM1		.	LabSk
LN-SM2		.	LabSk
LN-SM3		.	LabSk
LN-DR1		.	LabSk
LN-DR2		.	LabSk
LN-DR3		.	LabSk
WATER		.	Water
K-LVST		.	Capital
K-AGR		.	land
KFORM		.	Capital
KINF		.	Capital
/ ;

set mape(e0,e)  Aggregation mapping for enterprises /
ENT	.	ENT
/ ;

set maph(h0,h)  Aggregation mapping for households /
H-LF1	.	 H-LF1
H-LF2	.	 H-LF2
H-LF3	.	 H-LF3
H-MF1	.	 H-MF1
H-MF2	.	 H-MF2
H-MF3	.	 H-MF3
H-SF1	.	 H-SF1
H-SF2	.	 H-SF2
H-SF3	.	 H-SF3
H-0F1	.	 H-0F1
H-0F2	.	 H-0F2
H-0F3	.	 H-0F3
H-AGW1	.	 H-AGW1
H-AGW2	.	 H-AGW2
H-AGW3	.	 H-AGW3
H-NFNP	.	 H-NFNP
H-NFP	.	 H-NFP
H-URNP	.	 H-URNP
H-URPR	.	 H-URPR
/ ;

set mapf(f0,f)  Aggregation mapping for other final demand accounts /
GOVT		.	GOVT
*ITax		.	ITax
*TTax		.	TTax
*DTax		.	DTax
CapAcct		.	CapAcct
/ ;

set mapr(r0,r)  Aggregation mapping for regions /
ROW       .	ROW
/ ;

set ittt0(i0)/
AWhTrade		
ARetTrde		
ATrRail			
ATrRoadC			
ATrRoadP			
ATrWat			
ATrAir			
ATrOth			
ACommSv			
/ ;

set ittt(i) /
ARoadTr
AOtherTr
/ ;

set kttt0(k0)/
CWhTrade		
CRetTrde		
CTrRail			
CTrRoadC			
CTrRoadP			
CTrWat			
CTrAir			
CTrOth			
CCommSv			
/ ;

set kttt(k) /
CRoadTr
COtherTr
/ ;

set mapittt(i0,i)/
AWhTrade	.	ACommServ
ARetTrde	.	ACommServ
ATrRail		.	AOtherTr
ATrRoadC	.	ARoadTr
ATrRoadP	.	ARoadTr
ATrWat		.	AOtherTr
ATrAir		.	AOtherTr
ATrOth		.	AOtherTr
ACommSv		.	ACommServ
/ ;

set mapkttt(k0,k)/
CWhTrade	.	CCommServ
CRetTrde	.	CCommServ
CTrRail		.	COtherTr
CTrRoadC	.	CRoadTr
CTrRoadP	.	CRoadTr
CTrWat		.	COtherTr
CTrAir		.	COtherTr
CTrOth		.	COtherTr
CCommSv		.	CCommServ
/ ;


*## Define and load the Original SAM

 parameter sam11(s0,ss0), sam12(s0,ss0), sam21(s0,ss0), sam22(s0,ss0) ;
 parameter chk, chk1 ;
 parameter nsam(s,ss) ;

$onempty
$include paksam02.gms
$offempty
sam0("total",s0) = sum(ss0,sam0(ss0,s0)) ;
sam0(s0,"total") = sum(ss0,sam0(s0,ss0)) ;

parameter beta ;
beta = .5 ;
*sam0(kttt0,k0) = beta*sum(i0$mapc0(i0,k0),sam0(kttt0,i0)) ;
*sam0(kttt0,i0) = (1-beta)*sam0(kttt0,i0) ;
*sam0(i0,k0)$mapc0(i0,k0) = sam0(i0,k0) - sum(kttt0,sam0(kttt0,k0)) ;

nsam(s,ss)= sum(s0$map(s0,s),sum(ss0$map(ss0,ss),sam0(s0,ss0))) ;
nsam("total",s) = sum(ss,nsam(ss,s)) ;
nsam(s,"total") = sum(ss,nsam(s,ss)) ;
display nsam ;

$ontext
* ------------------------------------------------------------------------------
*
* Write out the SAM in square CSV format
*
* ------------------------------------------------------------------------------
* -- Output the balanced SAM in an Excel-readable CSV

put samfile ;
samfile.pc   = 5 ;
samfile.pw = 10000 ;
samfile.nj =   1 ;
samfile.nw =  15 ;
samfile.nd =   9 ;
samfile.nz =   0 ;
samfile.nr =   0 ;

put ' '; loop (s, put s.tl ) ; put / ;
loop(s,
put  s.tl, loop(ss, put nSAM(s,ss)) ; put / ; 

 ) ;

$offtext

*## Correct for diagonal household to nonmarket consumption transfers
sam0(hs0,hr0) = 0 ;

* Initialize Margins
parameter marg00(i0) /
APaddy		2.0
AWheat 		2.0
ACotton		2.0
ASugarcn	2.0
ATobacco	2.0
AOthCrop	2.0
APulses		2.0
APotatoe	15.0
AFruits		20.0
AVegOth		10.0
AOilseed	2.0
AOther 		2.0
ALvstk		5.0
AForest		1.0
AFishry		15.0
ACoal		1.0
AOilGas		2.0
AOthMin		2.0
AVegOil		5.0
AMillng		5.0
ABakery		10.0
ASugar		2.0
AOthPrFd	5.0
ABev		2.0
ATobProd	2.0
AGinCott	2.0
ACottyrn	2.0
ACotClth	2.0
AArtsilk	2.0
ATextile	2.0
AKnitwr		2.0
ACarpets	2.0
AGarment 	2.0
AOthTxPr	2.0
ALeather	2.0
AFootwr		2.0
AWoodPr		2.0
APaperPr	2.0
APharma		10.0
AFertPst	5.0
AChemicl	5.0
ARefPet		2.0
ARubPlst	2.0
AOthChem	2.0
ABrckTle	2.0
ACement		5.0
AOthMnPr	2.0
ABasMet		2.0
AOthMet		2.0
AOthMch		2.0
AElecEqp	2.0
AOthTr		2.0
ASrgInst	2.0
AHndcrft 	2.0
ASprtsPr	2.0
AJewelry	5.0
AOthMfg		2.0
AElecWat	2.0
AGasDist	5.0
AConstrc	2.0
AWhTrade	5.0
ARetTrde	5.0
AHotRest	5.0
ATrRail		1.0
ATrRoadC	0.0
ATrWat		1.0
ATrAir		1.0
ATrOth		1.0
ACommSv		10.0
ABankCen	5.0
ABankOth	5.0
ABankCrd	5.0
ABankNom	5.0
AInsrnce	3.0
ARealEst	2.0
AImpRent	0.0
ABusServ	2.0
APubAdm		5.0
AEducatn 	5.0
AHealth		10.0
AOthSoSv	5.0
APersSrv	2.0
/ ;


parameter marg0(i) /
APerAg		10.0
ANPAg		2.0
AFoodProc	5.0
AOthMfg		2.0
AMinUtlCon	2.0
ARoadTr		0.0	
AOtherTr	1.0
ACommServ	5.0
AOthPrSrv	2.0
APubServ	5.0
/;

parameter marg(i) ;
marg00(i0) = 4*marg00(i0)/(100 - marg00(i0)) ;
marg0(i) = sum(i0$mapi(i0,i),marg00(i0)*sam0("Total",i0)/sum(j0,sam0("Total",j0))) ;


*## Initialize border price trade valuations

Parameter wtf_pe0(r0,k0) Base trade flows at pre FOB export price 
*/
*/ 
;
wtf_pe0(r0,k0)$(sum(rr0,sam0(k0,rr0)) ne 0) = sam0(k0,r0) ;
*wtf_pe0(r0,k0)$(sum(rr0,sam0(k0,rr0)) ne 0) = sam0(k0,r0) - sam0("t06etax",k0)*sam0(k0,r0)/sum(rr0,sam0(k0,rr0)) ;

Parameter wtf_wpe0(r0,k0) Base trade flows at FOB export price 
*/
*/
;

wtf_wpe0(r0,k0) = sam0(k0,r0) ;

Parameter wtf_wpm0(r0,k0) Base trade flows at CIF import price 
*/
*/ 
;
wtf_wpm0(r0,k0) = sam0(r0,k0);

Parameter wtf_pm0(r0,k0) Base trade flows at post CIF import price 
*/
*/ 
;
wtf_pm0(r0,k0)$(sum(rr0,sam0(rr0,k0)) ne 0) = sam0(r0,k0) + sam0("ttax",k0)*sam0(r0,k0)/sum(rr0,sam0(rr0,k0)) ;


*## Initialize a variety of tax instruments

Parameter patax0(k0,j0) Base taxes on intermediate consumption 
*/
*/ 
;
*patax0(k0,j0)$sam0(k0,j0) = sam0("govt",j0)*sam0(k0,j0)/sum(kk0,sam0(kk0,j0)) ;
patax0(k0,j0) = 0 ;

Parameter vatax0(v0,j0) Base taxes on factors of production 
*/
*/ 
;

*vatax0(v0,j0)$sum(vv0,sam0(vv0,j0)) = (sam0("t02ptax",j0)+sam0("t01vat",j0))*sam0(v0,j0)/sum(vv0,sam0(vv0,j0)) ;

*vatax0("f13land",j0) = vatax0("f13land",j0) + sam0("t05ftax","f13land")*sam0("f13land",j0)/sum(jj0,sam0("f13land",jj0)) ;

*sam0(v0,j0) = sam0(v0,j0) + vatax0(v0,j0) ;

*vatax0("f14capital",j0) = vatax0("f14capital",j0)
*                        + sam0("t05ftax","f14capital")*sam0("f14capital",j0)/sum(jj0,sam0("f14capital",jj0)) ;

vatax0(l0,j0) = sam0("govt",l0)*sam0(l0,j0)/sum(jj0,sam0(l0,jj0)) ;
                        
Parameter fdtax0(k0,fd0) Base taxes on final demand consumption 
*/
*/ 
;

*fdtax0(k0,fd0)$sum(ffd0,sam0(k0,ffd0)) = sam0("itax",k0)*sam0(k0,fd0)/sum(ffd0,sam0(k0,ffd0)) ;
fdtax0(k0,fd0) =0 ;

*## Initialized miscellaneous exogenous data

Parameter tk0 Base capital stock /
        1.00E+2
/ ;

tk0 = sum(i0,sum(kap0,sam0(kap0,i0)))/.1 ;

Parameter tpop0 Base population in millions /
        77.000
/ ;

Parameter popsh0(h0) Base population shares 
*/
*/ 
;
        popsh0(h0) = 100 ;


Parameter labvol0(i0,l0) Initial labor demand volumes 
*// 
;

labvol0(i0,l0) = sam0(l0,i0) ;


Parameter ppp0 Base PPP exchange rate /
    1.00
/ ;

Parameter eta0(k0,h0) Base income elasticities 
*/
*/ 
;

        eta0(food0,h0) = .6 ;
        eta0(manufac0,h0) = 1.0 ;
        eta0(services0,h0) = 1.5 ;

*        eta0("CTrAir",h0) = .5 ;


scalar scale Scaling factor for initial data   / .001 / ;
scalar pscale Scaling factor for labor volumes / .001 / ;

sam0(s0,ss0)    = scale*sam0(s0,ss0) ;
patax0(k0,j0)   = scale*patax0(k0,j0) ;
vatax0(v0,j0)   = scale*vatax0(v0,j0) ;
fdtax0(k0,fd0)  = scale*fdtax0(k0,fd0) ;
tk0             = scale*tk0 ;
wtf_pe0(r0,k0)  = scale*wtf_pe0(r0,k0) ;
wtf_wpe0(r0,k0) = scale*wtf_wpe0(r0,k0) ;
wtf_wpm0(r0,k0) = scale*wtf_wpm0(r0,k0) ;
wtf_pm0(r0,k0)  = scale*wtf_pm0(r0,k0) ;
labvol0(i0,l0)  = pscale*labvol0(i0,l0) ;

*## Structural parameters for the new aggregation
set ipar / sigmap,    sigmav,   sigmakl,   sigmaks,    sigmau,    sigmas,    sigmak,    sigmat / ;
set kpar / sigmac,    sigmam,    sigmaw,    sigmax,    sigmaz,      etae / ;

Table KeySect(i,ipar) Key sectoral parameters

             sigmap    sigmav   sigmakl   sigmaks    sigmau    sigmas    sigmak    sigmat

APerAg		0.0       0.8       0.8       0.8       0.8       0.8       0.8       0.8       
ANPAg		0.0       0.8       0.8       0.8       0.8       0.8       0.8       0.8       
AFoodProc	0.0       0.8       0.8       0.8       0.8       0.8       0.8       0.8       
AOthMfg		0.0       0.8       0.8       0.8       0.8       0.8       0.8       0.8       
AMinUtlCon	0.0       0.8       0.8       0.8       0.8       0.8       0.8       0.8       
ARoadTr		0.0       0.8       0.8       0.8       0.8       0.8       0.8       0.8       
AOtherTr	0.0       0.8       0.8       0.8       0.8       0.8       0.8       0.8       
ACommServ	0.0       0.8       0.8       0.8       0.8       0.8       0.8       0.8       
AOthPrSrv	0.0       0.8       0.8       0.8       0.8       0.8       0.8       0.8       
APubServ	0.0       0.8       0.8       0.8       0.8       0.8       0.8       0.8       
;
keysect(i,ipar) = .95 ;
*keysect("ATAir",ipar) = .7 ;
keysect(i,"sigmap") = 0 ;

Table KeyComm(k,kpar) Key commodity parameters

             sigmac    sigmam    sigmaw    sigmax    sigmaz      etae

CPerAg 		4.0       4.0       4.0       4.0       4.0       5.0
CNPAg 		4.0       4.0       4.0       4.0       4.0       5.0
CFoodProc 	4.0       4.0       4.0       4.0       4.0       5.0
COthMfg		4.0       4.0       4.0       4.0       4.0       5.0
CMinUtlCon 	4.0       4.0       4.0       4.0       4.0       5.0
CRoadTr		4.0       4.0       4.0       4.0       4.0       5.0
COtherTr 	4.0       4.0       4.0       4.0       4.0       5.0
CCommServ	4.0       4.0       4.0       4.0       4.0       5.0
COthPrSrv	4.0       4.0       4.0       4.0       4.0       5.0
CPubServ	4.0       4.0       4.0       4.0       4.0       5.0
;

*keycomm(k,"etae") = inf ;

parameter Frisch(h) ;
Frisch(h) = -1 ;

parameter sigmaf(f) Final demand expenditure elasticities /
        govt   	0
        capacct        0
   / ;

scalar omegakt Capital mobility across types                 / 0.0 / ;
parameter omegak(kt) Capital mobility across sectors ;
omegak(kt) = 0 ;

scalar omegatl Land mobility across type of land             / 0.0 / ;
parameter omegat(lt) Land mobility across sectors ;
omegat(lt) = 0 ;

set gz Geographic zone / Rur, Urb, Tot / ;
set gz2(gz) / Rur, Urb / ;

set mapg(i,gz2) Mapping of sectors to geographic zones /
    APerAg 	.rur
    ANPAg 	.rur
    AFoodProc 	.rur
    AOthMfg	.rur
    AMinUtlCon	.rur
    ARoadTr	.rur
    AOtherTr 	.rur
    ACommServ 	.rur
    AOthPrSrv 	.rur
    APubServ	.urb
/ ;

parameter migr0(l) Base year migration /
LabUn 0
LabSk 0
/ ;

migr0(l) = pscale*migr0(l) ;

parameter glab0(l,gz) Base year labor supply growth rates /
LabUn.rur 1
LabSk.urb 1
/ ;

parameter omegal(l,gz)  Labor supply elasticities ;
omegal(l,gz) = 0 ;

parameter omegar(i) Sector specific factor supply elasticity ;
omegar(i) = 1 ;

parameter omegam(l) Migration elasticity ;
omegam(l) = inf ;
*omegam("unskl") = 1 ;


$offempty

* ----- Declare some additional subsets

set ip(i) Sectors with endogenous labor productivity ;
set np(i) Sectors with exogenous labor productivity ;

set mg different types of margins / d, m, x / ;

* ----- Create set aliases

alias(s,ss) ;
alias(i0,j0) ;
alias(h0,hh0) ;
alias(i,j) ;
alias(h,hh) ;

alias(k0,kk0) ;
alias(k,kk) ;


set ag(i) /
APerAg
ANPAg
/ ;


np(i) = yes$(ag(i)) ;
*np(i) = no ;
ip(i) = not np(i) ;
display ip, np ;

set manu(i) ;
set srv(i) /
AMinUtlCon
ARoadTr
AOtherTr
ACommServ
AOthPrSrv
APubServ
/ ;

set ttt(i) /
ARoadTr
AOtherTr
ACommServ
/ ;

manu(i) = not(ag(i)+srv(i)) ;
display ag, manu, srv ;
