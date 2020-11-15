include <trucomanx/headphone/lib_cup.scad>;
include <trucomanx/headphone/lib_cap.scad>;
include <trucomanx/headphone/lib_rocker.scad>;
include <trucomanx/headphone/lib_bridge.scad>;


include <trucomanx/p2/lib_plug.scad>;

module earphone_m1(    CUP_CIL_W_EXT=70,   // Cumprimento do casco (diametro circulo incrito)
                        CUP_CIL_D_INT=50,   // Diametro interno do casco
                        CUP_CIL_H=18.5,  // Altura do casco
                        CUP_CIL_H_TOP=10, // Espesor da tapa do casco

                        CUP_KNOB_H=11.5,  // Altura da perilha do casco
                        CUP_KNOB_R=27.5,  // Radio da perilha do casco

                        CAP_THICKNESS=5,   // Espesura de cada lamina da tampa
                        CAP_DIFFERENCE=5,
                        
                        WIRE_THICKNESS=3.5,
                        BRIDGE_L=50,
                        BRIDGE_W=15,

                        ROCKER_CIL_R_INT=30,
                        ROCKER_CIL_W=5,
                        ROCKER_THICKNESS=10.0,
                        ROCKER_BASE_W=30,
                        ROCKER_BASE_L=20)
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
    color("SaddleBrown")
    rocker_block_circular(  CIL_R_INT = ROCKER_CIL_R_INT, // Radio interno cilindro
                            CIL_W     = ROCKER_CIL_W,     // Espesura cilndro
                            THICKNESS = ROCKER_THICKNESS,  // Espesura do arco
                            BASE_W    = ROCKER_BASE_W,   // Cumprimento da base
                            BASE_L    = ROCKER_BASE_L);  // Longo da base

    translate([-ROCKER_CIL_R_INT-ROCKER_BASE_L,0,CUP_CIL_H/2+CUP_KNOB_H*0.5])
    color("Peru")
    bridge_wire(    THICKNESS=WIRE_THICKNESS,     // Diametro del cable
                    BRIDGE_W=BRIDGE_W,     // Separacion del puente
                    BRIDGE_L=BRIDGE_L);     // Largura da parte paralela del puente
    
    
    translate([0,0,-CAP_THICKNESS-CUP_CIL_H/2])
    color("Green",alpha=0.5)
    cap_circular(  ROUTER=CUP_CIL_W_EXT/2,HOUTER=CAP_THICKNESS,RINNER=CUP_CIL_W_EXT/2-CAP_DIFFERENCE,HINNER=CAP_THICKNESS);
}

//earphone_m1();
