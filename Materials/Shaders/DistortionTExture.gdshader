shader_type canvas_item;

uniform sampler2D tex: hint_default_white;

uniform sampler2D noise_tex1: repeat_enable;
uniform sampler2D noise_tex2: repeat_enable;

uniform vec2 offset1 = vec2(0.1);
uniform vec2 offset2 = vec2(0.2);

uniform float alpha: hint_range(0.0, 1.0);

uniform float distortion_strength: hint_range(-1.0, 1.0) = 0.1;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	
	vec4 noise_Color1 = texture(noise_tex1, UV + offset1 * TIME);
	vec4 noise_Color2 = texture(noise_tex2, UV + offset2 * TIME);
	
	float final_noise = noise_Color1.r * noise_Color2.r;
	vec4 final_color = texture(TEXTURE,UV + final_noise * distortion_strength);
	
	COLOR = vec4(final_color.r, final_color.g,final_color.b, final_color.a * alpha);
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
