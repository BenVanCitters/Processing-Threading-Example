class CopyAndSaveImgThread extends Thread
{
  public PImage mImageCopy;
  private String mRelativeFilePath;
  public CopyAndSaveImgThread(PImage img, String relativeFilePath)
  {
    long startTime = millis();
    mImageCopy = createImage(img.width,img.height,RGB);
    mImageCopy.copy(img,0,0,img.width,img.height,
                    0,0,img.width,img.height);
    mRelativeFilePath = relativeFilePath;
    println("copying image took " + (millis()-startTime) + " milliseconds.");
  }
  
  public void run() 
  {
    println(millis() + " starting saving " + mRelativeFilePath);
    mImageCopy.save(mRelativeFilePath);
    println(millis() + "...finished saving " + mRelativeFilePath);
  }
}
