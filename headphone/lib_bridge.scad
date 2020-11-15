

module bridge_wire(         THICKNESS=7,     // Diametro del cable
                            BRIDGE_W=15,     // Separacion del puente
                            BRIDGE_L=40)     // Largura da parte paralela del puente
{

    
    translate([-BRIDGE_L/2, BRIDGE_W/2, 0])
    rotate([0, 90, 0])
    {
        cylinder(h=BRIDGE_L, r1=THICKNESS/2, r2=THICKNESS/2,$fn = 360, center=true);  
    }
    
    translate([-BRIDGE_L/2, -BRIDGE_W/2, 0])
    rotate([0, 90, 0])
    {
        cylinder(h=BRIDGE_L, r1=THICKNESS/2, r2=THICKNESS/2,$fn = 360, center=true); 
    }
    
    
    
    translate([-BRIDGE_L, 0, 0])
    difference()
    {
        rotate_extrude(angle=180, $fn = 180)
        {
            translate([BRIDGE_W/2, 0, 0])
            circle(r = THICKNESS/2,$fn = 360); 
        }

        
        translate([BRIDGE_W, 0, 0])
        cube(size = [2*BRIDGE_W,2*BRIDGE_W,2*THICKNESS], center = true);
        
    } 

}

//bridge_wire();

