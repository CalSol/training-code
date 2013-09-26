/*CalSol
Introduction to Microcontrollers Lab
Adam Resnick
*/

void setup() {
  Serial.begin(9600); //Initializes serial communication 
} 

void loop() {
  Serial.println("Hello World!"); //Print Hello World
  delay(1000); //Wait 1 second
}
