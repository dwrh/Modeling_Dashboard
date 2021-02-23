$Title  Hello World
$Ontext

This example establishes the input-output channel for GAMS implementation.

$Offtext


  Sets
  i /World, Kitty/ ;
  
  Parameters
  names (i) /World, Kitty/ ;

  Scalars
  ;
  
  Variables
  name
  ;
  
  Equations
  ;
  
  name.l = names(1) ;
  
  Model hello ;


  Display "Hello ", name.l ;

