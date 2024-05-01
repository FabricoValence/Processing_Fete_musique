#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;


uniform float redMult;  // = 0.1;
uniform float greenMult = 0.02;
uniform float blueMult = 0.05;



void main() {
  vec2 pos = vertTexCoord.xy;//int((pos - 100) * redMult)

  gl_FragColor = vec4(
    texture2D(texture, pos + (pos - 0.5) * redMult).r, 
    texture2D(texture, pos + (pos - 0.5) * greenMult).g, 
    texture2D(texture, pos + (pos - 0.5) * blueMult).b,
    1.0);

/*gl_FragColor = vec4(
    abs(pos/200.0),1.0,
    1.0);*/
    /*gl_FragColor = vec4(
        pos, 
        0.0,
        1.0);*/
}
