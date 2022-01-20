package{
	//imports
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	//defining the class
	public class Enemy extends MovieClip{
		private var myInstance:Main;
		public var xSpeed:int;//how fast it's going horizontally
		public var ySpeed:int;//how fast it's going vertically
		public var maxSpeed:int = 3;//how fast it can possibly go
		public var health:int=1;
 
		public function Enemy(){
			this.addEventListener(Event.ADDED, beginClass);
			this.addEventListener(Event.ENTER_FRAME, eFrameEvents);
		}
		private function beginClass(e:Event):void{
			myInstance = Main.instance;//defining the root
 
			//checking what the start direction is
			if(myInstance.startDir == 'UP'){//if it's starting up
				this.y = 300;//set the y value off the field
				this.x = myInstance.startCoord;//make the x value where it should be
				this.xSpeed = 0;//make it not move horizontally
				this.ySpeed = -maxSpeed;//make it move upwards
			} else if(myInstance.startDir == 'RIGHT'){//and so on for other directions
				this.x = -25;
				this.y = myInstance.startCoord;
				this.xSpeed = +maxSpeed;
				this.ySpeed = 0;
			} else if(myInstance.startDir == 'DOWN'){
				this.y = -25;
				this.x = myInstance.startCoord;
				this.xSpeed = 0;
				this.ySpeed = maxSpeed;
			} else if(myInstance.startDir == 'LEFT'){
				this.x = 550;
				this.y = myInstance.startCoord;
				this.xSpeed = -maxSpeed;
				this.ySpeed = 0;
			}
 
			//draw the actual enemy, it's just a red ball
			this.graphics.beginFill(0xFF0000);
			this.graphics.drawCircle(12.5,12.5,5);
			this.graphics.endFill();
		}
		private function eFrameEvents(e:Event):void{
			//move it based on x and y value
			this.x += xSpeed;
			this.y += ySpeed;
 
			//checking what direction it goes when finishing the path
			if(myInstance.finDir == 'UP'){//if it finishes at the top
				if(this.y <= -25){//if the y value is too high
					destroyThis();//then remove this guy from the field
				}
			} else if(myInstance.finDir == 'RIGHT'){//and so on for other directions
				if(this.x >= 550){
					destroyThis();
				}
			} else if(myInstance.finDir == 'DOWN'){
				if(this.y >= 300){
					destroyThis();
				}
			} else if(myInstance.startDir == 'LEFT'){
				if(this.x <= 0){
					destroyThis();
				}
			}
			if(health<=0)
			{
				destroyThis();
			}
 
			//remove this from stage when game is over
			if(myInstance.gameOver){
				destroyThis();
			}
		}
		public function destroyThis():void{
			//this function will make it easier to remove this from stage
			this.removeEventListener(Event.ENTER_FRAME, eFrameEvents);
			this.parent.removeChild(this);
		}
	}
}