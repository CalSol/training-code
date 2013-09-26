#define RED 13
#define GREEN 14
#define BLUE 15

float mod(float x, float d) {
    while (x > d) {
        x = x - d;
    }
    
    return x;
}

/* Maps a HSL color with L fixed at 0.5 and S fixed at 1
   hue must be in the range [0.0, 360.0]
   
   Returns a triple of floats in [0.0, 1.0] representing
   the red, green, and blue values
*/

void hue_to_rgb(float hue, float *dest) {
    float h0 = hue/60.0;
    float x = 1 - abs(mod(h0, 2) - 1);
    if (h0 < 0.0 or h0 > 6.0) {
        dest[0] = dest[1] = dest[2] = 0.0;
    } else if (h0 < 1) {
        dest[0] = 1.0;
        dest[1] = x;
        dest[2] = 0.0;
    } else if (h0 < 2) {
        dest[0] = x;
        dest[1] = 1.0;
        dest[2] = 0.0;
    } else if (h0 < 3) {
        dest[0] = 0.0;
        dest[1] = 1.0;
        dest[2] = x;
    } else if (h0 < 4) {
        dest[0] = 0.0;
        dest[1] = x;
        dest[2] = 1.0;
    } else if (h0 < 5) {
        dest[0] = x;
        dest[1] = 0.0;
        dest[2] = 1.0;
    } else {
        dest[0] = 1.0;
        dest[1] = 0.0;
        dest[2] = x;
    }
}

void setup() {
    ;
}

void loop() {
  float rgb[3];
  for (int i=0; i < 1000; i=i+1) {
      hue_to_rgb(i*360.0/1000, rgb);
      analogWrite(RED,   rgb[0]*255);
      analogWrite(GREEN, rgb[1]*255);
      analogWrite(BLUE,  rgb[2]*255);
      delay(20);
  }
}
