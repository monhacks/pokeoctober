/* Generated by Nim Compiler v2.0.4 */
#define NIM_INTBITS 64
#define NIM_EmulateOverflowChecks

#include "nimbase.h"
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef far
#undef powerpc
#undef unix
N_LIB_PRIVATE N_NIMCALL(NI, nextPowerOfTwo__pureZmath_u219)(NI x_p0) {
	NI result;
	result = (NI)(x_p0 - ((NI)1));
	result = (NI)(result | (NI)((NI64)(result) >> (NU64)(((NI)32))));
	result = (NI)(result | (NI)((NI64)(result) >> (NU64)(((NI)16))));
	result = (NI)(result | (NI)((NI64)(result) >> (NU64)(((NI)8))));
	result = (NI)(result | (NI)((NI64)(result) >> (NU64)(((NI)4))));
	result = (NI)(result | (NI)((NI64)(result) >> (NU64)(((NI)2))));
	result = (NI)(result | (NI)((NI64)(result) >> (NU64)(((NI)1))));
	result += (NI)(((NI)1) + (x_p0 <= ((NI)0)));
	return result;
}
