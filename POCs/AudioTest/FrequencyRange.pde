static class FrequencyRange {
  
  static int frequencyCount = 0;
  static int sampleRate = 0;
  
  float minFrequency;
  float maxFrequency;
  
  int minIndex;
  int maxIndex;
  
  public FrequencyRange(float minFrequency, float maxFrequency) {
    this.minFrequency = minFrequency;
    this.maxFrequency = maxFrequency;
    
    this.minIndex = freqToFFTIndex(minFrequency);
    this.maxIndex = freqToFFTIndex(maxFrequency);
    
    println(this.minIndex,  this.maxIndex);
  }
  
  // returns the maximum value found in the range minIndex -> maxIndex
  public float maxOfRange(float frequencies[]) {
    float maxVal = 0.0;
    for (int i = this.minIndex ; i < this.maxIndex ; i++) {
      if (frequencies[i] > maxVal) {
        maxVal = frequencies[i];
      }
    }
    return maxVal;
  }
  
  public float averageOfRange(float frequencies[]) {
    float sum = 0.0;
    for (int i = this.minIndex ; i < this.maxIndex ; i++) {
      sum += frequencies[i];
    }
    return sum / (this.maxIndex-this.minIndex);
  }
  
  static int freqToFFTIndex(float hertz) {
    return round(frequencyCount*hertz / sampleRate);
  }
  
  static void param(int frequencyCount, int sampleRate) {
    FrequencyRange.frequencyCount = frequencyCount;
    FrequencyRange.sampleRate = sampleRate;
  }
}
