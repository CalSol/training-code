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
  if (digitalRead(switch1Pin) == LOW) {
    digitalWrite(led1Pin, HIGH);
    delay(1000);
    digitalWrite(led1Pin, LOW);
  }
  if (digitalRead(switch2Pin) == LOW) {
    digitalWrite(led2Pin, HIGH);
    delay(1000);
    digitalWrite(led2Pin, LOW);
  }
}
