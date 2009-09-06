package  
{
	import aze.motion.Eaze;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * NOT overwriting properties test
	 * @author Philippe / Proximity BBDO
	 */
	public class TestOverwrite extends Sprite
	{
		private var sp:Sprite;
		
		public function TestOverwrite() 
		{
			for (var i:int = 0; i < stage.stageWidth / 100; i++) 
			{
				for (var j:int = 0; j < stage.stageHeight / 100; j++) 
				{
					createItem(i * 100, j * 100);
				}
			}
		}
		
		private function createItem(sx:int, sy:int):void
		{
			var sp:Sprite = new Sprite();
			sp.x = sx + 10;
			sp.y = sy + 10;
			sp.graphics.beginFill(Math.random() * 0xffffff);
			sp.graphics.drawRect(0, 0, 80, 80);
			addChild(sp);
			
			sp.addEventListener(MouseEvent.ROLL_OVER, over);
			sp.addEventListener(MouseEvent.ROLL_OUT, out);
		}
		
		private function out(e:MouseEvent):void 
		{
			Eaze.to(e.target, 1, { alpha:1 }, "keep");
		}
		
		private function over(e:MouseEvent):void 
		{
			Eaze.to(e.target, 1, { alpha:0 }, "keep");
		}
		
	}

}