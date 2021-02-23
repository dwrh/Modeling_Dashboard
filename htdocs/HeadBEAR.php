<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
   <head>
      <title>Berkeley Economic Advising and Research</title>
         <script type="text/javascript">
  // <![CDATA[


/***********************************************
* IFrame SSI script II- S Dynamic Drive DHTML code library (http://www.dynamicdrive.com)
* Visit DynamicDrive.com for hundreds of original DHTML scripts
* This notice must stay intact for legal use
***********************************************/

//Input the IDs of the IFRAMES you wish to dynamically resize to match its content height:
//Separate each ID with a comma. Examples: ["myframe1", "myframe2"] or ["myframe"] or [] for none:
var iframeids=["myframe"]

//Should script hide iframe from browsers that don't support this script (non IE5+/NS6+ browsers. Recommended):
var iframehide="yes"

var getFFVersion=navigator.userAgent.substring(navigator.userAgent.indexOf("Firefox")).split("/")[1]
var FFextraHeight=parseFloat(getFFVersion)>=0.1? 16 : 0 //extra height in px to add to iframe in FireFox 1.0+ browsers

function resizeCaller() {
var dyniframe=new Array()
for (i=0; i<iframeids.length; i++){
if (document.getElementById)
resizeIframe(iframeids[i])
//reveal iframe for lower end browsers? (see var above):
if ((document.all || document.getElementById) && iframehide=="no"){
var tempobj=document.all? document.all[iframeids[i]] : document.getElementById(iframeids[i])
tempobj.style.display="block"
}
}
}

function resizeIframe(frameid){
var currentfr=document.getElementById(frameid)
if (currentfr && !window.opera){
currentfr.style.display="block"
if (currentfr.contentDocument && currentfr.contentDocument.body.offsetHeight) //ns6 syntax
currentfr.height = currentfr.contentDocument.body.offsetHeight+FFextraHeight; 
else if (currentfr.Document && currentfr.Document.body.scrollHeight) //ie5+ syntax
currentfr.height = currentfr.Document.body.scrollHeight;
if (currentfr.addEventListener)
currentfr.addEventListener("load", readjustIframe, false)
else if (currentfr.attachEvent){
currentfr.detachEvent("onload", readjustIframe) // Bug fix line
currentfr.attachEvent("onload", readjustIframe)
}
}
}

function readjustIframe(loadevt) {
var crossevt=(window.event)? event : loadevt
var iframeroot=(crossevt.currentTarget)? crossevt.currentTarget : crossevt.srcElement
if (iframeroot)
resizeIframe(iframeroot.id);
}

function loadintoIframe(iframeid, url){
if (document.getElementById)
document.getElementById(iframeid).src=url
}

if (window.addEventListener)
window.addEventListener("load", resizeCaller, false)
else if (window.attachEvent)
window.attachEvent("onload", resizeCaller)
else
window.onload=resizeCaller
  // ]]>
</script>
         
<!--<base href="http://www.adb.org/projects/39542-022/main" />-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="uploads/pages/countries/featuredcontentglider.css" />

<script type="text/javascript" src="uploads/pages/countries/featuredcontentglider.js">

/***********************************************

* Featured Content Glider script- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)

* Visit http://www.dynamicDrive.com for hundreds of DHTML scripts

* This notice must stay intact for legal use

**********************************************/

</script>

<link rel="stylesheet" type="text/css" media="all" href="ADB_LITS_Stylesheet1.html" />


<script language="javascript" type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.easing.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.cycle.all.js"></script>
<script language="javascript" type="text/javascript" src="js/script.js"></script>
<script type="text/javascript">
 $(document).ready( function(){	
		var buttons = { previous:$('#jslidernews2 .button-previous') ,
						next:$('#jslidernews2 .button-next') };			 
		$('#jslidernews2').lofJSidernews( { 
						interval:5000,
						easing:'easeInOutQuad',
						duration:1200,
						auto:true,
						mainWidth: 690,
						mainHeight: 300,
						navigatorHeight		: 15,
						navigatorWidth		: 15,
						maxItemDisplay: 5,
						buttons: buttons
		});				
		
		// Publications Cycle Jquery
		$('.cycle').cycle({ 
			fx:      'scrollRight', 
			next:   '#right', 
			timeout:  3000,
			speed: 1000,
			pause: true
		});		
		
		$('.cycle2').cycle({ 
			fx:      'scrollRight', 
			next:   '#right', 
			timeout:  5000,
			speed: 1000,
			pause: true
		});	
	});
</script>

<!--[if IE]>
<script type="text/javascript" src="modules/MenuManager/CSSMenu.js"></script>
<![endif]-->

<link rel="shortcut icon" href="favicon.ico" >

<script type="text/javascript"><!--
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-6868111-5']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
// --></script>

   <!-- TinyMCE Session vars empty --></head>
<body>
<div id="wrapper">
	<div id="wrap_all">
	<div class="container">
<div id="header">
<div id="header_top">
<div class="flotryt rytlinks"><a href="http://www.adb.org/projects/39542-022/main">Contact Us</a> </div>
<div class="clear"></div>
</div>
</div>
</div>
<div class="container">
<div id="header_bot">
<h1 id="logo" class="flotlef"><a href="http://www.adb.org/projects/39542-022/main"></a></h1>
<div id="search" class="flotryt"><h1>Livestock Information Traceability System</h1></div>

<script src="http://www.google.com/jsapi" type="text/javascript"></script>
<script type="text/javascript"><!--
google.load("elements", "1", {packages: "transliteration"});
// --></script>
<script src="http://www.google.com/coop/cse/t13n?form=cse-search-box&t13n_langs=en" type="text/javascript"></script>
<script src="http://www.google.com/coop/cse/brand?form=cse-search-box&lang=en" type="text/javascript"></script>
</div>
</div>
</html>