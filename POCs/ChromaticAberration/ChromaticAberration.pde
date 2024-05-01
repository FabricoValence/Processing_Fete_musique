import processing.video.*;


final int WIDTH = 800;
final int HEIGHT = 800;


PShader testShader;
Capture cam;

void settings() {
    size(WIDTH, HEIGHT, P2D);
}

void setup() {
    testShader = loadShader("shader/chromaticAberration.glsl");
    
    String[] cameras = Capture.list();
    cam = new Capture(this, cameras[0]);
    cam.start();
}

void draw() {
    testShader.set("redMult", mouseX/((float)WIDTH) * 2.0);
    testShader.set("greenMult", mouseY/((float)HEIGHT) * 2.0);
    shader(testShader);

    if (cam.available() == true) {
        cam.read();

        image(cam, 0, 0);
    }
}
