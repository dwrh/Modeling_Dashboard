<?php
	
		echo <<<_END
		<html><title>CAPSIM: Create a Scenario and Run the Model</title>
		<head>
		<style type="text/css">
		p.sansserif
		{
		font-family: Arial,Helvetica,sans-serif;
		font-size: 14px; 
		margin: 0px;
		}
		p.sansserif_c
		{
		font-family: Arial,Helvetica,sans-serif;
		font-size: 14px; 
		margin: 0px;
		color: #003366;
		}
		table
		{
		background-color: white;
		border-collapse:collapse;
		}
		table, th
		{
		border:1px solid black;
		}
		.table1
		{
		background-color: white;
		border-collapse:collapse;
		}
		.table1, th
		{
		border:0px;
		}
		body
		{
		background: url('Images/EBI_map.png') no-repeat;
		background-color:white;
		background-size: 100%;
		}
		</style>
		</head>
		<body>
		<table align=center cellpadding=8 width=619>
		<tr><td><img src="Images/top1.jpg" width="600" alt="border"></td></tr>
		<tr><td><table align=center cellpadding=8 width=600>
		<tr><td align=left><p class="sansserif"><b>Selecting Scenario Inputs >></b>
		CAPSIM is aggregated into 10 regions. For each region, change the 2030 default values to your desired values.
		Values for 2005 are provided for reference. If values are not changed, CAPSIM will run with default values.
		When finished designing your scenario, click the hand at the bottom of the page.</p>
		</tr></td></table> 
		<tr><td><table align=center cellpadding=0 class="table1">
				<tr><br>
				<td><p class="sansserif_c"><b>China</b></td>
				<td width=40><p class="sansserif"><b>2005</b></td>
				<td><p class="sansserif"><b>2030</b></td>
				<td width=20></td>
				<td><p class="sansserif_c"><b>Japan</b></td>
				<td width=40><p class="sansserif"><b>2005</b></td>
				<td><p class="sansserif"><b>2030</b></td>
				</tr>
				<form name="inputs" method="post" action="Economy.php">
				<tr>
				<td width=175><p class="sansserif">Average tariff rate</p></td>
				<td><p class="sansserif">0.05</td>
				<td><input type="text" value="0.50" name="RENC" size="1" /></td>
				<td width=20></td>
				<td width=175><p class="sansserif">Average tariff rate</p></td>
				<td><p class="sansserif">0.10</td>
				<td><input type="text" value="0.50" name="RENJ" size="1" /></td>
				</tr>
				<tr>
				<td width=175><p class="sansserif">Domestic transport margins</td>
				<td><p class="sansserif">0.05</td>
				<td><input type="text" value="0.50" name="EVC" size="1" /></td>
				<td width=20></td>
				<td width=175><p class="sansserif">Domestic transport margins</td>
				<td><p class="sansserif">0.10</td>
				<td><input type="text" value="0.50" name="EVJ" size="1" /></td>				
				</tr>
				<tr><td><br></td></tr>
				<tr>
				<td><p class="sansserif_c"><b>India</b></td>
				<td width=40><p class="sansserif"><b>2005</b></td>
				<td><p class="sansserif"><b>2030</b></td>
				<td width=20></td>
				<td><p class="sansserif_c"><b>United States</b></td>
				<td width=40><p class="sansserif"><b>2005</b></td>
				<td><p class="sansserif"><b>2030</b></td>
				</tr>
				<tr>
				<td width=175><p class="sansserif">Average tariff rate</p></td>
				<td><p class="sansserif">0.05</td>
				<td><input type="text" value="0.50" name="RENI" size="1" /></td>
				<td width=20></td>
				<td width=175><p class="sansserif">Average tariff rate</p></td>
				<td><p class="sansserif">0.10</td>
				<td><input type="text" value="0.50" name="RENU" size="1" /></td>
				</tr>
				<tr>
				<td width=175><p class="sansserif">Domestic transport margins</td>
				<td><p class="sansserif">0.05</td>
				<td><input type="text" value="0.50" name="EVI" size="1" /></td>
				<td width=20></td>
				<td width=175><p class="sansserif">Domestic transport margins</td>
				<td><p class="sansserif">0.10</td>
				<td><input type="text" value="0.50" name="EVU" size="1" /></td>				
				</tr>
								<tr><td><br></td></tr>
				<tr>
				<td><p class="sansserif_c"><b>Brazil</b></td>
				<td><p class="sansserif"><b>2005</b></td>
				<td><p class="sansserif"><b>2030</b></td>
				<td width=20></td>
				<td><p class="sansserif_c"><b>Russia</b></td>
				<td><p class="sansserif"><b>2005</b></td>
				<td><p class="sansserif"><b>2030</b></td>
				</tr>
				<tr>
				<td width=175><p class="sansserif">Average tariff rate</p></td>
				<td><p class="sansserif">0.05</td>
				<td><input type="text" value="0.50" name="RENB" size="1" /></td>
				<td width=20></td>
				<td width=175><p class="sansserif">Average tariff rate</p></td>
				<td><p class="sansserif">0.10</td>
				<td><input type="text" value="0.50" name="RENR" size="1" /></td>
				</tr>
				<tr>
				<td width=175><p class="sansserif">Domestic transport margins</td>
				<td><p class="sansserif">0.05</td>
				<td><input type="text" value="0.50" name="EVB" size="1" /></td>
				<td width=20></td>
				<td width=175><p class="sansserif">Domestic transport margins</td>
				<td><p class="sansserif">0.10</td>
				<td><input type="text" value="0.50" name="EVR" size="1" /></td>				
				</tr>
								<tr><td><br></td></tr>
				<tr>
				<td><p class="sansserif_c"><b>Europe</b></td>
				<td><p class="sansserif"><b>2005</b></td>
				<td><p class="sansserif"><b>2030</b></td>
				<td width=20></td>
				<td><p class="sansserif_c"><b>Latin America</b></td>
				<td><p class="sansserif"><b>2005</b></td>
				<td><p class="sansserif"><b>2030</b></td>
				</tr>
				<tr>
				<td width=175><p class="sansserif">Average tariff rate</p></td>
				<td><p class="sansserif">0.05</td>
				<td><input type="text" value="0.50" name="RENE" size="1" /></td>
				<td width=20></td>
				<td width=175><p class="sansserif">Average tariff rate</p></td>
				<td><p class="sansserif">0.10</td>
				<td><input type="text" value="0.50" name="RENL" size="1" /></td>
				</tr>
				<tr>
				<td width=175><p class="sansserif">Domestic transport margins</td>
				<td><p class="sansserif">0.05</td>
				<td><input type="text" value="0.50" name="EVE" size="1" /></td>
				<td width=20></td>
				<td width=175><p class="sansserif">Domestic transport margins</td>
				<td><p class="sansserif">0.10</td>
				<td><input type="text" value="0.50" name="EVL" size="1" /></td>				
				</tr>
								<tr><td><br></td></tr>
				<tr>
				<td><p class="sansserif_c"><b>OPEC</b></td>
				<td><p class="sansserif"><b>2005</b></td>
				<td><p class="sansserif"><b>2030</b></td>
				<td width=20></td>
				<td><p class="sansserif_c"><b>Rest of World</b></td>
				<td><p class="sansserif"><b>2005</b></td>
				<td><p class="sansserif"><b>2030</b></td>
				</tr>
				<tr>
				<td width=175><p class="sansserif">Average tariff rate</p></td>
				<td><p class="sansserif">0.05</td>
				<td><input type="text" value="0.50" name="RENO" size="1" /></td>
				<td width=20></td>
				<td width=175><p class="sansserif">Average tariff rate</p></td>
				<td><p class="sansserif">0.10</td>
				<td><input type="text" value="0.50" name="RENRW" size="1" /></td>
				</tr>
				<tr>
				<td width=175><p class="sansserif">Domestic transport margins</td>
				<td><p class="sansserif">0.05</td>
				<td><input type="text" value="0.50" name="EVO" size="1" /></td>
				<td width=20></td>
				<td width=175><p class="sansserif">Domestic transport margins</td>
				<td><p class="sansserif">0.10</td>
				<td><input type="text" value="0.50" name="EVRW" size="1" /></td>				
				</tr>
				</table>
		<tr><td align=center>
		<input type="image" width="70" src="Images/run.jpg" alt="Submit" /></td></tr>
		<tr><td align=center><p class="sansserif_c"><b>Click the hand to RUN CAPSIM</b></td></tr>
		</form>
		</td></tr>
		</table>
		
		
		</body></html>		
_END;
			
	?>
