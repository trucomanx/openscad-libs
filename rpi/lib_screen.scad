

module screen7touch()
{
    //////////////////////////////////////////////////////////////////////////////////
    // SCREEN
    SCREEN_W=193.0;
    SCREEN_L=110.0;
    SCREEN_H=1;
    
    SCREEN_R=5;
    color("Black")
    {
    translate([-SCREEN_W/2+SCREEN_R,-SCREEN_L/2+SCREEN_R,0])  cylinder(h=SCREEN_H,r=SCREEN_R, center=true);
    translate([-SCREEN_W/2+SCREEN_R,+SCREEN_L/2-SCREEN_R,0])  cylinder(h=SCREEN_H,r=SCREEN_R, center=true);
    translate([+SCREEN_W/2-SCREEN_R,-SCREEN_L/2+SCREEN_R,0])  cylinder(h=SCREEN_H,r=SCREEN_R, center=true);
    translate([+SCREEN_W/2-SCREEN_R,+SCREEN_L/2-SCREEN_R,0])  cylinder(h=SCREEN_H,r=SCREEN_R, center=true);
    }
    
    color("Black")
    difference()
    {
        cube([SCREEN_W,SCREEN_L,SCREEN_H], center=true);
        
        cube([SCREEN_W-40,SCREEN_L-25,SCREEN_H+10], center=true);
        
        translate([-SCREEN_W/2,-SCREEN_L/2,0])  cube([SCREEN_R*2,SCREEN_R*2,SCREEN_H+10], center=true);
        translate([-SCREEN_W/2,+SCREEN_L/2,0])  cube([SCREEN_R*2,SCREEN_R*2,SCREEN_H+10], center=true);
        translate([+SCREEN_W/2,-SCREEN_L/2,0])  cube([SCREEN_R*2,SCREEN_R*2,SCREEN_H+10], center=true);
        translate([+SCREEN_W/2,+SCREEN_L/2,0])  cube([SCREEN_R*2,SCREEN_R*2,SCREEN_H+10], center=true);
    }
    color("Gray")
    cube([SCREEN_W-40,SCREEN_L-25,SCREEN_H], center=true);
    
    //////////////////////////////////////////////////////////////////////////////////
    // METAL SCREEN    
    METAL_W=SCREEN_W-24;
    METAL_L=SCREEN_L-8;
    METAL_H=6;
    color("Gray")
    translate([0,0,-SCREEN_H/2-METAL_H/2])
    cube([METAL_W,METAL_L,METAL_H], center=true);
    
    //////////////////////////////////////////////////////////////////////////////////
    // BOARD SCREEN
    BOARD_W=65;
    BOARD_L=56;
    BOARD_H=4;
    BOARD_OFFSET_W=71;
    BOARD_OFFSET_L=31;
    color("Green")
    translate([ BOARD_OFFSET_W-SCREEN_W/2,  +BOARD_OFFSET_L-SCREEN_L/2,  -SCREEN_H/2-BOARD_H-METAL_H])
    cube([BOARD_W,BOARD_L,BOARD_H]);
    
    //////////////////////////////////////////////////////////////////////////////////
    // USB POWER OUTPUT
    USB_W=14;
    USB_L=14;
    USB_H=8;
    color("White")
    translate([ BOARD_OFFSET_W-SCREEN_W/2-1,  +BOARD_OFFSET_L-SCREEN_L/2+8,  -SCREEN_H/2-METAL_H-BOARD_H-USB_H])
    cube([USB_W,USB_L,USB_H]);
    
    ///////////////////////////////////////////////////////////////////////////////////
    PORCA_D=7;
    PORCA_H=12;
    PORCA_OFFSET_W=3.5;
    PORCA_OFFSET_L=3.5;
    PORCA_DIST_W=57.5;
    PORCA_DIST_L=48.5;
       
    
    color("White")
    translate([ BOARD_OFFSET_W+PORCA_OFFSET_W-SCREEN_W/2,  BOARD_OFFSET_L+PORCA_OFFSET_L-SCREEN_L/2,  -SCREEN_H/2-METAL_H-BOARD_H-PORCA_H/2])
    cylinder(PORCA_H, r=PORCA_D/2, center=true);
    
    color("White")
    translate([ BOARD_OFFSET_W+PORCA_OFFSET_W-SCREEN_W/2,  BOARD_OFFSET_L+PORCA_OFFSET_L-SCREEN_L/2+PORCA_DIST_L,  -SCREEN_H/2-METAL_H-BOARD_H-PORCA_H/2])
    cylinder(PORCA_H, r=PORCA_D/2, center=true);
    
    
    color("White")
    translate([ BOARD_OFFSET_W+PORCA_OFFSET_W-SCREEN_W/2+58,  BOARD_OFFSET_L+PORCA_OFFSET_L-SCREEN_L/2,  -SCREEN_H/2-METAL_H-BOARD_H-PORCA_H/2])
    cylinder(PORCA_H, r=PORCA_D/2, center=true);
    
    color("White")
    translate([ BOARD_OFFSET_W+PORCA_OFFSET_W-SCREEN_W/2+58,  BOARD_OFFSET_L+PORCA_OFFSET_L-SCREEN_L/2+PORCA_DIST_L,  -SCREEN_H/2-METAL_H-BOARD_H-PORCA_H/2])
    cylinder(PORCA_H, r=PORCA_D/2, center=true);
    
    text( "7 inch", font = "Liberation Sans", size = 20, valign="center", halign="center");
}
//screen7touch();