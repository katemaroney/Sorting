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
    for (int i = 0; i < radii.length; i++){
        radii[i] = noise(i) * 100;
    }
    x = 50;
    y = 50;
    printCircles();
    insertionSort(radii);
}

void printCircles(){
  for (int i = 0; i< radii.length; i++){
      ellipse(x, y, radii[i], radii[i]);
      x += 100;
  }
  y += 100;
  x = 50;
}

void insertionSort(float [] radii){
  int i, j;
  float newValue;
  for (i = 1; i < radii.length; i++){
      newValue = radii[i];
      j = i;
      while(j > 0 && radii[j -1] > newValue){
         radii[j] = radii[j-1];
         j--;
      }
      radii[j] = newValue;
      printCircles();
  }

}
