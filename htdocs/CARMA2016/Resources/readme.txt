GTAP Social Accounting Matrix (SAM) Extraction Programme

 All versions of this programme together with the documentation are
 supplied in the form of a USER MODEL LIBRARY. Unzip the archive into
 a directory and from GAMSIDE select
         FILE > Model Library > Open User Model Library
 and select the library index file (gtaplib.glb) and then select the
 version of the programme that matches the version of GTAP with which you
 are working.

 The GTAP version supported by programmes in the library are
           GTAP v5.3
           GTAP v5.4
           GTAP v6.0 pre 5
           GTAP v6.0
           GTAP v7.0 release candidate 4

 For GTAP versions 6 and 7 the programmes included that extract ALL the
 data supplied by GTAP.

This programme was developed by Scott McDonald

 Scott McDonald
 Dept of Economics & Strategy
 Oxford Brookes University
 Wheatley Campus
 Oxford, OX33 1HX, UK
 email:
    smcdonald@brookes.ac.uk

Invaluable helpful advice about the GTAP model and GEMPACK was received
from Terrie Walmsley. Helpful comments were provided by referees and
Vitaly Kharitonov, who identified an error in the code.

Documentation for the SAM representation of GTAP data is in

Scott McDonald and Karen Thierfelder,
'Deriving a Global Social Accounting Matrix from GTAP version 5 Data',
Global Trade Analysis Project Technical Paper 22.
Center for Global Trade Analysis: Purdue University. (www.gtap.org)

Copyright (c) 2008 Scott McDonald

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

A copy of the GNU GPL, gpl.txt, is included with the programme files.

Do NOT remove this notice if you redistribute this programme

If you use this programme you should acknowledge the source and not claim
authorship. Altered versions should be clearly distinguished from the original.

$offtext
*############## USER GUIDE v7 ######################################
$ontext

SOFTWARE REQUIREMENTS

  1) This programme is known to work with version 22.8 of GAMS 250.
     It is believed to work with all versions of GAMS 250 since
     distribution 22.6 in Dec 2007. It has not been tested for earlier
     versions of GDX, i.e., before v6

  2) Recent versions of GAMS include the GDX2HAR and HAR2GDX utilities.
     If your version of GAMS does not include GDX2HAR and HAR2GDX it is
     necessary to get copies of the GDX2HAR and HAR2GDX utilities developed
     by Horridge and Rutherford (revised Nov 2003).
            http://debreu.colorado.edu/gdxhar
                   OR
            http://www.monash.edu.au/policy/ftp/gpextra/gdxhar.zip
       There are three files that need to be copied to the GAMS directory
            gdx2har.exe
            har2gdx.exe
            gdxiomh.dll

  3) It is also useful to have a copy of GDXVIEWER. This is standard in
     recent versions of GAMS.
     NB: for GAMS versions 22.6 and 22.7 the cube facility in GDXViewer
         does not seem to work correctly.
     Users of versions of GAMS that do not include GDXViewer should note that
     GDXViewer was is one of the WTOOLS utilities developed by
     Erwin Kalvelagen. (GDXVIEWER allows the resultant Global SAM to be
     viewed on screen in a simple user friendly environment). The WTOOLS
     utilities used to be available from
            http://www.gams.com/~erwin/interface/interface.html#1.31_WTOOLS

DATA REQUIREMENTS

  1) No GTAP data are provided. The user must have a licensed version
     of the GTAP database complete with the GTAPAgg (or FLEXAgg) programme.

  2) All the sets and set mapping required to use the GAMS programmes for
     specific versions of the GTAP database are provided from
     a single Excel workbook.
         GTAP version 5.3               - data_gtp_53.xls
         GTAP version 5.4               - data_gtp_54.xls
         GTAP version 6.0 pre release 5 - data_gtp_60_p5.xls
         GTAP version 6.0               - data_gtp_60.xls
         GTAP version 7.0 rc4           - data_gtp_70_rc4.xls

     An additional Excel workbook is also supplied that provides a simple
     semi-automated method for producing new set and mapping configurations.

     Step 11 in the User Instructions below provides brief guidance for
     working with other - older or more recent - versions of the GTAP
     database.

USER INSTRUCTIONS
   (These instructions assume the user is working in a Windows XP/Vista
    environment using GAMSIDE and Microsoft Excel 2003/2007)

  1) The programme files are made available in a WinZip archive - gtapsam.zip.

  2) The programme files are organised so that they can be used as a
     GAMS User Model Library (see the GAMS documentation for information
     on using User Model Libraries). These instruction assume that files
     in gtapsim.zip have been extracted to a directory - gsamlib.

  3) Create a directory for the programme. The path to this directory
     should follow standard/old DOS conventions - no directory with more
     than an 8 character name and no spaces in the names in the path.

     (This is probably no longer necessary but I am old fshioned)

     Create a project file (*.gpr) in this directory.

  4) To copy the programme files to the project directory.
     In GAMSIDE with the project file controlling paths do the following
     a) Locate the User Model Library
          File>Model Library>Open User Model Library and then select the
          file gtablib.glb in the directory gsamlib
     b) Double click on the NAME of the version of the programme that
        corresponds to the version of the GTAP database with which you are
        working. ALL the files needed to run the programme other than the
        GTAP database file will be copied to the directory containing the
        project file.
        NB: A brief description of the programme is provided in the window
            at the bottom of the User Mode Library window.

  5) Read and study the GAMS programme.

  6) Create the database for the programme
     a) Use GTAPAgg to create an aggregation with 1:1 mappings for
        sectors, regions and factors.
     b) Extract the files Basedata.har, default.har, gsdvole.har and
        tstrade.har from the WinZip archive created by GTAPAgg
        and copy to the project directory.

  7) Check that programme compiles by using SHIFT+F9.
        If the steps above have been followed there should be no problems.
        a) Some users can have problems with the GDXXRW facility
           that generates the file data_in.gdx from the Excel file. These
           problems mostly seem to originate with a corruption of the
           'LAYOUT' worksheet and result in an error message saying the
           file data_in.gdx does not exist. To overcome this type of problem
              i)  check that gdxxrw.exe exists in the GAMS directory
              ii) copy the contents of the worksheet 'LAYOUT2' and replace
                  the worksheet 'LAYOUT' using Paste Special
        b) If an error message saying that the file database.gdx does not
           exist arises check that the files har2gdx.exe, gdx2har.exe and
           gdxiomh.dll exist in the GAM directory.

  8) Run the programme. The output to the working directory should be as
     follows:
     a) A series of GDX files for checking the intermediate stages
          gtptots1.gdx
          gtptots2.gdx
          gtptots3.gdx
          gtptots4.gdx
          gtptots5.gdx
          gtpmxmin.gdx
     b) A Global SAM in GDX format
          gtpsam70rc4.gdx
     c) A Global SAM in HAR format
          gsam70rc4.har

     NB: For version 7 of the GTAP database the directory will be in the
         order of ???MB with the Global SAM in HAR format accounting for
         some ???MB.

  9) Exports fob and Imports fob calculated directly do not always equate -
     indirect and direct methods of calculating imports are included
     search for TRADECAL to control the choice of method. All the checks
     labelled TRADECHK should equal ZERO.

  10)GAMS code for aggregating the Global SAM programme is provided
     in the User Model Library.

  11)These notes relate to situations where a user wishes to work with
     another version of the GTAP database. It is assumed this will be a later
     version.
     A new workbook - data_gtp_**.xls - will need to be compiled.
     a) Using the file gtp_sets_v70rc4.xls as a template
        i)   Get the 'new' sector, region, factor and margin codes and
             descriptions from the GTAP database and copy them into the
             worksheet 'Set data from GTAPAgg'
        ii)  Check that the worksheets
             'Set creation regions/sectors/factor/margins' have all updated
             correctly - NB the number of entries in each group of
             codes is the critical point.
        iii) Compile the new sets in the worksheet 'Compiling Sets'
     b) Using the file data_gtp_70rc4.xls as a template
        i)   Generate a revise worksheet 'Sets' - using copy and paste
             SPECIAL from the new file gtp_sets_V**.xls.
        ii)  Generate a revise worksheet 'Maps' - using copy and paste
             from the new worksheet 'Sets'.
        iii) The worksheet 'Layout' should NOT need to be changed unless
             new sets or maps are created.
     c) Update the programme file to read the new sets and maps.

     d) Some general suggestions
        i)   Spaces in the cells of the file data_gtp_**.xls are a
             problem - to GAMS spaces are characters.
        ii)  If the orderings in the mapping sets are not consistent the
             mappings implemented will be wrong.
        iii) 'Corruption' of the worksheet 'Layout' will cause the sets
             maps not to be read in.
        iv)  The codes used for account names in the GTAP database may
             have changed.
        v)   'Big' initial 'errors' (say entries in the first DIFFTOT that
             are greater than 1) are likely to be due to an error in the
             sets and maps files.
        vi)  'Small' initial 'errors' (say less that 0.01) are more likely
             to rounding issues due to the degree of precision in the
             GTAP database.
        vii) When adjusting the programme to remove 'errors' due to
             the degree precision in the database, it is best by far to
             work through the accounts as they appear in the SAM, i.e.,
             start with the import commodity accounts, then domestic
             commodities, etc.

$offtext