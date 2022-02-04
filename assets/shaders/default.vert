#define LAMBERT
varying float pos;

varying vec3 vLightFront;

#ifdef DOUBLE_SIDED

varying vec3 vLightBack;

#endif

#include <common>
#include <displacementmap_pars_vertex>
// #include <lightmap_pars_vertex>
#include <envmap_pars_vertex>
// #include <lights_lambert_pars_vertex>
#include <color_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
varying mat4 cameraSpaceMatrix;

#ifndef FLAT_SHADED
    varying vec3 vNormal;
#endif

void main(){

    #include <uv_vertex>

    #include <beginnormal_vertex>
    #include <morphnormal_vertex>
    #include <skinbase_vertex>
    #include <skinnormal_vertex>
    #include <defaultnormal_vertex>

     #ifndef FLAT_SHADED // Normal computed with derivatives when FLAT_SHADED
        vNormal = normalize( transformedNormal );
    #endif


    
    // #include <default_vertex>
    #include <logdepthbuf_vertex>
    
    // #include <worldpos_vertex>
    #include <envmap_vertex>
    // #include <shadowmap_vertex>

    cameraSpaceMatrix=projectionMatrix*modelViewMatrix;
    vec4 mvPosition=modelViewMatrix*vec4(position,1.);
    vec3 modelPos=position.xyz;
    gl_Position=projectionMatrix*mvPosition;
}