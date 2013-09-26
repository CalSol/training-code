int analogPin = 0;

void setup() {
  Serial.begin(9600); //Initializes serial communication 
  // Do any additional one-time setup
  pinMode(analogPin, INPUT);
}

void loop() {
  // Code here repeats forever
  float measVoltage = analogRead(analogPin);
  measVoltage *= 5;
  measVoltage /= 1023;
  Serial.println(measVoltage);
  delay(1000);
}
