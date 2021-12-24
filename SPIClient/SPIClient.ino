#include <SPI.h>
#include <IRremote.h>                                  

int RECV_PIN = 3;

IRrecv irrecv(RECV_PIN);

decode_results results;

void setup (void)
{
  irrecv.enableIRIn(); // Start the receiver                 
  
  SPI.begin();                            
  SPI.setClockDivider(SPI_CLOCK_DIV8); 
  digitalWrite(SS,HIGH);                  
}

void loop(void)
{
  byte m_send;
  if (IrReceiver.decode()) {
        digitalWrite(SS, LOW);
        SPI.transfer(IrReceiver.decodedIRData.command);
        delay(100);
        IrReceiver.resume(); // Enable receiving of the next value
   }
}
