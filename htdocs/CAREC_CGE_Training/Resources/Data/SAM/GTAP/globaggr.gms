$Title Aggregation Programme for GTAP Database SAMs
$OFFSYMLIST OFFSYMXREF OFFUPPER

*Generated at 28/11/2004 11:25:33 for scottm by Aggr.xls


$ontext

Scott McDonald
Dept of Economics, University of Sheffield

This version Nov 2002

This programme aggregates a SAM representation of GTAP version 5

This file has been generated with sets and mappings defined for a specific aggregation.

Input and Ouput are via GDX

$offtext

*###################### SET DECLARATION #############################


* read in sets for base data

SETS

      SS              SAM accounts

      MCC(SS)         Imported Commodities
      MCCTS(MCC)      Imported commodities WITH input subsidies
      DCC(SS)         Domestic Commodities
      DCCTS(DCC)      Domestic commodities WITH input subsidies
      CC(SS)          Composite Commodities

      AA(SS)          Activities

      FF(SS)          Factors

      TMMTAX(SS)      Trade taxes
      TEETAX(SS)      Export taxes
      SMMTAX(SS)      Sales Taxes on imported goods and services
      SDDTAX(SS)      Sales Taxes on domestic goods and services
      SSTAX(SS)       Sales Taxes on composite goods and services
      FFTAX(SS)       Taxes on Factors

      OTPPMARG(SS)    Other trade and transport costs
      WTPPMARG(SS)    Water trade and transport costs
      ATPPMARG(SS)    Air trade and transport costs
      VSTTMARG(SS)    Exports of trade and transport services

      WW(SS)          Rest of the World

      II(SS)          Investment

      KK              Regions

* Declaring SETS that will be assigned from the data

      MCCTSN(MCC)     Imported commodities WITHOUT input subsidies
      DCCTSN(DCC)     Domestic commodities WITHOUT input subsidies

* Declaring other sets

      SSN(SS)         SAM accounts excluding TOTAL
      row(ss)         SAM accounts excluding TOTAL


  ;

* Setting up ALIASES

 ALIAS(SS,SSP) ;
 ALIAS(SSN,SSNP) ;
 ALIAS(MCC,MCCP) ;
 ALIAS(DCC,DCCP) ;
 ALIAS(CC,CCP) ;
 ALIAS(AA,AAP) ;
 ALIAS(FF,FFP,ENDOW_COMM) ;
 ALIAS(TMMTAX,TMMTAXP) ;
 ALIAS(TEETAX,TEETAXP) ;
 ALIAS(SMMTAX,SMMTAXP) ;
 ALIAS(SDDTAX,SDDTAXP) ;
 ALIAS(SSTAX,SSTAXP) ;
 ALIAS(FFTAX,FFTAXP) ;
 ALIAS(OTPPMARG,OTPPMARGP) ;
 ALIAS(WTPPMARG,WTPPMARGP) ;
 ALIAS(ATPPMARG,ATPPMARGP) ;
 ALIAS(VSTTMARG,VSTTMARGP) ;
 ALIAS(WW,WWP) ;
 ALIAS(KK,KKP,REGP) ;
 ALIAS(row,coll) ;


*## Global SAM sets are defined here

SET
        SS      Global SAM         /
               mmpdr  Paddy rice
               mmwht  Wheat
               mmgro  Cereal grains nec
               mmv_f  Vegetables fruit nuts 
               mmosd  Oil seeds 
               mmc_b  Sugar cane sugar beet 
               mmpfb  Plant based fibers 
               mmocr  Crops nec 
               mmctl  Bovine cattle sheep and goats horses 
               mmoap  Animal products nec
               mmrmk  Raw milk
               mmwol  Wool silk worm cocoons
               mmfrs  Forestry
               mmfsh  Fishing
               mmcol  Coal
               mmoil  Oil 
               mmgas  Gas 
               mmomn  Minerals nec 
               mmcmt  Bovine cattle sheep and goat horse meat prods 
               mmomt  Meat products nec
               mmvol  Vegetable oils and fats
               mmmil  Dairy products
               mmpcr  Processed rice
               mmsgr  Sugar
               mmofd  Food products nec
               mmb_t  Beverages and tobacco products 
               mmtex  Textiles
               mmwap  Wearing apparel 
               mmlea  Leather products
               mmlum  Wood products
               mmppp  Paper products publishing
               mmp_c  Petroleum coal products
               mmcrp  Chemical rubber plastic products
               mmnmm  Mineral products nec
               mmi_s  Ferrous metals
               mmnfm  Metals nec
               mmfmp  Metal products
               mmmvh  Motor vehicles and parts 
               mmotn  Transport equipment nec
               mmele  Electronic equipment
               mmome  Machinery and equipment nec 
               mmomf  Manufactures nec
               mmely  Electricity
               mmgdt  Gas manufacture distribution
               mmwtr  Water
               mmcns  Construction 
               mmtrd  Trade
               mmotp  Transport nec
               mmwtp  Sea transport
               mmatp  Air transport
               mmcmn  Communication
               mmofi  Financial services nec
               mmisr  Insurance 
               mmobs  Business services nec 
               mmros  Recreation and other services
               mmosg  PubAdmin Defence Health Educat 
               mmdwe  Dwellings 
               ddpdr  Paddy rice
               ddwht  Wheat
               ddgro  Cereal grains nec
               ddv_f  Vegetables fruit nuts 
               ddosd  Oil seeds 
               ddc_b  Sugar cane sugar beet 
               ddpfb  Plant based fibers 
               ddocr  Crops nec 
               ddctl  Bovine cattle sheep and goats horses 
               ddoap  Animal products nec
               ddrmk  Raw milk
               ddwol  Wool silk worm cocoons
               ddfrs  Forestry
               ddfsh  Fishing
               ddcol  Coal
               ddoil  Oil 
               ddgas  Gas 
               ddomn  Minerals nec 
               ddcmt  Bovine cattle sheep and goat horse meat prods 
               ddomt  Meat products nec
               ddvol  Vegetable oils and fats
               ddmil  Dairy products
               ddpcr  Processed rice
               ddsgr  Sugar
               ddofd  Food products nec
               ddb_t  Beverages and tobacco products 
               ddtex  Textiles
               ddwap  Wearing apparel 
               ddlea  Leather products
               ddlum  Wood products
               ddppp  Paper products publishing
               ddp_c  Petroleum coal products
               ddcrp  Chemical rubber plastic products
               ddnmm  Mineral products nec
               ddi_s  Ferrous metals
               ddnfm  Metals nec
               ddfmp  Metal products
               ddmvh  Motor vehicles and parts 
               ddotn  Transport equipment nec
               ddele  Electronic equipment
               ddome  Machinery and equipment nec 
               ddomf  Manufactures nec
               ddely  Electricity
               ddgdt  Gas manufacture distribution
               ddwtr  Water
               ddcns  Construction 
               ddtrd  Trade
               ddotp  Transport nec
               ddwtp  Sea transport
               ddatp  Air transport
               ddcmn  Communication
               ddofi  Financial services nec
               ddisr  Insurance 
               ddobs  Business services nec 
               ddros  Recreation and other services
               ddosg  PubAdmin Defence Health Educat 
               dddwe  Dwellings 
               ccpdr  Paddy rice
               ccwht  Wheat
               ccgro  Cereal grains nec
               ccv_f  Vegetables fruit nuts 
               ccosd  Oil seeds 
               ccc_b  Sugar cane sugar beet 
               ccpfb  Plant based fibers 
               ccocr  Crops nec 
               ccctl  Bovine cattle sheep and goats horses 
               ccoap  Animal products nec
               ccrmk  Raw milk
               ccwol  Wool silk worm cocoons
               ccfrs  Forestry
               ccfsh  Fishing
               cccol  Coal
               ccoil  Oil 
               ccgas  Gas 
               ccomn  Minerals nec 
               cccmt  Bovine cattle sheep and goat horse meat prods 
               ccomt  Meat products nec
               ccvol  Vegetable oils and fats
               ccmil  Dairy products
               ccpcr  Processed rice
               ccsgr  Sugar
               ccofd  Food products nec
               ccb_t  Beverages and tobacco products 
               cctex  Textiles
               ccwap  Wearing apparel 
               cclea  Leather products
               cclum  Wood products
               ccppp  Paper products publishing
               ccp_c  Petroleum coal products
               cccrp  Chemical rubber plastic products
               ccnmm  Mineral products nec
               cci_s  Ferrous metals
               ccnfm  Metals nec
               ccfmp  Metal products
               ccmvh  Motor vehicles and parts 
               ccotn  Transport equipment nec
               ccele  Electronic equipment
               ccome  Machinery and equipment nec 
               ccomf  Manufactures nec
               ccely  Electricity
               ccgdt  Gas manufacture distribution
               ccwtr  Water
               cccns  Construction 
               cctrd  Trade
               ccotp  Transport nec
               ccwtp  Sea transport
               ccatp  Air transport
               cccmn  Communication
               ccofi  Financial services nec
               ccisr  Insurance 
               ccobs  Business services nec 
               ccros  Recreation and other services
               ccosg  PubAdmin Defence Health Educat 
               ccdwe  Dwellings 
               aapdr  Paddy rice
               aawht  Wheat
               aagro  Cereal grains nec
               aav_f  Vegetables fruit nuts 
               aaosd  Oil seeds 
               aac_b  Sugar cane sugar beet 
               aapfb  Plant based fibers 
               aaocr  Crops nec 
               aactl  Bovine cattle sheep and goats horses 
               aaoap  Animal products nec
               aarmk  Raw milk
               aawol  Wool silk worm cocoons
               aafrs  Forestry
               aafsh  Fishing
               aacol  Coal
               aaoil  Oil 
               aagas  Gas 
               aaomn  Minerals nec 
               aacmt  Bovine cattle sheep and goat horse meat prods 
               aaomt  Meat products nec
               aavol  Vegetable oils and fats
               aamil  Dairy products
               aapcr  Processed rice
               aasgr  Sugar
               aaofd  Food products nec
               aab_t  Beverages and tobacco products 
               aatex  Textiles
               aawap  Wearing apparel 
               aalea  Leather products
               aalum  Wood products
               aappp  Paper products publishing
               aap_c  Petroleum coal products
               aacrp  Chemical rubber plastic products
               aanmm  Mineral products nec
               aai_s  Ferrous metals
               aanfm  Metals nec
               aafmp  Metal products
               aamvh  Motor vehicles and parts 
               aaotn  Transport equipment nec
               aaele  Electronic equipment
               aaome  Machinery and equipment nec 
               aaomf  Manufactures nec
               aaely  Electricity
               aagdt  Gas manufacture distribution
               aawtr  Water
               aacns  Construction 
               aatrd  Trade
               aaotp  Transport nec
               aawtp  Sea transport
               aaatp  Air transport
               aacmn  Communication
               aaofi  Financial services nec
               aaisr  Insurance 
               aaobs  Business services nec 
               aaros  Recreation and other services
               aaosg  PubAdmin Defence Health Educat 
               aadwe  Dwellings 
               fLand  Land
            fUnSkLab  Unskilled labour
              fSkLab  Skilled labour
            fCapital  Capital
            fNatlRes  Natural Resources
              tmmaus  Australia 
              tmmnzl  New Zealand
              tmmchn  China
              tmmhkg  Hong Kong 
              tmmjpn  Japan
              tmmkor  Korea
              tmmtwn  Taiwan 
              tmmidn  Indonesia 
              tmmmys  Malaysia
              tmmphl  Philippines
              tmmsgp  Singapore 
              tmmtha  Thailand
              tmmvnm  Viet Nam
              tmmbgd  Bangladesh
              tmmind  India
              tmmlka  Sri Lanka 
              tmmxsa  Rest of South Asia 
              tmmcan  Canada 
              tmmusa  United States of America 
              tmmmex  Mexico 
              tmmxcm  Central America and the Caribbean 
              tmmcol  Colombia
              tmmper  Peru
              tmmven  Venezuela 
              tmmxap  Rest of Andean Pact
              tmmarg  Argentina 
              tmmbra  Brazil 
              tmmchl  Chile
              tmmury  Uruguay
              tmmxsm  Rest of South America 
              tmmaut  Austria
              tmmdnk  Denmark
              tmmfin  Finland
              tmmfra  France 
              tmmdeu  Germany
              tmmgbr  United Kingdom
              tmmgrc  Greece 
              tmmirl  Ireland
              tmmita  Italy
              tmmnld  Netherlands
              tmmprt  Portugal
              tmmesp  Spain
              tmmswe  Sweden 
              tmmbel  Belgium
              tmmlux  Luxembourg
              tmmche  Switzerland
              tmmxef  Rest of EFTA 
              tmmcyp  Cyprus 
              tmmmlt  Malta
              tmmhun  Hungary
              tmmpol  Poland 
              tmmbgr  Bulgaria
              tmmcze  Czech Republic
              tmmrom  Romania
              tmmsvk  Slovakia
              tmmsvn  Slovenia
              tmmhrv  Croatia
              tmmalb  Albania
              tmmest  Estonia
              tmmlva  Latvia 
              tmmltu  Lithuania 
              tmmrus  Russian Federation 
              tmmxsu  Rest of Former Soviet Union 
              tmmtur  Turkey 
              tmmxme  Rest of Middle East
              tmmmar  Morocco
              tmmxnf  Rest of North Africa
              tmmbwa  Botswana
              tmmxsc  South African Customs Union ex Botswana 
              tmmmwi  Malawi 
              tmmmoz  Mozambique
              tmmtza  Tanzania
              tmmzmb  Zambia 
              tmmzwe  Zimbabwe
              tmmxsf  Rest of southern Africa
              tmmuga  Uganda 
              tmmxss  Rest of sub-Saharan Africa
              tmmxrw  Rest of World
              tmmglo  Globe
              teeaus  Australia 
              teenzl  New Zealand
              teechn  China
              teehkg  Hong Kong 
              teejpn  Japan
              teekor  Korea
              teetwn  Taiwan 
              teeidn  Indonesia 
              teemys  Malaysia
              teephl  Philippines
              teesgp  Singapore 
              teetha  Thailand
              teevnm  Viet Nam
              teebgd  Bangladesh
              teeind  India
              teelka  Sri Lanka 
              teexsa  Rest of South Asia 
              teecan  Canada 
              teeusa  United States of America 
              teemex  Mexico 
              teexcm  Central America and the Caribbean 
              teecol  Colombia
              teeper  Peru
              teeven  Venezuela 
              teexap  Rest of Andean Pact
              teearg  Argentina 
              teebra  Brazil 
              teechl  Chile
              teeury  Uruguay
              teexsm  Rest of South America 
              teeaut  Austria
              teednk  Denmark
              teefin  Finland
              teefra  France 
              teedeu  Germany
              teegbr  United Kingdom
              teegrc  Greece 
              teeirl  Ireland
              teeita  Italy
              teenld  Netherlands
              teeprt  Portugal
              teeesp  Spain
              teeswe  Sweden 
              teebel  Belgium
              teelux  Luxembourg
              teeche  Switzerland
              teexef  Rest of EFTA 
              teecyp  Cyprus 
              teemlt  Malta
              teehun  Hungary
              teepol  Poland 
              teebgr  Bulgaria
              teecze  Czech Republic
              teerom  Romania
              teesvk  Slovakia
              teesvn  Slovenia
              teehrv  Croatia
              teealb  Albania
              teeest  Estonia
              teelva  Latvia 
              teeltu  Lithuania 
              teerus  Russian Federation 
              teexsu  Rest of Former Soviet Union 
              teetur  Turkey 
              teexme  Rest of Middle East
              teemar  Morocco
              teexnf  Rest of North Africa
              teebwa  Botswana
              teexsc  South African Customs Union ex Botswana 
              teemwi  Malawi 
              teemoz  Mozambique
              teetza  Tanzania
              teezmb  Zambia 
              teezwe  Zimbabwe
              teexsf  Rest of southern Africa
              teeuga  Uganda 
              teexss  Rest of sub-Saharan Africa
              teexrw  Rest of World
              teeglo  Globe
             tssmpdr  Paddy rice
             tssmwht  Wheat
             tssmgro  Cereal grains nec
             tssmv_f  Vegetables fruit nuts 
             tssmosd  Oil seeds 
             tssmc_b  Sugar cane sugar beet 
             tssmpfb  Plant based fibers 
             tssmocr  Crops nec 
             tssmctl  Bovine cattle sheep and goats horses 
             tssmoap  Animal products nec
             tssmrmk  Raw milk
             tssmwol  Wool silk worm cocoons
             tssmfrs  Forestry
             tssmfsh  Fishing
             tssmcol  Coal
             tssmoil  Oil 
             tssmgas  Gas 
             tssmomn  Minerals nec 
             tssmcmt  Bovine cattle sheep and goat horse meat prods 
             tssmomt  Meat products nec
             tssmvol  Vegetable oils and fats
             tssmmil  Dairy products
             tssmpcr  Processed rice
             tssmsgr  Sugar
             tssmofd  Food products nec
             tssmb_t  Beverages and tobacco products 
             tssmtex  Textiles
             tssmwap  Wearing apparel 
             tssmlea  Leather products
             tssmlum  Wood products
             tssmppp  Paper products publishing
             tssmp_c  Petroleum coal products
             tssmcrp  Chemical rubber plastic products
             tssmnmm  Mineral products nec
             tssmi_s  Ferrous metals
             tssmnfm  Metals nec
             tssmfmp  Metal products
             tssmmvh  Motor vehicles and parts 
             tssmotn  Transport equipment nec
             tssmele  Electronic equipment
             tssmome  Machinery and equipment nec 
             tssmomf  Manufactures nec
             tssmely  Electricity
             tssmgdt  Gas manufacture distribution
             tssmwtr  Water
             tssmcns  Construction 
             tssmtrd  Trade
             tssmotp  Transport nec
             tssmwtp  Sea transport
             tssmatp  Air transport
             tssmcmn  Communication
             tssmofi  Financial services nec
             tssmisr  Insurance 
             tssmobs  Business services nec 
             tssmros  Recreation and other services
             tssmosg  PubAdmin Defence Health Educat 
             tssmdwe  Dwellings 
             tssdpdr  Paddy rice
             tssdwht  Wheat
             tssdgro  Cereal grains nec
             tssdv_f  Vegetables fruit nuts 
             tssdosd  Oil seeds 
             tssdc_b  Sugar cane sugar beet 
             tssdpfb  Plant based fibers 
             tssdocr  Crops nec 
             tssdctl  Bovine cattle sheep and goats horses 
             tssdoap  Animal products nec
             tssdrmk  Raw milk
             tssdwol  Wool silk worm cocoons
             tssdfrs  Forestry
             tssdfsh  Fishing
             tssdcol  Coal
             tssdoil  Oil 
             tssdgas  Gas 
             tssdomn  Minerals nec 
             tssdcmt  Bovine cattle sheep and goat horse meat prods 
             tssdomt  Meat products nec
             tssdvol  Vegetable oils and fats
             tssdmil  Dairy products
             tssdpcr  Processed rice
             tssdsgr  Sugar
             tssdofd  Food products nec
             tssdb_t  Beverages and tobacco products 
             tssdtex  Textiles
             tssdwap  Wearing apparel 
             tssdlea  Leather products
             tssdlum  Wood products
             tssdppp  Paper products publishing
             tssdp_c  Petroleum coal products
             tssdcrp  Chemical rubber plastic products
             tssdnmm  Mineral products nec
             tssdi_s  Ferrous metals
             tssdnfm  Metals nec
             tssdfmp  Metal products
             tssdmvh  Motor vehicles and parts 
             tssdotn  Transport equipment nec
             tssdele  Electronic equipment
             tssdome  Machinery and equipment nec 
             tssdomf  Manufactures nec
             tssdely  Electricity
             tssdgdt  Gas manufacture distribution
             tssdwtr  Water
             tssdcns  Construction 
             tssdtrd  Trade
             tssdotp  Transport nec
             tssdwtp  Sea transport
             tssdatp  Air transport
             tssdcmn  Communication
             tssdofi  Financial services nec
             tssdisr  Insurance 
             tssdobs  Business services nec 
             tssdros  Recreation and other services
             tssdosg  PubAdmin Defence Health Educat 
             tssddwe  Dwellings 
              tsspdr  Paddy rice
              tsswht  Wheat
              tssgro  Cereal grains nec
              tssv_f  Vegetables fruit nuts 
              tssosd  Oil seeds 
              tssc_b  Sugar cane sugar beet 
              tsspfb  Plant based fibers 
              tssocr  Crops nec 
              tssctl  Bovine cattle sheep and goats horses 
              tssoap  Animal products nec
              tssrmk  Raw milk
              tsswol  Wool silk worm cocoons
              tssfrs  Forestry
              tssfsh  Fishing
              tsscol  Coal
              tssoil  Oil 
              tssgas  Gas 
              tssomn  Minerals nec 
              tsscmt  Bovine cattle sheep and goat horse meat prods 
              tssomt  Meat products nec
              tssvol  Vegetable oils and fats
              tssmil  Dairy products
              tsspcr  Processed rice
              tsssgr  Sugar
              tssofd  Food products nec
              tssb_t  Beverages and tobacco products 
              tsstex  Textiles
              tsswap  Wearing apparel 
              tsslea  Leather products
              tsslum  Wood products
              tssppp  Paper products publishing
              tssp_c  Petroleum coal products
              tsscrp  Chemical rubber plastic products
              tssnmm  Mineral products nec
              tssi_s  Ferrous metals
              tssnfm  Metals nec
              tssfmp  Metal products
              tssmvh  Motor vehicles and parts 
              tssotn  Transport equipment nec
              tssele  Electronic equipment
              tssome  Machinery and equipment nec 
              tssomf  Manufactures nec
              tssely  Electricity
              tssgdt  Gas manufacture distribution
              tsswtr  Water
              tsscns  Construction 
              tsstrd  Trade
              tssotp  Transport nec
              tsswtp  Sea transport
              tssatp  Air transport
              tsscmn  Communication
              tssofi  Financial services nec
              tssisr  Insurance 
              tssobs  Business services nec 
              tssros  Recreation and other services
              tssosg  PubAdmin Defence Health Educat 
              tssdwe  Dwellings 
             tffLand  Land
          tffUnSkLab  Unskilled labour
            tffSkLab  Skilled labour
          tffCapital  Capital
          tffNatlRes  Natural Resources
             otppaus  Australia 
             otppnzl  New Zealand
             otppchn  China
             otpphkg  Hong Kong 
             otppjpn  Japan
             otppkor  Korea
             otpptwn  Taiwan 
             otppidn  Indonesia 
             otppmys  Malaysia
             otppphl  Philippines
             otppsgp  Singapore 
             otpptha  Thailand
             otppvnm  Viet Nam
             otppbgd  Bangladesh
             otppind  India
             otpplka  Sri Lanka 
             otppxsa  Rest of South Asia 
             otppcan  Canada 
             otppusa  United States of America 
             otppmex  Mexico 
             otppxcm  Central America and the Caribbean 
             otppcol  Colombia
             otppper  Peru
             otppven  Venezuela 
             otppxap  Rest of Andean Pact
             otpparg  Argentina 
             otppbra  Brazil 
             otppchl  Chile
             otppury  Uruguay
             otppxsm  Rest of South America 
             otppaut  Austria
             otppdnk  Denmark
             otppfin  Finland
             otppfra  France 
             otppdeu  Germany
             otppgbr  United Kingdom
             otppgrc  Greece 
             otppirl  Ireland
             otppita  Italy
             otppnld  Netherlands
             otppprt  Portugal
             otppesp  Spain
             otppswe  Sweden 
             otppbel  Belgium
             otpplux  Luxembourg
             otppche  Switzerland
             otppxef  Rest of EFTA 
             otppcyp  Cyprus 
             otppmlt  Malta
             otpphun  Hungary
             otpppol  Poland 
             otppbgr  Bulgaria
             otppcze  Czech Republic
             otpprom  Romania
             otppsvk  Slovakia
             otppsvn  Slovenia
             otpphrv  Croatia
             otppalb  Albania
             otppest  Estonia
             otpplva  Latvia 
             otppltu  Lithuania 
             otpprus  Russian Federation 
             otppxsu  Rest of Former Soviet Union 
             otpptur  Turkey 
             otppxme  Rest of Middle East
             otppmar  Morocco
             otppxnf  Rest of North Africa
             otppbwa  Botswana
             otppxsc  South African Customs Union ex Botswana 
             otppmwi  Malawi 
             otppmoz  Mozambique
             otpptza  Tanzania
             otppzmb  Zambia 
             otppzwe  Zimbabwe
             otppxsf  Rest of southern Africa
             otppuga  Uganda 
             otppxss  Rest of sub-Saharan Africa
             otppxrw  Rest of World
             otppglo  Globe
             wtppaus  Australia 
             wtppnzl  New Zealand
             wtppchn  China
             wtpphkg  Hong Kong 
             wtppjpn  Japan
             wtppkor  Korea
             wtpptwn  Taiwan 
             wtppidn  Indonesia 
             wtppmys  Malaysia
             wtppphl  Philippines
             wtppsgp  Singapore 
             wtpptha  Thailand
             wtppvnm  Viet Nam
             wtppbgd  Bangladesh
             wtppind  India
             wtpplka  Sri Lanka 
             wtppxsa  Rest of South Asia 
             wtppcan  Canada 
             wtppusa  United States of America 
             wtppmex  Mexico 
             wtppxcm  Central America and the Caribbean 
             wtppcol  Colombia
             wtppper  Peru
             wtppven  Venezuela 
             wtppxap  Rest of Andean Pact
             wtpparg  Argentina 
             wtppbra  Brazil 
             wtppchl  Chile
             wtppury  Uruguay
             wtppxsm  Rest of South America 
             wtppaut  Austria
             wtppdnk  Denmark
             wtppfin  Finland
             wtppfra  France 
             wtppdeu  Germany
             wtppgbr  United Kingdom
             wtppgrc  Greece 
             wtppirl  Ireland
             wtppita  Italy
             wtppnld  Netherlands
             wtppprt  Portugal
             wtppesp  Spain
             wtppswe  Sweden 
             wtppbel  Belgium
             wtpplux  Luxembourg
             wtppche  Switzerland
             wtppxef  Rest of EFTA 
             wtppcyp  Cyprus 
             wtppmlt  Malta
             wtpphun  Hungary
             wtpppol  Poland 
             wtppbgr  Bulgaria
             wtppcze  Czech Republic
             wtpprom  Romania
             wtppsvk  Slovakia
             wtppsvn  Slovenia
             wtpphrv  Croatia
             wtppalb  Albania
             wtppest  Estonia
             wtpplva  Latvia 
             wtppltu  Lithuania 
             wtpprus  Russian Federation 
             wtppxsu  Rest of Former Soviet Union 
             wtpptur  Turkey 
             wtppxme  Rest of Middle East
             wtppmar  Morocco
             wtppxnf  Rest of North Africa
             wtppbwa  Botswana
             wtppxsc  South African Customs Union ex Botswana 
             wtppmwi  Malawi 
             wtppmoz  Mozambique
             wtpptza  Tanzania
             wtppzmb  Zambia 
             wtppzwe  Zimbabwe
             wtppxsf  Rest of southern Africa
             wtppuga  Uganda 
             wtppxss  Rest of sub-Saharan Africa
             wtppxrw  Rest of World
             wtppglo  Globe
             atppaus  Australia 
             atppnzl  New Zealand
             atppchn  China
             atpphkg  Hong Kong 
             atppjpn  Japan
             atppkor  Korea
             atpptwn  Taiwan 
             atppidn  Indonesia 
             atppmys  Malaysia
             atppphl  Philippines
             atppsgp  Singapore 
             atpptha  Thailand
             atppvnm  Viet Nam
             atppbgd  Bangladesh
             atppind  India
             atpplka  Sri Lanka 
             atppxsa  Rest of South Asia 
             atppcan  Canada 
             atppusa  United States of America 
             atppmex  Mexico 
             atppxcm  Central America and the Caribbean 
             atppcol  Colombia
             atppper  Peru
             atppven  Venezuela 
             atppxap  Rest of Andean Pact
             atpparg  Argentina 
             atppbra  Brazil 
             atppchl  Chile
             atppury  Uruguay
             atppxsm  Rest of South America 
             atppaut  Austria
             atppdnk  Denmark
             atppfin  Finland
             atppfra  France 
             atppdeu  Germany
             atppgbr  United Kingdom
             atppgrc  Greece 
             atppirl  Ireland
             atppita  Italy
             atppnld  Netherlands
             atppprt  Portugal
             atppesp  Spain
             atppswe  Sweden 
             atppbel  Belgium
             atpplux  Luxembourg
             atppche  Switzerland
             atppxef  Rest of EFTA 
             atppcyp  Cyprus 
             atppmlt  Malta
             atpphun  Hungary
             atpppol  Poland 
             atppbgr  Bulgaria
             atppcze  Czech Republic
             atpprom  Romania
             atppsvk  Slovakia
             atppsvn  Slovenia
             atpphrv  Croatia
             atppalb  Albania
             atppest  Estonia
             atpplva  Latvia 
             atppltu  Lithuania 
             atpprus  Russian Federation 
             atppxsu  Rest of Former Soviet Union 
             atpptur  Turkey 
             atppxme  Rest of Middle East
             atppmar  Morocco
             atppxnf  Rest of North Africa
             atppbwa  Botswana
             atppxsc  South African Customs Union ex Botswana 
             atppmwi  Malawi 
             atppmoz  Mozambique
             atpptza  Tanzania
             atppzmb  Zambia 
             atppzwe  Zimbabwe
             atppxsf  Rest of southern Africa
             atppuga  Uganda 
             atppxss  Rest of sub-Saharan Africa
             atppxrw  Rest of World
             atppglo  Globe
             otppvst  Transport nec
             wtppvst  Sea transport
             atppvst  Air transport
               wwaus  Australia 
               wwnzl  New Zealand
               wwchn  China
               wwhkg  Hong Kong 
               wwjpn  Japan
               wwkor  Korea
               wwtwn  Taiwan 
               wwidn  Indonesia 
               wwmys  Malaysia
               wwphl  Philippines
               wwsgp  Singapore 
               wwtha  Thailand
               wwvnm  Viet Nam
               wwbgd  Bangladesh
               wwind  India
               wwlka  Sri Lanka 
               wwxsa  Rest of South Asia 
               wwcan  Canada 
               wwusa  United States of America 
               wwmex  Mexico 
               wwxcm  Central America and the Caribbean 
               wwcol  Colombia
               wwper  Peru
               wwven  Venezuela 
               wwxap  Rest of Andean Pact
               wwarg  Argentina 
               wwbra  Brazil 
               wwchl  Chile
               wwury  Uruguay
               wwxsm  Rest of South America 
               wwaut  Austria
               wwdnk  Denmark
               wwfin  Finland
               wwfra  France 
               wwdeu  Germany
               wwgbr  United Kingdom
               wwgrc  Greece 
               wwirl  Ireland
               wwita  Italy
               wwnld  Netherlands
               wwprt  Portugal
               wwesp  Spain
               wwswe  Sweden 
               wwbel  Belgium
               wwlux  Luxembourg
               wwche  Switzerland
               wwxef  Rest of EFTA 
               wwcyp  Cyprus 
               wwmlt  Malta
               wwhun  Hungary
               wwpol  Poland 
               wwbgr  Bulgaria
               wwcze  Czech Republic
               wwrom  Romania
               wwsvk  Slovakia
               wwsvn  Slovenia
               wwhrv  Croatia
               wwalb  Albania
               wwest  Estonia
               wwlva  Latvia 
               wwltu  Lithuania 
               wwrus  Russian Federation 
               wwxsu  Rest of Former Soviet Union 
               wwtur  Turkey 
               wwxme  Rest of Middle East
               wwmar  Morocco
               wwxnf  Rest of North Africa
               wwbwa  Botswana
               wwxsc  South African Customs Union ex Botswana 
               wwmwi  Malawi 
               wwmoz  Mozambique
               wwtza  Tanzania
               wwzmb  Zambia 
               wwzwe  Zimbabwe
               wwxsf  Rest of southern Africa
               wwuga  Uganda 
               wwxss  Rest of sub-Saharan Africa
               wwxrw  Rest of World
               wwglo  Rest of World
            RREGHOUS  Regional Household
               HHOUS  Household 
             SSALTAX  Sales taxes
            PPRODTAX  Indirect Production Taxes paid by activities
             FFACTAX  Factor Use taxes paid by activities
             DDIRTAX  Direct Taxes 
               GGovt  Government
                KKAP  Capital
              TTOTAL  Account totals
/
;
SET
        KK      Global region set         /
                 aus  Australia
                 nzl  New Zealand
                 chn  China
                 hkg  Hong Kong
                 jpn  Japan
                 kor  Korea
                 twn  Taiwan 
                 idn  Indonesia
                 mys  Malaysia 
                 phl  Philippines
                 sgp  Singapore
                 tha  Thailand 
                 vnm  Viet Nam 
                 bgd  Bangladesh 
                 ind  India
                 lka  Sri Lanka
                 xsa  Rest of South Asia 
                 can  Canada 
                 usa  United States of America 
                 mex  Mexico 
                 xcm  Central America and the Caribbean
                 col  Colombia 
                 per  Peru 
                 ven  Venezuela
                 xap  Rest of Andean Pact
                 arg  Argentina
                 bra  Brazil 
                 chl  Chile
                 ury  Uruguay
                 xsm  Rest of South America
                 aut  Austria
                 dnk  Denmark
                 fin  Finland
                 fra  France 
                 deu  Germany
                 gbr  United Kingdom 
                 grc  Greece 
                 irl  Ireland
                 ita  Italy
                 nld  Netherlands
                 prt  Portugal 
                 esp  Spain
                 swe  Sweden 
                 bel  Belgium
                 lux  Luxembourg 
                 che  Switzerland
                 xef  Rest of EFTA 
                 cyp  Cyprus 
                 mlt  Malta
                 hun  Hungary
                 pol  Poland 
                 bgr  Bulgaria 
                 cze  Czech Republic 
                 rom  Romania
                 svk  Slovakia 
                 svn  Slovenia 
                 hrv  Croatia
                 alb  Albania
                 est  Estonia
                 lva  Latvia 
                 ltu  Lithuania
                 rus  Russian Federation 
                 xsu  Rest of Former Soviet Union
                 tur  Turkey 
                 xme  Rest of Middle East
                 mar  Morocco
                 xnf  Rest of North Africa 
                 bwa  Botswana 
                 xsc  South African Customs Union ex Botswana
                 mwi  Malawi 
                 moz  Mozambique 
                 tza  Tanzania 
                 zmb  Zambia 
                 zwe  Zimbabwe 
                 xsf  Rest of southern Africa
                 uga  Uganda 
                 xss  Rest of sub-Saharan Africa 
                 xrw  Rest of World
                 glo  Globe
/
;
SET
        MCC      Imported Commodities         /
               mmpdr  
               mmwht  
               mmgro  
               mmv_f  
               mmosd  
               mmc_b  
               mmpfb  
               mmocr  
               mmctl  
               mmoap  
               mmrmk  
               mmwol  
               mmfrs  
               mmfsh  
               mmcol  
               mmoil  
               mmgas  
               mmomn  
               mmcmt  
               mmomt  
               mmvol  
               mmmil  
               mmpcr  
               mmsgr  
               mmofd  
               mmb_t  
               mmtex  
               mmwap  
               mmlea  
               mmlum  
               mmppp  
               mmp_c  
               mmcrp  
               mmnmm  
               mmi_s  
               mmnfm  
               mmfmp  
               mmmvh  
               mmotn  
               mmele  
               mmome  
               mmomf  
               mmely  
               mmgdt  
               mmwtr  
               mmcns  
               mmtrd  
               mmotp  
               mmwtp  
               mmatp  
               mmcmn  
               mmofi  
               mmisr  
               mmobs  
               mmros  
               mmosg  
               mmdwe  
/
;
SET
        MCCTS      Imported commodities WITH input subsidies          /
               mmcol  
               mmoil  
               mmgas  
               mmp_c  
               mmely  
               mmgdt  
/
;
SET
        DCC      Domestic Commodities         /
               ddpdr  
               ddwht  
               ddgro  
               ddv_f  
               ddosd  
               ddc_b  
               ddpfb  
               ddocr  
               ddctl  
               ddoap  
               ddrmk  
               ddwol  
               ddfrs  
               ddfsh  
               ddcol  
               ddoil  
               ddgas  
               ddomn  
               ddcmt  
               ddomt  
               ddvol  
               ddmil  
               ddpcr  
               ddsgr  
               ddofd  
               ddb_t  
               ddtex  
               ddwap  
               ddlea  
               ddlum  
               ddppp  
               ddp_c  
               ddcrp  
               ddnmm  
               ddi_s  
               ddnfm  
               ddfmp  
               ddmvh  
               ddotn  
               ddele  
               ddome  
               ddomf  
               ddely  
               ddgdt  
               ddwtr  
               ddcns  
               ddtrd  
               ddotp  
               ddwtp  
               ddatp  
               ddcmn  
               ddofi  
               ddisr  
               ddobs  
               ddros  
               ddosg  
               dddwe  
/
;
SET
        DCCTS      Domestic commodities WITH input subsidies          /
               ddcol  
               ddoil  
               ddgas  
               ddp_c  
               ddely  
               ddgdt  
/
;
SET
        CC      Composite Commodities         /
               ccpdr  
               ccwht  
               ccgro  
               ccv_f  
               ccosd  
               ccc_b  
               ccpfb  
               ccocr  
               ccctl  
               ccoap  
               ccrmk  
               ccwol  
               ccfrs  
               ccfsh  
               cccol  
               ccoil  
               ccgas  
               ccomn  
               cccmt  
               ccomt  
               ccvol  
               ccmil  
               ccpcr  
               ccsgr  
               ccofd  
               ccb_t  
               cctex  
               ccwap  
               cclea  
               cclum  
               ccppp  
               ccp_c  
               cccrp  
               ccnmm  
               cci_s  
               ccnfm  
               ccfmp  
               ccmvh  
               ccotn  
               ccele  
               ccome  
               ccomf  
               ccely  
               ccgdt  
               ccwtr  
               cccns  
               cctrd  
               ccotp  
               ccwtp  
               ccatp  
               cccmn  
               ccofi  
               ccisr  
               ccobs  
               ccros  
               ccosg  
               ccdwe  
/
;
SET
        AA      Activities         /
               aapdr  
               aawht  
               aagro  
               aav_f  
               aaosd  
               aac_b  
               aapfb  
               aaocr  
               aactl  
               aaoap  
               aarmk  
               aawol  
               aafrs  
               aafsh  
               aacol  
               aaoil  
               aagas  
               aaomn  
               aacmt  
               aaomt  
               aavol  
               aamil  
               aapcr  
               aasgr  
               aaofd  
               aab_t  
               aatex  
               aawap  
               aalea  
               aalum  
               aappp  
               aap_c  
               aacrp  
               aanmm  
               aai_s  
               aanfm  
               aafmp  
               aamvh  
               aaotn  
               aaele  
               aaome  
               aaomf  
               aaely  
               aagdt  
               aawtr  
               aacns  
               aatrd  
               aaotp  
               aawtp  
               aaatp  
               aacmn  
               aaofi  
               aaisr  
               aaobs  
               aaros  
               aaosg  
               aadwe  
/
;
SET
        FF      Factors         /
               fLand  
            fUnSkLab  
              fSkLab  
            fCapital  
            fNatlRes  
/
;
SET
        TMMTAX      Import taxes          /
              tmmaus  
              tmmnzl  
              tmmchn  
              tmmhkg  
              tmmjpn  
              tmmkor  
              tmmtwn  
              tmmidn  
              tmmmys  
              tmmphl  
              tmmsgp  
              tmmtha  
              tmmvnm  
              tmmbgd  
              tmmind  
              tmmlka  
              tmmxsa  
              tmmcan  
              tmmusa  
              tmmmex  
              tmmxcm  
              tmmcol  
              tmmper  
              tmmven  
              tmmxap  
              tmmarg  
              tmmbra  
              tmmchl  
              tmmury  
              tmmxsm  
              tmmaut  
              tmmdnk  
              tmmfin  
              tmmfra  
              tmmdeu  
              tmmgbr  
              tmmgrc  
              tmmirl  
              tmmita  
              tmmnld  
              tmmprt  
              tmmesp  
              tmmswe  
              tmmbel  
              tmmlux  
              tmmche  
              tmmxef  
              tmmcyp  
              tmmmlt  
              tmmhun  
              tmmpol  
              tmmbgr  
              tmmcze  
              tmmrom  
              tmmsvk  
              tmmsvn  
              tmmhrv  
              tmmalb  
              tmmest  
              tmmlva  
              tmmltu  
              tmmrus  
              tmmxsu  
              tmmtur  
              tmmxme  
              tmmmar  
              tmmxnf  
              tmmbwa  
              tmmxsc  
              tmmmwi  
              tmmmoz  
              tmmtza  
              tmmzmb  
              tmmzwe  
              tmmxsf  
              tmmuga  
              tmmxss  
              tmmxrw  
              tmmglo  
/
;
SET
        TEETAX      Export taxes          /
              teeaus  
              teenzl  
              teechn  
              teehkg  
              teejpn  
              teekor  
              teetwn  
              teeidn  
              teemys  
              teephl  
              teesgp  
              teetha  
              teevnm  
              teebgd  
              teeind  
              teelka  
              teexsa  
              teecan  
              teeusa  
              teemex  
              teexcm  
              teecol  
              teeper  
              teeven  
              teexap  
              teearg  
              teebra  
              teechl  
              teeury  
              teexsm  
              teeaut  
              teednk  
              teefin  
              teefra  
              teedeu  
              teegbr  
              teegrc  
              teeirl  
              teeita  
              teenld  
              teeprt  
              teeesp  
              teeswe  
              teebel  
              teelux  
              teeche  
              teexef  
              teecyp  
              teemlt  
              teehun  
              teepol  
              teebgr  
              teecze  
              teerom  
              teesvk  
              teesvn  
              teehrv  
              teealb  
              teeest  
              teelva  
              teeltu  
              teerus  
              teexsu  
              teetur  
              teexme  
              teemar  
              teexnf  
              teebwa  
              teexsc  
              teemwi  
              teemoz  
              teetza  
              teezmb  
              teezwe  
              teexsf  
              teeuga  
              teexss  
              teexrw  
              teeglo  
/
;
SET
        SMMTAX      Sales Taxes on imported goods and services          /
             tssmpdr  
             tssmwht  
             tssmgro  
             tssmv_f  
             tssmosd  
             tssmc_b  
             tssmpfb  
             tssmocr  
             tssmctl  
             tssmoap  
             tssmrmk  
             tssmwol  
             tssmfrs  
             tssmfsh  
             tssmcol  
             tssmoil  
             tssmgas  
             tssmomn  
             tssmcmt  
             tssmomt  
             tssmvol  
             tssmmil  
             tssmpcr  
             tssmsgr  
             tssmofd  
             tssmb_t  
             tssmtex  
             tssmwap  
             tssmlea  
             tssmlum  
             tssmppp  
             tssmp_c  
             tssmcrp  
             tssmnmm  
             tssmi_s  
             tssmnfm  
             tssmfmp  
             tssmmvh  
             tssmotn  
             tssmele  
             tssmome  
             tssmomf  
             tssmely  
             tssmgdt  
             tssmwtr  
             tssmcns  
             tssmtrd  
             tssmotp  
             tssmwtp  
             tssmatp  
             tssmcmn  
             tssmofi  
             tssmisr  
             tssmobs  
             tssmros  
             tssmosg  
             tssmdwe  
/
;
SET
        SDDTAX      Sales Taxes on domestic goods and services          /
             tssdpdr  
             tssdwht  
             tssdgro  
             tssdv_f  
             tssdosd  
             tssdc_b  
             tssdpfb  
             tssdocr  
             tssdctl  
             tssdoap  
             tssdrmk  
             tssdwol  
             tssdfrs  
             tssdfsh  
             tssdcol  
             tssdoil  
             tssdgas  
             tssdomn  
             tssdcmt  
             tssdomt  
             tssdvol  
             tssdmil  
             tssdpcr  
             tssdsgr  
             tssdofd  
             tssdb_t  
             tssdtex  
             tssdwap  
             tssdlea  
             tssdlum  
             tssdppp  
             tssdp_c  
             tssdcrp  
             tssdnmm  
             tssdi_s  
             tssdnfm  
             tssdfmp  
             tssdmvh  
             tssdotn  
             tssdele  
             tssdome  
             tssdomf  
             tssdely  
             tssdgdt  
             tssdwtr  
             tssdcns  
             tssdtrd  
             tssdotp  
             tssdwtp  
             tssdatp  
             tssdcmn  
             tssdofi  
             tssdisr  
             tssdobs  
             tssdros  
             tssdosg  
             tssddwe  
/
;
SET
        SSTAX      Sales Taxes on composite goods and services         /
              tsspdr  
              tsswht  
              tssgro  
              tssv_f  
              tssosd  
              tssc_b  
              tsspfb  
              tssocr  
              tssctl  
              tssoap  
              tssrmk  
              tsswol  
              tssfrs  
              tssfsh  
              tsscol  
              tssoil  
              tssgas  
              tssomn  
              tsscmt  
              tssomt  
              tssvol  
              tssmil  
              tsspcr  
              tsssgr  
              tssofd  
              tssb_t  
              tsstex  
              tsswap  
              tsslea  
              tsslum  
              tssppp  
              tssp_c  
              tsscrp  
              tssnmm  
              tssi_s  
              tssnfm  
              tssfmp  
              tssmvh  
              tssotn  
              tssele  
              tssome  
              tssomf  
              tssely  
              tssgdt  
              tsswtr  
              tsscns  
              tsstrd  
              tssotp  
              tsswtp  
              tssatp  
              tsscmn  
              tssofi  
              tssisr  
              tssobs  
              tssros  
              tssosg  
              tssdwe  
/
;
SET
        FFTAX      Taxes on Factors          /
             tffLand  
          tffUnSkLab  
            tffSkLab  
          tffCapital  
          tffNatlRes  
/
;
SET
        OTPPMARG      Other trade and transport costs         /
             otppaus  
             otppnzl  
             otppchn  
             otpphkg  
             otppjpn  
             otppkor  
             otpptwn  
             otppidn  
             otppmys  
             otppphl  
             otppsgp  
             otpptha  
             otppvnm  
             otppbgd  
             otppind  
             otpplka  
             otppxsa  
             otppcan  
             otppusa  
             otppmex  
             otppxcm  
             otppcol  
             otppper  
             otppven  
             otppxap  
             otpparg  
             otppbra  
             otppchl  
             otppury  
             otppxsm  
             otppaut  
             otppdnk  
             otppfin  
             otppfra  
             otppdeu  
             otppgbr  
             otppgrc  
             otppirl  
             otppita  
             otppnld  
             otppprt  
             otppesp  
             otppswe  
             otppbel  
             otpplux  
             otppche  
             otppxef  
             otppcyp  
             otppmlt  
             otpphun  
             otpppol  
             otppbgr  
             otppcze  
             otpprom  
             otppsvk  
             otppsvn  
             otpphrv  
             otppalb  
             otppest  
             otpplva  
             otppltu  
             otpprus  
             otppxsu  
             otpptur  
             otppxme  
             otppmar  
             otppxnf  
             otppbwa  
             otppxsc  
             otppmwi  
             otppmoz  
             otpptza  
             otppzmb  
             otppzwe  
             otppxsf  
             otppuga  
             otppxss  
             otppxrw  
             otppglo  
/
;
SET
        WTPPMARG      Water trade and transport costs         /
             wtppaus  
             wtppnzl  
             wtppchn  
             wtpphkg  
             wtppjpn  
             wtppkor  
             wtpptwn  
             wtppidn  
             wtppmys  
             wtppphl  
             wtppsgp  
             wtpptha  
             wtppvnm  
             wtppbgd  
             wtppind  
             wtpplka  
             wtppxsa  
             wtppcan  
             wtppusa  
             wtppmex  
             wtppxcm  
             wtppcol  
             wtppper  
             wtppven  
             wtppxap  
             wtpparg  
             wtppbra  
             wtppchl  
             wtppury  
             wtppxsm  
             wtppaut  
             wtppdnk  
             wtppfin  
             wtppfra  
             wtppdeu  
             wtppgbr  
             wtppgrc  
             wtppirl  
             wtppita  
             wtppnld  
             wtppprt  
             wtppesp  
             wtppswe  
             wtppbel  
             wtpplux  
             wtppche  
             wtppxef  
             wtppcyp  
             wtppmlt  
             wtpphun  
             wtpppol  
             wtppbgr  
             wtppcze  
             wtpprom  
             wtppsvk  
             wtppsvn  
             wtpphrv  
             wtppalb  
             wtppest  
             wtpplva  
             wtppltu  
             wtpprus  
             wtppxsu  
             wtpptur  
             wtppxme  
             wtppmar  
             wtppxnf  
             wtppbwa  
             wtppxsc  
             wtppmwi  
             wtppmoz  
             wtpptza  
             wtppzmb  
             wtppzwe  
             wtppxsf  
             wtppuga  
             wtppxss  
             wtppxrw  
             wtppglo  
/
;
SET
        ATPPMARG      Air trade and transport costs         /
             atppaus  
             atppnzl  
             atppchn  
             atpphkg  
             atppjpn  
             atppkor  
             atpptwn  
             atppidn  
             atppmys  
             atppphl  
             atppsgp  
             atpptha  
             atppvnm  
             atppbgd  
             atppind  
             atpplka  
             atppxsa  
             atppcan  
             atppusa  
             atppmex  
             atppxcm  
             atppcol  
             atppper  
             atppven  
             atppxap  
             atpparg  
             atppbra  
             atppchl  
             atppury  
             atppxsm  
             atppaut  
             atppdnk  
             atppfin  
             atppfra  
             atppdeu  
             atppgbr  
             atppgrc  
             atppirl  
             atppita  
             atppnld  
             atppprt  
             atppesp  
             atppswe  
             atppbel  
             atpplux  
             atppche  
             atppxef  
             atppcyp  
             atppmlt  
             atpphun  
             atpppol  
             atppbgr  
             atppcze  
             atpprom  
             atppsvk  
             atppsvn  
             atpphrv  
             atppalb  
             atppest  
             atpplva  
             atppltu  
             atpprus  
             atppxsu  
             atpptur  
             atppxme  
             atppmar  
             atppxnf  
             atppbwa  
             atppxsc  
             atppmwi  
             atppmoz  
             atpptza  
             atppzmb  
             atppzwe  
             atppxsf  
             atppuga  
             atppxss  
             atppxrw  
             atppglo  
/
;
SET
        VSTTMARG      Exports of trade and transport services         /
             otppvst  
             wtppvst  
             atppvst  
/
;
SET
        II      Investment         /
                kkap  
/
;
SET
        WW      Rest of the World         /
               wwaus  
               wwnzl  
               wwchn  
               wwhkg  
               wwjpn  
               wwkor  
               wwtwn  
               wwidn  
               wwmys  
               wwphl  
               wwsgp  
               wwtha  
               wwvnm  
               wwbgd  
               wwind  
               wwlka  
               wwxsa  
               wwcan  
               wwusa  
               wwmex  
               wwxcm  
               wwcol  
               wwper  
               wwven  
               wwxap  
               wwarg  
               wwbra  
               wwchl  
               wwury  
               wwxsm  
               wwaut  
               wwdnk  
               wwfin  
               wwfra  
               wwdeu  
               wwgbr  
               wwgrc  
               wwirl  
               wwita  
               wwnld  
               wwprt  
               wwesp  
               wwswe  
               wwbel  
               wwlux  
               wwche  
               wwxef  
               wwcyp  
               wwmlt  
               wwhun  
               wwpol  
               wwbgr  
               wwcze  
               wwrom  
               wwsvk  
               wwsvn  
               wwhrv  
               wwalb  
               wwest  
               wwlva  
               wwltu  
               wwrus  
               wwxsu  
               wwtur  
               wwxme  
               wwmar  
               wwxnf  
               wwbwa  
               wwxsc  
               wwmwi  
               wwmoz  
               wwtza  
               wwzmb  
               wwzwe  
               wwxsf  
               wwuga  
               wwxss  
               wwxrw  
               wwglo  
/
;


* Defining SETS by exclusions from previously defined SETS

* SAM Accounts excluding totals
 SSN(SS)        = YES ;
 SSN("TTOTAL")  = NO ;

 row(SS)        = YES ;
 row("TTOTAL")  = NO ;

 MCCTSN(MCC)    = NOT MCCTS(MCC) ;

 DCCTSN(DCC)    = NOT DCCTS(DCC) ;



DISPLAY SS, MCC, MCCTS, DCC, DCCTS, CC, AA, FF,
        TMMTAX, TEETAX, SMMTAX, SDDTAX, SSTAX, FFTAX,
        OTPPMARG, WTPPMARG, ATPPMARG, VSTTMARG,
        WW, II, KK
    ;

* Output set declarations and definitions

*Output set definitions

SET
        s           New SAM accounts  /

                mcer  Cereals
               mocrp  Other crops
              mlstoc  Livestock
               mmins  Minerals
                mfod  Food Processing
               mtext  Textiles
              molman  Other light manufacturing
                mpet  Petroleum etc
               mchem  Chemicals etc
              mhmanu  Heavy manufacturing
               melec  Electricity
               mgasw  Gas and Water
               mcons  Construction
               mtrad  Trade and Transport
               mserv  Services

                dcer  Cereals
               docrp  Other crops
              dlstoc  Livestock
               dmins  Minerals
                dfod  Food Processing
               dtext  Textiles
              dolman  Other light manufacturing
                dpet  Petroleum etc
               dchem  Chemicals etc
              dhmanu  Heavy manufacturing
               delec  Electricity
               dgasw  Gas and Water
               dcons  Construction
               dtrad  Trade and Transport
               dserv  Services

                ccer  Cereals
               cocrp  Other crops
              clstoc  Livestock
               cmins  Minerals
                cfod  Food Processing
               ctext  Textiles
              colman  Other light manufacturing
                cpet  Petroleum etc
               cchem  Chemicals etc
              chmanu  Heavy manufacturing
               celec  Electricity
               cgasw  Gas and Water
               ccons  Construction
               ctrad  Trade and Transport
               cserv  Services

                acer  Cereals
               aocrp  Other crops
              alstoc  Livestock
               amins  Minerals
                afod  Food Processing
               atext  Textiles
              aolman  Other light manufacturing
                apet  Petroleum etc
               achem  Chemicals etc
              ahmanu  Heavy manufacturing
               aelec  Electricity
               agasw  Gas and Water
               acons  Construction
               atrad  Trade and Transport
               aserv  Services

                land  land and natural resources
                 gos  capital
               uslab  unskilled labour
                slab  skilled labour

               tmusa  United States of America
               tmeur  European Union
              tmreur  Rest of Europe
              tmsafr  Southern Africa
              tmnafr  Northen Africa
             tmsasia  South Asia
              tmchin  China HK Taiwan
              tmjkor  Japan and Korea
             tmeasia  East Asia
               tmanz  Australia and NZ
              tmsame  South America
              tmrame  Rest of Americas
               tmrow  Rest of the World
               tmglo  Globe

               teusa  United States of America
               teeur  European Union
              tereur  Rest of Europe
              tesafr  Southern Africa
              tenafr  Northen Africa
             tesasia  South Asia
              techin  China HK Taiwan
              tejkor  Japan and Korea
             teeasia  East Asia
               teanz  Australia and NZ
              tesame  South America
              terame  Rest of Americas
               terow  Rest of the World
               teglo  Globe

              tsmcer  Cereals
             tsmocrp  Other crops
            tsmlstoc  Livestock
             tsmmins  Minerals
              tsmfod  Food Processing
             tsmtext  Textiles
            tsmolman  Other light manufacturing
              tsmpet  Petroleum etc
             tsmchem  Chemicals etc
            tsmhmanu  Heavy manufacturing
             tsmelec  Electricity
             tsmgasw  Gas and Water
             tsmcons  Construction
             tsmtrad  Trade and Transport
             tsmserv  Services

              tsdcer  Cereals
             tsdocrp  Other crops
            tsdlstoc  Livestock
             tsdmins  Minerals
              tsdfod  Food Processing
             tsdtext  Textiles
            tsdolman  Other light manufacturing
              tsdpet  Petroleum etc
             tsdchem  Chemicals etc
            tsdhmanu  Heavy manufacturing
             tsdelec  Electricity
             tsdgasw  Gas and Water
             tsdcons  Construction
             tsdtrad  Trade and Transport
             tsdserv  Services

               tscer  Cereals
              tsocrp  Other crops
             tslstoc  Livestock
              tsmins  Minerals
               tsfod  Food Processing
              tstext  Textiles
             tsolman  Other light manufacturing
               tspet  Petroleum etc
              tschem  Chemicals etc
             tshmanu  Heavy manufacturing
              tselec  Electricity
              tsgasw  Gas and Water
              tscons  Construction
              tstrad  Trade and Transport
              tsserv  Services

              tfland  land and natural resources
               tfgos  capital
             tfuslab  unskilled labour
              tfslab  skilled labour

                marg  margins
            owatpusa  all transport margins United States of America
            owatpeur  all transport margins European Union
           owatpreur  all transport margins Rest of Europe
           owatpsafr  all transport margins Southern Africa
           owatpnafr  all transport margins Northen Africa
          owatpsasia  all transport margins South Asia
           owatpchin  all transport margins China HK Taiwan
           owatpjkor  all transport margins Japan and Korea
          owatpeasia  all transport margins East Asia
            owatpanz  all transport margins Australia and NZ
           owatpsame  all transport margins South America
           owatprame  all transport margins Rest of Americas
            owatprow  all transport margins Rest of the World
            owatpglo  all transport margins Globe

                wusa  United States of America
                weur  European Union
               wreur  Rest of Europe
               wsafr  Southern Africa
               wnafr  Northen Africa
              wsasia  South Asia
               wchin  China HK Taiwan
               wjkor  Japan and Korea
              weasia  East Asia
                wanz  Australia and NZ
               wsame  South America
               wrame  Rest of Americas
                wrow  Rest of the World
                wglo  Globe

             REGHOUS  Regional Household

                HOUS  Household 

              SALTAX  Sales taxes

             PRODTAX  Indirect Production Taxes paid by activities

              FACTAX  Factor Use taxes paid by activities

              DIRTAX  Direct Taxes 

                Govt  Government

                 KAP  Capital

               TOTAL  Account totals
/
;

SET m(s)    Imported Commodities /
                mcer  Cereals
               mocrp  Other crops
              mlstoc  Livestock
               mmins  Minerals
                mfod  Food Processing
               mtext  Textiles
              molman  Other light manufacturing
                mpet  Petroleum etc
               mchem  Chemicals etc
              mhmanu  Heavy manufacturing
               melec  Electricity
               mgasw  Gas and Water
               mcons  Construction
               mtrad  Trade and Transport
               mserv  Services
/

SET d(s)    Domestic Commodities /
                dcer  Cereals
               docrp  Other crops
              dlstoc  Livestock
               dmins  Minerals
                dfod  Food Processing
               dtext  Textiles
              dolman  Other light manufacturing
                dpet  Petroleum etc
               dchem  Chemicals etc
              dhmanu  Heavy manufacturing
               delec  Electricity
               dgasw  Gas and Water
               dcons  Construction
               dtrad  Trade and Transport
               dserv  Services
/

SET c(s)    Composite Commodities /
                ccer  Cereals
               cocrp  Other crops
              clstoc  Livestock
               cmins  Minerals
                cfod  Food Processing
               ctext  Textiles
              colman  Other light manufacturing
                cpet  Petroleum etc
               cchem  Chemicals etc
              chmanu  Heavy manufacturing
               celec  Electricity
               cgasw  Gas and Water
               ccons  Construction
               ctrad  Trade and Transport
               cserv  Services
/

SET a(s)    Activities /
                acer  Cereals
               aocrp  Other crops
              alstoc  Livestock
               amins  Minerals
                afod  Food Processing
               atext  Textiles
              aolman  Other light manufacturing
                apet  Petroleum etc
               achem  Chemicals etc
              ahmanu  Heavy manufacturing
               aelec  Electricity
               agasw  Gas and Water
               acons  Construction
               atrad  Trade and Transport
               aserv  Services
/

SET f(s)    Factors /
                land  land and natural resources
                 gos  capital
               uslab  unskilled labour
                slab  skilled labour
/

SET tm(s)    Import taxes  /
               tmusa  United States of America
               tmeur  European Union
              tmreur  Rest of Europe
              tmsafr  Southern Africa
              tmnafr  Northen Africa
             tmsasia  South Asia
              tmchin  China HK Taiwan
              tmjkor  Japan and Korea
             tmeasia  East Asia
               tmanz  Australia and NZ
              tmsame  South America
              tmrame  Rest of Americas
               tmrow  Rest of the World
               tmglo  Globe
/

SET te(s)    Export taxes  /
               teusa  United States of America
               teeur  European Union
              tereur  Rest of Europe
              tesafr  Southern Africa
              tenafr  Northen Africa
             tesasia  South Asia
              techin  China HK Taiwan
              tejkor  Japan and Korea
             teeasia  East Asia
               teanz  Australia and NZ
              tesame  South America
              terame  Rest of Americas
               terow  Rest of the World
               teglo  Globe
/

SET s_tssm(s)    Sales Taxes on imported goods and services  /
              tsmcer  Cereals
             tsmocrp  Other crops
            tsmlstoc  Livestock
             tsmmins  Minerals
              tsmfod  Food Processing
             tsmtext  Textiles
            tsmolman  Other light manufacturing
              tsmpet  Petroleum etc
             tsmchem  Chemicals etc
            tsmhmanu  Heavy manufacturing
             tsmelec  Electricity
             tsmgasw  Gas and Water
             tsmcons  Construction
             tsmtrad  Trade and Transport
             tsmserv  Services
/

SET s_tssd(s)    Sales Taxes on domestic goods and services  /
              tsdcer  Cereals
             tsdocrp  Other crops
            tsdlstoc  Livestock
             tsdmins  Minerals
              tsdfod  Food Processing
             tsdtext  Textiles
            tsdolman  Other light manufacturing
              tsdpet  Petroleum etc
             tsdchem  Chemicals etc
            tsdhmanu  Heavy manufacturing
             tsdelec  Electricity
             tsdgasw  Gas and Water
             tsdcons  Construction
             tsdtrad  Trade and Transport
             tsdserv  Services
/

SET s_tss(s)    Sales Taxes on composite goods and services /
               tscer  Cereals
              tsocrp  Other crops
             tslstoc  Livestock
              tsmins  Minerals
               tsfod  Food Processing
              tstext  Textiles
             tsolman  Other light manufacturing
               tspet  Petroleum etc
              tschem  Chemicals etc
             tshmanu  Heavy manufacturing
              tselec  Electricity
              tsgasw  Gas and Water
              tscons  Construction
              tstrad  Trade and Transport
              tsserv  Services
/

SET tf(s)    Taxes on Factors  /
              tfland  land and natural resources
               tfgos  capital
             tfuslab  unskilled labour
              tfslab  skilled labour
/

SET vstmarg(s)    export margin accounts /
                marg  margins
/
SET owatpmarg(s)  all margins on imports /
            owatpusa  all transport margins United States of America
            owatpeur  all transport margins European Union
           owatpreur  all transport margins Rest of Europe
           owatpsafr  all transport margins Southern Africa
           owatpnafr  all transport margins Northen Africa
          owatpsasia  all transport margins South Asia
           owatpchin  all transport margins China HK Taiwan
           owatpjkor  all transport margins Japan and Korea
          owatpeasia  all transport margins East Asia
            owatpanz  all transport margins Australia and NZ
           owatpsame  all transport margins South America
           owatprame  all transport margins Rest of Americas
            owatprow  all transport margins Rest of the World
            owatpglo  all transport margins Globe
/

SET w(s)    Rest of the World /
                wusa  United States of America
                weur  European Union
               wreur  Rest of Europe
               wsafr  Southern Africa
               wnafr  Northen Africa
              wsasia  South Asia
               wchin  China HK Taiwan
               wjkor  Japan and Korea
              weasia  East Asia
                wanz  Australia and NZ
               wsame  South America
               wrame  Rest of Americas
                wrow  Rest of the World
                wglo  Globe
/


SET
K            New SAM Regions  /
     usa
     eur
     reur
     safr
     nafr
     sasia
     chin
     jkor
     easia
     anz
     same
     rame
     row
     glo
    /

*Mapping sets definitions

SET
        MAPSAMAG(s, ss)      SAMG mapping to New SAM    /

mcer.(
               mmpdr
               mmwht
               mmgro
               mmosd
)
mocrp.(
               mmv_f
               mmc_b
               mmpfb
               mmocr
               mmfrs
)
mlstoc.(
               mmctl
               mmoap
               mmrmk
               mmwol
               mmfsh
)
mmins.(
               mmcol
               mmoil
               mmgas
               mmomn
)
mfod.(
               mmcmt
               mmomt
               mmvol
               mmmil
               mmpcr
               mmsgr
               mmofd
               mmb_t
)
mtext.(
               mmtex
               mmwap
               mmlea
)
molman.(
               mmlum
               mmppp
               mmele
               mmomf
)
mpet.(
               mmp_c
)
mchem.(
               mmcrp
)
mhmanu.(
               mmnmm
               mmi_s
               mmnfm
               mmfmp
               mmmvh
               mmotn
               mmome
)
melec.(
               mmely
)
mgasw.(
               mmgdt
               mmwtr
)
mcons.(
               mmcns
)
mtrad.(
               mmtrd
               mmotp
               mmwtp
               mmatp
               mmcmn
)
mserv.(
               mmofi
               mmisr
               mmobs
               mmros
               mmosg
               mmdwe
)

dcer.(
               ddpdr
               ddwht
               ddgro
               ddosd
)
docrp.(
               ddv_f
               ddc_b
               ddpfb
               ddocr
               ddfrs
)
dlstoc.(
               ddctl
               ddoap
               ddrmk
               ddwol
               ddfsh
)
dmins.(
               ddcol
               ddoil
               ddgas
               ddomn
)
dfod.(
               ddcmt
               ddomt
               ddvol
               ddmil
               ddpcr
               ddsgr
               ddofd
               ddb_t
)
dtext.(
               ddtex
               ddwap
               ddlea
)
dolman.(
               ddlum
               ddppp
               ddele
               ddomf
)
dpet.(
               ddp_c
)
dchem.(
               ddcrp
)
dhmanu.(
               ddnmm
               ddi_s
               ddnfm
               ddfmp
               ddmvh
               ddotn
               ddome
)
delec.(
               ddely
)
dgasw.(
               ddgdt
               ddwtr
)
dcons.(
               ddcns
)
dtrad.(
               ddtrd
               ddotp
               ddwtp
               ddatp
               ddcmn
)
dserv.(
               ddofi
               ddisr
               ddobs
               ddros
               ddosg
               dddwe
)

ccer.(
               ccpdr
               ccwht
               ccgro
               ccosd
)
cocrp.(
               ccv_f
               ccc_b
               ccpfb
               ccocr
               ccfrs
)
clstoc.(
               ccctl
               ccoap
               ccrmk
               ccwol
               ccfsh
)
cmins.(
               cccol
               ccoil
               ccgas
               ccomn
)
cfod.(
               cccmt
               ccomt
               ccvol
               ccmil
               ccpcr
               ccsgr
               ccofd
               ccb_t
)
ctext.(
               cctex
               ccwap
               cclea
)
colman.(
               cclum
               ccppp
               ccele
               ccomf
)
cpet.(
               ccp_c
)
cchem.(
               cccrp
)
chmanu.(
               ccnmm
               cci_s
               ccnfm
               ccfmp
               ccmvh
               ccotn
               ccome
)
celec.(
               ccely
)
cgasw.(
               ccgdt
               ccwtr
)
ccons.(
               cccns
)
ctrad.(
               cctrd
               ccotp
               ccwtp
               ccatp
               cccmn
)
cserv.(
               ccofi
               ccisr
               ccobs
               ccros
               ccosg
               ccdwe
)

acer.(
               aapdr
               aawht
               aagro
               aaosd
)
aocrp.(
               aav_f
               aac_b
               aapfb
               aaocr
               aafrs
)
alstoc.(
               aactl
               aaoap
               aarmk
               aawol
               aafsh
)
amins.(
               aacol
               aaoil
               aagas
               aaomn
)
afod.(
               aacmt
               aaomt
               aavol
               aamil
               aapcr
               aasgr
               aaofd
               aab_t
)
atext.(
               aatex
               aawap
               aalea
)
aolman.(
               aalum
               aappp
               aaele
               aaomf
)
apet.(
               aap_c
)
achem.(
               aacrp
)
ahmanu.(
               aanmm
               aai_s
               aanfm
               aafmp
               aamvh
               aaotn
               aaome
)
aelec.(
               aaely
)
agasw.(
               aagdt
               aawtr
)
acons.(
               aacns
)
atrad.(
               aatrd
               aaotp
               aawtp
               aaatp
               aacmn
)
aserv.(
               aaofi
               aaisr
               aaobs
               aaros
               aaosg
               aadwe
)

land.(
               fLand
            fNatlRes
)
gos.(
            fCapital
)
uslab.(
            fUnSkLab
)
slab.(
              fSkLab
)

tmusa.(
              tmmusa
)
tmeur.(
              tmmaut
              tmmdnk
              tmmfra
              tmmdeu
              tmmgbr
              tmmgrc
              tmmirl
              tmmita
              tmmnld
              tmmprt
              tmmesp
              tmmswe
              tmmbel
              tmmlux
)
tmreur.(
              tmmfin
              tmmche
              tmmxef
              tmmcyp
              tmmmlt
              tmmhun
              tmmpol
              tmmbgr
              tmmcze
              tmmrom
              tmmsvk
              tmmsvn
              tmmhrv
              tmmalb
              tmmest
              tmmlva
              tmmltu
)
tmsafr.(
              tmmbwa
              tmmxsc
              tmmmwi
              tmmmoz
              tmmtza
              tmmzmb
              tmmzwe
              tmmxsf
)
tmnafr.(
              tmmmar
              tmmxnf
              tmmuga
              tmmxss
)
tmsasia.(
              tmmbgd
              tmmind
              tmmlka
              tmmxsa
)
tmchin.(
              tmmchn
              tmmhkg
              tmmtwn
)
tmjkor.(
              tmmjpn
              tmmkor
)
tmeasia.(
              tmmidn
              tmmmys
              tmmphl
              tmmsgp
              tmmtha
              tmmvnm
)
tmanz.(
              tmmaus
              tmmnzl
)
tmsame.(
              tmmcol
              tmmper
              tmmven
              tmmxap
              tmmarg
              tmmbra
              tmmchl
              tmmury
              tmmxsm
)
tmrame.(
              tmmcan
              tmmmex
              tmmxcm
)
tmrow.(
              tmmrus
              tmmxsu
              tmmtur
              tmmxme
              tmmxrw
)
tmglo.(
              tmmglo
)

teusa.(
              teeusa
)
teeur.(
              teeaut
              teednk
              teefra
              teedeu
              teegbr
              teegrc
              teeirl
              teeita
              teenld
              teeprt
              teeesp
              teeswe
              teebel
              teelux
)
tereur.(
              teefin
              teeche
              teexef
              teecyp
              teemlt
              teehun
              teepol
              teebgr
              teecze
              teerom
              teesvk
              teesvn
              teehrv
              teealb
              teeest
              teelva
              teeltu
)
tesafr.(
              teebwa
              teexsc
              teemwi
              teemoz
              teetza
              teezmb
              teezwe
              teexsf
)
tenafr.(
              teemar
              teexnf
              teeuga
              teexss
)
tesasia.(
              teebgd
              teeind
              teelka
              teexsa
)
techin.(
              teechn
              teehkg
              teetwn
)
tejkor.(
              teejpn
              teekor
)
teeasia.(
              teeidn
              teemys
              teephl
              teesgp
              teetha
              teevnm
)
teanz.(
              teeaus
              teenzl
)
tesame.(
              teecol
              teeper
              teeven
              teexap
              teearg
              teebra
              teechl
              teeury
              teexsm
)
terame.(
              teecan
              teemex
              teexcm
)
terow.(
              teerus
              teexsu
              teetur
              teexme
              teexrw
)
teglo.(
              teeglo
)

tsmcer.(
             tssmpdr
             tssmwht
             tssmgro
             tssmosd
)
tsmocrp.(
             tssmv_f
             tssmc_b
             tssmpfb
             tssmocr
             tssmfrs
)
tsmlstoc.(
             tssmctl
             tssmoap
             tssmrmk
             tssmwol
             tssmfsh
)
tsmmins.(
             tssmcol
             tssmoil
             tssmgas
             tssmomn
)
tsmfod.(
             tssmcmt
             tssmomt
             tssmvol
             tssmmil
             tssmpcr
             tssmsgr
             tssmofd
             tssmb_t
)
tsmtext.(
             tssmtex
             tssmwap
             tssmlea
)
tsmolman.(
             tssmlum
             tssmppp
             tssmele
             tssmomf
)
tsmpet.(
             tssmp_c
)
tsmchem.(
             tssmcrp
)
tsmhmanu.(
             tssmnmm
             tssmi_s
             tssmnfm
             tssmfmp
             tssmmvh
             tssmotn
             tssmome
)
tsmelec.(
             tssmely
)
tsmgasw.(
             tssmgdt
             tssmwtr
)
tsmcons.(
             tssmcns
)
tsmtrad.(
             tssmtrd
             tssmotp
             tssmwtp
             tssmatp
             tssmcmn
)
tsmserv.(
             tssmofi
             tssmisr
             tssmobs
             tssmros
             tssmosg
             tssmdwe
)

tsdcer.(
             tssdpdr
             tssdwht
             tssdgro
             tssdosd
)
tsdocrp.(
             tssdv_f
             tssdc_b
             tssdpfb
             tssdocr
             tssdfrs
)
tsdlstoc.(
             tssdctl
             tssdoap
             tssdrmk
             tssdwol
             tssdfsh
)
tsdmins.(
             tssdcol
             tssdoil
             tssdgas
             tssdomn
)
tsdfod.(
             tssdcmt
             tssdomt
             tssdvol
             tssdmil
             tssdpcr
             tssdsgr
             tssdofd
             tssdb_t
)
tsdtext.(
             tssdtex
             tssdwap
             tssdlea
)
tsdolman.(
             tssdlum
             tssdppp
             tssdele
             tssdomf
)
tsdpet.(
             tssdp_c
)
tsdchem.(
             tssdcrp
)
tsdhmanu.(
             tssdnmm
             tssdi_s
             tssdnfm
             tssdfmp
             tssdmvh
             tssdotn
             tssdome
)
tsdelec.(
             tssdely
)
tsdgasw.(
             tssdgdt
             tssdwtr
)
tsdcons.(
             tssdcns
)
tsdtrad.(
             tssdtrd
             tssdotp
             tssdwtp
             tssdatp
             tssdcmn
)
tsdserv.(
             tssdofi
             tssdisr
             tssdobs
             tssdros
             tssdosg
             tssddwe
)

tscer.(
              tsspdr
              tsswht
              tssgro
              tssosd
)
tsocrp.(
              tssv_f
              tssc_b
              tsspfb
              tssocr
              tssfrs
)
tslstoc.(
              tssctl
              tssoap
              tssrmk
              tsswol
              tssfsh
)
tsmins.(
              tsscol
              tssoil
              tssgas
              tssomn
)
tsfod.(
              tsscmt
              tssomt
              tssvol
              tssmil
              tsspcr
              tsssgr
              tssofd
              tssb_t
)
tstext.(
              tsstex
              tsswap
              tsslea
)
tsolman.(
              tsslum
              tssppp
              tssele
              tssomf
)
tspet.(
              tssp_c
)
tschem.(
              tsscrp
)
tshmanu.(
              tssnmm
              tssi_s
              tssnfm
              tssfmp
              tssmvh
              tssotn
              tssome
)
tselec.(
              tssely
)
tsgasw.(
              tssgdt
              tsswtr
)
tscons.(
              tsscns
)
tstrad.(
              tsstrd
              tssotp
              tsswtp
              tssatp
              tsscmn
)
tsserv.(
              tssofi
              tssisr
              tssobs
              tssros
              tssosg
              tssdwe
)

tfland.(
             tffLand
          tffNatlRes
)
tfgos.(
          tffCapital
)
tfuslab.(
          tffUnSkLab
)
tfslab.(
            tffSkLab
)

marg.(
             otppvst
             wtppvst
             atppvst
)
  owatpusa   .(
     otppusa
     wtppusa
     atppusa
)
  owatpeur   .(
     otppaut
     wtppaut
     atppaut
     otppdnk
     wtppdnk
     atppdnk
     otppfra
     wtppfra
     atppfra
     otppdeu
     wtppdeu
     atppdeu
     otppgbr
     wtppgbr
     atppgbr
     otppgrc
     wtppgrc
     atppgrc
     otppirl
     wtppirl
     atppirl
     otppita
     wtppita
     atppita
     otppnld
     wtppnld
     atppnld
     otppprt
     wtppprt
     atppprt
     otppesp
     wtppesp
     atppesp
     otppswe
     wtppswe
     atppswe
     otppbel
     wtppbel
     atppbel
     otpplux
     wtpplux
     atpplux
)
  owatpreur   .(
     otppfin
     wtppfin
     atppfin
     otppche
     wtppche
     atppche
     otppxef
     wtppxef
     atppxef
     otppcyp
     wtppcyp
     atppcyp
     otppmlt
     wtppmlt
     atppmlt
     otpphun
     wtpphun
     atpphun
     otpppol
     wtpppol
     atpppol
     otppbgr
     wtppbgr
     atppbgr
     otppcze
     wtppcze
     atppcze
     otpprom
     wtpprom
     atpprom
     otppsvk
     wtppsvk
     atppsvk
     otppsvn
     wtppsvn
     atppsvn
     otpphrv
     wtpphrv
     atpphrv
     otppalb
     wtppalb
     atppalb
     otppest
     wtppest
     atppest
     otpplva
     wtpplva
     atpplva
     otppltu
     wtppltu
     atppltu
)
  owatpsafr   .(
     otppbwa
     wtppbwa
     atppbwa
     otppxsc
     wtppxsc
     atppxsc
     otppmwi
     wtppmwi
     atppmwi
     otppmoz
     wtppmoz
     atppmoz
     otpptza
     wtpptza
     atpptza
     otppzmb
     wtppzmb
     atppzmb
     otppzwe
     wtppzwe
     atppzwe
     otppxsf
     wtppxsf
     atppxsf
)
  owatpnafr   .(
     otppmar
     wtppmar
     atppmar
     otppxnf
     wtppxnf
     atppxnf
     otppuga
     wtppuga
     atppuga
     otppxss
     wtppxss
     atppxss
)
  owatpsasia   .(
     otppbgd
     wtppbgd
     atppbgd
     otppind
     wtppind
     atppind
     otpplka
     wtpplka
     atpplka
     otppxsa
     wtppxsa
     atppxsa
)
  owatpchin   .(
     otppchn
     wtppchn
     atppchn
     otpphkg
     wtpphkg
     atpphkg
     otpptwn
     wtpptwn
     atpptwn
)
  owatpjkor   .(
     otppjpn
     wtppjpn
     atppjpn
     otppkor
     wtppkor
     atppkor
)
  owatpeasia   .(
     otppidn
     wtppidn
     atppidn
     otppmys
     wtppmys
     atppmys
     otppphl
     wtppphl
     atppphl
     otppsgp
     wtppsgp
     atppsgp
     otpptha
     wtpptha
     atpptha
     otppvnm
     wtppvnm
     atppvnm
)
  owatpanz   .(
     otppaus
     wtppaus
     atppaus
     otppnzl
     wtppnzl
     atppnzl
)
  owatpsame   .(
     otppcol
     wtppcol
     atppcol
     otppper
     wtppper
     atppper
     otppven
     wtppven
     atppven
     otppxap
     wtppxap
     atppxap
     otpparg
     wtpparg
     atpparg
     otppbra
     wtppbra
     atppbra
     otppchl
     wtppchl
     atppchl
     otppury
     wtppury
     atppury
     otppxsm
     wtppxsm
     atppxsm
)
  owatprame   .(
     otppcan
     wtppcan
     atppcan
     otppmex
     wtppmex
     atppmex
     otppxcm
     wtppxcm
     atppxcm
)
  owatprow   .(
     otpprus
     wtpprus
     atpprus
     otppxsu
     wtppxsu
     atppxsu
     otpptur
     wtpptur
     atpptur
     otppxme
     wtppxme
     atppxme
     otppxrw
     wtppxrw
     atppxrw
)
  owatpglo   .(
     otppglo
     wtppglo
     atppglo
)

wusa.(
               wwusa
)
weur.(
               wwaut
               wwdnk
               wwfra
               wwdeu
               wwgbr
               wwgrc
               wwirl
               wwita
               wwnld
               wwprt
               wwesp
               wwswe
               wwbel
               wwlux
)
wreur.(
               wwfin
               wwche
               wwxef
               wwcyp
               wwmlt
               wwhun
               wwpol
               wwbgr
               wwcze
               wwrom
               wwsvk
               wwsvn
               wwhrv
               wwalb
               wwest
               wwlva
               wwltu
)
wsafr.(
               wwbwa
               wwxsc
               wwmwi
               wwmoz
               wwtza
               wwzmb
               wwzwe
               wwxsf
)
wnafr.(
               wwmar
               wwxnf
               wwuga
               wwxss
)
wsasia.(
               wwbgd
               wwind
               wwlka
               wwxsa
)
wchin.(
               wwchn
               wwhkg
               wwtwn
)
wjkor.(
               wwjpn
               wwkor
)
weasia.(
               wwidn
               wwmys
               wwphl
               wwsgp
               wwtha
               wwvnm
)
wanz.(
               wwaus
               wwnzl
)
wsame.(
               wwcol
               wwper
               wwven
               wwxap
               wwarg
               wwbra
               wwchl
               wwury
               wwxsm
)
wrame.(
               wwcan
               wwmex
               wwxcm
)
wrow.(
               wwrus
               wwxsu
               wwtur
               wwxme
               wwxrw
)
wglo.(
               wwglo
)

REGHOUS.(
            RREGHOUS
)

HOUS.(
               HHOUS
)

SALTAX.(
             SSALTAX
)

PRODTAX.(
            PPRODTAX
)

FACTAX.(
             FFACTAX
)

DIRTAX.(
             DDIRTAX
)

Govt.(
               GGovt
)

KAP.(
                KKAP
)

TOTAL.(
              TTOTAL
)
/
;

SET
MAPREGAG(k, kk)      SAMG Region mapping to New SAM    /
usa   .(
     usa
           )
eur   .(
     aut
     dnk
     fra
     deu
     gbr
     grc
     irl
     ita
     nld
     prt
     esp
     swe
     bel
     lux
           )
reur   .(
     fin
     che
     xef
     cyp
     mlt
     hun
     pol
     bgr
     cze
     rom
     svk
     svn
     hrv
     alb
     est
     lva
     ltu
           )
safr   .(
     bwa
     xsc
     mwi
     moz
     tza
     zmb
     zwe
     xsf
           )
nafr   .(
     mar
     xnf
     uga
     xss
           )
sasia   .(
     bgd
     ind
     lka
     xsa
           )
chin   .(
     chn
     hkg
     twn
           )
jkor   .(
     jpn
     kor
           )
easia   .(
     idn
     mys
     phl
     sgp
     tha
     vnm
           )
anz   .(
     aus
     nzl
           )
same   .(
     col
     per
     ven
     xap
     arg
     bra
     chl
     ury
     xsm
           )
rame   .(
     can
     mex
     xcm
           )
row   .(
     rus
     xsu
     tur
     xme
     xrw
           )
glo   .(
     glo
           )
    /


*### ALIASES common to All Aggregation Levels #####

ALIAS(ss, ssp) ;
ALIAS(s,sp,spp) ;


*################## DATA ENTRY ####################################

 PARAMETERS

 SAMG(SS,SSP,KK)   Social accounting matrices for regions k

;

* Data are read in from a *.gdx file

$GDXIN gtpsam54.gdx

$LOAD SAMG = SAMG

$GDXIN

*DISPLAY SAMG ;

*################### SAM AGGREGATION ############################

PARAMETER
   NEWSAM(sp,spp,k)          Aggregate SAM derived
   SUMROW(sp,k)              Row sum parameter by region
   SUMCOL(sp,k)              Column sum parameter by region
   SAMCHECK(sp,k)            Check on account totals parameter by region ;



*######### AGGREGATION ASSIGNMENT #######################

 NEWSAM(sp,spp,k)           = SUM((ss,ssp,kk)
                                $(MAPSAMAG(sp,ss)
                                $MAPSAMAG(spp,ssp)
                                $MAPREGAG(k,kk)),
                                SAMG(ss,ssp,kk)) ;


*#### Rounding the New SAM to 6 Decimal Places
* The GTAP database only records data to 6 decimal places

 NEWSAM(sp,spp,k)      = ROUND(NEWSAM(sp,spp,k),6) ;


*COMPUTE TOTALS AND CHECK

NEWSAM(sp,"TOTAL",k)        = 0.0 ;
NEWSAM("TOTAL",sp,k)        = 0.0 ;

NEWSAM(sp,"TOTAL",k)        = SUM(spp, NEWSAM(sp,spp,k)) ;
NEWSAM("TOTAL",spp,k)       = SUM(sp, NEWSAM(sp,spp,k)) ;

SUMROW(sp,k)                = NEWSAM(sp,"TOTAL",k) ;
 SUMROW(sp,k)      = ROUND(SUMROW(sp,k),6) ;

SUMCOL(spp,k)               = NEWSAM("TOTAL",spp,k) ;
 SUMCOL(spp,k)      = ROUND(SUMCOL(spp,k),6) ;

SAMCHECK(sp,k)              = SUMROW(sp,k) - SUMCOL(sp,k) ;
 SAMCHECK(sp,k)      = ROUND(SAMCHECK(sp,k),6) ;


DISPLAY NEWSAM, SAMCHECK ;


*#################### EXPORT OF RESULT FILES ####################

*#######  Export new aggregation to GDX ###################

*## Writing out the NEW SAMs to GDX

* This writes all the SAM data to GDX

* NB THE COMMON COMPONENT AT THE BOTTOM TO UNLOAD SETS TO GDX


Execute_Unload  'gtp_samg15_4_14.gdx', NEWSAM

* common instruction for unloading sets to GDX
s
m
d
c
a
f
tm
te
s_tssm
s_tssd
s_tss
tf
vstmarg
owatpmarg
w
K


     ;


*############################## THE END ############################


