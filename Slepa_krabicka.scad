krab_dlzka = 100 ;
krab_sirka = 100;
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
translate([-120,0,0])
2_polka();
1_polka();
}

krabica();