float [] shades = new float[50];
float r = random(255);
float g = random(255);
float b = random(255);
int x, y;
void setup(){
  size(500, 2000);
  background(255);
  x = 0;
  y = 0;
  fill(r, g, b);
  smooth();
  colorMode(HSB, 100);
  for(int i = 0; i < shades.length; i++){
    shades[i] = noise(i) * 100;
  }
  printColors(shades);
  quicksort(0, shades.length -1);
}

void printColors(float[] shades){
  for (int i = 0; i < shades.length; i++){
      print(shades[i] + " ");
      fill(100, shades[i], 100);
      rect(x, y, x + 10, y + 20);
      x = x + 10;
   }
   x = 0;
   y = y+20;
}
void quicksort(int low, int high){
  int i = low, j = high;
  float lowPivot = shades[low];
  float highPivot = shades[high];
  float middlePivot = shades[low + (high-low)/2];
  float pivot = median(lowPivot, middlePivot, highPivot);
  while (i <= j){
      while (shades[i] < pivot){
        i++;
      }
      while (shades[j] > pivot){
        j--;
      }
      
      if (i <= j){
        swap(i, j);
        i++;
        j--;
      }
  }
  
  printColors(shades);
  if (low < j){
    quicksort(low, j);
  }
  if (i < high){
    quicksort(i, high);
  }
}

void swap(int i, int j){
  float tmp = shades[i];
  shades[i] = shades[j];
  shades[j] = tmp;
}
float median(float low, float middle, float high){
    if ((low < middle && middle < high) || (high < middle && middle < low)){
       return middle;
    }
    else if ((low < high && high < middle) || (middle < high && high < low)){
      return high;
    }
    else{
      return low;
    }
}  
    
