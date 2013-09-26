int led1Pin = 9;
int led2Pin = 10;
int switchPin = 2;
int potPin = 0;

void setup() {
  Serial.begin(9600);
  
  pinMode(led1Pin, OUTPUT);
  pinMode(led2Pin, OUTPUT);
  pinMode(switchPin, INPUT);
  
  digitalWrite(switchPin, 1);
}

void loop() {
  static int led1Val = 0;
  static int led2Val = 0;

  if (!digitalRead(switchPin)) {
    Serial.print("1");
    delay(250);
    while (!digitalRead(switchPin)) {
      delay(250);
    }
  }
  
  while (Serial.available() > 0) {
    char inByte = Serial.read();
    if (inByte == '1') {
      led1Val = !led1Val;
    } else if (inByte == '2') {
      led2Val = !led2Val;
    } else {
      led1Val = !led1Val;
      led2Val = !led2Val;
    }
  }
  digitalWrite(led1Pin, led1Val);
  digitalWrite(led2Pin, led2Val);
}
