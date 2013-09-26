int ledPin = 13;
int ledOn = 1;

void setup() {
  pinMode(ledPin, OUTPUT);
}

void loop() {
  if (ledOn) {
    digitalWrite(ledPin, HIGH);
    delay (1000);
  }
  else {
    digitalWrite(ledPin, LOW);
    delay(1000);
  }
  ledOn = !ledOn;
}
