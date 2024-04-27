color bg_color = #ffe2a2;    //couleur de fond
float ecartement = 8.1;
float pointSize = 16.2;
float xCenter, yCenter;
int nb_points = 2000;

void setup(){  
  size(1000,1000);
  colorMode(HSB,100);
  xCenter =width*0.5;
  yCenter = height*0.5;
  background(bg_color);
}

void draw(){
    //float i=frameCount;    //
    background(bg_color);
    float magicAngle = (360/((1+sqrt(5))/2))+mouseX;
    for(int i=0;i<nb_points;i++){
      float rayon = sqrt(i)*ecartement;
      float angle = i*magicAngle;   //degré
      color pointColor = color(rayon%100,100,angle%100);
      float x = xCenter +rayon*cos(angle * TWO_PI/360);
      float y = yCenter +rayon*sin(angle * TWO_PI/360);
      fill(pointColor);
      circle (x,y,pointSize);
    }
  //circle (millis()/200.0,500,200);
}
