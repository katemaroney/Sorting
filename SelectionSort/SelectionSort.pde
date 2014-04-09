float [] radii = new float [10];
float r = random(255);
float g = random(255);
float b = random(255);
int x, y;
void setup(){
  background(255);
  size(1000, 1500);
  smooth();
  fill(r, g, b);
  for(int i = 0; i < radii.length; i++){
     radii[i] = noise(i) * 100;
  }
  x = 50;
  y = 50;
  printCircles();
  selectionSort(radii);
}
void printCircles(){
  for (int i = 0; i< radii.length; i++){
      ellipse(x, y, radii[i], radii[i]);
      x += 100;
  }
  y += 100;
  x = 50;
}

void selectionSort(float [] radii){
  int i, j;
  int min;
  for (j = 0; j < radii.length; j++){
      min = j;
      for (i = j+1; i < radii.length; i++){
          if (radii[i] < radii[min]){
             min = i;
          }
      }
      if (min != j){
        swap(j, min);
      }
      printCircles();
  }
}

void swap(int i, int j){
   float tmp = radii[i];
   radii[i] = radii[j];
   radii[j] = tmp;
}
