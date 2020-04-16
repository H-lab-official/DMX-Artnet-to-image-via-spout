import spout.*;
import ch.bildspur.artnet.*;

ArtNetClient artnet;
byte[] dmxData = new byte[512];         

PImage photo;
PImage img; // image to use for the rotating cube demo
PGraphics pgr; // Graphics for demo
int offsetX =105;
int offsetY =70;
Spout spout;
PFont xFont;

void setup() {
  frameRate(60);
  
  size(1800, 690, P3D);
  textureMode(NORMAL);
  noSmooth();
  
  xFont = createFont("uni.ttf", 10);
  textFont(xFont);
  pgr = createGraphics(1280, 720, P3D);
  spout = new Spout(this);
  
  artnet = new ArtNetClient();
  artnet.start();

  spout.createSender("DMX-2-IMG");
  
} 
 
void draw()  { 
    
    background(0, 0, 0);
    noStroke();
    int count=0;
    for(int i=1; i<=8;i++)
      for(int j=1; j<=16;j++){
        eachU(i,j,count);
        count++;
      }
  
    spout.sendTexture();
}
