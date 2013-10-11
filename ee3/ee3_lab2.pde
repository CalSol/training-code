const int PIN_LED1 = 12;
const int PIN_LED2 = 13;
const int PIN_SWITCH = 18;
const int PIN_POT = 0;

void setup() {
  Serial.begin(9600);   // Initialize the USB console
  Serial1.begin(9600);  // Initialize the external UART port
  
  pinMode(PIN_LED1, OUTPUT);
  pinMode(PIN_LED2, OUTPUT);
  pinMode(PIN_SWITCH, INPUT);
  
  digitalWrite(PIN_SWITCH, 1);
  
  Serial.println("Ready");
}

void loop() {
  int potIn = analogRead(PIN_POT) / 4;

  // Transmit data here!
  /*YOUR CODE HERE*/

  delay(100);

  while (Serial1.available() > 0) {
    // Read received data here!
    char inByte = /*YOUR CODE HERE*/
    // Process received data here!
    analogWrite(PIN_LED1, /*YOUR CODE HERE*/);
  }
}
