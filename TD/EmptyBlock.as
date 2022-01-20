package{
	//importing required classes for this to work
	import flash.display.MovieClip;
	import flash.events.*;
	public class EmptyBlock extends MovieClip{//defining the class as EmptyBlock

 
		public function EmptyBlock(){//this function will always run once EmptyBlock is called
			this.addEventListener(Event.ADDED, beginClass);//create a function that will run once

		}
		private function beginClass(e:Event):void{
			//_root = MovieClip(root);//setting the _root as the root level
 
			this.buttonMode = true;//make this act like a button
			this.addEventListener(MouseEvent.MOUSE_OVER, thisMouseOver);//adding function for mouseOver
			this.addEventListener(MouseEvent.MOUSE_OUT, thisMouseOut);//adding function for mouseOut
			this.addEventListener(MouseEvent.CLICK, thisClick);//adding function for clicking
		}
	
		private function thisMouseOver(e:MouseEvent):void{
			//changing the background so the user know's it's clickable
			this.graphics.drawRect(0,0,25,25);
			this.graphics.endFill();
		}
		private function thisMouseOut(e:MouseEvent):void{
			//changing the background back
			this.graphics.beginFill(0x99cc00);
			this.graphics.drawRect(0,0,25,25);
			this.graphics.endFill();
		}
		private function thisClick(e:MouseEvent):void{
			//we'll add code that'll make a turret be made later
			Main.instance.makeTurret(this.x, this.y);
			
		}
	}
}