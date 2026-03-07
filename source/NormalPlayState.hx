package;

import flixel.input.gamepad.FlxGamepad;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import lime.utils.Assets;


#if windows
import Discord.DiscordClient;
#end

using StringTools;

class NormalPlayState extends MusicBeatState
{
	var mainSongs:Array<FreeplayState.SongMetadata> = [];
	var coolSongs:Array<FreeplayState.SongMetadata> = [];
	var bsideSongs:Array<FreeplayState.SongMetadata> = [];
	var songs:Array<FreeplayState.SongMetadata> = [];

	var selector:FlxText;
	var curSelected:Int = 0;
	var curDifficulty:Int = 1;
	var bg:FlxSprite;
	var intendedColor:Int;
	var colorTween:FlxTween;

	var scoreText:FlxText;
	var comboText:FlxText;
	var diffText:FlxText;
	var fdiffText:FlxText;
	var lerpScore:Int = 0;
	var intendedScore:Int = 0;
	var combo:String = '';

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;

	private var iconArray:Array<HealthIcon> = [];

	var isB:Bool = false;

	function reloadSongList(newList:Array<FreeplayState.SongMetadata>)
	{
		var oldSelected = curSelected;
		for (i in 0...iconArray.length)
			remove(iconArray[i]);
		iconArray = [];

		grpSongs.clear();

		songs = newList.copy();

		for (i in 0...songs.length)
		{
			var songText = new Alphabet(0, (70 * i) + 30, songs[i].songName, true, false, true);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpSongs.add(songText);

			var icon = new HealthIcon(songs[i].songCharacter);
			icon.sprTracker = songText;
			iconArray.push(icon);
			add(icon);
		}

		curSelected = oldSelected;
		if (curSelected >= songs.length)
			curSelected = songs.length - 1;
		changeSelection(0, true);
	}
	override function create()
	{
		var initSonglist = CoolUtil.coolTextFile(Paths.txt('z_lists/fpMainlist'));
		for (i in 0...initSonglist.length)
		{
			var data = initSonglist[i].split(':');
			mainSongs.push(new FreeplayState.SongMetadata(data[0], Std.parseInt(data[2]), data[1]));
		}

		var initCoolList = CoolUtil.coolTextFile(Paths.txt('z_lists/fpCoollist'));
		for (i in 0...initCoolList.length)
		{
			var data = initCoolList[i].split(':');
			coolSongs.push(new FreeplayState.SongMetadata(data[0], Std.parseInt(data[2]), data[1]));
		}

		var initBsideList = CoolUtil.coolTextFile(Paths.txt('z_lists/fpBsidelist'));
		for (i in 0...initBsideList.length)
		{
			var data = initBsideList[i].split(':');
			bsideSongs.push(new FreeplayState.SongMetadata(data[0], Std.parseInt(data[2]), data[1]));
		}

		songs = mainSongs.copy();
		if (FlxG.sound.music != null)
		{
			if (!FlxG.sound.music.playing)
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		#if windows
		DiscordClient.currentIcon = "normal";
		DiscordClient.changePresence("In the Freeplay Menu (Main)", null);
		#end

		var isDebug:Bool = false;

		#if debug
		isDebug = true;
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.scale.set(0.7, 0.7);
		bg.screenCenter(XY);
		bg.color = 0xFFE51F89;
		add(bg);

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].songName, true, false, true);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpSongs.add(songText);

			var icon:HealthIcon = new HealthIcon(songs[i].songCharacter);
			icon.sprTracker = songText;

			iconArray.push(icon);
			add(icon);
		}

		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		// scoreText.autoSize = false;
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);
		// scoreText.alignment = RIGHT;

		var scoreBG:FlxSprite = new FlxSprite(scoreText.x - 6, 0).makeGraphic(Std.int(FlxG.width * 0.35), 66, 0xFF000000);
		scoreBG.alpha = 0.6;
		add(scoreBG);

		diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
		diffText.font = scoreText.font;
		add(diffText);

		fdiffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "UNFAIR", 24);
		fdiffText.font = scoreText.font;
		fdiffText.visible = false;
		fdiffText.color = 0xFFFF0000;
		add(fdiffText);

		comboText = new FlxText(diffText.x + 100, diffText.y, 0, "", 24);
		comboText.font = diffText.font;
		add(comboText);

		add(scoreText);

		intendedColor = bg.color;
		changeSelection();
		changeDiff();

		// FlxG.sound.playMusic(Paths.music('title'), 0);
		// FlxG.sound.music.fadeIn(2, 0, 0.8);
		selector = new FlxText();

		selector.size = 40;
		selector.text = ">";
		// add(selector);

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		diffText.text = CoolUtil.difficultyFromInt(curDifficulty).toUpperCase();

		super.create();
	}

	public function addSong(songName:String, weekNum:Int, songCharacter:String)
	{
		songs.push(new FreeplayState.SongMetadata(songName, weekNum, songCharacter));
	}

	public function addWeek(songs:Array<String>, weekNum:Int, ?songCharacters:Array<String>)
	{
		if (songCharacters == null)
			songCharacters = ['dad'];

		var num:Int = 0;
		for (song in songs)
		{
			addSong(song, weekNum, songCharacters[num]);

			if (songCharacters.length != 1)
			num++;
		}
	}
	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.4));
		FlxG.watch.addQuick("beatShit", curStep);
		Conductor.songPosition = FlxG.sound.music.time;

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;

		scoreText.text = "PERSONAL BEST:" + lerpScore;
		comboText.text = combo + '\n';

		var upP = FlxG.keys.justPressed.UP;
		var downP = FlxG.keys.justPressed.DOWN;
		var accepted = controls.ACCEPT;

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.DPAD_UP)
			{
				changeSelection(-1);
			}
			if (gamepad.justPressed.DPAD_DOWN)
			{
				changeSelection(1);
			}
			if (gamepad.justPressed.DPAD_LEFT)
			{
				changeDiff(-1);
			}
			if (gamepad.justPressed.DPAD_RIGHT)
			{
				changeDiff(1);
			}
		}

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (FlxG.keys.justPressed.LEFT)
			changeDiff(-1);
		if (FlxG.keys.justPressed.RIGHT)
			changeDiff(1);

		if (controls.BACK)
		{
			FlxG.switchState(new MasterPlayState());
		}
        
		if (songs[curSelected].songName == 'bleeding')
		{
			fdiffText.visible = true;
			diffText.visible = false;
		}
		else
		if (isB)
		{
			fdiffText.visible = false;
			diffText.visible = true;
		}
		else
		{
			fdiffText.visible = false;
			diffText.visible = true;
		}

		if (accepted)
		{
			FlxG.camera.antialiasing = true;
			var songFormat = StringTools.replace(songs[curSelected].songName, " ", "-");
			switch (songFormat) {
				case 'Dad-Battle': songFormat = 'Dadbattle';
				case 'Philly-Nice': songFormat = 'Philly';
			}
            
			trace(songs[curSelected].songName);

			var poop:String = Highscore.formatSong(songFormat, curDifficulty);

			trace(poop);
            
			if (songs[curSelected].songName == 'BLOODSHED-TWO')
				PlayState.storyDifficulty = 2;
			else
				PlayState.storyDifficulty = curDifficulty;
			if ((songs[curSelected].songName == 'Bloodshed') && (curDifficulty == 3))
			{}
			else if (isB)
				PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName);
			else
				PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName);

			PlayState.isStoryMode = false;
			PlayState.storyWeek = songs[curSelected].week;
			trace('CUR WEEK' + PlayState.storyWeek);
			LoadingState.loadAndSwitchState(new PlayState());
		}
	}
	function changeDiff(change:Int = 0)
	{
		var prev = curDifficulty;
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = 4;
		else if (curDifficulty > 4)
			curDifficulty = 0;

		if (curDifficulty == 3 && prev == 4)
		{
			modeSwapA();
			changeSelection(0, true);
		}

		if (curDifficulty == 0 && prev == 4)
		{
			modeSwapA();
			changeSelection(0, true);
		}

		if (curDifficulty == 4 && prev == 0)
		{
			modeSwap();
			changeSelection(0, true);
		}

		if (curDifficulty == 4 && prev == 3)
		{
			modeSwap();
			changeSelection(0, true);
		}

		if (curDifficulty == 3)
		{
			isB = false;

			reloadSongList(coolSongs);
		}
		else
		{
			if (isB)
				reloadSongList(bsideSongs);
			else
				reloadSongList(mainSongs);
		}
		if (songs[curSelected].songName == 'bleeding')
		{
			FlxTween.cancelTweensOf(FlxG.camera);
			FlxTween.tween(FlxG.camera, {zoom: 1.1}, 0.5, {ease: FlxEase.quadInOut});
		}
		else
		{
			FlxTween.cancelTweensOf(FlxG.camera);
			FlxTween.tween(FlxG.camera, {zoom: 1}, 1, {ease: FlxEase.quadInOut});
		}
		FlxG.camera.antialiasing = true;
		var songHighscore = StringTools.replace(songs[curSelected].songName, " ", "-");
		switch (songHighscore) {
			case 'Dad-Battle': songHighscore = 'Dadbattle';
			case 'Philly-Nice': songHighscore = 'Philly';
		}

		if (songHighscore == 'BLOODSHED-TWO')
			curDifficulty = 2;

		#if !switch
		intendedScore = Highscore.getScore(songHighscore, curDifficulty);
		combo = Highscore.getCombo(songHighscore, curDifficulty);
		#end

		diffText.text = CoolUtil.difficultyFromInt(curDifficulty).toUpperCase();
		if (songs[curSelected].songName.contains("-b"))
			diffText.text = CoolUtil.difficultyBFromInt(curDifficulty).toUpperCase();
	}
    
	override function beatHit()
	{
		switch (curSelected)
		{
			case 0:
				FlxG.camera.shake(0.0025, 0.05);
				if (curBeat % 2 == 1)
					FlxG.camera.angle = 1;
				else
					FlxG.camera.angle = -1;

				FlxG.camera.y += 2;
				FlxTween.tween(FlxG.camera, {y: 0}, 0.2, {ease: FlxEase.quadOut});
				FlxTween.tween(FlxG.camera, {angle: 0}, 0.2, {ease: FlxEase.quadInOut});
			case 1:
				FlxG.camera.shake(0.0025, 0.05);
				if (curBeat == 1)
				{
					var bruh:FlxSprite = new FlxSprite();
					bruh.loadGraphic(Paths.image('longbob'));
					bruh.antialiasing = true;
					bruh.active = false;
					bruh.scrollFactor.set();
					bruh.screenCenter();
					add(bruh);
					FlxTween.tween(bruh, {alpha: 0},1, {
						ease: FlxEase.cubeInOut,
						onComplete: function(twn:FlxTween) 
						{
							bruh.destroy();
						}
					});
				}
			case 2:
				FlxG.camera.y += 5;
				FlxTween.tween(FlxG.camera, {y: 0}, 0.2, {ease: FlxEase.quadOut});
			case 3:
				if (curBeat % 2 == 1)
					FlxG.camera.angle = 2;
				else
					FlxG.camera.angle = -2;
				FlxTween.tween(FlxG.camera, {angle: 0}, 0.2, {ease: FlxEase.quadInOut});
			case 4:
				if (songs[curSelected].songName == 'bleeding')
				{
					fdiffText.visible = true;
					diffText.visible = false;
					FlxG.camera.shake(0.0025, 0.05);
					FlxTween.cancelTweensOf(FlxG.camera);
					FlxTween.tween(FlxG.camera, {zoom: 1.1}, 0.5, {ease: FlxEase.quadInOut});
				}
				else
				{
					FlxG.camera.shake(0.0025, 0.05);
					if (curBeat % 2 == 1)
					{
						FlxG.camera.zoom = 1.01;
					}
					FlxG.camera.zoom = 0.99;
					FlxTween.tween(FlxG.camera, {zoom: 1}, 0.2, {ease: FlxEase.quadInOut});
				}
			case 5:
				if (curBeat % 5 == 1)
					FlxG.camera.x += 5;
				else if (curBeat % 5 == 3)
					FlxG.camera.x -= 5;
				else if (curBeat % 5 == 2)
					FlxG.camera.y += 5;
				else if (curBeat % 5 == 4)
					FlxG.camera.y -= 5;
                   
				FlxTween.tween(FlxG.camera, {x: 0}, 0.2, {ease: FlxEase.quadInOut});
				FlxTween.tween(FlxG.camera, {y: 0}, 0.2, {ease: FlxEase.quadInOut});
			case 6:
				if (!isB)
				{
					if (curBeat % 2 == 1)
						FlxG.camera.zoom = 1.01;
					else
						FlxG.camera.zoom = 0.99;
                   
					FlxTween.tween(FlxG.camera, {zoom: 1}, 0.2, {ease: FlxEase.quadInOut});
				}
				else
				{
					FlxG.camera.shake(0.0025, 0.05);
					if (curBeat % 2 == 1)
					{
						FlxG.camera.y += 5;
						FlxG.camera.angle = 2;
					}
					else
					{
						FlxG.camera.y -= 5;
						FlxG.camera.angle = -2;
					}
                   
					FlxTween.tween(FlxG.camera, {y: 0}, 0.2, {ease: FlxEase.quadOut});
					FlxTween.tween(FlxG.camera, {angle: 0}, 0.2, {ease: FlxEase.quadInOut});
				}
			case 7:
				if (!isB)
				{
					FlxG.camera.shake(0.0025, 0.05);
					if (curBeat % 2 == 1)
					{
						FlxG.camera.y += 5;
						FlxG.camera.angle = 2;
					}
					else
					{
						FlxG.camera.y -= 5;
						FlxG.camera.angle = -2;
					}
                   
					FlxTween.tween(FlxG.camera, {y: 0}, 0.2, {ease: FlxEase.quadOut});
					FlxTween.tween(FlxG.camera, {angle: 0}, 0.2, {ease: FlxEase.quadInOut});
				}
				else
				{
					FlxG.camera.shake(0.0015, 0.4);
					if (curBeat % 2 == 1)
						FlxG.camera.antialiasing = false;
					else
						FlxG.camera.antialiasing = true;
				}
			case 8:
				FlxG.camera.shake(0.0015, 0.4);
				if (curBeat % 2 == 1)
					FlxG.camera.antialiasing = false;
				else
					FlxG.camera.antialiasing = true;
		}
	}
	function changeSelection(change:Int = 0, silent:Bool = false)
	{
		#if !switch
		// NGio.logEvent('Fresh');
		#end

		// NGio.logEvent('Fresh');
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		if (!silent)
		{
	        	curSelected += change;
		}
       		if (curSelected < 0)
			curSelected = songs.length - 1;
		if (curSelected >= songs.length)
			curSelected = 0;

		if (songs[curSelected].songName.contains("-b"))
		{
			if (curDifficulty < 0)
			{
				modeSwap();
				curDifficulty = 4;
			}
			if (curDifficulty > 4)
			{
				modeSwapA();
				curDifficulty = 0;
			}
		}
		else
		{
			if (curDifficulty < 0)
			{
				modeSwap();
				curDifficulty = 4;
			}
			if (curDifficulty > 4)
			{
				modeSwapA();
				curDifficulty = 0;
			}
		}
		var songHighscore = StringTools.replace(songs[curSelected].songName, " ", "-");
		switch (songHighscore) {
			case 'Dad-Battle': songHighscore = 'Dadbattle';
			case 'Philly-Nice': songHighscore = 'Philly';
		}
		#if !switch
		intendedScore = Highscore.getScore(songHighscore, curDifficulty);
		combo = Highscore.getCombo(songHighscore, curDifficulty);
		#end

		#if PRELOAD_ALL
		if (isB)
			FlxG.sound.playMusic(Paths.inst(songs[curSelected].songName), 0);
		else
			FlxG.sound.playMusic(Paths.inst(songs[curSelected].songName), 0);
		#end
       
		if (!isB)
			Conductor.changeBPM(Song.loadFromJson(songs[curSelected].songName.toLowerCase(), songs[curSelected].songName.toLowerCase()).bpm/2);
		else
			Conductor.changeBPM(Song.loadFromJson(songs[curSelected].songName.toLowerCase(), songs[curSelected].songName.toLowerCase()).bpm/2);
		var bullShit:Int = 0;
		for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0.6;
		}
		iconArray[curSelected].alpha = 1;
		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;
			item.alpha = 0.6;
			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
      
		diffText.text = CoolUtil.difficultyFromInt(curDifficulty).toUpperCase();

		var clr = 0xFFE51F89;

		if (!isB)
		{
			switch (curSelected)
			{
				case 1:
					clr = FlxColor.YELLOW;
				case 2:
					clr = FlxColor.ORANGE;
				case 3:
					clr = FlxColor.BROWN;
				case 4:
					clr = FlxColor.BLACK;
				case 5:
					clr = FlxColor.GREEN;
				case 6:
					clr = 0xFF202020;
				case 7:
					clr = FlxColor.MAGENTA;
				case 8:
					clr = FlxColor.GRAY;
			}
		} else
		{
			switch (curSelected)
			{
				case 1:
					clr = FlxColor.MAGENTA;
				case 2:
					clr = FlxColor.PURPLE;
				case 3:
					clr = 0xFF8200AA;
				case 4:
					clr = FlxColor.WHITE;
				case 5:
					clr = 0xFF966E6E;
				case 6:
					clr = 0xFFDCDCDC;
				case 7:
					clr = FlxColor.CYAN;                
			}
		}
       
       
		if(clr != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = clr;
			colorTween = FlxTween.color(bg, 0.5, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}
	}
	function modeSwap()
	{
		FlxG.camera.flash(FlxColor.WHITE, 0.5);
		isB = true;
		reloadSongList(bsideSongs);
		switch (curSelected)
		{
			case 1: bg.color = FlxColor.MAGENTA;
			case 2: bg.color = FlxColor.PURPLE;
			case 3: bg.color = 0xFF8200AA;
			case 4: bg.color = FlxColor.WHITE;
			case 5: bg.color = 0xFF966E6E;
			case 6: bg.color = 0xFFDCDCDC;
			case 7: bg.color = FlxColor.CYAN;
		}

		FlxG.sound.playMusic(Paths.inst(songs[curSelected].songName), 0);
		Conductor.changeBPM(Song.loadFromJson(songs[curSelected].songName.toLowerCase(), songs[curSelected].songName.toLowerCase()).bpm/2);
	}


	function modeSwapA()
	{
		FlxG.camera.flash(FlxColor.WHITE, 0.5);
		isB = false;

		reloadSongList(mainSongs);

		switch (curSelected)
		{
			case 1: bg.color = FlxColor.YELLOW;
			case 2: bg.color = FlxColor.ORANGE;
			case 3: bg.color = FlxColor.BROWN;
			case 4: bg.color = FlxColor.BLACK;
			case 5: bg.color = FlxColor.GREEN;
			case 6: bg.color = 0xFF202020;
			case 7: bg.color = FlxColor.MAGENTA;
			case 8: bg.color = FlxColor.GRAY;
		}

		FlxG.sound.playMusic(Paths.inst(songs[curSelected].songName), 0);
		Conductor.changeBPM(Song.loadFromJson(songs[curSelected].songName.toLowerCase(), songs[curSelected].songName.toLowerCase()).bpm/2);
	}
}