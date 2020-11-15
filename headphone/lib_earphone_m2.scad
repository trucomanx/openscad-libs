include <trucomanx/headphone/lib_cup.scad>;
include <trucomanx/headphone/lib_cap.scad>;
include <trucomanx/headphone/lib_rocker.scad>;
include <trucomanx/headphone/lib_brace.scad>;

include <trucomanx/p2/lib_plug.scad>;

module earphone_m2(    CUP_CIL_W_EXT=70,   // Cumprimento do casco (diametro circulo incrito)
                        CUP_CIL_D_INT=50,   // Diametro interno do casco
                        CUP_CIL_H=18.5,  // Altura do casco
                        CUP_CIL_H_TOP=1, // Espesor da tapa do casco

                        CUP_KNOB_H=11.5,  // Altura da perilha do casco
                        CUP_KNOB_R=27.5,  // Radio da perilha do casco

                        CAP_THICKNESS=5,   // Espesura de cada lamina da tampa
                        CAP_DIFFERENCE=5,

                        BRACE_L=15,

                        ROCKER_CIL_R=32.5,
                        ROCKER_CIL_GAP=20,
                        ROCKER_BRIDGE_W=15,
                        WIRE_THICKNESS=3.5,
                        ROCKER_BRIDGE_L=80)
{

    RE=CUP_CIL_W_EXT/2;

    P2_HOLE_D=11;
    P2_HOLE_H=30;

    color("Silver")
    plug_p2_femea(  D=P2_HOLE_D*0.99,L=P2_HOLE_H,THETA=0,RHO=RE*2/sqrt(3)-P2_HOLE_H/2);
    
    color("Brown")
    cup_hexagonal(  CIL_H_EXT=CUP_CIL_H,  // Altura total
                    CIL_H_TOP=CUP_CIL_H_TOP,      // Altura tampa 
                    CIL_R_EXT=RE,       // Radio circulo externo inscrito
                    CIL_R_INT=CUP_CIL_D_INT/2, // Radio interno 
    
                    KNOB_R=CUP_KNOB_R,   // Radio da assa
                    KNOB_H=CUP_KNOB_H,   // Altura da assa
                    KNOB_E=1,
    
                    CHOLE_D=P2_HOLE_D,
                    CHOLE_H=P2_HOLE_H,
                    CHOLE_E=1);
    

    translate([0,0,CUP_CIL_H/2+CUP_KNOB_H*0.5])
    color("Peru")
    rocker_wire_circular(CIL_R   = ROCKER_CIL_R, // Radio interno cilindro
                        THICKNESS= WIRE_THICKNESS,  // Espesura cilndro
                        CIL_GAP  = ROCKER_CIL_GAP,
                        BRIDGE_W = ROCKER_BRIDGE_W,
                        BRIDGE_L = ROCKER_BRIDGE_L);    

    color("SaddleBrown")
    translate([-ROCKER_CIL_R-BRACE_L/2,0,CUP_CIL_H/2+CUP_KNOB_H/2])
    brace_2holes(   H=CUP_KNOB_H,   // Espesura da abrazadera
                    W=2*ROCKER_BRIDGE_W,   // Ancho da abrazadera
                    L=BRACE_L,   // Largo da abrazadera
                    SEP=ROCKER_BRIDGE_W, // Separacion de los agujeros
                    D=WIRE_THICKNESS); // Diametro de los agujeros
    
    
    translate([0,0,-CAP_THICKNESS-CUP_CIL_H/2])
    color("Green",alpha=0.5)
    cap_circular(  ROUTER=CUP_CIL_W_EXT/2,HOUTER=CAP_THICKNESS,RINNER=CUP_CIL_W_EXT/2-CAP_DIFFERENCE,HINNER=CAP_THICKNESS);
    
}


earphone_m2( );
