<?php

$xml = <<<xml
<markers>
 <marker name="Bikes" desc="116 18" lat="4.698479" lon="-74.048111" tipo="Store"/>
 <marker name="Kooning" desc="116 16" lat="4.697316" lon="-74.044807" tipo="Store"/>
 <marker name="Bike House" desc="15 104" lat="4.692983" lon="-74.044952" tipo="Store"/>
</markers>
xml;

$markers = new SimpleXMLElement($xml);

foreach ($markers->marker as $marker) {
    $mark_arr = array();
    foreach ($marker->attributes() as $key => $attr) {
            $mark_arr[$key] = (string) $attr;
    }
    $marks_arr[] = $mark_arr;
}