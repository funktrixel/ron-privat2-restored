package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		if (char == 'bambi-new')
			loadGraphic(Paths.image('iconGrid1'), true, 150, 150);
		else if (usesIconGrid3(char))
			loadGraphic(Paths.image('iconGrid3'), true, 150, 150);
		else if (usesIconGridOld(char))
			loadGraphic(Paths.image('iconGridold'), true, 150, 150);
		else if (usesIconGrid4(char))
			loadGraphic(Paths.image('iconGrid4'), true, 150, 150);
		else if (usesIconGridcookbob(char))
			loadGraphic(Paths.image('icon-bobcook'), true, 150, 150);
		else if (usesIconGridhellcookron(char))
			loadGraphic(Paths.image('icon-roncookassassinate'), true, 150, 150);
		else if (usesIconGridshaggy(char))
			loadGraphic(Paths.image('icon-shaggy'), true, 150, 150);
		else if (usesIconGridpshaggy(char))
			loadGraphic(Paths.image('icon-pshaggy'), true, 150, 150);
		else if (usesIconGridneil(char))
			loadGraphic(Paths.image('icon-neil'), true, 150, 150);
		else if (usesIconGridtricky(char))
			loadGraphic(Paths.image('icon-tricky'), true, 150, 150);
		else if (usesIconGridcheeky(char))
			loadGraphic(Paths.image('icon-cheeky'), true, 150, 150);
		else if (usesIconGridGapple(char))
			loadGraphic(Paths.image('iconGridGapple'), true, 150, 150);
		else
			loadGraphic(Paths.image('iconGrid2'), true, 150, 150);

		antialiasing = true;

		if (char == 'bambi-new')
		{
			animation.add('bambi-new', [45, 46], 0, false, isPlayer);
		}
		else if (usesIconGridcookbob(char))
		{
			animation.add('cookbob', [0, 1], 0, false, isPlayer);
		}
		else if (usesIconGridhellcookron(char))
		{
			animation.add('hellcookron', [0, 1], 0, false, isPlayer);
		}
		else if (usesIconGridshaggy(char))
		{
			animation.add('shaggy', [0, 1], 0, false, isPlayer);
		}
		else if (usesIconGridpshaggy(char))
		{
			animation.add('pshaggy', [0, 1], 0, false, isPlayer);
		}
		else if (usesIconGridneil(char))
		{
			animation.add('neil', [0, 1], 0, false, isPlayer);
		}
		else if (usesIconGridtricky(char))
		{
			animation.add('tricky', [0, 1], 0, false, isPlayer);
		}
		else if (usesIconGridcheeky(char))
		{
			animation.add('cheeky', [25, 25], 0, false, isPlayer);
		}
		else if (usesIconGridGapple(char))
		{
			animation.add('bandu', [8, 9], 0, false, isPlayer);
		}
		else if (usesIconGrid3(char))
		{
			animation.add('bf', [0, 1], 0, false, isPlayer);
			animation.add('bf-inv', [0, 1], 0, false, isPlayer);
			animation.add('bf-b', [20, 21], 0, false, isPlayer);
			animation.add('bf-run', [30, 31], 0, false, isPlayer);
			animation.add('bfbloodshed-death', [30, 31], 0, false, isPlayer);
			animation.add('bf-d', [40, 41], 0, false, isPlayer);
			animation.add('gf', [10], 0, false, isPlayer);
			animation.add('gf-d', [10], 0, false, isPlayer);
			animation.add('gf-b', [11], 0, false, isPlayer);
			animation.add('gf-in', [59], 0, false, isPlayer);
			animation.add('ron', [2, 3], 0, false, isPlayer);
			animation.add('ron-angry', [4, 5], 0, false, isPlayer);
			animation.add('ron-mad', [6, 7], 0, false, isPlayer);
			animation.add('hellron', [8, 9], 0, false, isPlayer);
			animation.add('hellron-far', [8, 9], 0, false, isPlayer);
			animation.add('hellron-crazy', [8, 9], 0, false, isPlayer);
			animation.add('demonron-new', [62, 63], 0, false, isPlayer);
			animation.add('ronPower', [12, 13], 0, false, isPlayer);
			animation.add('ron-usb', [16, 17], 0, false, isPlayer);
			animation.add('ateloron', [18, 19], 0, false, isPlayer);
			animation.add('factorytankman', [46, 47], 0, false, isPlayer);
			animation.add('ronb', [22, 23], 0, false, isPlayer);
			animation.add('ron-b', [22, 23], 0, false, isPlayer);
			animation.add('ronangry-b', [24, 25], 0, false, isPlayer);
			animation.add('ron-angry-b', [24, 25], 0, false, isPlayer);
			animation.add('ronmad-b', [26, 27], 0, false, isPlayer);
			animation.add('ron-mad-b', [26, 27], 0, false, isPlayer);
			animation.add('hellron-b', [28, 29], 0, false, isPlayer);
			animation.add('hellron-2', [28, 29], 0, false, isPlayer);
			animation.add('ronPower-b', [32, 33], 0, false, isPlayer);
			animation.add('ron-usb-b', [36, 37], 0, false, isPlayer);
			animation.add('tankmantrojan-2', [36, 37], 0, false, isPlayer);
			animation.add('ateloron-b', [38, 39], 0, false, isPlayer);
			animation.add('factorytankman-2', [46, 47], 0, false, isPlayer);
			animation.add('bijuuron-old', [42, 43], 0, false, isPlayer);
			animation.add('hellron-pov', [54, 55], 0, false, isPlayer);
			animation.add('ronslaught-pov', [54, 55], 0, false, isPlayer);
			animation.add('devilron', [44, 45], 0, false, isPlayer);
			animation.add('devilron-old', [44, 45], 0, false, isPlayer);
			animation.add('douyhe', [48, 49], 0, false, isPlayer);
			animation.add('hatedouyhe', [50, 51], 0, false, isPlayer);
			animation.add('douyhe-old', [48, 49], 0, false, isPlayer);
			animation.add('hatedouyhe-old', [50, 51], 0, false, isPlayer);
			animation.add('helldouyhe', [52, 53], 0, false, isPlayer);
			animation.add('dave', [58, 59], 0, false, isPlayer);
			animation.add('bambi', [56, 57], 0, false, isPlayer);
			animation.add('ronDave', [2, 3], 0, false, isPlayer);
			animation.add('hacker', [8, 9], 0, false, isPlayer);
			animation.add('hellron-drippin', [8, 9], 0, false, isPlayer);
			animation.add('oldbf', [60, 61], 0, false, isPlayer);
			animation.add('oldron', [64, 65], 0, false, isPlayer);
			animation.add('ronsip', [64, 65], 0, false, isPlayer);
			animation.add('oldron-mad', [66, 67], 0, false, isPlayer);		
			animation.add('oldhellron', [68, 69], 0, false, isPlayer);		
			animation.add('oldateloron', [68, 69], 0, false, isPlayer);
			animation.add('ronPower-old', [12, 13], 0, false, isPlayer);
			animation.add('oldron-usb', [70, 71], 0, false, isPlayer);		
			animation.add('oldfactorytankman', [72, 73], 0, false, isPlayer);
			animation.add('oldronb', [74, 75], 0, false, isPlayer);
			animation.add('oldronmad-b', [76, 77], 0, false, isPlayer);
			animation.add('oldhellron-b', [78, 79], 0, false, isPlayer);
			animation.add('oldateloron-b', [78, 79], 0, false, isPlayer);	
			animation.add('oldron-usb-b', [80, 81], 0, false, isPlayer);
			animation.add('oldfactorytankman-b', [82, 83], 0, false, isPlayer);
			animation.add('oldtankmantrojan-2', [80, 81], 0, false, isPlayer);
			animation.add('oldfactorytankman-2', [82, 83], 0, false, isPlayer);
			animation.add('oldhellron-2', [78, 79], 0, false, isPlayer);
			animation.add('hellron-2-old', [78, 79], 0, false, isPlayer);
			animation.add('chezburgir', [2, 3], 0, false, isPlayer);
		}
		else if (usesIconGridOld(char))
		{
			animation.add('demonron', [42, 43], 0, false, isPlayer);
			animation.add('tankman', [56, 57], 0, false, isPlayer);
			animation.add('factorytankman-old', [17, 18], 0, false, isPlayer);
			animation.add('factorytankman-b', [37, 38], 0, false, isPlayer);
			animation.add('ron-usb-old', [12, 13], 0, false, isPlayer);
			animation.add('ron-usb-b-old', [32, 33], 0, false, isPlayer);
			animation.add('oldgf', [10, 10], 0, false, isPlayer);
			animation.add('oldgf-b', [11, 11], 0, false, isPlayer);
		}
		else if (usesIconGrid4(char))
		{
			animation.add('whitty', [56, 57], 0, false, isPlayer);
			animation.add('blue', [56, 57], 0, false, isPlayer);
			animation.add('blueSad', [56, 57], 0, false, isPlayer);
			animation.add('bf_Gray', [60, 61], 0, false, isPlayer);
			animation.add('bf-g', [0, 1], 0, false, isPlayer);
			animation.add('armand', [87, 88], 0 , false, isPlayer);
			animation.add('himdrip', [87, 88], 0 , false, isPlayer);
			animation.add('gron', [42, 43], 0, false, isPlayer);
			animation.add('bijuuron', [64, 65], 0, false, isPlayer);
			animation.add('napkin', [87, 88], 0 , false, isPlayer);
			animation.add('cookron', [74, 75], 0, false, isPlayer);
			animation.add('bfshuttle-man-playable', [66, 67], 0, false, isPlayer);
			animation.add('weedron', [68, 69], 0, false, isPlayer);
			animation.add('shuttleron', [70, 71], 0, false, isPlayer);
			animation.add('rondvd', [72, 73], 0, false, isPlayer);
			animation.add('admin', [94, 94], 0, false, isPlayer);
			animation.add('ronusb-transform', [14, 15], 0, false, isPlayer);
			animation.add('ronusb-transform-b', [34, 35], 0, false, isPlayer);
			animation.add('meri', [85, 86], 0, false, isPlayer);
		}
		else
		{
			animation.add('hellron-crazy-old', [45, 45], 0, false, isPlayer);
			animation.add('demonron-old', [45, 46], 0, false, isPlayer);
		}

		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();

	}
	override function update(elapsed:Float)
	{
		super.update(elapsed);
			if (sprTracker != null)
				setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
	private function usesIconGrid3(char:String):Bool
	{
		return [
			'bf','bf-inv','bf-b','bf-run','bf-d','bfbloodshed-death',
			'gf','gf-d','gf-b','gf-in',
			'ron','ron-angry','ron-mad','hellron','hellron-far','hellron-crazy','hacker','hellron-drippin',
			'ronPower','ron-usb','ateloron','factorytankman',
			'ronb','ron-b','ronangry-b','ron-angry-b','ronmad-b','ron-mad-b','hellron-b','hellron-2',
			'ronPower-b','ron-usb-b','tankmantrojan-2','ateloron-b','factorytankman-2',
			'bijuuron-old','hellron-pov','ronslaught-pov','demonron-new','devilron','devilron-old','douyhe','hatedouyhe','hatedouyhe-old','douyhe-old','helldouyhe','dave','bambi','ronDave','chezburgir','Gray_BF',
			'oldbf','oldron','ronsip','oldron-mad','oldhellron','oldateloron','oldron-usb','ronPower-old',
			'oldfactorytankman','oldronb','oldronmad-b','oldhellron-b','oldateloron-b','hellron-2-old',
			'oldron-usb-b','oldfactorytankman-b','oldtankmantrojan-2','oldfactorytankman-2','oldhellron-2'
		].indexOf(char) != -1;
	}
	private function usesIconGridOld(char:String):Bool
	{
		return [
			'demonron','tankman','factorytankman-b','factorytankman-old','ron-usb-old','ron-usb-b-old','oldgf','oldgf-b'
		].indexOf(char) != -1;
	}
	private function usesIconGrid4(char:String):Bool
	{
		return [
			'blue','whitty','ronusb-transform','ronusb-transform-b','blueSad','meri','bf_Gray','bf-g','armand','himdrip','gron','bijuuron','napkin','cookron','bfshuttle-man-playable','weedron','shuttleron','rondvd','admin',
		].indexOf(char) != -1;
	}
	private function usesIconGridcookbob(char:String):Bool
	{
		return [
			'cookbob'
		].indexOf(char) != -1;
	}
	private function usesIconGridhellcookron(char:String):Bool
	{
		return [
			'hellcookron'
		].indexOf(char) != -1;
	}
	private function usesIconGridshaggy(char:String):Bool
	{
		return [
			'shaggy'
		].indexOf(char) != -1;
	}
	private function usesIconGridpshaggy(char:String):Bool
	{
		return [
			'pshaggy'
		].indexOf(char) != -1;
	}
	private function usesIconGridtricky(char:String):Bool
	{
		return [
			'tricky'
		].indexOf(char) != -1;
	}
	private function usesIconGridcheeky(char:String):Bool
	{
		return [
			'cheeky'
		].indexOf(char) != -1;
	}
	private function usesIconGridGapple(char:String):Bool
	{
		return [
			'bandu'
		].indexOf(char) != -1;
	}
	private function usesIconGridneil(char:String):Bool
	{
		return [
			'neil'
		].indexOf(char) != -1;
	}
}