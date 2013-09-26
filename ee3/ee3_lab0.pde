int led1Pin = 12;
int led2Pin = 13;
int switchPin = 18;
int potPin = 0;

void setup() {
  Serial1.begin(9600);
  
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
    Serial1.print("1");
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
  // Note: the BRAIN has a separate UART port for external communications
  // and the USB console. This additional code processes from both, making it
  // equivalent to the Arduino's external / console UART.
  while (Serial1.available() > 0) {
    char inByte = Serial1.read();
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
