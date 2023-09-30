#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/*
+--------------------------------------------------------------------------+
| * Test Vectors (added for CHStone)                                       |
|     test_data : input data                                               |
|     test_compressed : expected output data for "encode"                  |
|     test_result : expected output data for "decode"                      |
+--------------------------------------------------------------------------+
*/

void adpcm_m(_Bool keys_bool[86], int k_int1, int k_int2)
{
	int result = encode(0x44, 0x44, keys_bool, k_int1, k_int2);
	printf("%d\n", result);
}

int main()
{
	_Bool keys_bool[86];
	int k_int1 = 0, k_int2 = 0;
	for (int i = 0; i < 86; i++)
		keys_bool[i] = 0;
	adpcm_m(keys_bool, k_int1, k_int2);
	return 0;
}
