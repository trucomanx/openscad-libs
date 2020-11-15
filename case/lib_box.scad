

module box_open(EXT_L=200,
                EXT_W=300,
                EXT_H=100,
                BOX_T=10,
                WALL_ALPHA=0.2)
{
    //translate([-EXT_L/2,-EXT_W/2,-EXT_H/2])
    union()
    {
        cube([EXT_L,EXT_W,BOX_T]);
        
        color(alpha=WALL_ALPHA)
        {
            cube([EXT_L,BOX_T,EXT_H]);
            
            cube([BOX_T,EXT_W,EXT_H]);
            
            translate([0,EXT_W-BOX_T,0])
            cube([EXT_L,BOX_T,EXT_H]);
                
            translate([EXT_L-BOX_T,0,0])
            cube([BOX_T,EXT_W,EXT_H]);
        }
    }
}

//box_open();