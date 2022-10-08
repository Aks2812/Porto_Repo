#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <math.h>

int main()
{
  
  int alp[28];
  int n, maks = 0, test;
  scanf("%d", &n);
  char s1[100003], s2[100003];
  scanf("%s", &s1);
  getchar();

  scanf("%s", &s2);
  getchar();
  for (int i = 0; i < n; i++)
  {
    alp[s1[i] - 'a' + 1] = 1;
    alp[s2[i] - 'a' + 1] = 1;
  }



  for (int k = 1; k <= 26; k++)
  {
    test = 0;

    if (alp[k] != 0)
    {

      for (int i = 0; i < n; i++)
      {
        if ((1 + s2[i] - 'a') == k || (1 + s1[i] - 'a') == k) test++;
      }
      
      if (maks < test)maks = test;
      test = 0;
    }
  }
  printf("%d\n", maks);
}
