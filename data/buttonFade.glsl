uniform sampler2D texture;
varying vec4 vertTexCoord;

/*float easing(float x) {
	float y;
	
	y = 0.4 * exp(0.8 * x);
	y = cos(3.141 * y) * 0.5 + 1.;
	y = y * -x + 1.;
	
	return y;
}*/

float easing(float x) {
	float cutoff = 0.3;
	
	return x > cutoff ? -0.5 * (x - cutoff) + 1. : 1.;
}

void main() {
	vec2 uv = vertTexCoord.xy;
	vec4 color = texture2D(texture, uv);
	
	//float c = easing(uv.y) * -uv.y + 1.;
	float c = easing(uv.y);
	gl_FragColor = vec4(c, c, c, 1.);
}