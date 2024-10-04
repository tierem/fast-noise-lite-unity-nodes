#ifndef RAYMARCH_BASIC
#define RAYMARCH_BASIC

#include "Assets/Fast Noise/FastNoiseLite.hlsl"

float accDensity = 0;

fnl_state state;

void Raymarch_float(float3 rayOrigin, float3 rayDirection, float numSteps, float stepSize, float densityScale, float noiseScale, out float Out)
{
    for(int i = 0; i < numSteps; i++)
    {
        rayOrigin += (rayDirection * stepSize);

        // Noise settings

        state.seed = 1337;
        state.frequency = 0.01f;
        state.noise_type = FNL_NOISE_OPENSIMPLEX2;
        state.rotation_type_3d = FNL_ROTATION_NONE;
        state.fractal_type = FNL_FRACTAL_NONE;
        state.octaves = 3;
        state.lacunarity = 2.0f;
        state.gain = 0.5f;
        state.weighted_strength = 0.0f;
        state.ping_pong_strength = 2.0f;
        state.cellular_distance_func = FNL_CELLULAR_DISTANCE_EUCLIDEANSQ;
        state.cellular_return_type = FNL_CELLULAR_RETURN_TYPE_DISTANCE;
        state.cellular_jitter_mod = 1.0f;
        state.domain_warp_amp = 30.0f;
        state.domain_warp_type = FNL_DOMAIN_WARP_OPENSIMPLEX2;

        // Sample 3D Noise at position

        float sampleDensity = (fnlGetNoise3D(state, rayOrigin.x * 512, rayOrigin.y * 512, rayOrigin.z * 512) + 1.0) / 2.0;

        accDensity += sampleDensity * densityScale / 100;
        
    }
    Out = accDensity;
}

#endif
