#include <SPI.h>

int led1Pin = 9;
int led2Pin = 10;
int switchPin = 2;
int potPin = A0;

int aclCSPin = 7;

// MMA7455 Register Map
int MMA_XOUTL = 0x00;  // X-axis output LSB
int MMA_XOUTH = 0x01;  // X-axis output MSB
int MMA_YOUTL = 0x02;  // Y-axis output LSB
int MMA_YOUTH = 0x03;  // Y-axis output MSB
int MMA_ZOUTL = 0x04;  // Z-axis output LSB
int MMA_ZOUTH = 0x05;  // Z-axis output MSB
int MMA_XOUT8 = 0x06;  // X-axis output 8 bits
int MMA_YOUT8 = 0x07;  // Y-axis output 8 bits
int MMA_ZOUT8 = 0x08;  // Z-axis output 8 bits

int MMA_I2CAD = 0x0D;   // I2C device address
int MMA_STATUS = 0x09;  // status registers
int MMA_MCTL = 0x16;    // mode control

// Accelerometer driver function prototypes
int aclReadReg(int reg);
int aclWriteReg(int reg, int value);

void setup() {
  Serial.begin(9600);
  
  pinMode(led1Pin, OUTPUT);
  pinMode(led2Pin, OUTPUT);
  pinMode(switchPin, INPUT);
  
  digitalWrite(switchPin, HIGH);
  
  pinMode(aclCSPin, OUTPUT);
  digitalWrite(aclCSPin, HIGH);
  
  SPI.begin();

  // Disable the accelerometer's I2C interface
  aclWriteReg(MMA_I2CAD, 0b10011101);
    
  // Check that our writes have worked
  int aclResp = aclReadReg(MMA_I2CAD);
    
  if (aclResp != 0b10011101) {
    digitalWrite(led1Pin, LOW);
    digitalWrite(led2Pin, HIGH);
    while (1) {
      Serial.println("Accelerometer initialization failed");
      Serial.println(aclResp);
      delay(1000);
    }
  } else {
    digitalWrite(led1Pin, LOW);
    digitalWrite(led2Pin, LOW);
  }
  
  // Bring the accelerometer out of idle
  aclWriteReg(MMA_MCTL, 0b10000101);
}

void loop() {
  // Read the 8-bit X output register
  signed char xVal = aclReadReg(MMA_XOUT8);
  
  // Do some conditioning
  // Take the absolute value of the signed result
  /* YOUR CODE HERE */
  // Cap the result at 1g = 64
  /* YOUR CODE HERE */
  // Scale it to that the full scale is 16
  /* YOUR CODE HERE */
  // Square it to give a linear brightness output
  /* YOUR CODE HERE */
  
  // Write the result as the PWM duty cycle
  analogWrite(led1Pin, xVal);
  
  // Repeat for the Y-axis
  /* YOUR CODE HERE */
  
  delay(50);
}

// Reads one of the accelerometer's registers through SPI
// Returns: value of the register read
int aclReadReg(int reg) {
  int data;
  // bring CS low (active)
  digitalWrite(aclCSPin, LOW);
  
  reg = 0b01111110 & (reg << 1);
  
  // send read operation and register address
  SPI.transfer(reg);
  // read out data
  data = SPI.transfer(0x00);
  
  // return CS high (idle)
  digitalWrite(aclCSPin, HIGH);
  
  return data;
}

// Writes one of the accelerometer's registers through SPI
int aclWriteReg(int reg, int value) {
  int data;
  // bring CS low (active)
  digitalWrite(aclCSPin, LOW);
  
  reg = 0b10000000 | (reg << 1);
  
  // send write operation and register address
  SPI.transfer(reg);
  
  // send value to write into register
  SPI.transfer(value);
  
  // return CS high (idle)
  digitalWrite(aclCSPin, HIGH);
  
  return data;
}
