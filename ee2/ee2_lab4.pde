int analogPin = 0;

void setup() {
  Serial.begin(9600); //Initializes serial communication 
  // Do any additional one-time setup
  /* YOUR CODE HERE */
}

void loop() {
  // Code here repeats forever
  float measVoltage;
  /* YOUR CODE HERE */
  Serial.println(measVoltage);
  delay(1000);
}
