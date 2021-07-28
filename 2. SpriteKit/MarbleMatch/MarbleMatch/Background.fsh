// Fragment shader written in GLSL
// This creates a water ripple effect 
//
// u_X stands for Uniform. This means the values I'm passing in when creating the shader. 
//
// Fragment shaders with modify each pixel on screen

void main() {
    // u_time is the current time
    // u_speed is passed in by us from swift
    // It's a very large number, so reduce it down
    float speed = u_time * u_speed * 0.05;
    
    // we'll pass in the strength via Swift and reduce the size.
    // THis is so we can pass in normal size numbers rather than minute fractions.
    float strength = u_strength / 100.0;
    
    // vec2 is a vector2, an X and Y coordinate (like a CGFLoat)
    // v_tex_coord is the coordinate of the pixel that we are working on at this moment
    // Making the coord variable so we can modify it to make our effect
    vec2 coord = v_tex_coord;
    
    // u_frequency is how many to make.
    coord.x += sin((coord.x + speed) * u_frequency) * strength;
    coord.y += cos((coord.y + speed) * u_frequency) * strength;
    
    // gl_FragColor is the final output colour value for the pixel
    // Read the texture of the pixel at the modified position
    // v_color_mix.a means if it's transparent, leave our pixel as transparent too
    gl_FragColor = texture2D(u_texture, coord) * v_color_mix.a;
}


// Need to pass in values for speed, strength and frequency. The rest are automatic.
