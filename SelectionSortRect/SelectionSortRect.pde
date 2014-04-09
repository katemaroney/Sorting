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
  selectionSort(shades);
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

void selectionSort(float [] shades){
  int i, j;
  int min;
  for (j = 0; j < shades.length; j++){
      min = j;
      for (i = j+1; i < shades.length; i++){
          if (shades[i] < shades[min]){
             min = i;
          }
      }
      if (min != j){
        swap(j, min);
      }
      printColors(shades);
  }
}

void swap(int i, int j){
   float tmp = shades[i];
   shades[i] = shades[j];
   shades[j] = tmp;
}
