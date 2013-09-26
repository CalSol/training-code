int led1Pin = 13;
int led2Pin = 14;
int switch1Pin = 10;
int switch2Pin = 11;

void setup() {
  pinMode(led1Pin, OUTPUT);
  pinMode(led2Pin, OUTPUT);
  digitalWrite(led1Pin, LOW);
  digitalWrite(led2Pin, LOW);

  pinMode(switch1Pin, INPUT);
  pinMode(switch2Pin, INPUT);
  digitalWrite(switch1Pin, HIGH);
  digitalWrite(switch2Pin, HIGH);
}

void loop() {
  // The "task" for Switch 1 and LED 1
  static long led1OffTime = 0;

  if (led1OffTime <= millis()) {
    digitalWrite(led1Pin, LOW);
  }

  if (digitalRead(switch1Pin) == LOW) {
    digitalWrite(led1Pin, HIGH);
    led1OffTime = millis() + 1000;
  }
  
  // The "task" for Switch 2 and LED 2
  static long led2OffTime = 0;

  if (led2OffTime <= millis()) {
    digitalWrite(led2Pin, LOW);
  }

  if (digitalRead(switch2Pin) == LOW) {
    digitalWrite(led2Pin, HIGH);
    led2OffTime = millis() + 1000;
  }
}
