int led1Pin = 9;
int led2Pin = 10;
int switchPin = 2;
int potPin = 0;

void setup() {
  Serial.begin(9600);
  Serial1.begin(9600);
  
  pinMode(led1Pin, OUTPUT);
  pinMode(led2Pin, OUTPUT);
  pinMode(switchPin, INPUT);
  
  digitalWrite(switchPin, 1);
}

void loop() {
  int potIn = analogRead(potPin) / 4;

  // Transmit data here!
  Serial.write(potIn);

  delay(100);

  while (Serial.available() > 0) {
    // Read received data here!
    char inByte = Serial.read();
    // Process received data here!
    analogWrite(led1Pin, inByte);
  }
}
