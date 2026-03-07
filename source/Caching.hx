package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxState;
import flixel.FlxState;

class Caching extends MusicBeatState
{
	var toBeDone:Int = 179;
	var done:Int = 0;

	var cacheTimer:Float = 0;
	var cacheSpeed:Float = 0.01;

	var text:FlxText;
	var text2:FlxText;
	var kadeLogo:FlxSprite;
	var loadingBar:FlxBar;

	var transitioning:Bool = false;

	var returnState:Class<FlxState>;

	public function new()
	{
		super();
	}
	override function create()
	{
		persistentUpdate = true;
		FlxG.mouse.visible = false;

		text = new FlxText(FlxG.width / 2, FlxG.height / 4,0,"loading...");
		text.setFormat(Paths.font("w95.otf"), 34, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
		text.alignment = CENTER;
		text.screenCenter(XY);

		text2 = new FlxText(FlxG.width / 2, FlxG.height - FlxG.height / 4,0,"Loading...");
		text2.setFormat(Paths.font("w95.otf"), 34, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
		text2.alignment = CENTER;
		text2.screenCenter(XY);

		loadingBar = new FlxBar(text.x, text.y - 200, LEFT_TO_RIGHT, 400, 30, this, 'done', 0, toBeDone, true);
		loadingBar.screenCenter(X);
		loadingBar.createFilledBar(FlxColor.BLACK, 0xFFFFFFFF);

		var bgBar = new FlxSprite().makeGraphic(408, 38, FlxColor.BLACK);
		bgBar.x = loadingBar.x - 4;
		bgBar.y = loadingBar.y - 4;
		var bgLoading = Paths.image('loading');
		if (FlxG.random.bool(10))
			bgLoading = Paths.image('loadingold');
		// THIS LOOKS TERRIBLE
		if (FlxG.random.bool(1))
			bgLoading = Paths.image('loadingolder');
		kadeLogo = new FlxSprite(FlxG.width / 2, FlxG.height / 2).loadGraphic(bgLoading);
		// kadeLogo = new FlxSprite(FlxG.width / 2, FlxG.height / 2).loadGraphic(Paths.image('loading'));
		kadeLogo.screenCenter();
		kadeLogo.setGraphicSize(Std.int(kadeLogo.width * 0.5));
		kadeLogo.alpha = 0;

		text.y -= kadeLogo.height / 2 - 65;
		text.x -= 170;
		text2.x -= 85;
		text2.y += 300;

		var gfDance = new FlxSprite();
		gfDance.frames = Paths.getSparrowAtlas('loadingRun');
		gfDance.animation.addByPrefix('idle', "run", 12, true);
		gfDance.antialiasing = true;
		gfDance.screenCenter(XY);
		gfDance.scale.set(0.3, 0.3);
		gfDance.y -= 265;
		gfDance.animation.play('idle');

		add(kadeLogo);
		add(bgBar);
		add(loadingBar);
		add(text);
		add(text2);
		add(gfDance);

		super.create();
	}
	override function update(elapsed:Float)
	{
		super.update(elapsed);

		cacheTimer += elapsed;

		if (cacheTimer >= cacheSpeed && done < toBeDone)
		{
			cacheTimer = 0;
			done++;

			text2.text = "Loading.. (" + done + "/" + toBeDone + ")";
			kadeLogo.alpha = done / toBeDone;

			text.text = done + "/" + toBeDone;
			text.screenCenter(XY);
			text.y = FlxG.height / 8 + 52;
		}

		if (done >= toBeDone && !transitioning)
		{
			transitioning = true;
			finishLoading();
		}
	}
	function finishLoading()
	{
		text.text = toBeDone + "/" + toBeDone;
		text2.text = "DONE! (in a cool way)";
		FlxG.sound.play(Paths.sound('cool'));

		FlxTween.tween(kadeLogo, {alpha: 0}, 1.5, {ease: FlxEase.quadInOut});
		FlxTween.tween(FlxG.camera, {zoom: 3, angle: 20}, 2.5, {
		ease: FlxEase.quadInOut,
		onComplete: function(_) {
		FlxG.switchState(new TitleState());
		}});
	}
}