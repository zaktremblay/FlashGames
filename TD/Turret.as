package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Turret extends MovieClip {
		public var angle: Number;
		private var radiansToDegrees:Number = 180/Math.PI;
		private var damage:int=1;
		private var range:int=100;
		private var enTarget;
		private var cTime:int=0;
		private var reloadTime:int=12;
		private var loaded:Boolean=true;
		private var myInstance
		
		public function Turret() {
			// constructor code
			init();
		}
		private function init():void
		{
			myInstance=Main.instance;
			this.addEventListener(Event.ENTER_FRAME, onBulletShoot);
		}

		
		private function onBulletShoot(event:Event):void
		{
			var distance:Number=range;
			enTarget=null;
			for(var i:int=myInstance.enemyHolder.numChildren-1; i>=0; i--)
			{
				var cEnemy = myInstance.enemyHolder.getChildAt(i);
				if(Math.sqrt(Math.pow(cEnemy.y-y, 2)+Math.pow(cEnemy.x-x, 2))<distance)
				{
					enTarget=cEnemy;
				}
			}
			
			if(enTarget !=null)
			{
				this.rotation=Math.atan2((enTarget.y-y), (enTarget.x-x)/Math.PI*180-90)
				if(loaded)
				{
					loaded=false;
					var newBullet:Bullet=new Bullet();
					newBullet.x=this.x;
					newBullet.y=this.y;
					newBullet.target=enTarget;
					newBullet.damage=damage;
					myInstance.addChild(newBullet);
				}
			}

			if(!loaded)
			{
				cTime++;
				if(cTime==reloadTime)
				{
					loaded=true;
					cTime=0
				}
			}
		}
	}
}
