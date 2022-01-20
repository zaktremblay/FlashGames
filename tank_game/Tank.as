package  {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;

	public class Tank extends MovieClip{
		//private var tank:Tank;
		private var barrel:Barrel;
		private var leftDown:Boolean= false;
		private var rightDown:Boolean= false;
		private var upDown:Boolean= false;
		private var downDown:Boolean= false;
		private var vrotation:Number;




		public function Tank() {
			// constructor code
			init();
		}
		
		private function init()
		{
			barrel=new Barrel;
			barrel.x=tank.x;
			barrel.y=tank.y- tank.height/3;
			addChild(barrel);
			
			addEventListener(Event.ENTER_FRAME, onBarrelMouvement);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		private function onBarrelMouvement(event:Event):void
		{
			barrel.rotation+=vrotation;
			
			if(upDown)
			{
				vrotation= -5;
			}
			if(downDown)
			{
				vrotation= 5;
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
			
			else if(event.keyCode==Keyboard.UP)
			{
				upDown=true;
			}
			
			else if(event.keyCode==Keyboard.DOWN)
			{
				downDown=true;
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
			
			else if(event.keyCode==Keyboard.UP)
			{
				upDown=false;
			}
			
			else if(event.keyCode==Keyboard.DOWN)
			{
				downDown=false;
			}
		}
		
		

		
	}
	
}
