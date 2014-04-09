import java.util.Arrays;
float [] shades = new float[75];
float r = random(255);
float g = random(255);
float b = random(255);
int x, y;
void setup(){
  size(750, 2000);
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
  mergeSort(0, shades.length - 1);
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

void mergeSort(int low, int high){
  if (low < high){
    int middle = low + (high - low)/2;
    mergeSort(low, middle);
    mergeSort(middle + 1, high);
    merge(low, middle, high);
  }


}
void merge(int low, int middle, int high) {
    float [] helper = new float[shades.length];
    for (int i = low; i <= high; i++){
        helper[i] = shades[i];
    }
    int i = low;
    int j = middle + 1;
    int k = low;
    while (i <= middle && j <= high){
      if (helper[i] <= helper[j]){
        shades[k] = helper[i];
        i++;
      }
      else {
        shades[k] = helper[j];
        j++;
      }
      k++;
    }
    while (i <= middle){
      shades[k] = helper[i];
      k++;
      i++;
    }
      printColors(shades);
}


      


