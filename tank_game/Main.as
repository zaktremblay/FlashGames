package  {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;

	public class Main extends MovieClip{
		//private var tank:Tank;
		public var barrel:Barrel;
		private var leftDown:Boolean= false;
		private var rightDown:Boolean= false;
		private var upDown:Boolean= false;
		private var downDown:Boolean= false;
		private var vrotation:Number=0;
		private var spaceDown: Boolean=false;
		private var bullet:Bullet;
		public var barrelLenght:Number;
		private var bulletFire:Boolean=true;
		
		private static var myInstance:Main;
		public static function get instance():Main
		{
			return myInstance;
		}




		public function Main() {
			// constructor code
			init();
		}
		
		private function init()
		{
			myInstance=this;
			
			
			stage.addChild(tank2)
			barrel=new Barrel;
			barrel.x=tank.x;
			barrel.y=tank.y - tank.height/3;
			barrelLenght=barrel.width;
			addChild(barrel);
			
			addEventListener(Event.ENTER_FRAME, onBarrelMouvement);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			addEventListener(Event.ENTER_FRAME,onBulletShoot);
			addEventListener(Event.ENTER_FRAME, onGroundHit);
			addEventListener(Event.ENTER_FRAME, onEnemyHit);
		}
		private function onEnemyHit(event:Event):void
		{
			{if(bullet)
		{
			if(bullet.hitTestObject(tank2))
			{
				bulletFire=true;
				if(bullet.parent==stage)
				{
					stage.removeChild(bullet);
				
				}
				if(tank2.parent==stage)
				{
					stage.removeChild(tank2);
				}
				}
			}
		}
	}

		
		
		
		private function onGroundHit(event:Event):void
		{if(bullet)
		{
			if(bullet.hitTestObject(terrain1))
			{
				bulletFire=true;
				if(bullet.parent==stage)
				{
				stage.removeChild(bullet);
				}
			}
		}
	
	
	if(bullet)
		{
			if(bullet.hitTestObject(terrain2))
			{
				bulletFire=true;
				if(bullet.parent==stage)
				{
				stage.removeChild(bullet);
				}
			}
		}
	
	if(bullet)
		{
			if(bullet.hitTestObject(terrain3))
			{
				bulletFire=true;
				if(bullet.parent==stage)
				{
				stage.removeChild(bullet);
				}
			}
		}
	}
		
		private function onBulletShoot(event:Event)
		{
			if(spaceDown && bulletFire==true)
			{
				bullet=new Bullet();
				stage.addChild(bullet)
				bulletFire=false;
			}
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
			
			else if(event.keyCode==Keyboard.UP)
			{
				upDown=false;
				vrotation=0;
			}
			
			else if(event.keyCode==Keyboard.DOWN)
			{
				downDown=false;
				vrotation=0;
			}
			else if(event.keyCode==Keyboard.SPACE)
			{
				spaceDown=false;
			}
		}
		
		

		
	}
	
}
