int led1Pin = 12;
int led2Pin = 13;
int switchPin = 18;
int potPin = 0;

void setup() {
  Serial.begin(9600);   // Initialize the USB console
  Serial1.begin(9600);  // Initialize the external UART port
  
  pinMode(led1Pin, OUTPUT);
  pinMode(led2Pin, OUTPUT);
  pinMode(switchPin, INPUT);
  
  digitalWrite(switchPin, 1);
}

void loop() {
  int potIn = analogRead(potPin) / 4;

  // Transmit data here!
  /*YOUR CODE HERE*/

  delay(100);

  while (Serial1.available() > 0) {
    // Read received data here!
    char inByte = /*YOUR CODE HERE*/
    // Process received data here!
    analogWrite(led1Pin, /*YOUR CODE HERE*/);
  }
}
