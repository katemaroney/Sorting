import java.util.Arrays;
float [] shades = new float[50];
float r = random(255);
float g = random(255);
float b = random(255);
int x, y;
void setup(){
  size(500, 1500);
  background(255);
  x = 0;
  y = 0;
  fill(r, g, b);
  smooth();
  colorMode(HSB, 100);
  for (int i = 0; i < shades.length; i++){
    shades[i] = noise(i) * 100;
  }
  printColors(shades);
  insertionSort(shades);
  printColors(shades);
}

void printColors(float []shades){
   for (int i = 0; i < shades.length; i++){
        fill(100, shades[i], 100);
        rect(x, y, x + 10, y + 20);
        x = x + 10;
      }
     x = 0;
     y = y+20;
      
}
void insertionSort(float [] shades){
  int i, j;
  float newValue;
  for (i = 1; i < shades.length; i++){
      newValue = shades[i];
      j = i;
      while(j > 0 && shades[j -1] > newValue){
         shades[j] = shades[j-1];
         j--;
      }
      shades[j] = newValue;
      printColors(shades);
  }

}
