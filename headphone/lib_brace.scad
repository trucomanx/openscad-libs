//
module brace_2holes(H=10,   // Espesura da abrazadera
                    W=40,   // Ancho da abrazadera
                    L=20,   // Largo da abrazadera
                    SEP=10, // Separacion de los agujeros
                    D=3.5)  // Diametro de los agujeros
{
    HOLE_SEP=SEP;
    HOLE_D=D;
    HOLE_L=2*L;

    difference()
    {
        cube(size = [L,W,H], center = true); 
        
        translate([-0, HOLE_SEP/2, 0])
        rotate([0, 90, 0])
        {
            cylinder(h=HOLE_L, r1=HOLE_D/2, r2=HOLE_D/2,$fn = 360, center=true);
    
        }
        
        translate([0, -HOLE_SEP/2, 0])
        rotate([0, 90, 0])
        {
            cylinder(h=HOLE_L, r1=HOLE_D/2, r2=HOLE_D/2,$fn = 360, center=true);
        }
    }
}

//brace_2holes();