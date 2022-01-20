﻿package {
	import flash.display.MovieClip;
	import flash.events.*;
	public class Bullet extends MovieClip {
		private var myInstance:Main;
		//these two variables below must be set to public so that we can edit them outside the class
		public var target;//the target that this guy is moving towards
		public var damage:int;//how much damage this guy inflicts on the enemy
 
		private var xSpeed:Number;//how fast it's moving horizontally
		private var ySpeed:Number;//how fast it's moving vertically
		private var maxSpeed:Number = 5;//how fast it can go
		public function Bullet() {
			addEventListener(Event.ADDED,beginClass);//this will run every time this guy is made
			addEventListener(Event.ENTER_FRAME,eFrame);//this will run every frame
		}
		private function beginClass(e:Event):void {
			myInstance = Main.instance;//setting the root
 
			//drawing this guy (it'll be a small white circle)
			this.graphics.beginFill(0xFFFFFF);
			this.graphics.drawCircle(0,0,2);
			this.graphics.endFill();
		}
		private function eFrame(e:Event):void {
			var yDist:Number=target.y+12.5 - this.y;//how far this guy is from the enemy (x)
			var xDist:Number=target.x+12.5 - this.x;//how far it is from the enemy (y)
			var angle:Number=Math.atan2(yDist,xDist);//the angle that it must move
			ySpeed=Math.sin(angle) * maxSpeed;//calculate how much it should move the enemy vertically
			xSpeed=Math.cos(angle) * maxSpeed;//calculate how much it should move the enemy horizontally
			//move the bullet towards the enemy
			this.x+= xSpeed;
			this.y+= ySpeed;
 
			if(this.hitTestObject(target)){//if it touches the enemy
				target.health -= damage;//make it lose some health
				destroyThis();//and destroy this guy
			}
			if(target == null || myInstance.gameOver == true){//destroy it if game is over
				destroyThis();
			}
		}
		public function destroyThis():void{
			//this function will just remove this guy from the stage
			this.removeEventListener(Event.ENTER_FRAME, eFrame);
			myInstance.removeChild(this);
		}
	}
}

