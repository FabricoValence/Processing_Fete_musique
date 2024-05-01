import processing.video.*;

final int WIDTH = 800;
final int HEIGHT = 800;

Capture cam;

final int DELAY = 3;
PGraphics buffers[] = new PGraphics[DELAY];

void settings() {
    size(WIDTH, HEIGHT, P2D);
}

void setup() {
    background(0);
    
    String[] cameras = Capture.list();
    cam = new Capture(this, cameras[0]);
    cam.start();

    for (int i = 0 ; i < DELAY ; i++) {
        buffers[i] = createGraphics(cam.sourceWidth, cam.sourceHeight, P2D);

        buffers[i].beginDraw();
        buffers[i].background(0);
        buffers[i].endDraw();
    }
}

void draw() {
    if (cam.available() == true) {
        background(0);

        cam.read();

        image(buffers[DELAY-1], 0, 0);
        blendMode(SUBTRACT);
        image(cam, 0, 0);
        blendMode(BLEND);

        buffers[0].beginDraw();
        buffers[0].image(cam, 0, 0);
        buffers[0].endDraw();

        for (int i = DELAY-1 ; i > 0 ; i--) {
            buffers[i].beginDraw();
            buffers[i].image(buffers[i-1], 0, 0);
            buffers[i].endDraw();
        }
    }
}
