package kiloboltgame;

import java.awt.Rectangle;
import java.util.ArrayList;

//import java.awt.Graphics;

public class Robot {
	
	//Constants
	final int JUMPSPEED = -15, MOVESPEED = 5;
	
	private int centerX = 100, centerY = 377, speedX = 0, speedY = 0;
	private boolean jumped = false, movingLeft = false, movingRight = false, ducked = false, readyToFire=true;
	
	//Collision (x,y,width,height)
	//Character
	public static Rectangle rect = new Rectangle(0,0,0,0), rect2 = new Rectangle(0,0,0,0);
	//Arms
	public static Rectangle rect3 = new Rectangle(0,0,0,0), rect4 = new Rectangle(0,0,0,0);
	//Feet
	public static Rectangle footleft = new Rectangle(0,0,0,0), footright = new Rectangle(0,0,0,0);
	//Ground
	public static Rectangle yellowRed = new Rectangle(0,0,0,0);	
	
	private static Background bg1 = StartingClass.getBg1(), bg2 = StartingClass.getBg2();
	
	private ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
	
	public void update() {
		
		//Moves Character or Scrolls Background accordingly
		if (speedX < 0) {
			centerX+=speedX;
		} 
		//Prevents going beyond X coordinate of 0
		if (centerX+speedX<=60) {
			centerX=61;
		}
		if(speedX<=0) {
			//Do not scroll the background"
			bg1.setSpeedX(0);
			bg2.setSpeedX(0);
		}
		if (centerX<=200 && speedX>0) {
			centerX+=speedX;
		} 
		if (speedX>0 && centerX>200){
			//Scroll background here
			bg1.setSpeedX(-MOVESPEED/5);
			bg2.setSpeedX(-MOVESPEED/5);
		}
		
		
		//Updates Y Position
		centerY+=speedY;
		
		//Handles Jumping
		speedY+=1;
		if (speedY>3) {
			jumped=true;
		}
		
		//Collision
		rect.setRect(centerX-34, centerY-63, 68, 63);
		rect2.setRect(rect.getX(),rect.getY()+63,68,64);
		rect3.setRect(rect.getX()-26,rect.getY()+32,26,20);
		rect4.setRect(rect.getX()+68,rect.getY()+32,26,20);
		yellowRed.setRect(centerX-110,centerY-110,180,180);
		footleft.setRect(centerX-50,centerY+20,50,15);
		footright.setRect(centerX,centerY+20,50,15);
		
	}
	
	
	public void moveRight() {
		if (!ducked) {
			speedX=MOVESPEED;
		}
	}

	public void moveLeft() {
		if (!ducked) {
			speedX=-MOVESPEED;
		}
	}

	public void stopRight() {
		setMovingRight(false);
		stop();
	}
	
	public void stopLeft() {
		setMovingLeft(false);
		stop();
	}
	
	public void stop() {
		if (!isMovingRight() && !isMovingLeft()) {
			speedX=0;
		}
		if (!isMovingRight() && isMovingLeft()) {
			moveLeft();
		}
		if (isMovingRight() && !isMovingLeft()) {
			moveRight();
		}
		
	}

	public void jump() {
		if (jumped == false) {
			speedY=JUMPSPEED;
			jumped = true;
		}	
	}
	
	public void shoot() {
		if(readyToFire) {
			Projectile p = new Projectile(centerX+50,centerY-25);
			projectiles.add(p);
		}
	}
	public ArrayList<Projectile> getProjectiles() {
		return projectiles;
	}
	
	public int getCenterX() {
		return centerX;
	}

	public int getCenterY() {
		return centerY;
	}

	public int getSpeedX() {
		return speedX;
	}

	public int getSpeedY() {
		return speedY;
	}

	public boolean isJumped() {
		return jumped;
	}

	public void setCenterX(int centerX) {
		this.centerX = centerX;
	}

	public void setCenterY(int centerY) {
		this.centerY = centerY;
	}

	public void setSpeedX(int speedX) {
		this.speedX = speedX;
	}

	public void setSpeedY(int speedY) {
		this.speedY = speedY;
	}

	public void setJumped(boolean jumped) {
		this.jumped = jumped;
	}
	

	public boolean isMovingLeft() {
		return movingLeft;
	}

	public boolean isMovingRight() {
		return movingRight;
	}

	public boolean isDucked() {
		return ducked;
	}

	public void setMovingLeft(boolean movingLeft) {
		this.movingLeft = movingLeft;
	}

	public void setMovingRight(boolean movingRight) {
		this.movingRight = movingRight;
	}

	public void setDucked(boolean ducked) {
		this.ducked = ducked;
	}

	public boolean isReadyToFire() {
		return readyToFire;
	}

	public void setReadyToFire(boolean readyToFire) {
		this.readyToFire = readyToFire;
	}


}
