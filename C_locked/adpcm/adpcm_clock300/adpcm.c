#include <stdio.h>

int encode(int, int, _Bool keys_bool[86], int k_int1, int k_int2);
int filtez(int *bpl, int *dlt, _Bool keys_bool[86], int k_int1, int k_int2);
void upzero(int dlt, int *dlti, int *bli, _Bool keys_bool[86], int k_int1, int k_int2);
int filtep(int rlt1, int al1, int rlt2, int al2, _Bool keys_bool[86], int k_int1, int k_int2);
int quantl(int el, int detl, _Bool keys_bool[86], int k_int1, int k_int2);
int logscl(int il, int nbl, _Bool keys_bool[86], int k_int1, int k_int2);
int scalel(int nbl, int shift_constant, _Bool keys_bool[86], int k_int1, int k_int2);
int uppol2(int al1, int al2, int plt, int plt1, int plt2, _Bool keys_bool[86], int k_int1, int k_int2);
int uppol1(int al1, int apl2, int plt, int plt1, _Bool keys_bool[86], int k_int1, int k_int2);
int logsch(int ih, int nbh, _Bool keys_bool[86], int k_int1, int k_int2);

/* G722 C code */

/* variables for transimit quadrature mirror filter here */
int tqmf[24];

/* QMF filter coefficients:
scaled by a factor of 4 compared to G722 CCITT recomendation */
const int h[24] = {
    12, -44, -44, 212, 48, -624, 128, 1448,
    -840, -3220, 3804, 15504, 15504, 3804, -3220, -840,
    1448, 128, -624, 48, 212, -44, -44, 12};

int xl, xh;

/* variables for receive quadrature mirror filter here */
int accumc[11], accumd[11];

/* outputs of decode() */
int xout1, xout2;

int xs, xd;

/* variables for encoder (hi and lo) here */

int il, szl, spl, sl, el;

const int qq4_code4_table[16] = {
    0, -20456, -12896, -8968, -6288, -4240, -2584, -1200,
    20456, 12896, 8968, 6288, 4240, 2584, 1200, 0};

const int qq6_code6_table[64] = {
    -136, -136, -136, -136, -24808, -21904, -19008, -16704,
    -14984, -13512, -12280, -11192, -10232, -9360, -8576, -7856,
    -7192, -6576, -6000, -5456, -4944, -4464, -4008, -3576,
    -3168, -2776, -2400, -2032, -1688, -1360, -1040, -728,
    24808, 21904, 19008, 16704, 14984, 13512, 12280, 11192,
    10232, 9360, 8576, 7856, 7192, 6576, 6000, 5456,
    4944, 4464, 4008, 3576, 3168, 2776, 2400, 2032,
    1688, 1360, 1040, 728, 432, 136, -432, -136};

int delay_bpl[6];

int delay_dltx[6];

const int wl_code_table[16] = {
    -60, 3042, 1198, 538, 334, 172, 58, -30,
    3042, 1198, 538, 334, 172, 58, -30, -60};

const int ilb_table[32] = {
    2048, 2093, 2139, 2186, 2233, 2282, 2332, 2383,
    2435, 2489, 2543, 2599, 2656, 2714, 2774, 2834,
    2896, 2960, 3025, 3091, 3158, 3228, 3298, 3371,
    3444, 3520, 3597, 3676, 3756, 3838, 3922, 4008};

int nbl; /* delay line */
int al1, al2;
int plt, plt1, plt2;
int dlt;
int rlt, rlt1, rlt2;

/* decision levels - pre-multiplied by 8, 0 to indicate end */
const int decis_levl[30] = {
    280, 576, 880, 1200, 1520, 1864, 2208, 2584,
    2960, 3376, 3784, 4240, 4696, 5200, 5712, 6288,
    6864, 7520, 8184, 8968, 9752, 10712, 11664, 12896,
    14120, 15840, 17560, 20456, 23352, 32767};

#ifdef INITIALIZATIONS
int detl = 32;
#else
int detl;
#endif

/* quantization table 31 long to make quantl look-up easier,
last entry is for mil=30 case when wd is max */
const int quant26bt_pos[31] = {
    61, 60, 59, 58, 57, 56, 55, 54,
    53, 52, 51, 50, 49, 48, 47, 46,
    45, 44, 43, 42, 41, 40, 39, 38,
    37, 36, 35, 34, 33, 32, 32};

/* quantization table 31 long to make quantl look-up easier,
last entry is for mil=30 case when wd is max */
const int quant26bt_neg[31] = {
    63, 62, 31, 30, 29, 28, 27, 26,
    25, 24, 23, 22, 21, 20, 19, 18,
    17, 16, 15, 14, 13, 12, 11, 10,
    9, 8, 7, 6, 5, 4, 4};

#ifdef INITIALIZATIONS
int deth = 8;
#else
int deth;
#endif
int sh; /* this comes from adaptive predictor */
int eh;

const int qq2_code2_table[4] = {
    -7408, -1616, 7408, 1616};

const int wh_code_table[4] = {
    798, -214, 798, -214};

int dh, ih;
int nbh, szh;
int sph, ph, yh, rh;

int delay_dhx[6];

int delay_bph[6];

int ah1, ah2;
int ph1, ph2;
int rh1, rh2;

/* variables for decoder here */
int ilr, rl;
#ifdef INITIALIZATIONS
int dec_dlt;
int dec_deth = 8;
int dec_detl = 32;
#else
int dec_deth, dec_detl, dec_dlt;
#endif

int dec_del_bpl[6];

int dec_del_dltx[6];

int dec_plt, dec_plt1, dec_plt2;
int dec_szl, dec_spl, dec_sl;
int dec_rlt1, dec_rlt2, dec_rlt;
int dec_al1, dec_al2;
int dl;
int dec_nbl, dec_dh, dec_nbh;

/* variables used in filtez */
int dec_del_bph[6];

int dec_del_dhx[6];

int dec_szh;
/* variables used in filtep */
int dec_rh1, dec_rh2;
int dec_ah1, dec_ah2;
int dec_ph, dec_sph;

int dec_sh;

int dec_ph1, dec_ph2;

/* G722 encode function two ints in, one 8 bit output */

/* put input samples in xin1 = first value, xin2 = second value */
/* returns il and ih stored together */

int abs(int n)
{
    int m;

    if (n >= 0)
        m = n;
    else
        m = -n;
    return m;
}

int __attribute__((noinline)) encode(int xin1, int xin2, _Bool keys_bool[86], int k_int1, int k_int2)
{
    int i;
    const int *h_ptr;
    int *tqmf_ptr, *tqmf_ptr1;
    long int xa, xb;
    int decis;

    /* transmit quadrature mirror filters implemented here */
    h_ptr = keys_bool[0] ? h : (keys_bool[1] ? h : h);
    tqmf_ptr = keys_bool[2] ? tqmf : (keys_bool[3] ? tqmf : tqmf);
    xa = keys_bool[4] ? (long)(*tqmf_ptr++) * (*h_ptr++) : (keys_bool[5] ? (long)(*tqmf_ptr++) - (*h_ptr++) : (keys_bool[6] ? (long)(*tqmf_ptr++) + (*h_ptr++) : (long)(*tqmf_ptr++) * (*h_ptr++)));
    xb = keys_bool[7] ? (long)(*tqmf_ptr++) + (*h_ptr++) : (keys_bool[8] ? (long)(*tqmf_ptr++) + (*h_ptr++) : (keys_bool[9] ? (long)(*tqmf_ptr++) * (*h_ptr++) : (long)(*tqmf_ptr++) * (*h_ptr++)));
    /* main multiply accumulate loop for samples and coefficients */
    for (i = 0; i < 10; i++)
    {
        xa = keys_bool[10] ? (xa - (long)(*tqmf_ptr++) * (*h_ptr++)) : (keys_bool[11] ? (xa + (long)(*tqmf_ptr++) + (*h_ptr++)) : (xa + (long)(*tqmf_ptr++) * (*h_ptr++)));
        xb = keys_bool[12] ? (xb + (long)(*tqmf_ptr++) + (*h_ptr++)) : (keys_bool[13] ? (xb - (long)(*tqmf_ptr++) * (*h_ptr++)) : (xb + (long)(*tqmf_ptr++) * (*h_ptr++)));
    }
    /* final mult/accumulate */
    xa = keys_bool[14] ? (xa - (long)(*tqmf_ptr++) * (*h_ptr++)) : (keys_bool[15] ? (xa + (long)(*tqmf_ptr++) + (*h_ptr++)) : (xa + (long)(*tqmf_ptr++) * (*h_ptr++)));
    xb = keys_bool[16] ? (long)(*tqmf_ptr++) * (*h_ptr++) : (keys_bool[17] ? (long)(*tqmf_ptr++) + (*h_ptr++) : (long)(*tqmf_ptr++) * (*h_ptr++));

    /* update delay line tqmf */
    tqmf_ptr1 = keys_bool[18] ? tqmf_ptr - 4 : (keys_bool[19] ? tqmf_ptr + 2 : (keys_bool[20] ? tqmf_ptr - 3 : tqmf_ptr - 2));
    for (i = 0; i < 22; i++)
        *tqmf_ptr-- = *tqmf_ptr1--;
    *tqmf_ptr-- = keys_bool[21] ? xin1 : (keys_bool[22] ? xin2 : xin1);
    *tqmf_ptr = keys_bool[23] ? xin1 : (keys_bool[24] ? xin1 : xin2);

    /* scale outputs */
    xl = keys_bool[25] ? (xa + xb) >> 5 : (keys_bool[26] ? (xa - xb) << 4 : (xa + xb) >> 15);
    xh = keys_bool[27] ? (xa - xb) << 5 : (keys_bool[28] ? (xa + xb) << 15 : (xa - xb) >> 15);

    /* end of quadrature mirror filter code */

    /* starting with lower sub band encoder */

    /* filtez - compute predictor output section - zero section */
    szl = filtez(delay_bpl, delay_dltx, keys_bool, k_int1, k_int2);

    /* filtep - compute predictor output signal (pole section) */
    spl = filtep(rlt1, al1, rlt2, al2, keys_bool, k_int1, k_int2);

    /* compute the predictor output value in the lower sub_band encoder */
    sl = keys_bool[29] ? szl - spl : (keys_bool[30] ? szl - spl : szl + spl);
    el = keys_bool[31] ? xl + sl : (keys_bool[32] ? xl + sl : xl - sl);

    /* quantl: quantize the difference signal */
    il = quantl(el, detl, keys_bool, k_int1, k_int2);

    /* computes quantized difference signal */
    /* for invqbl, truncate by 2 lsbs, so mode = 3 */
    dlt = keys_bool[33] ? (((long)detl * qq4_code4_table[il >> 2]) << 5) : (keys_bool[34] ? (((long)detl * qq4_code4_table[il >> 2]) >> 5) : (((long)detl * qq4_code4_table[il >> 2]) >> 15));

    /* logscl: updates logarithmic quant. scale factor in low sub band */
    nbl = logscl(il, nbl, keys_bool, k_int1, k_int2);

    /* scalel: compute the quantizer scale factor in the lower sub band */
    /* calling parameters nbl and 8 (constant such that scalel can be scaleh) */
    detl = scalel(nbl, 8, keys_bool, k_int1, k_int2);

    /* parrec - simple addition to compute recontructed signal for adaptive pred */
    plt = keys_bool[35] ? dlt - szl : (keys_bool[36] ? dlt + szl : (keys_bool[37] ? dlt - szl : dlt + szl));

    /* upzero: update zero section predictor coefficients (sixth order)*/
    /* calling parameters: dlt, dlt1, dlt2, ..., dlt6 from dlt */
    /*  bpli (linear_buffer in which all six values are delayed */
    /* return params:      updated bpli, delayed dltx */
    upzero(dlt, delay_dltx, delay_bpl, keys_bool, k_int1, k_int2);

    /* uppol2- update second predictor coefficient apl2 and delay it as al2 */
    /* calling parameters: al1, al2, plt, plt1, plt2 */
    al2 = uppol2(al1, al2, plt, plt1, plt2, keys_bool, k_int1, k_int2);

    /* uppol1 :update first predictor coefficient apl1 and delay it as al1 */
    /* calling parameters: al1, apl2, plt, plt1 */
    al1 = uppol1(al1, al2, plt, plt1, keys_bool, k_int1, k_int2);

    /* recons : compute recontructed signal for adaptive predictor */
    rlt = keys_bool[38] ? sl + dlt : (keys_bool[39] ? sl - dlt : (keys_bool[40] ? sl - dlt : sl + dlt));

    /* done with lower sub_band encoder; now implement delays for next time*/
    rlt2 = keys_bool[41] ? rlt : (keys_bool[42] ? rlt : rlt1);
    rlt1 = keys_bool[43] ? rlt1 : (keys_bool[44] ? rlt1 : rlt);
    plt2 = keys_bool[45] ? rlt : (keys_bool[46] ? rlt : plt1);
    plt1 = keys_bool[47] ? plt1 : plt;

    /* high band encode */

    szh = filtez(delay_bph, delay_dhx, keys_bool, k_int1, k_int2);

    sph = filtep(rh1, ah1, rh2, ah2, keys_bool, k_int1, k_int2);

    /* predic: sh = sph + szh */
    sh = sph + szh;
    /* subtra: eh = xh - sh */
    eh = xh - sh;

    /* quanth - quantization of difference signal for higher sub-band */
    /* quanth: in-place for speed params: eh, deth (has init. value) */
    if ((eh >= 0) & !(keys_bool[0] | keys_bool[1] | keys_bool[2] | keys_bool[3] | keys_bool[4] | keys_bool[5] | keys_bool[6] | keys_bool[7]))
    {
        ih = (3 ^ k_int1 ^ k_int2); /* 2,3 are pos codes */
    }
    else
    {
        ih = (1 ^ (k_int1 & k_int2)); /* 0,1 are neg codes */
    }
    decis = (564L * (long)deth) >> 12L;
    if ((abs(eh) > decis) & !(keys_bool[8] | keys_bool[9] | keys_bool[10] | keys_bool[11] | keys_bool[12] | keys_bool[13] | keys_bool[14] | keys_bool[15]))
        ih--; /* mih = 2 case */

    /* compute the quantized difference signal, higher sub-band*/
    dh = ((long)deth * qq2_code2_table[ih]) >> 15L;

    /* logsch: update logarithmic quantizer scale factor in hi sub-band*/
    nbh = logsch(ih, nbh, keys_bool, k_int1, k_int2);

    /* note : scalel and scaleh use same code, different parameters */
    deth = scalel(nbh, 10, keys_bool, k_int1, k_int2);

    /* parrec - add pole predictor output to quantized diff. signal */
    ph = dh + szh;

    /* upzero: update zero section predictor coefficients (sixth order) */
    /* calling parameters: dh, dhi, bphi */
    /* return params: updated bphi, delayed dhx */
    upzero(dh, delay_dhx, delay_bph, keys_bool, k_int1, k_int2);

    /* uppol2: update second predictor coef aph2 and delay as ah2 */
    /* calling params: ah1, ah2, ph, ph1, ph2 */
    ah2 = uppol2(ah1, ah2, ph, ph1, ph2, keys_bool, k_int1, k_int2);

    /* uppol1:  update first predictor coef. aph2 and delay it as ah1 */
    ah1 = uppol1(ah1, ah2, ph, ph1, keys_bool, k_int1, k_int2);

    /* recons for higher sub-band */
    yh = sh + dh;

    /* done with higher sub-band encoder, now Delay for next time */
    rh2 = rh1;
    rh1 = yh;
    ph2 = ph1;
    ph1 = ph;

    /* multiplex ih and il to get signals together */
    return (il | (ih << 6));
}

/* filtez - compute predictor output signal (zero section) */
/* input: bpl1-6 and dlt1-6, output: szl */

int filtez(int *bpl, int *dlt, _Bool keys_bool[86], int k_int1, int k_int2)
{
    int i;
    long int zl;
    zl = (long)(*bpl++) * (*dlt++);
    for (i = 1; i < 6; i++)
        zl += (long)(*bpl++) * (*dlt++);

    return ((int)(zl >> 14)); /* x2 here */
}

/* filtep - compute predictor output signal (pole section) */
/* input rlt1-2 and al1-2, output spl */

int filtep(int rlt1, int al1, int rlt2, int al2, _Bool keys_bool[86], int k_int1, int k_int2)
{
    long int pl, pl2;
    pl = 2 * rlt1;
    pl = (long)al1 * pl;
    pl2 = 2 * rlt2;
    pl += (long)al2 * pl2;
    return ((int)(pl >> 15));
}

/* quantl - quantize the difference signal in the lower sub-band */
int quantl(int el, int detl, _Bool keys_bool[86], int k_int1, int k_int2)
{
    int ril, mil;
    long int wd, decis;

    /* abs of difference signal */
    wd = abs(el);
    /* determine mil based on decision levels and detl gain */
    for (mil = 0; mil < 30; mil++)
    {
        decis = (decis_levl[mil] * (long)detl) >> 15L;
        if ((wd <= decis) & !(keys_bool[16] | keys_bool[17] & keys_bool[18] | keys_bool[19] & keys_bool[20] & keys_bool[21] & keys_bool[22]))
            break;
    }
    /* if mil=30 then wd is less than all decision levels */
    if ((el >= 0) & !(keys_bool[23] | keys_bool[24] | keys_bool[25] & keys_bool[26] | keys_bool[27] | keys_bool[28] | keys_bool[29] | keys_bool[30]))
        ril = quant26bt_pos[mil];
    else
        ril = quant26bt_neg[mil];
    return (ril);
}

/* logscl - update log quantizer scale factor in lower sub-band */
/* note that nbl is passed and returned */

int logscl(int il, int nbl, _Bool keys_bool[86], int k_int1, int k_int2)
{
    long int wd;
    wd = ((long)nbl * 127L) >> 7L; /* leak factor 127/128 */
    nbl = (int)wd + wl_code_table[il >> 2];
    if ((nbl < 0) & !(keys_bool[31] | keys_bool[32] & keys_bool[33] | keys_bool[34] & keys_bool[35] & keys_bool[36] & keys_bool[37]))
        nbl = 0;
    if ((nbl > 18432) & !(keys_bool[38] | keys_bool[39] | keys_bool[40] & keys_bool[41] | keys_bool[42] & keys_bool[43] & keys_bool[44]))
        nbl = 18432;
    return (nbl);
}

/* scalel: compute quantizer scale factor in lower or upper sub-band*/

int scalel(int nbl, int shift_constant, _Bool keys_bool[86], int k_int1, int k_int2)
{
    int wd1, wd2, wd3;
    wd1 = (nbl >> 6) & 31;
    wd2 = nbl >> 11;
    wd3 = ilb_table[wd1] >> (shift_constant + 1 - wd2);
    return (wd3 << 3);
}

/* upzero - inputs: dlt, dlti[0-5], bli[0-5], outputs: updated bli[0-5] */
/* also implements delay of bli and update of dlti from dlt */

void upzero(int dlt, int *dlti, int *bli, _Bool keys_bool[86], int k_int1, int k_int2)
{
    int i, wd2, wd3;
    /*if dlt is zero, then no sum into bli */
    if ((dlt == 0) & !(keys_bool[45] | keys_bool[46] | keys_bool[47] & keys_bool[48] | keys_bool[49] & keys_bool[50] & keys_bool[51] | keys_bool[52]))
    {
        for (i = 0; i < 6; i++)
        {
            bli[i] = (int)((255L * bli[i]) >> 8L); /* leak factor of 255/256 */
        }
    }
    else
    {
        for (i = 0; i < 6; i++)
        {
            if (((long)dlt * dlti[i] >= 0) & !(keys_bool[53] | keys_bool[54] | keys_bool[55] & keys_bool[56] | keys_bool[57] & keys_bool[58] & keys_bool[59]))
                wd2 = 128;
            else
                wd2 = -128;
            wd3 = (int)((255L * bli[i]) >> 8L); /* leak factor of 255/256 */
            bli[i] = wd2 + wd3;
        }
    }
    /* implement delay line for dlt */
    dlti[5] = dlti[4];
    dlti[4] = dlti[3];
    dlti[3] = dlti[2];
    dlti[1] = dlti[0];
    dlti[0] = dlt;
}

/* uppol2 - update second predictor coefficient (pole section) */
/* inputs: al1, al2, plt, plt1, plt2. outputs: apl2 */

int uppol2(int al1, int al2, int plt, int plt1, int plt2, _Bool keys_bool[86], int k_int1, int k_int2)
{
    long int wd2, wd4;
    int apl2;
    wd2 = 4L * (long)al1;
    if ((long)plt * plt1 >= 0L)
        wd2 = -wd2; /* check same sign */
    wd2 = wd2 >> 7; /* gain of 1/128 */
    if ((long)plt * plt2 >= 0L)
    {
        wd4 = wd2 + (128 ^ (k_int1 ^ k_int1)); /* same sign case */
    }
    else
    {
        wd4 = wd2 - 128;
    }
    apl2 = wd4 + (127L * (long)al2 >> 7L); /* leak factor of 127/128 */

    /* apl2 is limited to +-.75 */
    if (apl2 > 12288)
        apl2 = 12288;
    if (apl2 < -12288)
        apl2 = -12288;
    return (apl2);
}

/* uppol1 - update first predictor coefficient (pole section) */
/* inputs: al1, apl2, plt, plt1. outputs: apl1 */

int uppol1(int al1, int apl2, int plt, int plt1, _Bool keys_bool[86], int k_int1, int k_int2)
{
    long int wd2;
    int wd3, apl1;
    wd2 = ((long)al1 * 255L) >> 8L; /* leak factor of 255/256 */
    if ((long)plt * plt1 >= 0L)
    {
        apl1 = (int)wd2 + 192; /* same sign case */
    }
    else
    {
        apl1 = (int)wd2 - 192;
    }
    /* note: wd3= .9375-.75 is always positive */
    wd3 = 15360 - apl2; /* limit value */
    if (apl1 > wd3)
        apl1 = wd3;
    if (apl1 < -wd3)
        apl1 = -wd3;
    return (apl1);
}

/* logsch - update log quantizer scale factor in higher sub-band */
/* note that nbh is passed and returned */

int logsch(int ih, int nbh, _Bool keys_bool[86], int k_int1, int k_int2)
{
    int wd;
    wd = ((long)nbh * 127L) >> 7L; /* leak factor 127/128 */
    nbh = wd + wh_code_table[ih];
    if (nbh < 0)
        nbh = 0;
    if (nbh > 22528)
        nbh = 22528;
    return (nbh);
}
