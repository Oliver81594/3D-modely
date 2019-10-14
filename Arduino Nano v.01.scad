hore = 0; //ci budu piny napajkovane smerom hore alebo dole
module doska(){
color( "MediumBlue", 1.0 )
 cube([43,18,1], true);
}

module connector(){
     cube([11,7,2], true);
     translate([0,0,1.5])
      cube([11,8,1.5], true);
}
module ATMega(){
    color( "Black", 1.0 )
     cube([7,7,0.5], true);
}
module reset(){
    color( "Silver", 1.0 )
    cube([6,3,1.5], true);
    translate([0,0,1])
    color( "White", 1.0 )
     cube([3,2.5,1], true);
}
module pin(){
   color( "Silver", 1.0 )
    cube([1,1,8], true); 
   color( "Black", 1.0 )
    cube([2,2,2], true); 
}

module celok(){
doska();
    
translate([21.5,0,1])
connector();
    
translate([9,0,0.5])
rotate([0,0,45])
ATMega();
    
translate([-1,0,0.7])
rotate([0,0,90])
reset();

for (i = [0:14])
{
    translate([i,7,1.5])
     pin();
}

}
celok();
