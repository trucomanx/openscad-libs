

module rocker_block_circular(CIL_R_INT=20, // Radio interno cilindro
                            CIL_W=7,     // Espesura cilndro
                            THICKNESS=16,    // Altura do arco

                            BASE_W=30,   // Cumprimento da base
                            BASE_L=20)   // Longo da base
{

    RCIL=CIL_R_INT+CIL_W/2;
    RCILEXT=RCIL+CIL_W/2;
    union()
    {
        difference()
        {
            cylinder(h=THICKNESS, r1=RCILEXT*2/sqrt(3), r2=RCILEXT*2/sqrt(3),$fn=6, center=true);
            cylinder(h=THICKNESS*1.5, r1=CIL_R_INT, r2=CIL_R_INT, center=true);
            translate([ RCIL/2.0+CIL_W, 0, 0 ])
            {
                cube(size = [RCIL+2*CIL_W,2*RCIL+2*CIL_W,THICKNESS*1.5], center = true);
            }
            
        }
        

        {
            // Lapelas
            translate([ 0, RCIL, 0 ])
            {   
                rotate([90, 0 ,0])
                {
                    cylinder(h=CIL_W, r1=THICKNESS/2, r2=THICKNESS/2, center=true);
                }
            }
            translate([ 0, -RCIL, 0 ])
            {
                rotate([90, 0 ,0])
                {                
                    cylinder(h=CIL_W, r1=THICKNESS/2, r2=THICKNESS/2, center=true);
                }
            }
        }

        
        // Base sujetadora 
        translate([ -RCIL+CIL_W/2-BASE_L/2, 0, 0 ])
        {
            cube(size = [BASE_L,BASE_W,THICKNESS], center = true);
        }        
    }

}

module rocker_wire_circular(CIL_R=30, // Radio interno cilindro
                            THICKNESS=7,     // Espesura cilndro 
                            CIL_GAP=20,
                            BRIDGE_W=15,
                            BRIDGE_L=40)
{

    difference()
    {
        rotate_extrude(angle=180, $fn = 180)
        {
            translate([CIL_R, 0, 0])
            circle(r = THICKNESS/2,$fn = 360); 
        }
        
        translate([CIL_R/2+THICKNESS, 0, 0])
        cube(size = [CIL_R+2*THICKNESS,2*CIL_R+2*THICKNESS,2*THICKNESS], center = true);
        
        translate([-CIL_R, 0, 0])
        cube(size = [2*THICKNESS,BRIDGE_W,2*THICKNESS], center = true); 
    }
    

    difference()
    {
        rotate([90, 0, 0])
        cylinder(h=2*CIL_R, r1=THICKNESS/2, r2=THICKNESS/2,$fn = 360, center=true);
  
        
        cube(size = [2*THICKNESS,CIL_GAP,2*THICKNESS], center = true);

    }
    
    translate([-sqrt(CIL_R*CIL_R-BRIDGE_W*BRIDGE_W/4)-BRIDGE_L/2, BRIDGE_W/2, 0])
    rotate([0, 90, 0])
    {
        cylinder(h=BRIDGE_L, r1=THICKNESS/2, r2=THICKNESS/2,$fn = 360, center=true);
        translate([0, 0,+BRIDGE_L/2]) 
        sphere(d = THICKNESS,$fn = 360);  
    }
    
    translate([-sqrt(CIL_R*CIL_R-BRIDGE_W*BRIDGE_W/4)-BRIDGE_L/2, -BRIDGE_W/2, 0])
    rotate([0, 90, 0])
    {
        cylinder(h=BRIDGE_L, r1=THICKNESS/2, r2=THICKNESS/2,$fn = 360, center=true);
        translate([0, 0,+BRIDGE_L/2]) 
        sphere(d = THICKNESS,$fn = 360);    
    }
    
    
  
    translate([-sqrt(CIL_R*CIL_R-BRIDGE_W*BRIDGE_W/4)-BRIDGE_L, 0, 0])
    difference()
    {
        rotate_extrude(angle=180, $fn = 180)
        {
            translate([BRIDGE_W/2, 0, 0])
            circle(r = THICKNESS/2,$fn = 360); 
        }
        
        translate([CIL_R/2+THICKNESS, 0, 0])
        cube(size = [CIL_R+2*THICKNESS,2*CIL_R+2*THICKNESS,2*THICKNESS], center = true);
        
        translate([-CIL_R, 0, 0])
        cube(size = [2*THICKNESS,BRIDGE_W,2*THICKNESS], center = true); 
    }  
    
    translate([0,-CIL_R, 0])
    sphere(d = THICKNESS,$fn = 360);
    
    translate([0,+CIL_R, 0])
    sphere(d = THICKNESS,$fn = 360);



}

//rocker_wire_circular(CIL_R=30, THICKNESS=7,CIL_GAP=20,BRIDGE_W=15);

//rocker_block_circular(CIL_R_INT=20,CIL_W=6,THICKNESS=16,BASE_W=30,BASE_L=20);
