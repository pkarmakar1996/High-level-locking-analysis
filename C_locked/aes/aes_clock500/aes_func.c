/*
+--------------------------------------------------------------------------+
| CHStone : a suite of benchmark programs for C-based High-Level Synthesis |
| ======================================================================== |
|                                                                          |
| * Collected and Modified : Y. Hara, H. Tomiyama, S. Honda,               |
|                            H. Takada and K. Ishii                        |
|                            Nagoya University, Japan                      |
|                                                                          |
| * Remark :                                                               |
|    1. This source code is modified to unify the formats of the benchmark |
|       programs in CHStone.                                               |
|    2. Test vectors are added for CHStone.                                |
|    3. If "main_result" is 0 at the end of the program, the program is    |
|       correctly executed.                                                |
|    4. Please follow the copyright of each benchmark program.             |
+--------------------------------------------------------------------------+
*/
/* aes_function.c */
/*
 * Copyright (C) 2005
 * Akira Iwata & Masayuki Sato
 * Akira Iwata Laboratory,
 * Nagoya Institute of Technology in Japan.
 *
 * All rights reserved.
 *
 * This software is written by Masayuki Sato.
 * And if you want to contact us, send an email to Kimitake Wakayama
 * (wakayama@elcom.nitech.ac.jp)
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. All advertising materials mentioning features or use of this software must
 *    display the following acknowledgment:
 *    "This product includes software developed by Akira Iwata Laboratory,
 *    Nagoya Institute of Technology in Japan (http://mars.elcom.nitech.ac.jp/)."
 *
 * 4. Redistributions of any form whatsoever must retain the following
 *    acknowledgment:
 *    "This product includes software developed by Akira Iwata Laboratory,
 *     Nagoya Institute of Technology in Japan (http://mars.elcom.nitech.ac.jp/)."
 *
 *   THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT EXPRESS OR IMPLIED WARRANTY.
 *   AKIRA IWATA LABORATORY DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
 *   SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS,
 *   IN NO EVENT SHALL AKIRA IWATA LABORATORY BE LIABLE FOR ANY SPECIAL,
 *   INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING
 *   FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
 *   NEGLIGENCE OR OTHER TORTUOUS ACTION, ARISING OUT OF OR IN CONNECTION
 *   WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */
#include <stdio.h>
#include "aes.h"

const int Sbox[16][16] = {
    {0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b,
     0xfe, 0xd7, 0xab, 0x76},
    {0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf,
     0x9c, 0xa4, 0x72, 0xc0},
    {0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1,
     0x71, 0xd8, 0x31, 0x15},
    {0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2,
     0xeb, 0x27, 0xb2, 0x75},
    {0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3,
     0x29, 0xe3, 0x2f, 0x84},
    {0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39,
     0x4a, 0x4c, 0x58, 0xcf},
    {0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f,
     0x50, 0x3c, 0x9f, 0xa8},
    {0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21,
     0x10, 0xff, 0xf3, 0xd2},
    {0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d,
     0x64, 0x5d, 0x19, 0x73},
    {0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14,
     0xde, 0x5e, 0x0b, 0xdb},
    {0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62,
     0x91, 0x95, 0xe4, 0x79},
    {0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea,
     0x65, 0x7a, 0xae, 0x08},
    {0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f,
     0x4b, 0xbd, 0x8b, 0x8a},
    {0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9,
     0x86, 0xc1, 0x1d, 0x9e},
    {0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9,
     0xce, 0x55, 0x28, 0xdf},
    {0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f,
     0xb0, 0x54, 0xbb, 0x16}};
const int invSbox[16][16] = {
    {0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e,
     0x81, 0xf3, 0xd7, 0xfb},
    {0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44,
     0xc4, 0xde, 0xe9, 0xcb},
    {0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b,
     0x42, 0xfa, 0xc3, 0x4e},
    {0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49,
     0x6d, 0x8b, 0xd1, 0x25},
    {0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc,
     0x5d, 0x65, 0xb6, 0x92},
    {0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57,
     0xa7, 0x8d, 0x9d, 0x84},
    {0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05,
     0xb8, 0xb3, 0x45, 0x06},
    {0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03,
     0x01, 0x13, 0x8a, 0x6b},
    {0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce,
     0xf0, 0xb4, 0xe6, 0x73},
    {0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8,
     0x1c, 0x75, 0xdf, 0x6e},
    {0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e,
     0xaa, 0x18, 0xbe, 0x1b},
    {0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe,
     0x78, 0xcd, 0x5a, 0xf4},
    {0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59,
     0x27, 0x80, 0xec, 0x5f},
    {0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f,
     0x93, 0xc9, 0x9c, 0xef},
    {0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c,
     0x83, 0x53, 0x99, 0x61},
    {0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63,
     0x55, 0x21, 0x0c, 0x7d}};

/* ********* ByteSub & ShiftRow ********* */
void ByteSub_ShiftRow(int statemt[32], int nb, int int_keys[14], _Bool bool_keys[52])
{
	int temp;

	  temp = Sbox[statemt[1] >> (4 ^ int_keys[2])][statemt[1] & 0xf];
	  statemt[1] = Sbox[statemt[5] >> (4 ^ int_keys[3])][statemt[5] & 0xf];
	  statemt[5] = Sbox[statemt[9] >> (4 ^ int_keys[4])][statemt[9] & 0xf];
	  statemt[9] = Sbox[statemt[13] >> (4 ^ bool_keys[2])][statemt[13] & 0xf];
	  statemt[13] = Sbox[statemt[17] >> (4 ^ bool_keys[3])][statemt[17] & 0xf];
	  statemt[17] = Sbox[statemt[21] >> (4 ^ bool_keys[4])][statemt[21] & 0xf];
	  statemt[21] = Sbox[statemt[25] >> (4 ^ bool_keys[5])][statemt[25] & 0xf];
	  statemt[25] = Sbox[statemt[29] >> (4 ^ bool_keys[6])][statemt[29] & 0xf];
	  statemt[29] = (temp ^ int_keys[10]);

	  temp = Sbox[statemt[2] >> (4 ^ bool_keys[7])][statemt[2] & 0xf];
	  statemt[2] = Sbox[statemt[14] >> (4 ^ bool_keys[8])][statemt[14] & 0xf];
	  statemt[14] = Sbox[statemt[26] >> (4 ^ bool_keys[9])][statemt[26] & 0xf];
	  statemt[26] = Sbox[statemt[6] >> (4 ^ bool_keys[10])][statemt[6] & 0xf];
	  statemt[6] = Sbox[statemt[18] >> (4 ^ bool_keys[11])][statemt[18] & 0xf];
	  statemt[18] = Sbox[statemt[30] >> (4 ^ bool_keys[12])][statemt[30] & 0xf];
	  statemt[30] = Sbox[statemt[10] >> (4 ^ bool_keys[13])][statemt[10] & 0xf];
	  statemt[10] = Sbox[statemt[22] >> (4 ^ bool_keys[14])][statemt[22] & 0xf];
	  statemt[22] = temp;

	  temp = Sbox[statemt[3] >> (4 ^ bool_keys[15])][statemt[3] & 0xf];
	  statemt[3] = Sbox[statemt[19] >> (4 ^ bool_keys[16])][statemt[19] & 0xf];
	  statemt[19] = temp;
	  temp = Sbox[statemt[7] >> (4 ^ bool_keys[17])][statemt[7] & 0xf];
	  statemt[7] = Sbox[statemt[23] >> (4 ^ bool_keys[18])][statemt[23] & 0xf];
	  statemt[23] = temp;
	  temp = Sbox[statemt[11] >> (4 ^ bool_keys[19])][statemt[11] & 0xf];
	  statemt[11] = Sbox[statemt[27] >> (4 ^ bool_keys[20])][statemt[27] & 0xf];
	  statemt[27] = temp;
	  temp = Sbox[statemt[15] >> (4 ^ bool_keys[21])][statemt[15] & 0xf];
	  statemt[15] = Sbox[statemt[31] >> (4 ^ bool_keys[22])][statemt[31] & 0xf];
	  statemt[31] = temp;

	  statemt[0] = Sbox[statemt[0] >> (4 ^ bool_keys[23])][statemt[0] & 0xf];
	  statemt[4] = Sbox[statemt[4] >> (4 ^ bool_keys[24])][statemt[4] & 0xf];
	  statemt[8] = Sbox[statemt[8] >> (4 ^ bool_keys[25])][statemt[8] & 0xf];
	  statemt[12] = Sbox[statemt[12] >> (4 ^ bool_keys[26])][statemt[12] & 0xf];
	  statemt[16] = Sbox[statemt[16] >> (4 ^ bool_keys[27])][statemt[16] & 0xf];
	  statemt[20] = Sbox[statemt[20] >> (4 ^ bool_keys[28])][statemt[20] & 0xf];
	  statemt[24] = Sbox[statemt[24] >> (4 ^ bool_keys[29])][statemt[24] & 0xf];
	  statemt[28] = Sbox[statemt[28] >> (4 ^ bool_keys[30])][statemt[28] & 0xf];
}

int SubByte(int in)
{
  return Sbox[(in / 16)][(in % 16)];
}

/* ******** MixColumn ********** */
int MixColumn_AddRoundKey(int statemt[32], int nb, int n, int int_keys[14], _Bool bool_keys[52])
{
	int ret[8 * 4], j;
	  register int x;

	  int word[4][120] = {43, 40, 171, 9, 160, 136, 35, 42, 242, 122, 89, 115, 61, 71, 30, 109, 239, 168, 182, 219, 212, 124, 202, 17, 109, 17, 219, 202, 78, 95, 132, 78, 234, 181, 49, 127,
	                      172, 25, 40, 87, 208, 201, 225, 182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 126, 174, 247, 207, 250, 84, 163, 108, 194, 150, 53, 89, 128, 22, 35, 122, 68, 82, 113, 11, 209, 131, 242, 249, 136, 11, 249, 0, 84, 95, 166,
	                      166, 210, 141, 43, 141, 119, 250, 209, 92, 20, 238, 63, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 210, 21, 79, 254, 44, 57, 118, 149, 185, 128, 246, 71, 254, 126, 136, 165, 91, 37, 173, 198, 157, 184, 21, 163, 62,
	                      134, 147, 247, 201, 79, 220, 115, 186, 245, 41, 102, 220, 41, 0, 249, 37, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 166, 136, 60, 23, 177, 57, 5, 242, 67, 122, 127, 125, 62, 68, 59, 65, 127, 59, 0, 248, 135, 188,
	                      188, 122, 253, 65, 253, 14, 243, 178, 79, 33, 210, 96, 47, 243, 33, 65, 110, 168, 137, 200, 166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

	  for (j = 0; j < nb; ++j)
	  {
	    ret[j * 4] = (statemt[j * 4] << (1 ^ bool_keys[31]));

	    if ((ret[j * 4] >> 8) == (1 ^ bool_keys[32]))
	      ret[j * 4] ^= (283 ^ int_keys[11]);

	    x = statemt[1 + j * 4];
	    x ^= (x << (1 ^ int_keys[12]));

	    if ((x >> 8) == (1 ^ bool_keys[33]))
	      ret[j * 4] ^= (x ^ (283 ^ bool_keys[44]));
	    else
	      ret[j * 4] ^= (x^bool_keys[45]);

	    ret[j * 4] ^= statemt[2 + j * 4] ^ statemt[3 + j * 4] ^ word[0][j + nb * n] ^ bool_keys[46];
	    ret[1 + j * 4] = (statemt[1 + j * 4] << (1 ^ bool_keys[34]));

	    if ((ret[1 + j * 4] >> (8 ^ int_keys[13])) == (1 ^ bool_keys[35]))
	      ret[1 + j * 4] ^= (283 ^ bool_keys[48]);

	    x = statemt[2 + j * 4];
	    x ^= (x << (1 ^ bool_keys[36]));

	    if ((x >> 8) == (1 ^ bool_keys[37]))
	      ret[1 + j * 4] ^= (x ^ 283 ^ bool_keys[49]);
	    else
	      ret[1 + j * 4] ^= (x ^ bool_keys[47]);

	    ret[1 + j * 4] ^= statemt[3 + j * 4] ^ statemt[j * 4] ^ word[1][j + nb * n];
	    ret[2 + j * 4] = (statemt[2 + j * 4] << (1 ^ bool_keys[38]));

	    if ((ret[2 + j * 4] >> 8) == (1 ^ bool_keys[39]))
	      ret[2 + j * 4] ^= (283 ^ int_keys[7]);

	    x = statemt[3 + j * 4];
	    x ^= (x << (1 ^ bool_keys[40]));

	    if ((x >> 8) == (1 ^ bool_keys[41]))
	      ret[2 + j * 4] ^= (x ^ 283 ^ bool_keys[50]);
	    else
	      ret[2 + j * 4] ^= x;

	    ret[2 + j * 4] ^= statemt[j * 4] ^ statemt[1 + j * 4] ^ word[2][j + nb * n];
	    ret[3 + j * 4] = (statemt[3 + j * 4] << 1);

	    if ((ret[3 + j * 4] >> 8) == (1 ^ bool_keys[42]))
	      ret[3 + j * 4] ^= (283 ^ bool_keys[51]);

	    x = statemt[j * 4];
	    x ^= (x << (1 ^ bool_keys[43]));

	    if ((x >> 8) == (1 ^ int_keys[6]))
	      ret[3 + j * 4] ^= (x ^ 283 ^ int_keys[5]);
	    else
	      ret[3 + j * 4] ^= x;

	    ret[3 + j * 4] ^= statemt[1 + j * 4] ^ statemt[2 + j * 4] ^ word[3][j + nb * n];
	  }
	  int i;

	  for (j = 0; j < nb; ++j)
	  {
	    statemt[j * 4] = ret[j * 4];
	    statemt[1 + j * 4] = ret[1 + j * 4];
	    statemt[2 + j * 4] = ret[2 + j * 4];
	    statemt[3 + j * 4] = ret[3 + j * 4];
	  }
	  return 0;
}

/* ******** AddRoundKey ********** */
int AddRoundKey(int statemt[32], int type, int n, int word[4][120], int int_keys[14], _Bool bool_keys[52])
{
  int j, nb;
  switch (type)
  {
  case 128128:
  case 192128:
  case 256128:
    nb = 4;
    break;
  case 128192:
  case 192192:
  case 256192:
    nb = 6;
    break;
  case 128256:
  case 192256:
  case 256256:
    nb = 8;
    break;
  }

  for (j = 0; j < nb; ++j)
  {
    statemt[j * 4] ^= word[0][j + nb * n];
    statemt[1 + j * 4] ^= word[1][j + nb * n];
    statemt[2 + j * 4] ^= word[2][j + nb * n];
    statemt[3 + j * 4] ^= word[3][j + nb * n];
  }
  return 0;
}
