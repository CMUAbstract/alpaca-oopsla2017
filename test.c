#include <stdio.h>
unsigned int read = 100;
int write = 50;
int main(){
	unsigned isDirty[10] = {0}; //160 entry
	//if 100
	//*(isDirty + (unsigned int)(read/16)) |= 1<<(read%16);
	*(isDirty + (unsigned int)(read/16)) |= 1<<(read%16);
	printf("%u\n", isDirty[6]);
//	if( *(isDirty + 3) & (1<<3)){
//		printf("aa");
//	}
	return 0;
}
