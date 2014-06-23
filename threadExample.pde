//http://wiki.processing.org/w/Threading
PGraphics offscreenSurface;

void setup()
{
  size(screenWidth,screenWidth,P2D);
  offscreenSurface = createGraphics(500,500,P2D);
  //creates and launches a new 'rendering thread' that 
  RepeatingImageDisplayThread myThread = new RepeatingImageDisplayThread(offscreenSurface,1);
  myThread.start();
}

void draw()
{
  doSomethingToOffscreenSurface();
}

void keyPressed()
{
  if(key == 's')
  {
    //saves the screen off to a file on a new thread
    CopyAndSaveImgThread myThread = new CopyAndSaveImgThread(g,"customFileName-"+millis()+".png");
    myThread.start();
  }
}

//example function that changes and updates the data contained 
//in the PGraphics object
void doSomethingToOffscreenSurface()
{
  offscreenSurface.loadPixels();
  for(int i = 0; i < offscreenSurface.pixels.length; i++)
  {
    offscreenSurface.pixels[i] = color(random(255),
                                       random(255),
                                       random(255));
  }
  offscreenSurface.updatePixels();
  println("doSomethingToOffscreenSurface timeStamp: " + millis() );
}


