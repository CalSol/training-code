const int PIN_LED1 = 12;
const int PIN_LED2 = 13;
const int PIN_SWITCH = 18;
const int PIN_POT = 0;

const int PIN_UART1_RX = 10;

void setup() {
  Serial.begin(9600);
  Serial1.begin(9600);
  
  pinMode(PIN_LED1, OUTPUT);
  pinMode(PIN_LED2, OUTPUT);
  pinMode(PIN_SWITCH, INPUT);
  
  digitalWrite(PIN_SWITCH, 1);    // pull-up for switch
  digitalWrite(PIN_UART1_RX, 1);  // pull-up for external UART RX
  
  Serial.println("Ready");
}

void loop() {
  static int led1Val = 0;
  static int led2Val = 0;

  if (!digitalRead(PIN_SWITCH)) {
    Serial.print("1");
    Serial1.print("1");
    
    // Do a delay before and after to filter out switch bounce.
    delay(50);
    while (!digitalRead(PIN_SWITCH)) {
      delay(50);
    }
  }

  // Note: the BRAIN has a separate UART port for external communications
  // and the USB console. This additional code processes from both, making it
  // equivalent to the Arduino's external / console UART.  
  while (1) {
    char inByte;
    if (Serial.available()) {
      inByte = Serial.read();
    } else if (Serial1.available()) {
      inByte = Serial1.read();
    } else {
      break;
    }
    
    if (inByte == '1') {
      led1Val = !led1Val;
    } else if (inByte == '2') {
      led2Val = !led2Val;
    } else {
      led1Val = !led1Val;
      led2Val = !led2Val;
    }
  }

  digitalWrite(PIN_LED1, led1Val);
  digitalWrite(PIN_LED2, led2Val);
}
