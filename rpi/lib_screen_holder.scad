
module case_screen_rpi_7inch_buttons(CASE_W=213,CASE_H=3,CASE_BUTTON_L=15,CASE_BUTTON_R=5)
{
    difference()
    {
        cube([CASE_W,CASE_BUTTON_L,CASE_H], center=true);
        translate([0,-CASE_BUTTON_L/2+CASE_BUTTON_R,0])
        {
            cylinder(h=CASE_H+2,r=CASE_BUTTON_R, center=true);
            translate([CASE_BUTTON_R*3,0,0])
            cylinder(h=CASE_H+2,r=CASE_BUTTON_R, center=true);
            translate([-CASE_BUTTON_R*3,0,0])
            cylinder(h=CASE_H+2,r=CASE_BUTTON_R, center=true);
        }
    }
}

module case_screen_rpi_7inch_type1_pc1(CASE_W=213,CASE_L=131,CASE_H=3,CASE_BUTTON_L=15,CASE_BUTTON_R=5,CASE_BUTTON_E=true)
{
    
    /////////////////////////////////////////////////////////////////////////////////////
    // DATA
    /////////////////////////////////////////////////////////////////////////////////////

    RP3_7INCH_SCREEN_W=193.0;
    RP3_7INCH_SCREEN_L=111.0;
    
    RP3_7INCH_SCREEN_H=CASE_H+2;//este valor es para restar solmente
    RP3_7INCH_SCREEN_R=5;
    
    if(CASE_W<RP3_7INCH_SCREEN_W)
    {
        echo("<font color='red'> CASE_W is less than rpi 7inch (193 mm) </font>");
        assert(false);
    }
    
    if(CASE_L<RP3_7INCH_SCREEN_L)
    {
        echo("<font color='red'> CASE_L is less than rpi 7inch (110 mm) </font>");
        assert(false);
    }
    

    
    /////////////////////////////////////////////////////////////////////////////////////
    // SCREEN 
    /////////////////////////////////////////////////////////////////////////////////////
    
    color("Black")
    translate([0,0,CASE_H/2])
    difference()
    {
        cube([CASE_W,CASE_L,CASE_H], center=true);
        union()
        {
            translate([-RP3_7INCH_SCREEN_W/2+RP3_7INCH_SCREEN_R,-RP3_7INCH_SCREEN_L/2+RP3_7INCH_SCREEN_R,0])  
                cylinder(h=RP3_7INCH_SCREEN_H,r=RP3_7INCH_SCREEN_R, center=true);
            translate([-RP3_7INCH_SCREEN_W/2+RP3_7INCH_SCREEN_R,+RP3_7INCH_SCREEN_L/2-RP3_7INCH_SCREEN_R,0])  
                cylinder(h=RP3_7INCH_SCREEN_H,r=RP3_7INCH_SCREEN_R, center=true);
            translate([+RP3_7INCH_SCREEN_W/2-RP3_7INCH_SCREEN_R,-RP3_7INCH_SCREEN_L/2+RP3_7INCH_SCREEN_R,0])  
                cylinder(h=RP3_7INCH_SCREEN_H,r=RP3_7INCH_SCREEN_R, center=true);
            translate([+RP3_7INCH_SCREEN_W/2-RP3_7INCH_SCREEN_R,+RP3_7INCH_SCREEN_L/2-RP3_7INCH_SCREEN_R,0])  
                cylinder(h=RP3_7INCH_SCREEN_H,r=RP3_7INCH_SCREEN_R, center=true);
 
            difference()
            {
                cube([RP3_7INCH_SCREEN_W,RP3_7INCH_SCREEN_L,RP3_7INCH_SCREEN_H], center=true);
    
                translate([-RP3_7INCH_SCREEN_W/2,-RP3_7INCH_SCREEN_L/2,0])  
                    cube([RP3_7INCH_SCREEN_R*2,RP3_7INCH_SCREEN_R*2,RP3_7INCH_SCREEN_H+10], center=true);
                translate([-RP3_7INCH_SCREEN_W/2,+RP3_7INCH_SCREEN_L/2,0])  
                    cube([RP3_7INCH_SCREEN_R*2,RP3_7INCH_SCREEN_R*2,RP3_7INCH_SCREEN_H+10], center=true);
                translate([+RP3_7INCH_SCREEN_W/2,-RP3_7INCH_SCREEN_L/2,0])  
                    cube([RP3_7INCH_SCREEN_R*2,RP3_7INCH_SCREEN_R*2,RP3_7INCH_SCREEN_H+10], center=true);
                translate([+RP3_7INCH_SCREEN_W/2,+RP3_7INCH_SCREEN_L/2,0])  
                    cube([RP3_7INCH_SCREEN_R*2,RP3_7INCH_SCREEN_R*2,RP3_7INCH_SCREEN_H+10], center=true);        
            }
        }
    }

    /////////////////////////////////////////////////////////////////////////////////////
    // BUTTON
    /////////////////////////////////////////////////////////////////////////////////////
    translate([0,CASE_L/2+CASE_BUTTON_L/2,CASE_H/2])
    if(CASE_BUTTON_E==true)
    {   
        case_screen_rpi_7inch_buttons(CASE_W=CASE_W,CASE_H=CASE_H,CASE_BUTTON_L=CASE_BUTTON_L,CASE_BUTTON_R=CASE_BUTTON_R);
    }

}

module case_screen_rpi_7inch_type1_pc2(CASE_W=213,CASE_L=131,CASE_H=3,CASE_BUTTON_L=15,CASE_BUTTON_R=5,CASE_BUTTON_E=true)
{
    
    /////////////////////////////////////////////////////////////////////////////////////
    // DATA
    /////////////////////////////////////////////////////////////////////////////////////

    RP3_7INCH_SCREEN_W=193.0;
    RP3_7INCH_SCREEN_L=111.0;
    
    RP3_7INCH_SCREEN_H=CASE_H+2;//este valor es para restar solmente
    RP3_7INCH_SCREEN_R=5;
    
    if(CASE_W<RP3_7INCH_SCREEN_W)
    {
        echo("<font color='red'> CASE_W is less than rpi 7inch (193 mm) </font>");
        assert(false);
    }
    
    if(CASE_L<RP3_7INCH_SCREEN_L)
    {
        echo("<font color='red'> CASE_L is less than rpi 7inch (110 mm) </font>");
        assert(false);
    }
    
    /////////////////////////////////////////////////////////////////////////////////////
    // METAL
    /////////////////////////////////////////////////////////////////////////////////////
    
    RP3_7INCH_METAL_W=RP3_7INCH_SCREEN_W-24;
    RP3_7INCH_METAL_L=RP3_7INCH_SCREEN_L-8;
    RP3_7INCH_METAL_H=CASE_H+2;    

    color("Silver")
    translate([0,0,-CASE_H/2])
    difference()
    {
        cube([CASE_W,CASE_L,CASE_H], center=true);
        
        cube([RP3_7INCH_METAL_W,RP3_7INCH_METAL_L,RP3_7INCH_METAL_H], center=true);
    }
    
    /////////////////////////////////////////////////////////////////////////////////////
    // BUTTON
    /////////////////////////////////////////////////////////////////////////////////////
    translate([0,CASE_L/2+CASE_BUTTON_L/2,-CASE_H/2])
    if(CASE_BUTTON_E==true)
    {   
        case_screen_rpi_7inch_buttons(CASE_W=CASE_W,CASE_H=CASE_H,CASE_BUTTON_L=CASE_BUTTON_L,CASE_BUTTON_R=CASE_BUTTON_R);
    }
}

module case_screen_rpi_7inch_type1()
{
    case_screen_rpi_7inch_type1_pc1();
    case_screen_rpi_7inch_type1_pc2();
}

case_screen_rpi_7inch_type1_pc1();
case_screen_rpi_7inch_type1_pc2();
//case_screen_rpi_7inch_type1();