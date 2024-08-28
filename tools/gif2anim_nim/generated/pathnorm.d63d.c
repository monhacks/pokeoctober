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
typedef struct tyObject_PathIter__ncrAQm84p2rryv0P5gPo3Q tyObject_PathIter__ncrAQm84p2rryv0P5gPo3Q;
typedef struct tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ;
struct NimStrPayload {
	NI cap;
	NIM_CHAR data[SEQ_DECL_SIZE];
};
struct NimStringV2 {
	NI len;
	NimStrPayload* p;
};
struct tyObject_PathIter__ncrAQm84p2rryv0P5gPo3Q {
	NI i;
	NI prev;
	NIM_BOOL notFirst;
};
struct tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ {
NI Field0;
NI Field1;
};
static N_INLINE(void, nimZeroMem)(void* p_p0, NI size_p1);
static N_INLINE(void, nimSetMem__systemZmemory_u7)(void* a_p0, int v_p1, NI size_p2);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, hasNext__pureZpathnorm_u6)(tyObject_PathIter__ncrAQm84p2rryv0P5gPo3Q it_p0, NimStringV2 x_p1);
N_LIB_PRIVATE N_NIMCALL(tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ, next__pureZpathnorm_u10)(tyObject_PathIter__ncrAQm84p2rryv0P5gPo3Q* it_p0, NimStringV2 x_p1);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, isSlash__pureZpathnorm_u75)(NimStringV2 x_p0, tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ bounds_p1);
static N_INLINE(void, nimAddCharV1)(NimStringV2* s_p0, NIM_CHAR c_p1);
N_LIB_PRIVATE N_NIMCALL(void, prepareAdd)(NimStringV2* s_p0, NI addLen_p1);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, isDotDot__pureZpathnorm_u71)(NimStringV2 x_p0, tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ bounds_p1);
N_LIB_PRIVATE N_NIMCALL(void, setLengthStrV2)(NimStringV2* s_p0, NI newLen_p1);
N_LIB_PRIVATE N_NIMCALL(NimStringV2, substr__system_u6122)(NimStringV2 s_p0, NI first_p1, NI last_p2);
static N_INLINE(void, appendString)(NimStringV2* dest_p0, NimStringV2 src_p1);
static N_INLINE(void, copyMem__system_u1740)(void* dest_p0, void* source_p1, NI size_p2);
static N_INLINE(void, nimCopyMem)(void* dest_p0, void* source_p1, NI size_p2);
N_LIB_PRIVATE N_NOCONV(void, dealloc)(void* p_p0);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, isDot__pureZpathnorm_u67)(NimStringV2 x_p0, tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ bounds_p1);
N_LIB_PRIVATE N_NIMCALL(void, eqsink___stdZassertions_u22)(NimStringV2* dest_p0, NimStringV2 src_p1);
static const struct {
  NI cap; NIM_CHAR data[1+1];
} TM__DfU0iuayCGwHDN1Exp9cbKg_2 = { 1 | NIM_STRLIT_FLAG, "." };
static const NimStringV2 TM__DfU0iuayCGwHDN1Exp9cbKg_3 = {1, (NimStrPayload*)&TM__DfU0iuayCGwHDN1Exp9cbKg_2};
static N_INLINE(void, nimSetMem__systemZmemory_u7)(void* a_p0, int v_p1, NI size_p2) {
	void* T1_;
	T1_ = (void*)0;
	T1_ = memset(a_p0, v_p1, ((size_t) (size_p2)));
}
static N_INLINE(void, nimZeroMem)(void* p_p0, NI size_p1) {
	nimSetMem__systemZmemory_u7(p_p0, ((int)0), size_p1);
}
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, hasNext__pureZpathnorm_u6)(tyObject_PathIter__ncrAQm84p2rryv0P5gPo3Q it_p0, NimStringV2 x_p1) {
	NIM_BOOL result;
	result = (it_p0.i < x_p1.len);
	return result;
}
N_LIB_PRIVATE N_NIMCALL(tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ, next__pureZpathnorm_u10)(tyObject_PathIter__ncrAQm84p2rryv0P5gPo3Q* it_p0, NimStringV2 x_p1) {
	tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ result;
	nimZeroMem((void*)(&result), sizeof(tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ));
	(*it_p0).prev = (*it_p0).i;
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = !((*it_p0).notFirst);
		if (!(T3_)) goto LA4_;
		T3_ = (((NU8)(x_p1.p->data[(*it_p0).i])) == ((NU8)(47)) || ((NU8)(x_p1.p->data[(*it_p0).i])) == ((NU8)(47)));
LA4_: ;
		if (!T3_) goto LA5_;
		(*it_p0).i += ((NI)1);
	}
	goto LA1_;
LA5_: ;
	{
		{
			while (1) {
				NIM_BOOL T10_;
				T10_ = (NIM_BOOL)0;
				T10_ = ((*it_p0).i < x_p1.len);
				if (!(T10_)) goto LA11_;
				T10_ = !((((NU8)(x_p1.p->data[(*it_p0).i])) == ((NU8)(47)) || ((NU8)(x_p1.p->data[(*it_p0).i])) == ((NU8)(47))));
LA11_: ;
				if (!T10_) goto LA9;
				(*it_p0).i += ((NI)1);
			} LA9: ;
		}
	}
LA1_: ;
	{
		NI colontmp_;
		NI colontmp__2;
		if (!((*it_p0).prev < (*it_p0).i)) goto LA14_;
		colontmp_ = (*it_p0).prev;
		colontmp__2 = (NI)((*it_p0).i - ((NI)1));
		result.Field0 = colontmp_;
		result.Field1 = colontmp__2;
	}
	goto LA12_;
LA14_: ;
	{
		NIM_BOOL T17_;
		T17_ = (NIM_BOOL)0;
		T17_ = hasNext__pureZpathnorm_u6((*it_p0), x_p1);
		if (!T17_) goto LA18_;
		result = next__pureZpathnorm_u10(it_p0, x_p1);
	}
	goto LA12_;
LA18_: ;
LA12_: ;
	{
		while (1) {
			NIM_BOOL T22_;
			T22_ = (NIM_BOOL)0;
			T22_ = ((*it_p0).i < x_p1.len);
			if (!(T22_)) goto LA23_;
			T22_ = (((NU8)(x_p1.p->data[(*it_p0).i])) == ((NU8)(47)) || ((NU8)(x_p1.p->data[(*it_p0).i])) == ((NU8)(47)));
LA23_: ;
			if (!T22_) goto LA21;
			(*it_p0).i += ((NI)1);
		} LA21: ;
	}
	(*it_p0).notFirst = NIM_TRUE;
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, isSlash__pureZpathnorm_u75)(NimStringV2 x_p0, tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ bounds_p1) {
	NIM_BOOL result;
	NIM_BOOL T1_;
	T1_ = (NIM_BOOL)0;
	T1_ = (bounds_p1.Field1 == bounds_p1.Field0);
	if (!(T1_)) goto LA2_;
	T1_ = (((NU8)(x_p0.p->data[bounds_p1.Field0])) == ((NU8)(47)) || ((NU8)(x_p0.p->data[bounds_p1.Field0])) == ((NU8)(47)));
LA2_: ;
	result = T1_;
	return result;
}
static N_INLINE(void, nimAddCharV1)(NimStringV2* s_p0, NIM_CHAR c_p1) {
	prepareAdd(s_p0, ((NI)1));
	(*(*s_p0).p).data[(*s_p0).len] = c_p1;
	(*s_p0).len += ((NI)1);
	(*(*s_p0).p).data[(*s_p0).len] = 0;
}
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, isDotDot__pureZpathnorm_u71)(NimStringV2 x_p0, tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ bounds_p1) {
	NIM_BOOL result;
	NIM_BOOL T1_;
	NIM_BOOL T2_;
	T1_ = (NIM_BOOL)0;
	T2_ = (NIM_BOOL)0;
	T2_ = (bounds_p1.Field1 == (NI)(bounds_p1.Field0 + ((NI)1)));
	if (!(T2_)) goto LA3_;
	T2_ = ((NU8)(x_p0.p->data[bounds_p1.Field0]) == (NU8)(46));
LA3_: ;
	T1_ = T2_;
	if (!(T1_)) goto LA4_;
	T1_ = ((NU8)(x_p0.p->data[(NI)(bounds_p1.Field0 + ((NI)1))]) == (NU8)(46));
LA4_: ;
	result = T1_;
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
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, isDot__pureZpathnorm_u67)(NimStringV2 x_p0, tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ bounds_p1) {
	NIM_BOOL result;
	NIM_BOOL T1_;
	T1_ = (NIM_BOOL)0;
	T1_ = (bounds_p1.Field1 == bounds_p1.Field0);
	if (!(T1_)) goto LA2_;
	T1_ = ((NU8)(x_p0.p->data[bounds_p1.Field0]) == (NU8)(46));
LA2_: ;
	result = T1_;
	return result;
}
N_LIB_PRIVATE N_NIMCALL(void, addNormalizePath__pureZpathnorm_u83)(NimStringV2 x_p0, NimStringV2* result_p1, NI* state_p2, NIM_CHAR dirSep_p3) {
	tyObject_PathIter__ncrAQm84p2rryv0P5gPo3Q it;
	nimZeroMem((void*)(&it), sizeof(tyObject_PathIter__ncrAQm84p2rryv0P5gPo3Q));
	it.notFirst = (((NI)0) < (NI)((NI64)((*state_p2)) >> (NU64)(((NI)1))));
	{
		if (!it.notFirst) goto LA3_;
		{
			while (1) {
				NIM_BOOL T7_;
				T7_ = (NIM_BOOL)0;
				T7_ = (it.i < x_p0.len);
				if (!(T7_)) goto LA8_;
				T7_ = (((NU8)(x_p0.p->data[it.i])) == ((NU8)(47)) || ((NU8)(x_p0.p->data[it.i])) == ((NU8)(47)));
LA8_: ;
				if (!T7_) goto LA6;
				it.i += ((NI)1);
			} LA6: ;
		}
	}
LA3_: ;
	{
		while (1) {
			NIM_BOOL T11_;
			tyTuple__1v9bKyksXWMsm0vNwmZ4EuQ b;
			T11_ = (NIM_BOOL)0;
			T11_ = hasNext__pureZpathnorm_u6(it, x_p0);
			if (!T11_) goto LA10;
			b = next__pureZpathnorm_u10((&it), x_p0);
			{
				NIM_BOOL T14_;
				T14_ = (NIM_BOOL)0;
				T14_ = ((NI)((NI64)((*state_p2)) >> (NU64)(((NI)1))) == ((NI)0));
				if (!(T14_)) goto LA15_;
				T14_ = isSlash__pureZpathnorm_u75(x_p0, b);
LA15_: ;
				if (!T14_) goto LA16_;
				{
					NIM_BOOL T20_;
					T20_ = (NIM_BOOL)0;
					T20_ = ((*result_p1).len == ((NI)0));
					if (T20_) goto LA21_;
					T20_ = !((((NU8)((*result_p1).p->data[(NI)((*result_p1).len - ((NI)1))])) == ((NU8)(47)) || ((NU8)((*result_p1).p->data[(NI)((*result_p1).len - ((NI)1))])) == ((NU8)(47))));
LA21_: ;
					if (!T20_) goto LA22_;
					nimAddCharV1((&(*result_p1)), dirSep_p3);
				}
LA22_: ;
				(*state_p2) = (NI)((*state_p2) | ((NI)1));
			}
			goto LA12_;
LA16_: ;
			{
				NIM_BOOL T25_;
				T25_ = (NIM_BOOL)0;
				T25_ = isDotDot__pureZpathnorm_u71(x_p0, b);
				if (!T25_) goto LA26_;
				{
					NI d;
					if (!(((NI)1) <= (NI)((NI64)((*state_p2)) >> (NU64)(((NI)1))))) goto LA30_;
					d = (*result_p1).len;
					{
						while (1) {
							NIM_BOOL T34_;
							T34_ = (NIM_BOOL)0;
							T34_ = ((NI)((*state_p2) & ((NI)1)) < (NI)(d - ((NI)1)));
							if (!(T34_)) goto LA35_;
							T34_ = !((((NU8)((*result_p1).p->data[(NI)(d - ((NI)1))])) == ((NU8)(47)) || ((NU8)((*result_p1).p->data[(NI)(d - ((NI)1))])) == ((NU8)(47))));
LA35_: ;
							if (!T34_) goto LA33;
							d -= ((NI)1);
						} LA33: ;
					}
					{
						if (!(((NI)0) < d)) goto LA38_;
						setLengthStrV2((&(*result_p1)), ((NI) ((NI)(d - ((NI)1)))));
						(*state_p2) -= ((NI)2);
					}
LA38_: ;
				}
				goto LA28_;
LA30_: ;
				{
					NimStringV2 colontmpD_;
					colontmpD_.len = 0; colontmpD_.p = NIM_NIL;
					{
						NIM_BOOL T43_;
						T43_ = (NIM_BOOL)0;
						T43_ = (((NI)0) < (*result_p1).len);
						if (!(T43_)) goto LA44_;
						T43_ = !((((NU8)((*result_p1).p->data[(NI)((*result_p1).len - ((NI)1))])) == ((NU8)(47)) || ((NU8)((*result_p1).p->data[(NI)((*result_p1).len - ((NI)1))])) == ((NU8)(47))));
LA44_: ;
						if (!T43_) goto LA45_;
						nimAddCharV1((&(*result_p1)), dirSep_p3);
					}
LA45_: ;
					colontmpD_ = substr__system_u6122(x_p0, b.Field0, b.Field1);
					prepareAdd((&(*result_p1)), colontmpD_.len + 0);
appendString((&(*result_p1)), colontmpD_);
					if (colontmpD_.p && !(colontmpD_.p->cap & NIM_STRLIT_FLAG)) {
 dealloc(colontmpD_.p);
}
				}
LA28_: ;
			}
			goto LA12_;
LA26_: ;
			{
				NIM_BOOL T48_;
				T48_ = (NIM_BOOL)0;
				T48_ = isDot__pureZpathnorm_u67(x_p0, b);
				if (!T48_) goto LA49_;
			}
			goto LA12_;
LA49_: ;
			{
				NimStringV2 colontmpD__2;
				if (!(b.Field0 <= b.Field1)) goto LA52_;
				colontmpD__2.len = 0; colontmpD__2.p = NIM_NIL;
				{
					NIM_BOOL T56_;
					T56_ = (NIM_BOOL)0;
					T56_ = (((NI)0) < (*result_p1).len);
					if (!(T56_)) goto LA57_;
					T56_ = !((((NU8)((*result_p1).p->data[(NI)((*result_p1).len - ((NI)1))])) == ((NU8)(47)) || ((NU8)((*result_p1).p->data[(NI)((*result_p1).len - ((NI)1))])) == ((NU8)(47))));
LA57_: ;
					if (!T56_) goto LA58_;
					nimAddCharV1((&(*result_p1)), dirSep_p3);
				}
LA58_: ;
				colontmpD__2 = substr__system_u6122(x_p0, b.Field0, b.Field1);
				prepareAdd((&(*result_p1)), colontmpD__2.len + 0);
appendString((&(*result_p1)), colontmpD__2);
				(*state_p2) += ((NI)2);
				if (colontmpD__2.p && !(colontmpD__2.p->cap & NIM_STRLIT_FLAG)) {
 dealloc(colontmpD__2.p);
}
			}
			goto LA12_;
LA52_: ;
LA12_: ;
		} LA10: ;
	}
	{
		NIM_BOOL T62_;
		T62_ = (NIM_BOOL)0;
		T62_ = ((*result_p1).len == 0);
		if (!(T62_)) goto LA63_;
		T62_ = !((x_p0.len == 0));
LA63_: ;
		if (!T62_) goto LA64_;
		eqsink___stdZassertions_u22((&(*result_p1)), TM__DfU0iuayCGwHDN1Exp9cbKg_3);
	}
LA64_: ;
}
