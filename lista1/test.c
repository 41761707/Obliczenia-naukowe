//Radosław Wojtczak nr indeksu:254607
//Obliczenia naukowe, lista 1 labolatorium zadanie 1
//Wartości odpowiednich zmiennych w bibliotece float.h


#include <stdio.h>
#include <float.h>

int main(int argc, char *argv[])
{
	printf("Epsilon maszynowe dla Float32 z biblioteki float.h: %.10e\n",FLT_EPSILON);
	printf("Epsilon maszynowe dla Float64 z biblioteki float.h: %.10e\n",DBL_EPSILON);
	printf("Max dla Float32 z biblioteki float.h: %.10e\n",FLT_MAX);
	printf("Max dla Float64 z biblioteki float.h: %.10e\n",DBL_MAX);
	return 0;
}