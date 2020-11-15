
module case_screen_rpi_7inch_type1(CASE_W=225,CASE_L=130,CASE_H=3)
{
    RP3_7INCH_SCREEN_W=193.0;
    RP3_7INCH_SCREEN_L=110.0;
    RP3_7INCH_SCREEN_H=CASE_H+2;
    
    if(CASE_W<RP3_7INCH_SCREEN_W)
    {
    }
    
    if(CASE_L<RP3_7INCH_SCREEN_L)
    {
    }
    
    RP3_7INCH_METAL_W=RP3_7INCH_SCREEN_W-24;
    RP3_7INCH_METAL_L=RP3_7INCH_SCREEN_L-8;
    RP3_7INCH_METAL_H=CASE_H+2;    
    
    color("Black")
    translate([0,0,CASE_H/2])
    difference()
    {
        cube([CASE_W,CASE_L,CASE_H], center=true);
        

        cube([RP3_7INCH_SCREEN_W,RP3_7INCH_SCREEN_L,RP3_7INCH_SCREEN_H], center=true);
    }

    

    
    color("Silver")
    translate([0,0,-CASE_H/2])
    difference()
    {
        cube([CASE_W,CASE_L,CASE_H], center=true);
        
        cube([RP3_7INCH_METAL_W,RP3_7INCH_METAL_L,RP3_7INCH_METAL_H], center=true);
    }
}

case_screen_rpi_7inch_type1();