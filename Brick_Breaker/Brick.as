package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Brick extends MovieClip{
		
		private var _root:MovieClip
		

		public function Brick() {
			// constructor code
			addEventListener(Event.ADDED, onBeginClass);
			addEventListener(Event.ENTER_FRAME, onEnterFrameEvents);
		}
		
		private function onBeginClass(event:Event):void
		{
			_root=MovieClip(root);
			_root.brickAmt++;
		}
		
		private function onEnterFrameEvents(event:Event):void
		{
			if(this.hitTestObject(_root.mcBall))
			{
				_root.ballYspeed *=-1
				this.parent.removeChild(this);
					removeEventListener(Event.ENTER_FRAME, onEnterFrameEvents);
				_root.brickAmt--;
			}

		}

	}
	
}
