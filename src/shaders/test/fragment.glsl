varying vec2 vUv;

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
    float strength = step(0.85, mod(vUv.x * 10.0, 1.0));
    strength *= step(0.85, mod(vUv.y * 10.0, 1.0));


    gl_FragColor = vec4(strength, strength, strength, 1.0);
}