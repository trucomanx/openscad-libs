module cap_circular(    ROUTER=35,  // Radio do disco exterior
                        HOUTER=5,   // Altura do disco exterior
                        RINNER=29,  // Radio do disco interior
                        HINNER=5)   // Altura do disco interior
{
    union()
    {
        translate([ 0, 0, +HINNER/2 ])
        {
            cylinder(h=HINNER, r1=RINNER, r2=RINNER, center=true);
        }
        translate([ 0, 0, -HOUTER/2 ])
        {
            cylinder(h=HINNER, r1=ROUTER, r2=ROUTER, center=true);
        }
    }

}

//cap_circular(  ROUTER=35,HOUTER=5,RINNER=29,HINNER=5);