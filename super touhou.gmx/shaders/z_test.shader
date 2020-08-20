//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float size;
uniform float amount;
float theEquation(float var){
    return pow((0.2*var),3.0) + pow((0.8*var),5.0);
}
vec3 increment(vec3 inc, float amount2){
    float red = inc.r- mod(inc.r,pow(abs(inc.r*3.0),-amount));
    float green = inc.g-mod(inc.g,pow(abs(inc.g*3.0),-amount));
    float blue = inc.b-mod(inc.b,pow(abs(inc.b*3.0),-amount));
    return vec3(red,green,blue);
}

vec3 realincrement(vec3 inc,float amount3){
    float red = inc.r - mod(inc.r , amount3);
    float green = inc.g - mod(inc.g , amount3);
    float blue = inc.b-mod(inc.b , amount3);
    return vec3(red,green,blue);
}
void main()
{
    vec4 color = texture2D(gm_BaseTexture,v_vTexcoord);
     /*if(1.0/distance(v_vTexcoord,vec2(0.5)) > size){
        color = color + (color * vec4(0.2));
        }*/
    gl_FragColor = vec4(increment(color.rgb, 3.0),1.0);
}

