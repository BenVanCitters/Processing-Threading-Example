//repeatedly renders an image to the screen buffer 
//on a fixed delay.
class RepeatingImageDisplayThread extends Thread
{
  public PGraphics mSharedPGraphics;
  private long mNextTriggerTime = 0;
  private long mRepeatInterval;
  public RepeatingImageDisplayThread(PGraphics pgraphics, long repeatInterval)
  {
    mSharedPGraphics = pgraphics;
    mRepeatInterval = repeatInterval;
  }
  public void run() 
  {
    while(true)
    {
      if(mNextTriggerTime < millis())
      {
        mNextTriggerTime += mRepeatInterval;
        image(mSharedPGraphics,0,0);
        println("RepeatingImageDisplayThread timeStamp: " + millis() );
      }
    }
  }
}
