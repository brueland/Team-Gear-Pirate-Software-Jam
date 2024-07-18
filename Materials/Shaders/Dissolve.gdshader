shader_type canvas_item;

uniform sampler2D noise_Tex;
uniform float dissolvePercent : hint_range(0.0,1.0);
uniform float dissolveSpeed;
uniform bool dissolving;

void vertex() 
{
	VERTEX += vec2(0,0);
	VERTEX += vec2(cos(TIME)*0.1, sin(TIME)*1.0);
}

void fragment() {

vec4 original_color = texture(TEXTURE,UV);
vec4 final_color = original_color;
vec4 noise = texture(noise_Tex,UV);

if(dissolvePercent >= noise.r)
{
	final_color.a = 0.0;
}

COLOR = final_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
