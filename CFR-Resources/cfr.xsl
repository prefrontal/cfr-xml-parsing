<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:variable name="gpocollection">Code of Federal Regulations</xsl:variable>
  <xsl:variable name="cfrnumber" select="//FDSYS/CFRTITLE"/>
  <xsl:variable name="cfrvolume" select="//FDSYS/VOL"/>
  <xsl:variable name="cfrdate" select="//FDSYS/DATE"/>
  <xsl:variable name="cfrorigdate" select="//FDSYS/ORIGINALDATE"/>
  <xsl:variable name="cfrtitle" select="//FDSYS/CFRTITLETEXT"/>
  <xsl:variable name="cfrtitle2" select="//FDSYS/TITLE"/>
  <xsl:variable name="cfrgranulenum" select="//FDSYS/GRANULENUM"/>
  <xsl:variable name="cfrheading" select="//FDSYS/HEADING"/>
  <xsl:variable name="cfrancestors" select="//FDSYS/ANCESTORS/PARENT/@HEADING"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Code of Federal Regulations</title>
        <style type="text/css">
	 
	  <!-- Update Dec 03, 2009 5:45pm - NZambrano
	       FDSYS Meta data tags have been updated based on 
	       GPO request. Ancestors tag hadnt been formatted before. Now
	       it is working as it is expected. Thre new templates have been 
	       created to get the FDSYS section to look like as GPO wanted.
	       
	  -->
	 
          <!-- Update Nov 26, 2009 11:00pm - RMATAMOROS  
            PRTPAGE fix when it is found within FL-2 and SECTNO
          -->                    
          
          <!-- Update Nov 25, 2009 8:06 pm EST USA.
             Tags: 
             LDRWK Section created, and childs re configured. 
             EXTRACT-FP re configured
             PART-SECTION re configured
             SECTION-SECTNO re configured
             SECTION-LDRWK, and SECTION-RESERVED re configured as well.
          -->
          
          
          <!-- Update Nov 25, 2009 06:00pm - RMATAMOROS  
            PRTPAGE fix when it is found within a ROW (GPOTABLE) tag.
            (This is an improvement, yet the final fix needs to split
             the whole table)
          -->          
          
          <!-- Update Nov 25, 2009 05:00pm - NZAMBRANO  
	        Changed Top/Bottom Spacing for CFR SubPart tags.
	        SUBPART-SECTION created
          -->

          <!-- Update Nov 25, 2009 02:09pm - RMATAMOROS  
            PRTPAGE fix when it is found within a PG, SUBJECT,
            CITA and P Tag.
          -->          
          
          <!-- Update Nov 24, 2009 04:48pm - RMATAMOROS  
            Included page header support (missing formatting fix).
          -->          

          <!-- Update Nov 23, 2009 06:37pm - RMATAMOROS  
            Included support for the ABBREV  tag.
          -->          
          
          <!-- Update Nov 23, 2009 01:20pm - RMATAMOROS  
            Changed Font for CFR Header CSS H1
            Included missing period to the CFRDOC-FDSYS class tag
          -->
          
          <!-- Update Nov 20, 2009 10:30pm - NZambrano  
          	Meta Data Tags configured
          	Aligning issues fixed
          	More space bet some titles
          	Emanuel new tags have been configured
          	The proclamation pdf documents done as well
          -->
	  
       	  <!-- Update Nov 18, 2009 4:30pm - NZambrano
       	        fixing some spacing & aligning issues
       	  -->	

          <!-- MetaData Tags   -->
          
          .FDSYSLINE {display:block;width:100%;margin-bottom:10px;text-align:left;border-bottom-style:solid;border-width:1px;}
          .CFRFDSYS {display:block;width:100%;margin-top:5px;margin-bottom:5px;text-align:left;}
          .FDSYSANCESTORS, .FDSYSHEADINGTITLE2, .FDSYSORIGDATE, .FDSYSDATE, .FDSYSNUMTITLE1, .FDSYSVOLUME {display:block;}
          
   
   
          <!-- End of MetaData Tags  -->
          
          <!-- Headers -->
           H1 {display:block;font-weight:bold; font-size:18pt;margin-top:3cm;text-align:center;font-family:sans-serif;}
          .SUBCHAP-HED {text-align:center;font-size:12pt;font-weight:bold;display:block;margin-top:1cm;margin-bottom:1cm;}
          .SUBCHAP-RESERVED {text-align:center;font-size:12pt;font-weight:bold;display:block;margin-top:1cm;} 
          .CFRGRANULE, .CFRDOC {font-family:sans-serif;font-size:10pt;}
          .CFRGRANULE-CHAPINDX, .CFRGRANULE-BMTR, .APPENDIX-GPH, .CFRGRANULE-TOC, .CFRGRANULE-CROSSREF {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .CFRDOC-CHAPINDX, .CFRDOC-BMTR, .CFRDOC-TOC, .CFRDOC-CROSSREF {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .CFRGRANULE-CONTENTS, CFRDOC-CONTENTS {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .SUBPART-SUBJGRP, .CFRGRANULE-SOURCE, CFRDOC-SOURCE, .CFRGRANULE-AUTH, .CFRDOC-AUTH {display:block;width:100%;margin-top:20px;margin-bottom:20px;text-align:left;}
          .CONTENTS-SUBPART {display:block;width:100%;margin-top:20px;margin-bottom:20px;text-align:left;}
          .EXPLA-SIG, .EXPLA-IPAR, .CFRGRANULE-ALPHLIST, .CFRDOC-ALPHLIST, .TOCTAC-TITLENO {display:block;width:100%;margin-top:20px;margin-bottom:2cm;text-align:left;}
          .PART-ROPIND {display:block;width:100%;margin-top:20px;margin-bottom:2cm;text-align:left;}
          .ROPIND-HED {display:block;margin-top:20px;margin-bottom:10px;font-size:12pt;text-align:center;}
          .ROPIND-SUBJECT {display:block;text-align:left;clear:both;font-style:italic;}
          .ROPIND-SUBJL {display:block;width:55%;text-align:left;float:left;}
          .ROPIND-SUBJ1L {display:block;width:55%;text-align:left;float:left;}
          .ROPIND-SUBJ2L {display:block;width:53.53%;text-align:left;margin-left:0.5cm;float:left;}
          .ROPIND-SECTNO {display:block;width:25%;text-align:right;margin-right:1cm;float:left;clear:right;}
          .TITLENO-SUBTI, .TOC-EXPL, .TITLENO-CHAPTI {width:100%;margin-bottom:5px;margin-top:5px;}          
          .SUBJGRP-SECTION, .SUBPART-SECTION {width:100%;margin-bottom:10px;margin-top:20px;}
          .SECTION-LDRWK {width:100%;margin-bottom:5px;margin-top:5px;display:block;}
          .PART-SECTION {width:100%;margin-bottom:5px;margin-top:10px;display:block;}
          .TOC-TITLENO {display:block;margin-top:1cm;margin-bottom:1cm;}          
          .TOC-CHAPTI, .TOC-FAIDS {display:block;width:100%;margin-top:0.5cm;margin-bottom:0.5cm;text-align:left;}          
          .CFRTOC-ABBR {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .SSAINDEX-EDNOTE, .AR-NOTE, .AR-PUBLI {width:100%;text-indent:1cm;}
          .SECTION-EXTRACT {display:block;width:100%;text-align:left;}
          .CFRGRANULE-SECTION, .CFRDOC-SECTION {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .APPENDIX-LDRWK {display:block;margin-left:1cm;margin-top:10px;text-align:left;width:60%;}
          .CFRGRANULE-GROUPHD, .CFRDOC-GROUPHD {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}
          .BMTR-INCORP {display:block;width:100%;margin-top:1cm;margin-bottom:1cm;text-align:left;}        
          .CFRTOC-PTHD, .TOC-PGHD {font-style:italic;display:block;text-align:right;width:80%;}          
          .CFRGRANULE-HED, .CFRDOC-HED, .TOC-HED {margin-left:1cm;font-size:30pt;display:block;border-bottom-style:double;border-width:2px; border-color:black;margin-top:3cm;margin-bottom:2cm;text-align:center;}
          .EXTRACT-CTRHD, .CTRHD-FP {display:block;text-align:left;margin-left:1cm;margin-top:20px;}
          .CHAPTI-RESERVED {text-align:left;margin-left:2cm;float:left;}
          .CHAPTI-SUBJECT {text-align:left;width:74%;margin-left:2cm;float:left;display:inline;}          
          .EXPL-SUBJECT {text-align:left;width:77%;display:block;float:left;}
          .SUBTI-HED {text-align:left;width:73.5%;margin-left:1cm;float:left;}
          .EXPL-PG, .SUBTI-PG, .CHAPTI-PG {width:5%;text-align:left;display:inline;float:left;}
          .MATH-MID {text-align:left;margin-left:2cm;font-size:9pt;font-style:italic;display:block;}          
          .FAIDS-PG  {width:20%;text-align:right;}
          .FAIDS-HED, {text-align:left;width:77%;}
          .FAIDS-SUBJECT {text-align:left;width:77%;}         
          .SIG-NAME {text-align:right;width:90%;display:block;text-transform:uppercase;}
          .SIG-OFFICE, .SIG-POSITION {text-align:right;width:90%;display:block;text-style:italic;}
          .EXPLA-DATE {text-align:left;margin-left:1cm;width:90%;display:block;text-style:italic;font-weight:bold;}          
          .CFRGRANULE-HED, CFRDOC-HED, .CFRGRANULE-PROC, .CFRDOC-PROC {text-align:center;font-size:18pt;margin-top:1cm;margin-bottom:1cm;width:100%;clear:both;}
          .CFRGRANULE-MEMO, .CFRDOC-MEMO {text-align:left;margin-left:1cm;margin-top:0.5cm;margin-bottom:0.5cm;width:100%;}          
          .CFRGRANULE-RESERVED, .CFRDOC-RESERVED {width:75%;text-align:left;display:block;}
          .CFRGRANULE-ENTRY, .CFRDOC-ENTRY {width:75%;text-align:left;float:left;display:block;margin-bottom:20px;}
          .CFRGRANULE-PG, .CFRDOC-PG {width:80%;text-align:right;display:block;float:left;}
          .CFRGRANULE-DETNO, CFRDOC-DETNO, .CFRGRANULE-PNOTICE, .CFRDOC-PNOTICE, .CFRGRANULE-DATE, .CFRDOC-DATE {margin-left:1cm;font-style:italic;display:block;margin-top:0.5cm;}          
          .CFRGRANULE-STUB, .CFRDOC-STUB {text-align:left;display:block;width:90%;float:left;font-weight:bold;}
          .CFRGRANULE-SUBJECT, CFRDOC-SUBJECT {margin-left:1cm;text-align:left;display:block;}
          .CFRGRANULE-SUBJECT1, .CFRDOC-SUBJECT1 {margin-left:2cm;text-align:left;display:block;}         
          .EXPLA-HED, .THISTITL-HED {display:block;font-size:16pt;text-align:center;margin-bottom:2cm;margin-top:3cm;}
          .LSA-HED, .ALPHLIST-HED {display:block;font-size:18pt;text-align:center;margin-left:1cm;margin-top:3cm;width:80%;border-bottom-style:double;border-width:5px;}          
          <!--
          .LDRWK-FL-2 {display:inline;text-align:left;margin-top:10px;}
          .LDRWK-LDRFIG {display:inline;text-align:right;display:block;}
	        .LDRWK-FL-2 {text-align:left;margin-left:1cm;float:left;clear:left;width:80%;border:1px solid black;}
	        .LDRWK-LDRFIG {text-align:right;display:block;width:100%;border:1px solid black;clear:right;}
          -->          
          .LDRWK-FL-2 {text-align:left;margin-left:1cm;width:90%;float:left;}
          .LDRWK-LDRFIG {text-align:right;width:100%;display:block;}
          .INCORP-RRH, .INCORP-LRH {text-align:center;font-weight:bold;font-size:18px;display:block;}
          .INCORP-HED {text-align:center;font-weight:bold;display:block;margin-top:1cm;}
          .CFRGRANULE-TABLHED, .CFRDOC-TABLHED {text-align:center;font-weight:bold;display:block;margin-top:3cm;font-size:14pt;clear:both;}
          .PART-CITA, .CHAPTER-JOURNAL {text-align:left;margin-left:0.5cm;display:block;margin-top:1cm;margin-bottom:1cm;clear:both;}
          .EXTRACT-DOCKETHD {font-variant:small-caps;text-align:center;display:block;}
          .EXTRACT-HD1 {margin-left:1cm;font-variant:small-caps;text-align:left;display:block;margin-bottom:10px;margin-top:10px;}
          .EXTRACT-FP {text-indent:1cm;display:block;text-align:left;margin-top:5px;margin-bottom:5px;}
          .SECTION-APPRO, .SECTION-FP {text-indent:1cm;display:block;text-align:left;margin-top:5px;margin-bottom:5px;font-weight:bold;}
          .SECTION-EXT-XREF {text-indent:2cm;display:block;text-align:left;margin-top:5px;margin-bottom:5px;}
          .SECTION-BOXTXT {text-indent:2cm;text-align:center;border:1px solid black;display:block;padding:10px;width:80%;margin:20px;}  
          .GPH-GID {text-indent:1cm;display:block;text-align:left;margin-top:10px;margin-bottom:20px;}          
          .APPENDIX-SECAUTH, .GPH-BCAP {text-indent:1cm;display:block;text-align:left;margin-top:10px;margin-bottom:5px;}          
          .SSAINDEX-HED, .ACQRUL-HED, .ABBR-HED {font-size:14px;font-variant:small-caps;text-indent:1cm;display:block;text-align:left;margin-top:10px;margin-bottom:10px;}
          .EXTRACT-HD2 {text-align:left;margin-left:1cm;font-weight:bold;display:block;margin-top:20px;}
          .EDNOTE-NOTE-HED {font-variant:small-caps;text-indent:2cm;}
          .ACQRUL-E-04 {font-size:14px;font-variant:small-caps;}
          .ACQRUL-E-03 {font-style:italic;margin-top:25px;text-indent:2cm;}          
          .CHAPTER-CHAPNO {margin-left:1cm;font-size:14pt;font-weight:bold;display:block;text-align:left;}
          .CHAPTER-OWNER {font-size:12pt;font-weight:bold;margin-top:20px;margin-left:1cm;display:block;text-align:left;}
          .CHAPTER-ADDR {display:block;margin-bottom:10px;text-align:left;margin-left:1cm;}
          .CHAPTER-AGENCY, .CHAPTER-AVAIL {display:block;text-indent:1cm;text-align:left;margin-bottom:5px;width:80%;}
          .CHAPTER-CFRHD {text-align:right;display:block;margin-right:1cm;margin-bottom:5px}          
          .CUSTOM-CHAPTER-PUBLI {font-style:normal;}
          .CUSTOM-CHAPTER-CFRNO {font-style:normal;}         
          .CHAPTER-CFRNO-MAINCONTAINER {margin-top:-33px;width:1200px;}
          .CHAPTER-CFRNO-MAINCONTAINER2 {margin-bottom:10px;width:1200px;clear:both;}
          .CHAPTER-CFRNO-SIDECONTAINER {width:350px;padding:10px;margin:0px;float:left;}
          .CHAPTER-CFRNO-CONTENTCONTAINER {width:400px;padding:10px;text-align:right;margin:0px;float:left;}	
          .CUSTOM-CHAPTER-CFRNO-DUMP {text-align:right;}
          .CHAPTER-PUBLI-CONTAINER {text-align:left;width:650px;padding:5px;display:block;}
          .CHAPTER-ANOTE {text-indent:1cm;display:block;margin-bottom:10px} 
          .FAIDS-HED {margin-top:10px;display:block;}
          .FAIDS-SUBJECT {text-indent:1cm;display:block;text-align:left;margin-top:10px;}
          .FAIDS-PG  {position:absolute;right:5cm;margin-top:-17px;text-align:right;}
          .CHAPINDX-SUBJECT {display:block;text-align:left;margin-top:10px;font-weight:bold;width:100%;}
          .CHAPINDX-SUBJL {display:inline;text-indent:1cm;display:block;text-align:left;margin-top:10px;}
          .CHAPINDX-PT {display:inline;text-align:right;}          
          .LSA-PUBYEAR {display:block;margin-top:2cm;margin-bottom:2cm;text-align:center;}          
          .CFRGRANULE-APPHED, .CFRGRANULE-APP, .CFRDOC-APPHED, .CFRDOC-APP {display:block;text-indent:1cm;text-align:left;width:60%;}
          .CFRGRANULE-PG, .CFRDOC-PG {text-align:right;display:block;margin-right:6cm;margin-top:-22px;}          
          .CHAPINDX-HED, .BLMINDEX-ALPHHD, .CHAPINDX-ALPHHD {text-align:center;width:100%;font-weight:bold;display:block;font-size:14pt;margin-bottom:20px;margin-top:10px;}
          .BLMINDEX-HD2, .BLMINDEX-HD {text-align:left;display:block;text-indent:2cm;margin-top:10px;}
          .BLMINDEX-STUB {display:block;text-align:right;margin-right:1cm;margin-top:-18px;}
          .CROSSREF-HED {display:block;text-align:left;margin-left:1cm;}          
          .REGINDEX-INDEXHD {text-align:center;font-weight:bold;display:block;font-size:12pt;margin-bottom:20px;margin-top:20px;}
          .REGINDEX-ALPHHD {margin-left:3cm;text-align:left;font-weight:bold;display:block;font-size:12pt;margin-bottom:20px;margin-top:1cm;}
          .REGINDEX-FP {text-transform:uppercase;margin-top:1cm;}          
          .PUBYEAR-YEAR {text-align:center;font-weight:bold;display:block;font-size:14pt;margin-bottom:20px;}
          .PUBYEAR-CFRNO {text-align:left;font-weight:bold;display:block;font-size:12pt;margin-bottom:20px;}
          .PUBYEAR-VOLHD {text-align:right;display:block;font-size:10pt;margin-bottom:20px;margin-top:-42px;}
          .PUBYEAR-PGHD {text-align:right;display:block;font-size:10pt;margin-bottom:20px;margin-top:-19px;}
          .PUBYEAR-REV, .PUBYEAR-CHAPNO, .PUBYEAR-ENTRY {text-align:left;display:block;font-size:12pt;}
          .PUBYEAR-PG {text-align:right;display:block;font-size:12pt;margin-top:-20px;}
          .PUBYEAR-MOREPGS {text-indent:2cm;text-align:center;border:1px solid black;display:block;padding:10px;width:80%;margin:20px;}          
          .PUBLI1-SU {font-size:8pt;font-style:italic;margin-left:2px;margin-right:2px;vertical-align:super}
          .FP-SU, .P-SU {font-size:8pt;font-style:italic;margin-left:2px;margin-right:2px;vertical-align:super}
          .P-FR {font-size:8pt}
          .SECTION-FTNT {text-indent:1cm;font-size:8pt;font-style:italic;display:block;text-decoration:overline}          
          .TITLEHD-HED {display:block;font-weight:bold;font-size:22pt;text-align:center;margin-top:3cm;margin-bottom:1cm;border-bottom-style:double;border-width:3px;}
          .BLMINDEX-HED, .CHAPTER-HED, .TOCTAC-HED, .SUBTITLE-HED, .TOCHD-HED {font-size:22pt;display:block;border-bottom-style:double;border-width:2px; border-color:black;margin-top:2cm;text-align:center;}          
          .PART-HED {font-weight:bold;font-size:12pt;display:block;margin-top:1cm;margin-bottom:1cm;text-align:center;}
          .PART-RESERVED {font-weight:bold;font-size:12pt;display:block;margin-top:3cm;margin-bottom:3px;text-align:center;}
          .APPENDIX-LHD1, .APPENDIX-HD3, .APPENDIX-HD1, .APPENDIX-HED {font-weight:bold;display:block;font-size:12pt;text-align:left;margin-bottom:10px;margin-top:10px}        
          .APPENDIX-HD2 {font-weight:bold;display:block;font-size:12pt;text-align:center;margin-bottom:10px;margin-top:10px}        
          .SIDEHED-HED {text-indent:1cm;display:block;font-size:12pt;text-align:left;margin-bottom:10px;margin-top:10px}
          .SUBPART-APP {text-align:center;font-size:12pt;margin-top:20pt;margin-bottom:10pt;display:block;}   
          .SUBJGRP-HED {font-size:12pt;margin-bottom:20pt;margin-top:25pt;display:block;font-weight:bold;width:80%;}   
          .CONTENTS-APP {display:block;text-align:left;margin-top:1cm;text-indent:2cm;font-weight:bold;}                   
          .SECTION-SECTNO {font-weight:bold;text-align:left;width:15%;float:left;}                   
          .SECTION-SUBJECT {font-weight:bold;width:70%;}      
          .SECTION-RESERVED {font-weight:bold;width:70%;}          
          .SUBJGRP-SECTNO, .CONTENTS-SECTNO {font-weight:bold;display:block;text-align:left;width:15%;float:left;}                   
          .SUBJGRP-SUBJECT,.AUTH-SOURCE-P, .CONTENTS-SUBJECT {width:90%;display:block;text-align:left;}  
          .SOURCE-HED, .AUTH-HED {font-weight:bold;display:block;text-align:left;width:15%;float:left;}          
          .INCORP-REV, .BLMINDEX-DATE, .TOCTAC-REV {font-weight:bold;font-size:8pt;text-align:center;display:block;}
          .ALPHLIST-AGHD {font-weight:bold;text-align:left;margin-left:1cm;display:block;width:30%;float:left;}
          .ALPHLIST-AGENCY {text-align:left;display:block;width:70%;float:left;}
          .ALPHLIST-SUBAGCY {text-align:left;margin-left:1cm;display:block;width:65.7%;float:left;}
          .ALPHLIST-CFRHD {font-weight:bold;text-align:right;display:block;width:90%;}
          .ALPHLIST-CFRID {text-align:right;display:block;width:90%;}                     
          .LSA-LRH {text-align:left;float:left;width:30%;display:block;clear:both;}
          .LSA-RRH {float:left;width:50%;display:block;}          
          .GID {font-family:Sans-serif;font-size:10pt;margin-top:2pt;margin-bottom:6pt;display:block;}         
          .ALPHLIST-REV {text-align:center;font-weight:bold; font-size:8pt;display:block;margin-bottom:1cm;width:80%;}          
          .TOCTAC-CHHD, .APPENDIX-EAR, .CHAPTER-LRH, .CHAPTER-RRH, .TITLE-LRH, .TITLE-RRH, .PART-EAR {display:none;}          
          .CFRGRANULE-LRH,.CFRDOC-LRH, .CFRGRANULE-RRH,.CFRDOC-RRH {display:none;}
          .FAIDS-P, .EFFDNOTP-P, .APPENDIX-P, .AUTH-P, .SOURCE-P, .SIDEHED-P, .THISTITL-P, .SECTION-P, .EXTRACT-P {text-indent:1cm;display:block;text-align:left;margin-top:5pt;margin-bottom:5pt;}
          .CHAPINDX-FP {text-indent:2cm;display:block;text-align:left;margin-top:5pt;margin-bottom:5pt;width:100%;}  
          .APPENDIX-FP {text-indent:1cm;display:block;text-align:left;margin-top:5pt;margin-bottom:5pt;font-style:italic;}
          .CHAPTI-PT {text-align:left;width:5%;float:left;display:inline;clear:left;}          
          .CFRGRANULE-PTHD, .CFRDOC-PTHD {text-align:left;font-style:italic;width:40%;display:block;float:left;}          
          .CFRGRANULE-PGHD, .CFRDOC-PGHD {text-align:right;margin-right:1cm;font-style:italic;width:45%;display:block;float:left;}
          .TOC-PTHD {text-indent:1cm;display:block;font-style:italic;margin-top:20pt;}          
          .EFFDNOTP-HED {text-indent:2cm;text-align:left;}          
          .AUTH-SOURCE-P {text-indent:3cm;display:block;}          
          .EXPLAP.SIDEHEDP {text-indent:1cm;display:block;}          
          .TITLENO-SUBTITL {text-transform:uppercase;margin-top:15px;display:block;text-align:left;margin-bottom:15px;width:90%;}          
          .TITLENO-HED  {margin-top:15px;display:block;}                
          .TITLENO-RESERVED {font-size:18px;margin-bottom:15px;margin-top:15px;display:block;font-weight:bold;}
          .MyTITLENO-HED {font-size:18px;margin-bottom:15px;margin-top:15px;display:block;font-weight:bold;width:90%;}
          .SUBPART-SECTNO {display:block;text-align:left;font-weight:bold;float:left;width:15%;}
          .SUBPART-SUBJECT {display:block;text-align:left;width:75%;}          
          .TITLENO-SUBJECT {text-indent:2cm;display:block;text-align:left;}
          .SUBJECT-PREVCHAPNO {text-indent:1px;display:block;text-align:left;width:90%;}
          .TITLENO-CHAPNO {display:block;text-align:left;width:10%;float:left;}          
          .SUBJGRP-SECHD, .SUBPART-SECHD {display:block;text-align:left;font-weight:bold;}          
          .CONTENTS-SECHD {display:block;text-align:left;font-weight:bold;}
          .MyRESERVED {font-weight:bold;display:block;font-size:12pt;text-align:left;margin-top:10px;margin-bottom:10px;}          
          .SUBPART-HED {font-weight:bold;display:block;font-size:12pt;text-align:left;margin-top:20px;margin-bottom:10px;}          
          .EXPL {display:block;width:500px;}
          .EXPL {width:100%;}
          .IPAR-P {margin-left:1cm;text-align:left;float:left;width:30%;}
          .IPAR-STUB {margin-right:1cm;width:30%;float:left;clear:right;}           
          
          <!--  CITE SECTION  -->
          .CFRGRANULE-CITE, .CFRDOC-CITE {margin-left:5cm;display:block;font-style:italic;font-size:12pt;width:50%;border-bottom-style:double;border-top-style:double;border-width:2px;margin-top:6cm;margin-bottom:6cm;text-align:center;}
          .CITE-CITEP {display:block;font-style:italic;margin-top:10px;margin-bottom:10px;}
          .E-01 {font-size:12pt;font-weight:bold;margin-left:8px;font-style:normal;}                  
          .E {font-weight:bold;font-style:normal;}
          .E-02 {font-weight:bold;font-style:normal;font-size:12pt;}
          .E-03, .URL {margin-left:0.5cm;font-style:italic;}
          .E-04 {margin-left:0.2cm;font-weight:bold;}
          .E-05 {margin-left:1.5cm;font-variant:small-caps;}
          .E-15 {font-variant:small-caps;}
          .E-22, .E-52 {font-size:6pt;vertical-align:sub;}
          .E-51 {font-size:6pt;vertical-align:top;}
	  
	        .CFRGRANULE-FP, .CFRDOC-FP, .CFRGRANULE-AMDPAR, .CFRDOC-AMDPAR, .HED-P, .HD1-P, .P {margin-left:1cm;text-align:left;display:block;margin-top:10px;margin-bottom:10px;clear:both;}	 
	        .SSAINDEX-HED-P {text-indent:1cm;text-align:left;}	 
	        .MyP {text-indent:1cm;text-align:left;display:block;}
	        .APPENDIX-CITA, .CITA {text-indent:1cm;text-align:left;margin-top:5pt;margin-bottom:20pt;} 	 
          <!-- GPO Tables -->
          .GPOTABLE {margin-top:10pt;margin-bottom:10pt;margin-left:1cm;display:block;border-collapse:collapse;empty-cells:show;border-bottom-style:solid;border-top-style:solid;border-width:1px;border-color:black;}
          .GPOTABLE-TTITLE {text-align:center}			
          .CHED {font-size:8pt;padding:5px;font-weight:bold;border-top-style:solid;border-bottom-style:solid;border-width:1px; border-color:black;}
          .ENT {font-size:8pt;padding:5px;}
          .TNOTE {font-size:8pt;padding-left:15px;}
          .TRPRTPAGE, .TDPRTPAGE {width:100%;} 
	  
	        .OMBNOS {display:block;margin-top:30px;margin-bottom:30px;}
	        .OMBNOS-LRH, .OMBNOS-RRH, .REDES-LRH, .REDES-RRH, .REGINDEX-LRH, .REGINDEX-RRH, .SUBCHIND-LRH, .SUBCHIND-RRH  {display:block;margin-top:10px;margin-bottom:10px;width:100%;text-align:center;font-weight:bold;font-size:14pt;}
	        .OMBNOS-HED, .REDES-HED, .REGINDEX-HED, .SUBCHIND-HED, .SUBJIND-HED {display:block;margin-top:50px;margin-bottom:5px;width:100%;text-align:center;font-weight:bold;font-size:18pt;}
	        .ONOTE {display:block;margin-top:20px;text-indent:1.5cm}
	        .SECTION-PARAUTH {display:block;margin-top:10px;text-indent:2cm;font-size:8pt;}
	        .APPENDIX-PARTHD {display:block;margin-top:10px;width:100%;text-align:center;font-weight:bold}	 
	        .PUBYEAR-REG {display:block;width:100%;text-align:center;} 
	        .EDNOTE, .WEDNOTE {display:block;width:100%;text-align:center;margin-top:20px;}
	        .EDNOTE-HED, .WEDNOTE-HED {text-transform:uppercase;}
	        .EDNOTEP, .WEDNOTEP {display:inline;text-indent:0cm;text-align:center;margin-right:0cm;margin-left:0cm;}    
	        .RESCIS-HED {text-transform:uppercase;display:block;width:100%;text-align:center;margin-top:20px;}
	        .SCOL2 {display:block;margin-top:15px;margin-bottom:15px;}
	        .SCOL2-LI {display:block;text-indent:2cm;}
	        .SUBCHPHD {display:block;margin-top:25px;margin-bottom:5px;width:100%;text-align:center;font-weight:bold;font-size:12pt;}
	        .SUBJIND-EAR {display:none}
	        .CHAPINDX-LRH, .CHAPINDX-RRH {display:block;margin-top:10px;margin-bottom:10px;width:100%;text-align:center;font-weight:bold;font-size:14pt;}
	        .ALPHHD {display:block;margin-top:50px;margin-bottom:5px;width:100%;text-align:center;font-weight:bold;font-size:18pt;}	 
	        .CHAPINDX-PT {text-align:right;position:absolute;right:50px;}
	        .CHAPINDX-SUBJ1L, .CHAPINDX-SUBJECT1 {margin-left:20px;margin-top:5px;}
	        .CHAPINDX-SUBJ2L, .CHAPINDX-SUBJECT2 {margin-left:40px;margin-top:5px;}
	        .CHAPINDX-SUBJ3L, .CHAPINDX-SUBJECT3 {margin-left:60px;margin-top:5px;}
	        .CHAPINDX-PT-P {margin-top:10px;margin-bottom:10px;}
	        .SUBPUBLI {display:block;text-indent:0.5cm;margin-top:5px;margin-bottom:5px;}
	        .TCAP {display:block;width:100%;text-align:center;margin-top:10px;}
	        .TDESC {display:block;width:100%;text-align:center;font-size:8pt;}
	        .SUBTI2 {display:block;margin-top:20px;margin-bottom:10px;width:100%}
	        .SUBTI2-HED {margin-left:40px;}
	        .SUBTI2-PG {text-align:right;position:absolute;right:6.5cm;}
	 
	        .CFRGRANULE-ABBREV, .CFRDOC-ABBREV {float:left;display:block;width:15%;clear:both;text-align:left;}
	        .CFRGRANULE-NAME, .CFRDOC-NAME {margin-bottom:10px;float:left;display:block;width:85%;text-align:left;}
	 
	        /* Page Header */
	        .PGHEAD {width:100%;margin-top:24pt;margin-bottom:0pt;margin-left:0pt;margin-right:0pt;text-indent:0cm;font-style:normal;}
	        .PGHDRCOLLECTION {font-weight:bold;}
	        .PGLABEL {text-align:left;font-size:10pt;}			
	        .PRTPAGE {text-align:right;font-weight:bold;position:absolute;right:50px;font-size:11pt;}
	        .PRTPAGELN1 {width:100%;border-bottom-style:solid;border-width:6px;border-color:black;padding-bottom:3pt;}
	        .PRTPAGELN2 {width:100%;border-bottom-style:solid;border-width:1px;border-color:black;margin-bottom:24pt;padding-bottom:3pt;}
 
        </style>
      </head>
      <body style="margin-left:50px;margin-right:50px;">
            <center>
               <H1>Code of Federal Regulations</H1>
            </center>
            <xsl:apply-templates/>
      </body>        
    </html>
  </xsl:template>
  
  <xsl:template match="PG">
    <xsl:variable name="pgheader" select="child::PRTPAGE"/>
    <xsl:call-template name="apply-span"/>
    <br/>
    <xsl:if test="$pgheader">
      <xsl:call-template name="APPLY-PGHEADER">
        <xsl:with-param name="pgnode" select="$pgheader"/> 
      </xsl:call-template>      
    </xsl:if>
    <br/>
  </xsl:template>
  
  <xsl:template match="RESERVED">
      <xsl:call-template name="apply-span"/>
      <br/>
  </xsl:template>
    
  <xsl:template match="SECTION/CITA">
    <xsl:variable name="pgheader" select="child::PRTPAGE"/>
    <table>
      <xsl:attribute name="class">
        <xsl:value-of select="name()"/>      
      </xsl:attribute>
      <xsl:apply-templates/>
    </table>
    <xsl:if test="$pgheader">
      <xsl:call-template name="APPLY-PGHEADER">
        <xsl:with-param name="pgnode" select="$pgheader"/> 
      </xsl:call-template>      
    </xsl:if>    
  </xsl:template>
  
  <xsl:template match="CITA | FL-2">
    <xsl:variable name="pgheader" select="child::PRTPAGE"/>
    <xsl:call-template name="apply-span"/>
    <xsl:if test="$pgheader">
      <xsl:call-template name="APPLY-PGHEADER">
        <xsl:with-param name="pgnode" select="$pgheader"/> 
      </xsl:call-template>      
    </xsl:if>
  </xsl:template>

  <xsl:template match="SECTNO">
    <xsl:variable name="pgheader" select="child::PRTPAGE"/>
    <xsl:call-template name="apply-span"/>
    <br/>
    <xsl:if test="$pgheader">
      <xsl:call-template name="APPLY-PGHEADER">
        <xsl:with-param name="pgnode" select="$pgheader"/> 
      </xsl:call-template>      
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="SUBPART/RESERVED">
            <span class="MyRESERVED"><xsl:value-of select="."/></span>
  </xsl:template>
  
  <xsl:template match="GPOTABLE">
    <table>
      <xsl:attribute name="class">
        <xsl:value-of select="name()"/>      
      </xsl:attribute>
      <xsl:apply-templates/>
    </table>
  </xsl:template>

  <xsl:template match="TTITLE">
    <xsl:choose>
      <xsl:when test="not(node())">
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="apply-span"/>
      </xsl:otherwise>
    </xsl:choose>    
  </xsl:template>
  
  <xsl:template match="BOXHD | ROW">
    <xsl:variable name="pgheader" select="descendant::PRTPAGE"/>
    <tr>
      <xsl:attribute name="class">
        <xsl:value-of select="name()"/>      
      </xsl:attribute>
      <xsl:apply-templates/>
    </tr>
    <xsl:if test="$pgheader">
      <xsl:variable name="columns" select="(ancestor::GPOTABLE)[last()]/@COLS"/>
      <tr class="TRPRTPAGE">
        <td class="TDPRTPAGE">
          <xsl:attribute name="colspan">
            <xsl:value-of select="$columns"/>      
          </xsl:attribute>            
          <xsl:call-template name="APPLY-PGHEADER">
            <xsl:with-param name="pgnode" select="$pgheader"/>
          </xsl:call-template>          
        </td>
      </tr>              
    </xsl:if>                    
  </xsl:template>
  
  <xsl:template match="TNOTE | TDESC | SIGDAT">
    <tr>
      <td>
        <xsl:attribute name="class">
          <xsl:value-of select="name()"/>      
        </xsl:attribute>
        <xsl:apply-templates/>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template match="CHED">
    <th>
      <xsl:attribute name="class">
        <xsl:value-of select="name()"/>      
      </xsl:attribute>
      <xsl:apply-templates/>
    </th>
  </xsl:template>
  
  <xsl:template match="ENT">
    <td>
      <xsl:attribute name="class">        
        <xsl:value-of select="name()"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </td>
  </xsl:template>
  
  <xsl:template match="HD">
    <xsl:choose>  
      <xsl:when test="./@SOURCE">
        <xsl:variable name="collapseSource" select="./@SOURCE"/>
       <span>
          <xsl:attribute name="class">
            <xsl:value-of select="name()"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="name(parent::*)"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="$collapseSource"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <span>
          <xsl:attribute name="class">
            <xsl:value-of select="name()"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="name(parent::*)"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="name()"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </span>
      </xsl:otherwise>    
    </xsl:choose>    
  </xsl:template>
  
    
  <xsl:template match="P">
    <xsl:variable name="pgheader" select="child::PRTPAGE"/>
    <xsl:variable name="precedingSib" select="(preceding-sibling::*)[last()]/@SOURCE"/>
    <xsl:choose>
      <xsl:when test="$precedingSib='HED'">
        <span><xsl:attribute name="class"><xsl:value-of select="name(parent::*)"/><xsl:value-of select="name()"/><xsl:text> </xsl:text><xsl:value-of select="$precedingSib"/>-P</xsl:attribute>
          <xsl:apply-templates/>
          <xsl:if test="not(name(parent::*)='SEE')"><p/></xsl:if>
        </span>
        <xsl:if test="$pgheader">
          <xsl:call-template name="APPLY-PGHEADER">
            <xsl:with-param name="pgnode" select="$pgheader"/> 
          </xsl:call-template>      
        </xsl:if>                
      </xsl:when>
      <xsl:when test="$precedingSib='HD1'">
        <span>
          <xsl:attribute name="class">
            <xsl:value-of select="name(parent::*)"/>
            <xsl:value-of select="name()"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$precedingSib"/>-P</xsl:attribute>
          <xsl:apply-templates/>
        </span>
        <xsl:if test="$pgheader">
          <xsl:call-template name="APPLY-PGHEADER">
            <xsl:with-param name="pgnode" select="$pgheader"/> 
          </xsl:call-template>      
        </xsl:if>                
      </xsl:when>
      <xsl:otherwise>
        <span class="P">
          <xsl:apply-templates/>
        </span>
        <xsl:if test="$pgheader">
          <xsl:call-template name="APPLY-PGHEADER">
            <xsl:with-param name="pgnode" select="$pgheader"/> 
          </xsl:call-template>      
        </xsl:if>                
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="EXPLA/IPAR/P">
    <xsl:variable name="pgheader" select="child::PRTPAGE"/>
    <span class="IPAR-P"><xsl:value-of select="."/></span>
    <xsl:if test="$pgheader">
      <xsl:call-template name="APPLY-PGHEADER">
        <xsl:with-param name="pgnode" select="$pgheader"/> 
      </xsl:call-template>      
    </xsl:if>        
  </xsl:template>
  
  <xsl:template match="EXPLA/SIDEHED/HD/P">
    <xsl:variable name="pgheader" select="child::PRTPAGE"/>
    <span class="HED-PP"><xsl:value-of select="."/></span>
    <xsl:if test="$pgheader">
      <xsl:call-template name="APPLY-PGHEADER">
        <xsl:with-param name="pgnode" select="$pgheader"/> 
      </xsl:call-template>      
    </xsl:if>        
  </xsl:template>
  
  <xsl:template match="AUTH/P | SOURCE/P | EFFDNOTP/P">
    <xsl:variable name="pgheader" select="child::PRTPAGE"/>
    <span class="AUTH-SOURCE-P"><xsl:value-of select="."/></span>
    <xsl:if test="$pgheader">
      <xsl:call-template name="APPLY-PGHEADER">
        <xsl:with-param name="pgnode" select="$pgheader"/> 
      </xsl:call-template>      
    </xsl:if>        
  </xsl:template>
  
  <xsl:template match="E">
    <span>
      <xsl:attribute name="class">E-<xsl:value-of select="@T"/></xsl:attribute>  
      <xsl:apply-templates/>	
    </span>
  </xsl:template>      
  
  <xsl:template match="CFRTOC/CHAPTI/SUBJECT">
    <xsl:variable name="pgheader" select="child::PRTPAGE"/>
    <span class="CHAPTI-SUBJECT"><xsl:value-of select="."/></span>
    <xsl:if test="$pgheader">
      <xsl:call-template name="APPLY-PGHEADER">
        <xsl:with-param name="pgnode" select="$pgheader"/> 
      </xsl:call-template>      
    </xsl:if>       
  </xsl:template>
      
  <xsl:template match="TOCTAC/TITLENO/HD">
    <span class="MyTITLENO-HED"><xsl:value-of select="."/></span>
  </xsl:template>
  
  <xsl:template match="SSAINDEX/ACQRUL/P/E[@T='04']">
    <span class="ACQRUL-E-04"><xsl:value-of select="."/></span>
  </xsl:template>
  
  <xsl:template match="SSAINDEX/ACQRUL/AR/PUBLI/E[@T='03']">
    <span class="ACQRUL-E-03"><xsl:value-of select="."/></span>
  </xsl:template>  
  
  
  <xsl:template match="SSAINDEX/ACQRUL/AR/NOTE/HD | SSAINDEX/EDNOTE/HD | BMTR/BLMINDEX/EDNOTE/HD | CHAPINDX/EDNOTE/HD">
    <span class="EDNOTE-NOTE-HED"><xsl:value-of select="."/></span>
  </xsl:template>
    
  <xsl:template match="CHAPTER/PUBLI | CHAPTER/PUBLI1">
    <div class="CHAPTER-PUBLI-CONTAINER">
            <span class="CUSTOM-CHAPTER-PUBLI"><xsl:value-of select="."/></span>
    </div>   
  </xsl:template>  
  
  <xsl:template match="GPH/GID">
    <span class="GID">		
      [IMAGE ONLY IN PDF:<xsl:text> </xsl:text><xsl:value-of select="."/>] 
    </span>
  </xsl:template>  
  
  <xsl:template match="MATH/MID">
      <span class="MATH-MID">		
        [FORMULA CAN BE SEEN ONLY IN PDF:<xsl:text> </xsl:text><xsl:value-of select="."/>] 
      </span>
  </xsl:template>  
  
  
  
  <!--
  <xsl:template match="FDSYS/VOL">
      <span class="FDSYS-VOL">		
        Volume:<xsl:text> </xsl:text><xsl:value-of select="."/>
      </span>
  </xsl:template>
  
  <xsl:template match="FDSYS/DATE">
        <span class="FDSYS-DATE">		
          Date:<xsl:text> </xsl:text><xsl:value-of select="."/>
        </span>
  </xsl:template>
  
  <xsl:template match="FDSYS/ORIGINALDATE">
        <span class="FDSYS-ORIGINALDATE">		
          Original Date:<xsl:text> </xsl:text><xsl:value-of select="."/>
        </span>
  </xsl:template>
  
  <xsl:template match="FDSYS/TITLE">
        <span class="FDSYS-TITLE">		
            Title:<xsl:text> </xsl:text><xsl:value-of select="."/>
        </span>
  </xsl:template>
  
  <xsl:template match="FDSYS/GRANULENUM">
        <span class="FDSYS-GRANULENUM">		
            Granule Num. :<xsl:text> </xsl:text><xsl:value-of select="."/> 
        </span>
  </xsl:template>
  
  <xsl:template match="FDSYS/HEADING">
        <span class="FDSYS-HEADING">		
            Heading:<xsl:text> </xsl:text><xsl:value-of select="."/>
        </span>
  </xsl:template>  
  
  -->
  
  
  
  
  
  <xsl:template match="CHAPTER/CFRNO">
    <div class="CHAPTER-CFRNO-MAINCONTAINER">
    	<div class="CHAPTER-CFRNO-SIDECONTAINER">
    		<span class="CUSTOM-CHAPTER-CFRNO-DUMP"></span>
    	</div>
    	<div class="CHAPTER-CFRNO-SIDECONTAINER">
    		<span class="CUSTOM-CHAPTER-CFRNO-DUMP"></span>
    	</div>
    	<div class="CHAPTER-CFRNO-CONTENTCONTAINER">
    		<span class="CUSTOM-CHAPTER-CFRNO"><xsl:value-of select="."/></span>
    	</div>
    	<div class="CHAPTER-CFRNO-MAINCONTAINER2">
	    		<span class="CUSTOM-CHAPTER-CFRNO-DUMP"></span>
    	</div>
    </div>   
  </xsl:template>
 
  <xsl:template match="SUBJL">
    <xsl:choose>  
      <xsl:when test="./@SOURCE">
        <xsl:variable name="collapseSource" select="./@SOURCE"/>
        <span>
          <xsl:attribute name="class">
            <xsl:value-of select="name()"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="name(parent::*)"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="$collapseSource"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <span>
          <xsl:attribute name="class">
            <xsl:value-of select="name()"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="name(parent::*)"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="name()"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </span>
      </xsl:otherwise>    
    </xsl:choose>    
  </xsl:template>
  
  <xsl:template match="PT">
    <xsl:choose>  
      <xsl:when test="name(parent::*)='CHAPINDX'">
        <span>
          <xsl:attribute name="class">
            <xsl:value-of select="name()"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="name(parent::*)"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="name()"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </span>
        <p class="CHAPINDX-PT-P"/>        
      </xsl:when>
      <xsl:otherwise>
        <span>
          <xsl:attribute name="class">
            <xsl:value-of select="name()"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="name(parent::*)"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="name()"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </span>
      </xsl:otherwise>    
    </xsl:choose>    
  </xsl:template>

  <xsl:template match="SUBJECT" priority="-5">
    <xsl:variable name="pgheader" select="child::PRTPAGE"/>    
    <xsl:variable name="precedingSibName" select="name((preceding-sibling::*)[last()])"/>    
    <span>
      <xsl:attribute name="class">
        <xsl:value-of select="name()"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="name(parent::*)"/>-<xsl:value-of select="name()"/>
        <xsl:if test="($precedingSibName='CHAPNO')"> 
          <xsl:text> </xsl:text>
          <xsl:text>SUBJECT-PREVCHAPNO</xsl:text>
        </xsl:if> 
        <xsl:if test="./@SOURCE"> 
          <xsl:text> </xsl:text>          
          <xsl:value-of select="name(parent::*)"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="./@SOURCE"/>          
        </xsl:if>         
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
    <xsl:if test="$pgheader">
      <xsl:call-template name="APPLY-PGHEADER">
        <xsl:with-param name="pgnode" select="$pgheader"/> 
      </xsl:call-template>      
    </xsl:if>    
  </xsl:template>
  
  <xsl:template match="PRTPAGE">
    <xsl:choose>  
      <xsl:when test="ancestor::BOXHD or ancestor::ROW"/> <!-- Ignores Tag, Already processed in another Template -->             
      <xsl:when test="parent::PG"/> <!-- Ignores Tag, Already processed in another Template -->       
      <xsl:when test="parent::SUBJECT"/> <!-- Ignores Tag, Already processed in another Template -->        
      <xsl:when test="parent::P"/> <!-- Ignores Tag, Already processed in another Template -->        
      <xsl:when test="parent::CITA"/> <!-- Ignores Tag, Already processed in another Template -->    
      <xsl:when test="parent::FL-2"/> <!-- Ignores Tag, Already processed in another Template -->          
      <xsl:when test="parent::SECTNO"/> <!-- Ignores Tag, Already processed in another Template -->          
      <xsl:otherwise>
        <xsl:call-template name="APPLY-PGHEADER"/>        
      </xsl:otherwise>  
    </xsl:choose>    
  </xsl:template>
  
  <xsl:template name="APPLY-PGHEADER">
    <xsl:param name="pgnode" select="."/>
    <xsl:choose>  
      <xsl:when test="$pgnode/@P">
        <xsl:variable name="pagenum" select="$pgnode/@P"/>
        <div class="PGHEAD">          
          <div class="PRTPAGELN2">
            <div class="PRTPAGELN1">
              <span class="PGLABEL">
                <span class="PGHDRCOLLECTION">
                  <xsl:value-of select="$gpocollection"/> 
                </span>
                <xsl:if test="$cfrnumber and $cfrtitle"> 
                  <span class="PGHDRDLIMIT"><xsl:text> / </xsl:text></span> 
                  <span class="PGHDRREFERENCE">
                    Title <xsl:value-of select="$cfrnumber"/>
                    <xsl:text> - </xsl:text>
                    <xsl:value-of select="$cfrtitle"/> 
                    <xsl:text> </xsl:text>  
                  </span>
                </xsl:if>
                <xsl:if test="$cfrvolume">
                  <span class="PGHDRDLIMIT"><xsl:text> / </xsl:text></span>
                  Vol. <xsl:value-of select="$cfrvolume"/>
                </xsl:if>
                <xsl:if test="$cfrdate">
                  <span class="PGHDRDLIMIT"><xsl:text> / </xsl:text></span>
                  <span class="PGHDRDATE">
                    <xsl:value-of select="$cfrdate"/> 
                  </span>
                </xsl:if>
              </span>
              <span>
                <xsl:attribute name="class">
                  <xsl:value-of select="name($pgnode)"/>      
                </xsl:attribute>          
                <xsl:value-of select="$pagenum"/>  
              </span>
            </div>          
          </div>
        </div>  
      </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise>    
    </xsl:choose>          
  </xsl:template>
  
  
  
  <xsl:template match="CFRGRANULE/FDSYS | CFRDOC/FDSYS">
          <xsl:call-template name="APPLY-FDSYS"/>
  </xsl:template>
  
  
  <xsl:template name="APPLY-FDSYS">
     <div class="CFRFDSYS"><div class="FDSYSLINE"/></div>
     <div class="CFRFDSYS">
        <xsl:if test="$cfrnumber and $cfrtitle"><span class="FDSYSNUMTITLE1">Title <xsl:value-of select="$cfrnumber"/><xsl:text> - </xsl:text><xsl:value-of select="$cfrtitle"/></span></xsl:if>
     </div>
     <div class="CFRFDSYS"><div class="FDSYSLINE"/></div>
     <div class="CFRFDSYS">
        <xsl:if test="$cfrvolume"><span class="FDSYSVOLUME">Volume: <xsl:value-of select="$cfrvolume"/></span></xsl:if>
	<xsl:if test="$cfrdate"><span class="FDSYSDATE">Date: <xsl:value-of select="$cfrdate"/></span></xsl:if>
	<xsl:if test="$cfrdate"><span class="FDSYSORIGDATE">Original Date: <xsl:value-of select="$cfrorigdate"/></span></xsl:if>
	<xsl:if test="$cfrdate"><span class="FDSYSHEADINGTITLE2">Title: <xsl:value-of select="$cfrheading"/><xsl:text> - </xsl:text><xsl:value-of select="$cfrtitle2"/></span></xsl:if>
	<xsl:if test="$cfrancestors"><xsl:call-template name="APPLY-ANCESTORS"/></xsl:if>
     </div>
     <div class="CFRFDSYS"><div class="FDSYSLINE"/></div>
  </xsl:template>
  
  <xsl:template name="APPLY-ANCESTORS">
     <span class="FDSYSANCESTORS">Context:
     <xsl:variable name="parentChildren" select="./ANCESTORS/child::PARENT"/>    
        <xsl:for-each select="$parentChildren">
            <xsl:value-of select="./@HEADING"/><xsl:text> - </xsl:text><xsl:value-of select="."/><xsl:text>. </xsl:text>
        </xsl:for-each>     
     </span>  
  </xsl:template> 
  
  
  
  <!-- Default Template Handling -->
  <xsl:template match="*" priority="-10">
    <xsl:choose>
      <xsl:when test="not(node())">
        
        <!--  DEBUG: Enable to detect empty tags.
        <span>
          [EMPTY-NODE <xsl:value-of select="name()"/>]  
        </span>
        -->
        
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="apply-span"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
 
  <xsl:template name="apply-span">
    <span>
      <xsl:attribute name="class">
        <xsl:value-of select="name()"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="name(parent::*)"/>-<xsl:value-of select="name()"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>	
  </xsl:template>
  
</xsl:stylesheet>