/* Generated by Nim Compiler v2.0.4 */
#define NIM_INTBITS 64
#define NIM_EmulateOverflowChecks

#include "nimbase.h"
#include <string.h>
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
typedef struct NimStrPayload NimStrPayload;
typedef struct NimStringV2 NimStringV2;
typedef struct tySequence__6H5Oh5UUvVCLiakt9aTwtUQ tySequence__6H5Oh5UUvVCLiakt9aTwtUQ;
typedef struct tySequence__6H5Oh5UUvVCLiakt9aTwtUQ_Content tySequence__6H5Oh5UUvVCLiakt9aTwtUQ_Content;
struct NimStrPayload {
	NI cap;
	NIM_CHAR data[SEQ_DECL_SIZE];
};
struct NimStringV2 {
	NI len;
	NimStrPayload* p;
};
struct tySequence__6H5Oh5UUvVCLiakt9aTwtUQ {
  NI len; tySequence__6H5Oh5UUvVCLiakt9aTwtUQ_Content* p;
};
struct tySequence__6H5Oh5UUvVCLiakt9aTwtUQ_Content { NI cap; NU8 data[SEQ_DECL_SIZE]; };
static N_INLINE(void, addInt__stdZprivateZdigitsutils_u195)(NimStringV2* result_p0, NI x_p1);
N_LIB_PRIVATE N_NIMCALL(void, addInt__stdZprivateZdigitsutils_u178)(NimStringV2* result_p0, NI64 x_p1);
N_LIB_PRIVATE N_NIMCALL(NimStringV2, collectionToString__gif50anim_u2919)(tySequence__6H5Oh5UUvVCLiakt9aTwtUQ x_p0, NimStringV2 prefix_p1, NimStringV2 separator_p2, NimStringV2 suffix_p3);
N_LIB_PRIVATE N_NIMCALL(void, eqcopy___stdZassertions_u16)(NimStringV2* dest_p0, NimStringV2 src_p1);
static N_INLINE(void, appendString)(NimStringV2* dest_p0, NimStringV2 src_p1);
static N_INLINE(void, copyMem__system_u1740)(void* dest_p0, void* source_p1, NI size_p2);
static N_INLINE(void, nimCopyMem)(void* dest_p0, void* source_p1, NI size_p2);
N_LIB_PRIVATE N_NIMCALL(void, prepareAdd)(NimStringV2* s_p0, NI addLen_p1);
N_LIB_PRIVATE N_NIMCALL(void, addQuoted__gif50anim_u2950)(NimStringV2* s_p0, NU8 x_p1);
N_LIB_PRIVATE N_NIMCALL(void, addInt__stdZprivateZdigitsutils_u175)(NimStringV2* result_p0, NU64 x_p1);
static const struct {
  NI cap; NIM_CHAR data[2+1];
} TM__n49a9aYp5BrbXv9a6OCpJYm0g_2 = { 2 | NIM_STRLIT_FLAG, "@[" };
static const NimStringV2 TM__n49a9aYp5BrbXv9a6OCpJYm0g_3 = {2, (NimStrPayload*)&TM__n49a9aYp5BrbXv9a6OCpJYm0g_2};
static const struct {
  NI cap; NIM_CHAR data[2+1];
} TM__n49a9aYp5BrbXv9a6OCpJYm0g_4 = { 2 | NIM_STRLIT_FLAG, ", " };
static const NimStringV2 TM__n49a9aYp5BrbXv9a6OCpJYm0g_5 = {2, (NimStrPayload*)&TM__n49a9aYp5BrbXv9a6OCpJYm0g_4};
static const struct {
  NI cap; NIM_CHAR data[1+1];
} TM__n49a9aYp5BrbXv9a6OCpJYm0g_6 = { 1 | NIM_STRLIT_FLAG, "]" };
static const NimStringV2 TM__n49a9aYp5BrbXv9a6OCpJYm0g_7 = {1, (NimStrPayload*)&TM__n49a9aYp5BrbXv9a6OCpJYm0g_6};
static N_INLINE(void, addInt__stdZprivateZdigitsutils_u195)(NimStringV2* result_p0, NI x_p1) {
	addInt__stdZprivateZdigitsutils_u178(result_p0, ((NI64) (x_p1)));
}
N_LIB_PRIVATE N_NIMCALL(NimStringV2, dollar___systemZdollars_u3)(NI x_p0) {
	NimStringV2 result;
	result.len = 0; result.p = NIM_NIL;
	addInt__stdZprivateZdigitsutils_u195((&result), x_p0);
	return result;
}
static N_INLINE(void, nimCopyMem)(void* dest_p0, void* source_p1, NI size_p2) {
	void* T1_;
	T1_ = (void*)0;
	T1_ = memcpy(dest_p0, source_p1, ((size_t) (size_p2)));
}
static N_INLINE(void, copyMem__system_u1740)(void* dest_p0, void* source_p1, NI size_p2) {
	nimCopyMem(dest_p0, source_p1, size_p2);
}
static N_INLINE(void, appendString)(NimStringV2* dest_p0, NimStringV2 src_p1) {
	{
		if (!(((NI)0) < src_p1.len)) goto LA3_;
		copyMem__system_u1740(((void*) ((&(*(*dest_p0).p).data[(*dest_p0).len]))), ((void*) ((&(*src_p1.p).data[((NI)0)]))), ((NI) ((NI)(src_p1.len + ((NI)1)))));
		(*dest_p0).len += src_p1.len;
	}
LA3_: ;
}
N_LIB_PRIVATE N_NIMCALL(NimStringV2, collectionToString__gif50anim_u2919)(tySequence__6H5Oh5UUvVCLiakt9aTwtUQ x_p0, NimStringV2 prefix_p1, NimStringV2 separator_p2, NimStringV2 suffix_p3) {
	NimStringV2 result;
	NIM_BOOL firstElement;
	result.len = 0; result.p = NIM_NIL;
	eqcopy___stdZassertions_u16((&result), prefix_p1);
	firstElement = NIM_TRUE;
	{
		NU8* value;
		NI i;
		NI L;
		NI T2_;
		value = (NU8*)0;
		i = ((NI)0);
		T2_ = x_p0.len;
		L = T2_;
		{
			while (1) {
				if (!(i < L)) goto LA4;
				value = (&x_p0.p->data[i]);
				{
					if (!firstElement) goto LA7_;
					firstElement = NIM_FALSE;
				}
				goto LA5_;
LA7_: ;
				{
					prepareAdd((&result), separator_p2.len + 0);
appendString((&result), separator_p2);
				}
LA5_: ;
				addQuoted__gif50anim_u2950((&result), (*value));
				i += ((NI)1);
			} LA4: ;
		}
	}
	prepareAdd((&result), suffix_p3.len + 0);
appendString((&result), suffix_p3);
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NimStringV2, dollar___gif50anim_u2915)(tySequence__6H5Oh5UUvVCLiakt9aTwtUQ x_p0) {
	NimStringV2 result;
	result = collectionToString__gif50anim_u2919(x_p0, TM__n49a9aYp5BrbXv9a6OCpJYm0g_3, TM__n49a9aYp5BrbXv9a6OCpJYm0g_5, TM__n49a9aYp5BrbXv9a6OCpJYm0g_7);
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NimStringV2, dollar___systemZdollars_u9)(NU64 x_p0) {
	NimStringV2 result;
	result.len = 0; result.p = NIM_NIL;
	addInt__stdZprivateZdigitsutils_u175((&result), x_p0);
	return result;
}