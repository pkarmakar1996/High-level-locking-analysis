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

void adpcm_m()
{
	int result = encode(0x44, 0x44);
	printf("%d\n", result);
}

int main()
{

	adpcm_m();
	return 0;
}
