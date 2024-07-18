shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float glitch_intensity : hint_range(0.0, 1.0) = 0.1;
uniform float glitch_speed : hint_range(0.0, 10.0) = 5.0;

void fragment() {
    vec2 uv = SCREEN_UV;
    vec2 offset = vec2(0.0);
    
    float time = TIME * glitch_speed;
    
    offset.x = glitch_intensity * 0.1 * sin(time * 10.0 + uv.y * 20.0);
    offset.y = glitch_intensity * 0.05 * sin(time * 5.0 + uv.x * 10.0);
    
    vec4 red = texture(SCREEN_TEXTURE, uv + offset);
    vec4 green = texture(SCREEN_TEXTURE, uv);
    vec4 blue = texture(SCREEN_TEXTURE, uv - offset);
    
    COLOR = vec4(red.r, green.g, blue.b, 1.0);
}