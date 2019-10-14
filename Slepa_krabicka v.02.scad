krab_dlzka = 120 ;
krab_sirka = 120;
krab_hrubka = 12.5;

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

module krabica(){
translate([-krab_dlzka-20,0,0])
1_polka();
2_polka();
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

diera_d = 3 ; // d = diameter -> priemer

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
    translate([-10,-45,0])
     posuvny_potenciometer();
}

module 2_posuvny(){
    rotate([0,0,90])
     translate([10,-45,0])
      posuvny_potenciometer();
}

module arduino(){
    
}
1_posuvny();
2_posuvny();
1_potenciometer();
2_potenciometer();
krabica();
