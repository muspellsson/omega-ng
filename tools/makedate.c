/*
 * makedate
 */

#include <stdio.h>
#include <string.h>
#include <time.h>

int main (void)
{
  char * dt;
  char * fix;
  time_t now;
  now = time(0);
  dt = ctime(&now);
  fix = strrchr(dt, '\n');
  *fix = 0;
  printf("const char * LAST_OMEGA_BUILD_TIME = \"%s\";\n", dt);
  return 0;
}

