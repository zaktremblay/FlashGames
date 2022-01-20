package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Bullet extends MovieClip {
		private var  main:MovieClip;
		private var barrel:Barrel;
		private var vx:Number;
		private var vy:Number;
		private var gravity:Number=.2;
		private var speed: Number=10;
		private var barLenght:Number;

		
		
		public function Bullet() {
			// constructor code
			init();
		}
		private function init():void
		{
			main=Main.instance;
			barrel=main.barrel;
			barLenght=main.barrelLenght;
			var angle:Number=(barrel.rotation)*Math.PI/180;
			this.x=barrel.x+Math.cos(angle)*barLenght;
			this.y=barrel.y+Math.sin(angle)*barLenght;
			vx=Math.cos(angle)*speed;
			vy=Math.sin(angle)*speed;
			
			
			
			addEventListener(Event.ENTER_FRAME, onBulletPath)
		}
		private function onBulletPath(event:Event)
		{
		vy+=gravity;
			this.x+=vx;
			this.y+=vy;
			
		}
	}
	
}
