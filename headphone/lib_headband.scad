

module headband_solid( ARC_W=30,  // Ancho de la banda
                        ARC_T=5,
                        ARC_S=130, // Separacion del puente
                        ARC_L=35, // Largura da parte paralela del puente
                        ARC_E_ROUND=0,
                        
                        BRACE_L=25,
                        BRACE_H=10)
{
    color("DarkKhaki")
    union()
    {
        translate([-ARC_L/2, ARC_S/2, 0])
        rotate([0, 90, 0])
        cube(size = [ARC_W,ARC_T,ARC_L], center = true);
    
        
        translate([-ARC_L/2, -ARC_S/2, 0])
        rotate([0, 90, 0])
        cube(size = [ARC_W,ARC_T,ARC_L], center = true);
        
        
        translate([-ARC_L, 0, 0])
        difference()
        {
            cylinder(h=ARC_W, r=ARC_S/2+ARC_T/2, center=true, $fn=360);
            
            cylinder(h=2*ARC_W, r=ARC_S/2-ARC_T/2, center=true, $fn=360);
            
            translate([ARC_S, 0, 0])
            cube(size = [2*ARC_S,2*ARC_S,2*ARC_W], center = true);
            
        }
        
        if(ARC_E_ROUND>0)
        {
            translate([0,-ARC_S/2, 0])
            rotate([90, 0, 0])
            cylinder(h=ARC_T, r=ARC_W/2, center=true, $fn=360);
    
            
            translate([0,+ARC_S/2, 0])
            rotate([90, 0, 0])
            cylinder(h=ARC_T, r=ARC_W/2, center=true, $fn=360);
        }
    }
    
    color("Peru")
    translate([-BRACE_L/2, -ARC_S/2-ARC_T/2-BRACE_H/2, 0])
    rotate([0, 90, 0])
    cube(size = [ARC_W,BRACE_H,BRACE_L], center = true);
    
    color("Peru")
    translate([-BRACE_L/2, +ARC_S/2+ARC_T/2+BRACE_H/2, 0])
    rotate([0, 90, 0])
    cube(size = [ARC_W,BRACE_H,BRACE_L], center = true);
}

//headband_solid();

