package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class SpaceShip extends Sprite{
		
		private var ship:Ship;
		private var vr:Number=5;
		private var vx:Number=0
		private var vy:Number=0
		private var thrust:Number=0;
		private var Down:Boolean=false;
		private var downDown:Boolean=false;
		private var leftDown:Boolean=false;
		private var rightDown:Boolean=false;
		private var spaceDown:Boolean=false;
		private var friction:Number=0.95;
		

		public function SpaceShip() {
			// constructor code
			init();
		}
		private function init():void
		{
			ship=new Ship();
			ship.x=stage.stageWidth/2;
			ship.y=stage.stageHeight/2;
		    stage.addChild(ship);
			
			addEventListener(Event.ENTER_FRAME, onShipMouvement);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onShipMouvement(event:Event)
		{
			var angle:Number=ship.rotation * Math.PI /180;
			var ax:Number=Math.cos(angle)*thrust;
			var ay:Number=Math.sin(angle)*thrust;
			vx+=ax;
			vy+=ay;
			vx*=friction;
			vy*=friction;
			ship.x+=vx;
			ship.y-=vy;
			
		
			if(leftDown)
			{
				ship.rotation-=vr;
			}
			if(rightDown)
			{
				ship.rotation+=vr;
			}
			if(spaceDown)
			{
				thrust=0.2;
				ship.draw(true);
			}
		}

		
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			if(event.keyCode==Keyboard.LEFT)
			{
				leftDown=true;
			}
			
			else if(event.keyCode==Keyboard.RIGHT)
			{
				rightDown=true;
			}
			if(event.keyCode==Keyboard.SPACE)
			{
				spaceDown=true;
			}
		}
		
		private function onKeyUp(event:KeyboardEvent):void
		{
			if(event.keyCode==Keyboard.LEFT)
			{
				leftDown=false;
			}
			else if(event.keyCode==Keyboard.RIGHT)
			{
				rightDown=false;
			}
				if(event.keyCode==Keyboard.SPACE)
			{
				spaceDown=false;
				thrust=0;
				ship.draw(false);
			}
			
		}

	}
	
}
