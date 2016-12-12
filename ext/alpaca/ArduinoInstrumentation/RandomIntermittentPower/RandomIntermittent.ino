/* Blink without Delay
 
 Turns on and off a light emitting diode(LED) connected to a digital  
 pin, without using the delay() function.  This means that other code
 can run at the same time without being interrupted by the LED code.
 
 The circuit:
 * LED attached from pin 13 to ground.
 * Note: on most Arduinos, there is already an LED on the board
 that's attached to pin 13, so no hardware is needed for this example.
 
 
 created 2005
 by David A. Mellis
 modified 8 Feb 2010
 by Paul Stoffregen
 
 This example code is in the public domain.

 
 http://www.arduino.cc/en/Tutorial/BlinkWithoutDelay
 */

// constants won't change. Used here to 
// set pin numbers:
const int ledPin =  13;      // the number of the LED pin
const int VoutPin =  4;      // the number of the Vout pin

// Variables will change:
int ledState = LOW;             // ledState used to set the LED
long previousMillis = 0;        // will store last time LED was updated

// the follow variables is a long because the time, measured in miliseconds,
// will quickly become a bigger number than can be stored in an int.

unsigned long totalOnTime = 60000;//milliseconds of powered time per experiment
long interval = 1000;           // interval at which to blink (milliseconds) initially 1 sec.
int done = 0;

void setup() {
  // set the digital pin as output:
  pinMode(ledPin, OUTPUT);      
  pinMode(VoutPin, OUTPUT);      
}

void loop()
{
  if(done){ return; }
  // here is where you'd put code that needs to be running all the time.

  // check to see if it's time to blink the LED; that is, if the 
  // difference between the current time and last time you blinked 
  // the LED is bigger than the interval at which you want to 
  // blink the LED.
  unsigned long currentMillis = millis();
 
  if(currentMillis - previousMillis > interval) {
    
    
    // save the last time you blinked the LED 
    previousMillis = currentMillis;   


    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW){
      /*turn on for 1-10 seconds*/
      if(totalOnTime > 10000){
        interval = random(1000,10000);
      }
      else if(totalOnTime > 1000){
        interval = random(1000,totalOnTime);  
      }
      else{
        interval = totalOnTime; 
      }
      ledState = HIGH;
      
    }else{
      totalOnTime = totalOnTime - interval;
      if(totalOnTime <= 0){
        done = 1;
      }
      /*turn off for 1 second*/
      ledState = LOW;
      interval = 1000;
    }
    // set the LED with the ledState of the variable:
    digitalWrite(ledPin, ledState);
    digitalWrite(VoutPin, ledState);
  }

}

