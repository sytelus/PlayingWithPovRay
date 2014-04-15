  #include "colors.inc"
  #include "textures.inc"
    #include "stones.inc"
    #include "glass.inc"
    #include "skies.inc"

//anim command: +kff256 +kc declare=fp=1
  
  background { color Cyan }
  camera {
    location <7, -10, -10>
    //location <clock*30, clock*-40+1, clock*-40+1>
    //location <0, -0, -10>
    //location <10, 5, -5>
    look_at  <0, 0,  0>
  }     
  

#declare povPlanet = union
{  
  sphere {
    <0, 1, 8>, 6
    texture {
      Blood_Sky scale 0
    }
  }                  
  
  
  cone {
    <0, 2, 0>, 1.3    // Center and radius of one end
    <1, 5, 3>, 1.0    // Center and radius of other end
    open              // Removes end caps
    material { 
        M_Glass3 scale 3 
     texture {pigment {color rgbt<0.5, 0.8,0.2,0.65> } }
     }
  }


  cylinder {
    <-1.2, -1.6, -3.6>,     // Center of one end
    <1, 5, 3>,     // Center of other end
    0.27            // Radius
    open           // Remove end caps
    texture { Lightning1  scale 1 }     
    //pigment {color rgbt<0.5, 0.1,0.65,0.2> }      
    
  }
    

    torus {
    10, 0.4
    rotate <-35,10,20>  
        texture {T_Cloud1 pigment {rgbt<0.5, 0.8,0.2,0.65>}    }          
    translate <0, 0, 8>
  }


  box {
    <-2, -5,   -2>,  // Near lower left corner
    < 0, -6.5,  0>   // Far upper right corner
      texture {
      T_Stone25     // Pre-defined from stones.inc
      scale 4       // Scale by the same amount in all
                    // directions
    }
    rotate <50,20,10>     // Equivalent to "rotate <0,20,0>"   
  }

}


 object {povPlanet translate <0,3,1>}
  
 light_source { <2, -5, -30> color White}

  plane { <0, 30, -30>, -1
    texture {Clouds
    }
  }


  sky_sphere {
    pigment {
      gradient y
      color_map {
        [0.000 0.002 color rgb <1.0, 0.2, 0.0>
                     color rgb <1.0, 0.2, 0.0>]
        [0.002 0.200 color rgb <0.8, 0.1, 0.0>
                     color rgb <0.2, 0.2, 0.3>]
      }
      scale 2
      translate -1
    }
    
    rotate -135*x
  }
