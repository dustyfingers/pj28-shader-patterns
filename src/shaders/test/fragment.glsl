varying vec2 vUv;

// no native random function in glsl
// so we use homebrew pseudo-random number generator functions like so:
float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

void main()
{
    // pattern #3
    // float strength = vUv.x;

    // pattern #4
    // float strength = vUv.y;

    // pattern #5
    // float strength = 1.0 - vUv.y;

    // pattern #6
    // float strength = vUv.y * 10.0;

    // pattern #7
    // float strength = mod(vUv.y * 10.0, 1.0);

    // pattern #8
    // float strength = mod(vUv.y * 10.0, 1.0);
    // strength = step(0.5, strength);

    // avoid if statements in glsl
    // if (strength < 0.5)
    // {
    //     strength = 0.0;
    // } else {
    //     strength = 1.0;
    // }

    // pattern #9
    // float strength = mod(vUv.y * 10.0, 1.0);
    // strength = step(0.85, strength);

    // pattern #10
    // float strength = mod(vUv.x * 10.0, 1.0);
    // strength = step(0.85, strength);

    // pattern #11
    // float strength = step(0.85, mod(vUv.x * 10.0, 1.0));
    // strength += step(0.85, mod(vUv.y * 10.0, 1.0));

    // pattern #12
    // float strength = step(0.85, mod(vUv.x * 10.0, 1.0));
    // strength *= step(0.85, mod(vUv.y * 10.0, 1.0));

    // pattern #13
    // float strength = step(0.25, mod(vUv.x * 10.0, 1.0));
    // strength *= step(0.85, mod(vUv.y * 10.0, 1.0));

    // pattern #14
    // float barX = step(0.4, mod(vUv.x * 10.0, 1.0));
    // barX *= step(0.8, mod(vUv.y * 10.0, 1.0));

    // float barY = step(0.8, mod(vUv.x * 10.0, 1.0));
    // barY *= step(0.4, mod(vUv.y * 10.0, 1.0));

    // float strength = barX + barY;

    // pattern #15
    // float barX = step(0.4, mod(vUv.x * 10.0, 1.0));
    // barX *= step(0.8, mod(vUv.y * 10.0 + 0.2, 1.0));

    // float barY = step(0.8, mod(vUv.x * 10.0 + 0.2, 1.0));
    // barY *= step(0.4, mod(vUv.y * 10.0, 1.0));

    // float strength = barX + barY;

    // pattern #16
    // float strength = abs(vUv.x - 0.5);

    // pattern #17
    // float strength = min(abs(vUv.x - 0.5), abs(vUv.y - 0.5));

    // pattern #18
    // float strength = max(abs(vUv.x - 0.5), abs(vUv.y - 0.5));

    // pattern #19
    // float strength = step(0.2, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));

    // pattern #20
    // float square1 = step(0.2, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // float square2 = 1.0 - step(0.25, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // float strength = square1 * square2;

    // pattern #21
    // float strength = floor(vUv.x * 10.0) / 10.0;

    // pattern #22
    // float strength = floor(vUv.x * 10.0) / 10.0;
    // strength *= floor(vUv.y * 10.0) / 10.0;

    // pattern #23 - random noise (hi-def)
    // float strength = random(vUv);

    // pattern #24 - random noise (lo-def)
    // vec2 gridUv = vec2(floor(vUv.x * 10.0) / 10.0, floor(vUv.y * 10.0) / 10.0);
    // float strength = random(gridUv);

    // pattern #25 - offset random noise (lo-def)
    vec2 gridUv = vec2(floor(vUv.x * 10.0) / 10.0, floor(vUv.y * 10.0) / 10.0);
    float strength = random(gridUv);

    gl_FragColor = vec4(strength, strength, strength, 1.0);
}