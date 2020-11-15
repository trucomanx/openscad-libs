//
module cup_hexagonal(   CIL_H_EXT=30,  // Altura total
                        CIL_H_TOP=5,   // Altura tampa 
                        CIL_R_EXT=35, // Radio circulo exterior inscrito
                        CIL_R_INT=26, // Radio interno
                        
                        KNOB_R=20,   // Radio da assa
                        KNOB_H=10,   // Altura da assa
                        KNOB_E=1,     // TIpo de casco
                        
                        CHOLE_D=11,
                        CHOLE_H=30,
                        CHOLE_E=0)
{
    CRE=CIL_R_EXT*2/sqrt(3);

    if(CRE<=CIL_R_INT)
    {
        echo("<font color='red'>Please, verity that CRE>CIL_R_INT</font>");
        assert(false);
    }
    
    difference()
    {
        union()
        translate([0,0,-CIL_H_TOP/2]) 
        {
            // CILINDRO
            HCIL=CIL_H_EXT-CIL_H_TOP;
            difference()
            {
                cylinder(h=HCIL, r1=CRE, r2=CRE,$fn=6, center=true);
                cylinder(h=HCIL+1, r1=CIL_R_INT, r2=CIL_R_INT, center=true);
            }
            
            // TAMPA
            translate([0,0,HCIL/2+CIL_H_TOP/2])
            {
                cylinder(h=CIL_H_TOP, r1=CRE, r2=CRE,$fn=6, center=true);
            }
            
            if( KNOB_E>0 )
            {
                // ASSA
                translate([0,0,HCIL/2+CIL_H_TOP+KNOB_H/2])
                {
                    cylinder(h=KNOB_H, r1=KNOB_R, r2=KNOB_R, center=true);
                }
            }
        }

        if(CHOLE_E>0) 
        {
            rotate([ 0, 90, 0 ])
            translate([0,0,CRE-15])
            cylinder(h=CHOLE_H, r1=CHOLE_D/2, r2=CHOLE_D/2, center=true);

        }
    }

}

//cup_hexagonal(CIL_H_EXT=30,CIL_H_TOP=5,CIL_R_EXT=35,CIL_R_INT=26,KNOB_E=0);
//cup_hexagonal(CIL_H_EXT=30,CIL_H_TOP=5,CIL_R_EXT=35,CIL_R_INT=26,KNOB_R=20,KNOB_H=10,KNOB_E=1,CHOLE_E=1);
