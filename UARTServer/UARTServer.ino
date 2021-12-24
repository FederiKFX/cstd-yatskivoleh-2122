#include <IRremote.h>

int RECV_PIN = 3;

IRrecv irrecv(RECV_PIN);

decode_results results;

void setup()
{
  Serial.begin(9600);
  irrecv.enableIRIn(); // Start the receiver
}

void loop() {
  if (IrReceiver.decode()) {
        Serial.print(IrReceiver.decodedIRData.command, HEX);
        delay(100);
        IrReceiver.resume(); // Enable receiving of the next value
    }
}
