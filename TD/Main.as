package {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.Event;

	public class Main extends Sprite{
		//setting vars to step in for turns and special blocks
		public var S: String = 'START';
		public var F: String = 'FINISH';
		public var U: String = 'UP';
		public var R: String = 'RIGHT';
		public var D: String = 'DOWN';
		public var L: String = 'LEFT';
		public var startDir: String; //the direction the enemies go when they enter
		public var finDir: String; //the direction the enemies go when they exit
		public var startCoord: int; //the coordinates of the beginning of the road
		private var lvlArray: Array = new Array(); //this array will hold the formatting of the roads
		private var roadHolder: Sprite = new Sprite(); //create an object that will hold all parts of the road
		private var currentEnemy:int=0;
		private var enemyTime:int=0;
		private var enemyLimit:int=12;
		private var enemyArray:Array=new Array();
		private var enemiesLeft:int;
		private var currentLvl: int = 1;
		public var gameOver: Boolean = false;
		public var enemyHolder:Sprite=new Sprite();
		
		

		private static var myInstance:Main;
		
		public static function get instance():Main { return myInstance; } 

		public function Main() {
			// constructor code
			init();

		}

		private function init(): void {
	
			myInstance = this;
			lvlArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, R, 1, 1, 1, 1, 1, 1, 1, D, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 1, 0, R, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, D, 0, 0, 0,
				S, U, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
				0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
				0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
				0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
				0, 0, 0, U, 1, 1, 1, 1, 1, L, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, F, 0, 0, 0,
			];

			
			enemyArray= [
			            [1,1,1,1,1,1,1,1],
			            [1,1,1,1,1,1,1,1,1,1,1,1,1],
			            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
						]
			//the names of these variables explain what they do


			
			addChild(roadHolder); //add it to the stage

			makeRoad();
			startGame();
			addChild(enemyHolder);
			
			
			addEventListener(Event.ENTER_FRAME, onMakeEnemies);
		}
		private function onMakeEnemies(event:Event):void
		{
			makeEnemies();
		}
		
		private function makeEnemies():void
		{
			if(enemyTime<enemyLimit)
			{
				enemyTime++
			}
			else
			{
				var theCode:int=enemyArray[currentLvl-1][currentEnemy];
				if(theCode==1)
				{
					var newEnemy:Enemy=new Enemy;
					enemyHolder.addChild(newEnemy);
		
				}
				currentEnemy++;
				enemyTime=0;
			}
		}

		private function startGame(): void
		{
			for(var i:int=0;i<enemyArray[currentLvl-1].length;i++)
		    {
				if(enemyArray[currentLvl-1][i]==1)
			    {
				enemiesLeft ++;
			    }
		    }
	    }  

		private function makeRoad(): void {
			var row: int = 0; //the current row we're working on
			var block; //this will act as the block that we're placing down
			for (var i: int = 0; i < lvlArray.length; i++) { //creating a loop that'll go through the level array
				if (lvlArray[i] == 0) { //if the current index is set to 0
					block = new EmptyBlock(); //create a gray empty block
					block.graphics.beginFill(0x99cc00);
					block.graphics.drawRect(0, 0, 25, 25);
					block.graphics.endFill();
					addChild(block);
					//and set the coordinates to be relative to the place in the array
					block.x = (i - row * 22) * 25;
					block.y = row * 25;
				} else if (lvlArray[i] == 1) { //if there is supposed to be a row
					//just add a box that will be a darker color and won't have any actions
					block = new Shape();
					block.graphics.beginFill(0x333300);
					block.graphics.drawRect(0, 0, 25, 25);
					block.graphics.endFill();
					block.x = (i - row * 22) * 25;
					block.y = row * 25;
					roadHolder.addChild(block); //add it to the roadHolder
				} else if (lvlArray[i] is String) { //if it's a string, meaning a special block
					//then create a special block
					block = new DirectBlock(lvlArray[i], (i - row * 22) * 25, row * 25);
					addChild(block);
				}
				for (var c: int = 1; c <= 16; c++) {
					if (i == c * 22 - 1) {
						//if 22 columns have gone by, then we move onto the next row
						row++;
					}
				}
			}
		}
		public function makeTurret(xValue:int, yValue:int):void
			{
				var turret:Turret=new Turret()
				turret.x=xValue;
				turret.y=yValue;
				addChild(turret);
				
			}


	}

}