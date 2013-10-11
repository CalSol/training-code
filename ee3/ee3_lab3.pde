#include <Wire.h>

const int PIN_SCL = 16;
const int PIN_SDA = 17;

// I2C address of TMP100 with A0=0, A1=0
const int TMP100_I2C_ADDR = 0x48;
const int TMP100_REG_TEMPERATURE = 0x00;
const int TMP100_REG_CONFIG = 0x01;

float digitalOutputToTemp(int16_t val) {
  return (float)val / 16;
}

void setup() {
  // Initialize serial console
  Serial.begin(9600);
  
  // Enable internal I2C pull-up resistors
  digitalWrite(PIN_SCL, HIGH);
  digitalWrite(PIN_SDA, HIGH);
  
  // Initialize I2C in master mode
  Wire.begin();
  
  // Setup configuration registers on TMP100
  Wire.beginTransmission(TMP100_I2C_ADDR);
  Wire.send(TMP100_REG_CONFIG);
  Wire.send(0x60);  // Set 12-bit mode
  Wire.endTransmission();
  
  // Set pointer at temperature 
  Wire.beginTransmission(TMP100_I2C_ADDR);
  Wire.send(TMP100_REG_TEMPERATURE);
  Wire.endTransmission();
  
  Serial.println("Ready");
}

void loop() {
  Wire.requestFrom(TMP100_I2C_ADDR, 2);
  
  if (Wire.available() == 2) {
    int16_t val = Wire.receive();
    val = val << 8;
    val |= Wire.receive();
    val = val >> 4;
    Serial.println("Read temperature");
    Serial.println(digitalOutputToTemp(val));
  } else {
    Serial.println("Invalid response");
  }

  delay(500);
}


