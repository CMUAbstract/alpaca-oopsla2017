const int DoutPin =  0;//Pin A0

// Variables will change:
long previousMicros = 0;        // will store last time LED was updated
long interval = 200;           // check the ADC every 200 microseconds
int voltage = 0;
int done = 0;


void setup() {
  
  analogReference(INTERNAL);
  Serial.begin(9600);

}

void loop()
{

  unsigned long currentMicros = micros();
  //deal with overflow
  if( currentMicros < previousMicros ){
    previousMicros = currentMicros;
    return; 
  }
  
  if(currentMicros - previousMicros > interval ) {
    
    // save the last time you blinked the LED 
    previousMicros = currentMicros;  
    voltage = analogRead(DoutPin);
    Serial.println(voltage);
    
  }

}

