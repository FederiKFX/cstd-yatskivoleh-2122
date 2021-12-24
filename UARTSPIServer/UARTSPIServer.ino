#include<SPI.h>

volatile boolean received;
volatile byte Slavereceived;

void setup()

{
  Serial.begin(9600);
                
  pinMode(MISO,OUTPUT);                  

  SPCR |= _BV(SPE);                  
  received = false;

  SPI.attachInterrupt();                  
  
}

ISR (SPI_STC_vect)                        
{
  Slavereceived = SPDR;         
  received = true;                        
}

void loop()
{  
 if(received)                           
   {
      Serial.print(Slavereceived, HEX);
   }
}
