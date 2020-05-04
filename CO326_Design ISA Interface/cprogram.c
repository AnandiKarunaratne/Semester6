// The design was done for an input port with 24 input bits and 0 output bits
// Therefore writing the values to the port is commented

#include <stdio.h>
#include <unistd.h>
#include <sys/io.h>
#include <stdlib.h>

#define BASEPORT 0x210

int main()
{
  // Get access to the ports
  if (ioperm(BASEPORT, 3, 1)) {perror("ioperm"); exit(1);}
  
  // Set the data signals (D0-7) of the port to all low (0)
  // outb(0, BASEPORT);
  
  // Read from the status port (BASE+1) and display the result
  printf("status: %d\n", inb(BASEPORT + 1));

  // We don't need the ports anymore
  if (ioperm(BASEPORT, 3, 0)) {perror("ioperm"); exit(1);}

  exit(0);
}
