#ifndef RAYMARCH_BASIC
#define RAYMARCH_BASIC

float accDensity = 0;

void Raymarch_float(float3 noise, float3 rayOrigin, float3 rayDirection, float numSteps, float stepSize, float densityScale, out float Out)
{
    for(int i = 0; i < numSteps; i++)
    {
    }
    Out = accDensity;
}

#endif
