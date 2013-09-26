#define LED 13
#define BUTTON 2

void setup(){
  pinMode(LED, OUTPUT);
  pinMode(BUTTON, INPUT);
  digitalWrite(BUTTON, HIGH);
}

void loop(){
	while(1){
		digitalWrite(LED, digitalRead(BUTTON));
	}
}
