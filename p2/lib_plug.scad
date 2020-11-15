module plug_p2_femea(  D=10,L=30,THETA=5,RHO=20)   // Longo da base 
{
    rotate([ THETA, 90, 0 ])
    {
        translate([ 0, 0, RHO ])
        {
            cylinder(h=L, r1=D/2, r2=D/2, center=true);
        }
    }
}

//plug_p2_femea(  D=10,L=30,THETA=45,RHO=15);
