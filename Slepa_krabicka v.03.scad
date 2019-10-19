krab_dlzka = 120 ;
krab_sirka = 120;
krab_hrubka = 12.5;

doplnky = 1;
//komponenty: arduino 2 psouvne a 2 otocne potenciometre 
module 1_polka(){
   difference(){
    cube([krab_dlzka,krab_sirka,krab_hrubka], true);
    translate([0,0,3])
     cube([krab_dlzka - 3,krab_sirka - 3,krab_hrubka], true);
   }
}




module p(){
        difference(){
        cube([krab_dlzka,krab_sirka,krab_hrubka], true);
        translate([0,0,3])
         cube([krab_dlzka - 6,krab_sirka - 6,krab_hrubka], true);
       }
    }

module d(){
       difference(){
       cube([krab_dlzka+0.01,krab_sirka+0.01,krab_hrubka+2], true);
       cube([krab_dlzka-3,krab_sirka-3,krab_hrubka+4], true);
       }
   }
   
 module 2_polka(){
    difference(){
        p();
        translate([0,0,3])
        d();
    }
   
}

module 1_potenciometer(){
    translate([82-40,82+5,-5])
    import("/Users/Oli/Desktop/3D modely/Potentiometer.stl");
}

module 2_potenciometer(){
    translate([82-40,82+40,-5])
    import("/Users/Oli/Desktop/3D modely/Potentiometer.stl");
}

module posuvny_potenciometer(){
spodok_dlzka = 90;
spodok_sirka = 20;
spodok_hrubka = 2;

piny_dlzka = 10;
piny_sirka = 3;
piny_hrubka = 4;

diera_d = 3 ; //diameter

module diera()
{
    cylinder (h = 8, d = diera_d, center = true, $fn=100);
}
module spodok() 
{
    color( "red", 1.0 )
     cube([spodok_dlzka,spodok_sirka,spodok_hrubka], true);
}

module Lko()
{
   color( "silver", 1.0 )
    {
    translate([0,0,-3/2+1])
     cube([1,1,3], true);
    translate([-0.5,-0.5,0])
        cube([1,8,1], false);
    }
}

module buxa() //krabica na piny
{
    color( "black", 1.0 )
     cube([piny_dlzka,piny_sirka,piny_hrubka], true);
    
}

module piny()
{
    buxa();
    translate([piny_dlzka/3,0,piny_hrubka-1])
     Lko();
    translate([0,0,piny_hrubka-1])
     Lko();
    translate([-piny_dlzka/3,0,piny_hrubka-1])
     Lko();
}

module krabica() //sranda s posuvnou srandou
{
    color( "gray", 1.0 )
     cube([spodok_dlzka-20,spodok_sirka/2,      spodok_hrubka*5], true);
}

module cindzik() //to je ta sranda ktora sa posuva
{
    color( "silver", 1.0 )
    translate([0,0,10/2])
    cube([5,1,10], true);
    color( "yellow", 1.0 )
    difference()
    {
        translate([0,0,14])
        cube([15,6,8], true);
        translate([0,0,21])
            rotate ([90,0,0])
                cylinder (h = 10, r=7.5, center = true, $fn=100);
    }  
}

module diery()
{
    translate([spodok_dlzka/2 - 2.5,spodok_sirka/2 - 3,0])
     diera();
    
    translate([spodok_dlzka/2 - 2.5,-spodok_sirka/2 + 2.5,0])
     diera();
    
    translate([-spodok_dlzka/2 + 2.5,spodok_sirka/2 -2.5,0])
     diera();
    
    translate([-spodok_dlzka/2 + 2.5,-spodok_sirka/2 + 2.5,0])
     diera();
}
module celok()
{
   spodok();
   translate([spodok_dlzka/2 - piny_dlzka/2 - 5,spodok_sirka/2 - 2,piny_hrubka/2])
    piny(); 
    
   translate([spodok_dlzka/2 - piny_dlzka/2 - 5 - piny_dlzka*1.5,spodok_sirka/2 - 2,piny_hrubka/2])
    piny(); 
    
    translate([0,-2.5,spodok_hrubka*5/2 - 0.9])
    krabica();
    
    translate([spodok_dlzka/2 - 20,-2.5,spodok_hrubka*5/2])
    cindzik();
}


difference() 
{
celok();
diery();
}
}
module 1_posuvny(){
    translate([10,-45,0])
     posuvny_potenciometer();
}

module 2_posuvny(){
    rotate([0,0,90])
     translate([10,-45,0])
      posuvny_potenciometer();
}

module doska(){
color( "MediumBlue", 1.0 )
 cube([43,18,1], true);
}

module connector(){
     cube([20,7,2], true);
     translate([0,0,1.5])
      cube([20,8,1.5], true);
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
    cube([0.75,0.75,8], true); 
   color( "Black", 1.0 )
    cube([3,2,2], true); 
}

module pinyl(){
for (i = [0:7])
{
    translate([i*2.5,7.5,1.5])
     pin();
} 

for (i = [0:7])
{
    translate([-(i*2.5),7.5,1.5])
     pin();
} 
}

module pinyp(){
for (i = [0:7])
{
    translate([i*2.5,-7.5,1.5])
     pin();
} 

for (i = [0:7])
{
    translate([-(i*2.5),-7.5,1.5])
     pin();
} 
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


pinyl();
pinyp();
}   

module arduino(){
celok();    
}
module drziak(){
    difference(){
    cube([10,10,10], true);
    
    translate([3,0,-1.5])
    cube([5,10.1,1.25], true);
    }
}

module posuvny_potenciometer_diery(){
spodok_dlzka = 90;
spodok_sirka = 20;
spodok_hrubka = 2;

piny_dlzka = 10;
piny_sirka = 3;
piny_hrubka = 4;

diera_d = 2 ; //diameter

module diera()
{
    cylinder (h = 8, d = diera_d, center = true, $fn=100);
}
module spodok() 
{
    color( "red", 1.0 )
     cube([spodok_dlzka,spodok_sirka,spodok_hrubka], true);
}

module Lko()
{
   color( "silver", 1.0 )
    {
    translate([0,0,-3/2+1])
     cube([1,1,3], true);
    translate([-0.5,-0.5,0])
        cube([1,8,1], false);
    }
}

module buxa() //krabica na piny
{
    color( "black", 1.0 )
     cube([piny_dlzka,piny_sirka,piny_hrubka], true);
    
}

module piny()
{
    buxa();
    translate([piny_dlzka/3,0,piny_hrubka-1])
     Lko();
    translate([0,0,piny_hrubka-1])
     Lko();
    translate([-piny_dlzka/3,0,piny_hrubka-1])
     Lko();
}

module krabica() //sranda s posuvnou srandou
{
    color( "gray", 1.0 )
     cube([spodok_dlzka-20,spodok_sirka/2,      spodok_hrubka*5], true);
}

module cindzik() //to je ta sranda ktora sa posuva
{
    color( "silver", 1.0 )
    translate([0,0,10/2])
    cube([5,1,10], true);
    color( "yellow", 1.0 )
    difference()
    {
        translate([0,0,14])
        cube([15,6,8], true);
        translate([0,0,21])
            rotate ([90,0,0])
                cylinder (h = 10, r=7.5, center = true, $fn=100);
    }  
}

module diery()
{
    translate([spodok_dlzka/2 - 2.5,spodok_sirka/2 - 3,0])
     diera();
    
    translate([spodok_dlzka/2 - 2.5,-spodok_sirka/2 + 2.5,0])
     diera();
    
    translate([-spodok_dlzka/2 + 2.5,spodok_sirka/2 -2.5,0])
     diera();
    
    translate([-spodok_dlzka/2 + 2.5,-spodok_sirka/2 + 2.5,0])
     diera();
}
module celok()
{
   spodok();
   translate([spodok_dlzka/2 - piny_dlzka/2 - 5,spodok_sirka/2 - 2,piny_hrubka/2])
    piny(); 
    
   translate([spodok_dlzka/2 - piny_dlzka/2 - 5 - piny_dlzka*1.5,spodok_sirka/2 - 2,piny_hrubka/2])
    piny(); 
    
    translate([0,-2.5,spodok_hrubka*5/2 - 0.9])
    krabica();
    
    translate([spodok_dlzka/2 - 20,-2.5,spodok_hrubka*5/2])
    cindzik();
}

diery();
}

module doplnky(){
    if (doplnky == 1){
        1_posuvny();
        2_posuvny();
        1_potenciometer();
        2_potenciometer();
        rotate ([0,0,90])
          translate([30,0,1.5])
          arduino();
    }
}

//2_polka();
//translate([-krab_dlzka-20,0,0])
//1_polka();

translate([0,10,3])
 rotate ([0,0,90])
  drziak();


translate([10,-45,0])
 posuvny_potenciometer_diery();

rotate([0,0,90])
 translate([10,-45,0])
  posuvny_potenciometer_diery();
  
difference(){
1_polka();
rotate ([0,0,90])
  translate([30,0,1.5])
  arduino();
}

module diery_potenciometer(){
translate([krab_dlzka + 20,0,0])
difference(){

    difference(){
    2_polka();
    rotate ([0,180,0])
     translate([-40,+5,0])
      cylinder(h=20, r=2.5, center=true);
    }
    
rotate ([0,180,0])
    translate([-40,40,0])
      cylinder(h=20, r=2.5, center=true);
}
}


diery_potenciometer();

doplnky();