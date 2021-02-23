var dataString ='<map borderColor="FFFFFF" connectorColor="000000" fillAlpha="70" hoverColor="FFFFFF" showBevel="1" legendPosition="bottom" bgcolor = "FFF8DC"> \n\
	<colorRange gradient="1" minValue="-5" code="FF0000" > \n\
		<color maxValue="-2.5" code="FF0000" /> \n\
		<color maxValue="0" code="FFAA00" /> \n\
	    <color maxValue="2.5" code="FFCC33" /> \n\
        <color maxValue="5" code="069F06" /> \n\
	</colorRange> \n\
<data> \n\
<entity id="KG.BA" value ="2" />\n\
<entity id="KG.GB" value ="2" />\n\
<entity id="KG.CU" value ="-2" />\n\
<entity id="KG.YK" value ="2" />\n\
<entity id="KG.DA" value ="-4" />\n\
<entity id="KG.NA" value ="3" />\n\
<entity id="KG.OS" value ="3" />\n\
<entity id="KG.TL" value ="-3" />\n\
</data> \n\
	<styles>\n\
		<definition>\n\
			<style type="animation" name="animX" param="_xscale" start="0" duration="1" />\n\
			<style type="animation" name="animY" param="_yscale" start="0" duration="1" />\n\
		</definition>	\n\
		<application>\n\
			<apply toObject="PLOT" styles="animX,animY" />\n\
		</application>\n\
	</styles>\n\
</map>';