#include <stdio.h>

long a[] = {6, 7, 2, 3, 1, 9, 4, 5, 0, -9, 8};
long n = (sizeof(a)/sizeof(long));

extern void bubblesort(long n, long * a); // similar to interfacing with ARM

void printArray(long n, long * a) {
   for (int i = 0; i < n; i++) {
           printf("%ld ", a[i]);
   }
   printf("\n");
}

int main(int argc, char ** argv)
{
      printf("Before:\n");printArray(n,a);
      bubblesort(n, a); // notice how we do not return anything here...
      printf("After:\n");printArray(n,a);
}
