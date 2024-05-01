import processing.sound.*;


final int WIDTH = 800;
final int HEIGHT = 800;


final int FREQUENCY_COUNT = (int) pow(2, 10);
final int SAMPLE_RATE = Sound.sampleRate();

AudioIn audioIn;
FFT fft;
float frequencies[] = new float[FREQUENCY_COUNT];
float frequenciesDisplay[] = new float[FREQUENCY_COUNT];


FrequencyRange bass;
FrequencyRange tribble;
Amplitude amplitude;


void settings() {
    size(WIDTH, HEIGHT, P2D);
}

void setup() {
    audioIn = new AudioIn(this, 0);
    fft = new FFT(this, FREQUENCY_COUNT);
    
    amplitude = new Amplitude(this);
    amplitude.input(audioIn);

    audioIn.start();
    fft.input(audioIn);
    
    FrequencyRange.param(FREQUENCY_COUNT, SAMPLE_RATE);
    bass = new FrequencyRange(50.0, 400.0);
    tribble = new FrequencyRange(2000.0, 3000.0);
}

void draw() {
    fft.analyze(frequencies);
    
    float volume = amplitude.analyze()*5.0;
    println(volume);
    
    //float maxBass = bass.maxOfRange(frequencies)*10000.0 / volume;
    float averageBass = bass.averageOfRange(frequencies)*10000.0 / volume;
    // println(max, average);
    
    //float maxTribble = tribble.maxOfRange(frequencies)*10000.0 / volume;
    float averageTribble = tribble.averageOfRange(frequencies)*10000.0 / volume;
  
    background(255, averageTribble, averageBass);
  
    strokeWeight(2);
    for(int i = 0; i < FREQUENCY_COUNT; i++) {
      frequenciesDisplay[i] += (frequencies[i]-frequenciesDisplay[i]) / 5.0;
      
      if (bass.minIndex < i && i < bass.maxIndex) {
        stroke(0, 0, 255);
      } else if (tribble.minIndex < i && i < tribble.maxIndex) {
        stroke(0, 255, 0);
      } else {
        stroke(0, 0, 0);
      }
      line( i * 2, HEIGHT/2 + frequenciesDisplay[i]*height*3 / volume, i * 2, HEIGHT/2 - frequenciesDisplay[i]*height*3 / volume );
    }
    
    // println(tribble.maxOfRange(frequencies));
}
