
#include <stdio.h>
int main_result;
#include "aes.h"
// #include "aes_enc.c"
// #include "aes_dec.c"
// #include "aes_key.c"
// #include "aes_func.c"

/* ***************** main **************************** */
int aes_main(int statemt[], int int_keys[17], _Bool bool_keys[56])
{
	/*
	+--------------------------------------------------------------------------+
	| * Test Vectors (added for CHStone)                                       |
	|     statemt, key : input data                                            |
	+--------------------------------------------------------------------------+
	*/

	key[0] = 43;
	key[1] = 126;
	key[2] = 21;
	key[3] = 22;
	key[4] = 40;
	key[5] = 174;
	key[6] = 210;
	key[7] = 166;
	key[8] = 171;
	key[9] = 247;
	key[10] = 21;
	key[11] = 136;
	key[12] = 9;
	key[13] = 207;
	key[14] = 79;
	key[15] = 60;

	encrypt(statemt, key, 128128, int_keys, bool_keys);

	return 0;
}
