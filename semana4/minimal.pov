// PoV-Ray 3.6/3.7 Scene File "Minimal.pov"
// by Friedrich A. Lohmueller, March-2010 / Feb-2013
//-------------------------------------------
#version 3.6; // 3.7;
global_settings{assumed_gamma 1.0}
#default{ finish{ ambient 0.1 diffuse 0.9 }}
//------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//------------------------------------------
// camera ----------------------------------

// original
camera{ location  <1.0 , 1.0 ,-3.0>
        look_at   <0.0 , 1.0 , 0.0>
        right x*image_width/image_height
        angle 75 }
        
// pontual   
light_source{ <8,8,-12> color White}

                         
/*

// direcional
light_source{ <8,8,-12>  color White
              parallel
              point_at<1,1,-3>
            } 

// spot                                    
light_source{ <8,8,-12> color White   
              spotlight
              point_at<1,1,-3>
              radius 20  // hotspot
              tightness 100
              falloff 60
              translate< 1.3, 3, 0>
            }
            
*/
        
// sun -------------------------------------

// sky -------------------------------------
plane{ <0,1,0>,1 hollow
       texture{
         pigment{ bozo turbulence 0.92
           color_map{
                 [0.00 rgb<0.05,0.15,0.45>]
                 [0.50 rgb<0.05,0.15,0.45>]
                 [0.70 rgb<1,1,1>        ]
                 [0.85 rgb<0.2,0.2,0.2>  ]
                 [1.00 rgb<0.5,0.5,0.5>  ]
                       } //
           scale<1,1,1.5>*2.5
           translate<0,0,0>
           } // end of pigment
         finish {ambient 1 diffuse 0}
        } // end of texture
       scale 10000}
// fog on the ground -----------------------
fog { fog_type   2
      distance   50
      color      rgb<1,1,1>*0.8
      fog_offset 0.1
      fog_alt    1.5
      turbulence 1.8
    } //
// ground ----------------------------------
plane{ <0,1,0>, 0
       texture{
          pigment{ color rgb<0.22,0.45,0>}
          normal { bumps 0.75 scale 0.015 }
          finish { phong 0.1 }
       } // end of texture
     } // end of plane
//------------------------------------------
//------------------------------------------
// objects in scene ------------------------
sphere{ <0,0,0>, 0.75
        texture{
          pigment{ color rgb<0.9,0.55,0>}
          finish {  }
        } // end of texture
        translate<0.85,1.1,0>
      } // end of sphere
//------------------------------------- end



//------------------------------ the Axes --------------------------------

//------------------------------------------------------------------------
#macro Axis_( AxisLen, Dark_Texture,Light_Texture)
 union{
    cylinder { <0,-AxisLen,0>,<0,AxisLen,0>,0.05
               texture{checker texture{Dark_Texture }
                               texture{Light_Texture}
                       translate<0.1,0,0.1>}
             }
    cone{<0,AxisLen,0>,0.2,<0,AxisLen+0.7,0>,0
          texture{Dark_Texture}
         }
     } // end of union
#end // of macro "Axis()"
//------------------------------------------------------------------------
#macro AxisXYZ( AxisLenX, AxisLenY, AxisLenZ, Tex_Dark, Tex_Light)
//--------------------- drawing of 3 Axes --------------------------------
#local Font_Name = "cyrvetic.ttf"
#declare Text_Rotate = < 5,-45,0>; //
union{
#if (AxisLenX != 0)
 object { Axis_(AxisLenX, Tex_Dark, Tex_Light)   rotate< 0,0,-90>}// x-Axis
 text   { ttf Font_Name,  "x",  0.15,  0  texture{Tex_Dark}
          rotate Text_Rotate scale 0.6 translate <AxisLenX+0.15,0.3,-0.05> no_shadow }
#end // of #if
#if (AxisLenY != 0)
 object { Axis_(AxisLenY, Tex_Dark, Tex_Light)   rotate< 0,0,  0>}// y-Axis
 text   { ttf Font_Name,  "y",  0.15,  0  texture{Tex_Dark}
          rotate <Text_Rotate.x,0,0> scale 0.6 translate <-0.55,AxisLenY+0.20,-0.05>
          rotate <0,Text_Rotate.y,0> no_shadow }
#end // of #if
#if (AxisLenZ != 0)
 object { Axis_(AxisLenZ, Tex_Dark, Tex_Light)   rotate<90,0,  0>}// z-Axis
 text   { ttf Font_Name,  "z",  0.15,  0  texture{Tex_Dark}
          rotate Text_Rotate scale 0.95 translate <-0.75,0.2,AxisLenZ+0.10> no_shadow }
#end // of #if
} // end of union
#end// of macro "AxisXYZ( ... )"
//-------------------------------------------------------------------------
//------------------------------------------------------------------------
#declare Texture_A_Dark  = texture {
                               pigment{ color rgb<1,0.45,0>}
                               finish { phong 1}
                           }
#declare Texture_A_Light = texture {
                              pigment{ color rgb<1,1,1>}
                              finish { phong 1}
                           }
object{ AxisXYZ( 4.0, 3.5, 6.0, Texture_A_Dark, Texture_A_Light) scale 0.25}
//-------------------------------------------------- end of coordinate axes


//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------





