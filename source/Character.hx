package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		// do we really need all this excess character
		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
			case 'oldgf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
			case 'oldgf-b':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
			case 'gf-d':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/dGF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByPrefix('idle', 'GF Dancing Beat', 24);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByPrefix('hairBlow', 'GF Dancing Beat', 24);
				animation.addByPrefix('hairFall', 'GF Dancing Beat', 24);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);

				addOffset('scared', -2, -17);

				playAnim('danceRight');				

			case 'gf-b':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/bGF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByPrefix('idle', 'GF Dancing Beat', 24);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);

				playAnim('danceRight');
			case 'gf-run':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GFR_assets');
				frames = tex;
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByPrefix('idle', 'GF Dancing Beat', 24);

				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);
				playAnim('danceRight');
			case 'gf-whitty':
				tex = Paths.getSparrowAtlas('characters/GF_Standing_Sway');
				frames = tex;
				animation.addByPrefix('sad', 'Sad', 24, false);
				animation.addByPrefix('danceLeft', 'Idle Left', 24, false);
				animation.addByPrefix('danceRight', 'Idle Right', 24, false);
				animation.addByPrefix('scared', 'Scared', 24, false);

				addOffset('sad', -140, -153);
				addOffset('danceLeft', -140, -153);
				addOffset('danceRight', -140, -153);
				addOffset('scared', -140, -153);

				playAnim('danceRight');
			case 'gf-in':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets_In');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;
			case 'oldbf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;
			case 'bf-inv':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');
				visible = false;
				alpha = 0;
				flipX = true;
			case 'bf-d':
				var tex = Paths.getSparrowAtlas('characters/dBOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;
				
			case 'bf-b':
				var tex = Paths.getSparrowAtlas('characters/bBOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

			case 'bf-run':
				var tex = Paths.getSparrowAtlas('updateron/characters/BOYFRIEND_Run', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;
				flipX = true;
			case 'bfbloodshed-death':
				var tex = Paths.getSparrowAtlas('updateron/characters/bfbloodshed-death', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', "BF idle dance", 24, false);
				animation.addByPrefix('singUP', "BF dies", 24, false);
				animation.addByPrefix('singLEFT', "BF dies", 24, false);
				animation.addByPrefix('singRIGHT', "BF dies", 24, false);
				animation.addByPrefix('singDOWN', "BF dies", 24, false);
				animation.addByPrefix('singUPmiss', "BF dies", 24, false);
				animation.addByPrefix('singLEFTmiss', "BF dies", 24, false);
				animation.addByPrefix('singRIGHTmiss', "BF dies", 24, false);
				animation.addByPrefix('singDOWNmiss', "BF dies", 24, false);
				animation.addByPrefix('hey', "BF dies", 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset('firstDeath', 317, 76);
				addOffset('deathLoop', 235, 71);
				addOffset('deathConfirm', 232, 69);
				playAnim('idle');

				flipX = true;
				flipX = true;
			case 'douyhe'|'hatedouyhe':
				tex = Paths.getSparrowAtlas('memes/doyne');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				addOffset('idle');
				addOffset("singUP", 0, 60);
				addOffset("singLEFT", 75, 30);
				addOffset("singRIGHT");
				addOffset("singDOWN", 25, -60);
				playAnim('idle');
				
			case 'douyhe-old'|'hatedouyhe-old':
				tex = Paths.getSparrowAtlas('memes/dayne');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('Ugh', 'BF HEY', 24, false);
				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", 0, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", 40, -30);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				playAnim('idle');
				
				flipX = true;
			case 'helldouyhe':
				tex = Paths.getSparrowAtlas('memes/helldouye');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('Ugh', 'BF HEY', 24, false);
				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", 0, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", 40, -30);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				playAnim('idle');
				
				flipX = true;
			case 'dave':
				frames = Paths.getSparrowAtlas('updateron/cachecharacters/Dave/dave_sheet', 'shared');
				animation.addByPrefix('idle', 'idleDance', 24, false);
				animation.addByPrefix('singUP', 'Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Right', 24, false);
				animation.addByPrefix('singDOWN', 'Down', 24, false);
				animation.addByPrefix('singLEFT', 'Left', 24, false);
	
				addOffset('idle');
				addOffset("singUP", 18, 12);
				addOffset("singRIGHT", 5, -2);
				addOffset("singLEFT", 29, 2);
				addOffset("singDOWN", -5, 2);
				animation.addByPrefix('um', 'um', 24, false);
				animation.addByPrefix('err', 'err', 24, false);
				playAnim('idle');
			case 'bambi':
				frames = Paths.getSparrowAtlas('ron/characters/bambiRemake');
				animation.addByPrefix('idle', 'Idle', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle');
				addOffset("singUP", 54, 3);
				addOffset("singRIGHT", -50, 0);
				addOffset("singLEFT", 20, -7);
				addOffset("singDOWN", -5, -43);

				playAnim('idle');
			case 'bambi-new':
				frames = Paths.getSparrowAtlas('ron/characters/bambiRemake');
				animation.addByPrefix('idle', 'Idle', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle');
				addOffset("singUP", 54, 3);
				addOffset("singRIGHT", -50, 0);
				addOffset("singLEFT", 20, -7);
				addOffset("singDOWN", -5, -43);

				playAnim('idle');
			case 'ron':
				tex = Paths.getSparrowAtlas('ron/characters/Tankman');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'cookron':
				tex = Paths.getSparrowAtlas('updateron/characters/roncook');
				frames = tex;
				animation.addByPrefix('idle', "roncook idle", 12);
				animation.addByPrefix('singUP', 'roncook up', 12, false);
				animation.addByPrefix('singDOWN', 'roncook down', 12, false);
				animation.addByPrefix('singLEFT', 'roncook left', 12, false);
				animation.addByPrefix('singRIGHT', 'roncook right', 12, false);
				addOffset('idle');
				addOffset("singUP", 29, 31);
				addOffset("singLEFT", 40, -20);
				addOffset("singRIGHT", -30, 10);
				addOffset("singDOWN", 30, -160);
				playAnim('idle');
			case 'hellcookron':
				tex = Paths.getSparrowAtlas('updateron/characters/roncookassassinate');
				frames = tex;
				animation.addByPrefix('idle', "roncook idle", 12);
				animation.addByPrefix('singUP', 'roncook up', 12, false);
				animation.addByPrefix('singDOWN', 'roncook down', 12, false);
				animation.addByPrefix('singLEFT', 'roncook left', 12, false);
				animation.addByPrefix('singRIGHT', 'roncook right', 12, false);
				addOffset('idle');
				addOffset("singUP", -6, 1);
				addOffset("singLEFT", 22, 2);
				addOffset("singRIGHT", 67, -33);
				addOffset("singDOWN", 10, -11);
				playAnim('idle');
			case 'ronDave':
				tex = Paths.getSparrowAtlas('ron/characters/Tankman');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'cookbob':
				tex = Paths.getSparrowAtlas('updateron/characters/bobcook');
				frames = tex;
				animation.addByPrefix('idle', "bobcook idle", 24);
				animation.addByPrefix('singUP', 'bobcook up', 24, false);
				animation.addByPrefix('singDOWN', 'bobcook down', 24, false);
				animation.addByPrefix('singLEFT', 'bobcook left', 24, false);
				animation.addByPrefix('singRIGHT', 'bobcook right', 24, false);
				animation.addByPrefix('what', 'bobcook what', 24, false);
				addOffset('idle');
				addOffset("singUP", -150, 10);
				addOffset("singLEFT", 10, -10);
				addOffset("singRIGHT", -149, -131);
				addOffset("singDOWN", -120, -36);
				addOffset("what", -115, 2);
				playAnim('idle');
				
				flipX = true;
			case 'ronPower':
				tex = Paths.getSparrowAtlas('updateron/characters/Trojan_Ron');
				frames = tex;
				animation.addByPrefix('idle', "Trojan Ron Idle", 24);
				animation.addByPrefix('singUP', 'Trojan Ron Up', 24, false);
				animation.addByPrefix('singDOWN', 'Trojan Ron Down', 24, false);
				animation.addByPrefix('singLEFT', 'Trojan Ron Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Trojan Ron Right', 24, false);
				animation.addByPrefix('cheer', 'Trojan Ron Bruh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, -172);
				addOffset("singLEFT", 158, -177);
				addOffset("singRIGHT", -169, -200);
				addOffset("singDOWN", 40, -280);
				addOffset("cheer", 71, -40);
				playAnim('idle');
			case 'ronPower-b':
				tex = Paths.getSparrowAtlas('updateron/characters/ronPower-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("cheer", 71, -40);
				playAnim('idle');
			case 'ronPower-old':
				tex = Paths.getSparrowAtlas('updateron/characters/ronPower');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'demonron-new':
				tex = Paths.getSparrowAtlas('updateron/characters/demonron-new');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'demonron':
				tex = Paths.getSparrowAtlas('updateron/characters/demonron');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'demonron-old':
				tex = Paths.getSparrowAtlas('updateron/characters/demonron-old');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'ron-angry':
				tex = Paths.getSparrowAtlas('updateron/characters/slightlyannoyedron');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'susron':
				tex = Paths.getSparrowAtlas('ron/characters/susron');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'ronb':
				tex = Paths.getSparrowAtlas('updateron/characters/BsidesNEW');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'ron-mad':
				tex = Paths.getSparrowAtlas('ron/characters/madron');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'ronangry-b':
				tex = Paths.getSparrowAtlas('updateron/characters/wastedron-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'devilron':
				// tex = Paths.getSparrowAtlas('updateron/cachecharacters/Hellron-2/hellron-2');
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Devilron/devilron');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'right', 24, false);
				animation.addByPrefix('singRIGHT', 'left', 24, false);
				addOffset('idle', -6, -1);
				addOffset("singUP", 2, 50);
				addOffset("singLEFT",-35, 7);
				addOffset("singRIGHT", 40, -7);
				addOffset("singDOWN", 40, -35);
				playAnim('idle');
			case 'devilron-old':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Hellron-2/hellron-2');
				frames = tex;
				animation.addByPrefix('idle', "idle normal", 24);
				animation.addByPrefix('singUP', 'up normal', 24, false);
				animation.addByPrefix('singDOWN', 'down normal', 24, false);
				animation.addByPrefix('singLEFT', 'right normal', 24, false);
				animation.addByPrefix('singRIGHT', 'left normal', 24, false);
				addOffset('idle');
				addOffset("singUP",70,70);
				addOffset("singLEFT",25,-20);
				addOffset("singRIGHT",30,-7);
				addOffset("singDOWN",-25,-30);
				playAnim('idle');
			case 'hellron':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Hellron/hellron');
				frames = tex;
				animation.addByPrefix('idle', "idle normal", 24);
				animation.addByPrefix('singUP', 'up normal', 24, false);
				animation.addByPrefix('singDOWN', 'down normal', 24, false);
				animation.addByPrefix('singLEFT', 'right normal', 24, false);
				animation.addByPrefix('singRIGHT', 'left normal', 24, false);
				addOffset('idle');
				addOffset("singUP",130,75);
				addOffset("singLEFT",180,0);
				addOffset("singRIGHT",30,-7);
				addOffset("singDOWN",60,-61);
				playAnim('idle');
			case 'hellron-far':
				tex = Paths.getSparrowAtlas('updateron/characters/hellron-far');
				frames = tex;
				animation.addByPrefix('idle', "idle normal", 24);
				animation.addByPrefix('singUP', 'up normal', 24, false);
				animation.addByPrefix('singDOWN', 'down normal', 24, false);
				animation.addByPrefix('singLEFT', 'right normal', 24, false);
				animation.addByPrefix('singRIGHT', 'left normal', 24, false);
				addOffset('idle');
				addOffset("singUP",130,75);
				addOffset("singLEFT",180,0);
				addOffset("singRIGHT",30,-7);
				addOffset("singDOWN",60,-61);
				playAnim('idle');
			case 'hellron-pov':
				tex = Paths.getSparrowAtlas('updateron/characters/hellron-pov');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'right', 24, false);
				animation.addByPrefix('singRIGHT', 'left', 24, false);
				addOffset('idle');
				addOffset("singUP", 120, 72);
				addOffset("singLEFT", -70, -77);
				addOffset("singRIGHT", 214, -50);
				addOffset("singDOWN", 20, -195);
				playAnim('idle');
			case 'ronslaught-pov':
				tex = Paths.getSparrowAtlas('updateron/characters/ronslaught-pov');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'right', 24, false);
				animation.addByPrefix('singRIGHT', 'left', 24, false);
				addOffset('idle');
				addOffset("singUP", 0, 140);
				addOffset("singLEFT", -190, -53);
				addOffset("singRIGHT", 103, -52);
				addOffset("singDOWN", -88, -137);
				playAnim('idle');
			case 'hacker':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Hacker/hacker');
				frames = tex;
				animation.addByPrefix('idle', "idle normal", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'right', 24, false);
				animation.addByPrefix('singRIGHT', 'left', 24, false);
				addOffset('idle',-200,-150);
				addOffset("singUP",25,175);
				addOffset("singLEFT",-185,-141);
				addOffset("singRIGHT",1050,245);
				addOffset("singDOWN",370,200);
				playAnim('idle');
			case 'hellron-drippin':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Hellron-Drippin/hellron-drippin');
				frames = tex;
				animation.addByPrefix('idle', "idle instance 1", 24);
				animation.addByPrefix('singUP', 'up instance 1', 24, false);
				animation.addByPrefix('singDOWN', 'down instance 1', 24, false);
				animation.addByPrefix('singLEFT', 'left instance 1', 24, false);
				animation.addByPrefix('singRIGHT', 'right instance 1', 24, false);
				addOffset('idle');
				addOffset("singUP",40,160);
				addOffset("singRIGHT",58,56);
				addOffset("singLEFT",370,80);
				addOffset("singDOWN",270,-130);
				playAnim('idle');
			case 'hellron-crazy':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Hellron/hellron');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				addOffset('idle');
				addOffset("singUP",140,132);
				addOffset("singLEFT",150,7);
				addOffset("singRIGHT",-23,-13);
				addOffset("singDOWN",165,-160);
				playAnim('idle');
			case 'hellron-b':
				tex = Paths.getSparrowAtlas('ron/characters/Hellron-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'hellron-2':
				tex = Paths.getSparrowAtlas('updateron/characters/godron');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('crazy', 'crazy', 24, false);
				addOffset('idle');
				addOffset("singUP", 10, 80);
				addOffset("singLEFT", 92, 22);
				addOffset("singRIGHT", 40, 9);
				addOffset("singDOWN", 50, -38);
				addOffset("crazy", 93, 36);
				playAnim('idle');
			case 'hellron-2-old':
				tex = Paths.getSparrowAtlas('ron/characters/Hellron-2');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'ateloron':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Ateloron/ateloron', 'shared');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				addOffset('idle');
				addOffset("singUP", -110, 91);
				addOffset("singLEFT");
				addOffset("singRIGHT", -83, -46);
				addOffset("singDOWN", -70, 30);
				playAnim('idle');
			case 'ateloron-old':
				tex = Paths.getSparrowAtlas('ron/characters/ateloron');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'ateloron-b':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Bteloron/bteloron');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				addOffset('idle');
				addOffset("singUP", -110, 53);
				addOffset("singLEFT");
				addOffset("singRIGHT", -83, -46);
				addOffset("singDOWN", -70, 20);
				playAnim('idle');
			case 'ateloron-b-old':
				tex = Paths.getSparrowAtlas('ron/characters/ateloron-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'factorytankman-b':
				tex = Paths.getSparrowAtlas('ron/characters/factorytankman-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'ron-usb':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Ron-Usb/ron-usb', 'shared');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				addOffset('idle');
				addOffset("singUP", 130, 188);
				addOffset("singLEFT", 160, -85);
				addOffset("singRIGHT", 0, -126);
				addOffset("singDOWN", 55, -143);
				playAnim('idle');
			case 'ron-usb-old':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Ron-Usb/ron-usb', 'shared');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				addOffset('idle');
				addOffset("singUP", 130, 188);
				addOffset("singLEFT", 160, -85);
				addOffset("singRIGHT", 0, -126);
				addOffset("singDOWN", 55, -143);
				playAnim('idle');
			case 'ron-usb-b':
				tex = Paths.getSparrowAtlas('updateron/characters/FMronB');
				frames = tex;
				animation.addByPrefix('idle', "FMronB Idle", 24);
				animation.addByPrefix('singUP', 'FMronB Up', 24, false);
				animation.addByPrefix('singDOWN', 'FMronB Down', 24, false);
				animation.addByPrefix('singLEFT', 'FMronB Left', 24, false);
				animation.addByPrefix('singRIGHT', 'FMronB Right', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 138);
				addOffset("singLEFT", 98, -7);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -180);
				playAnim('idle');
			case 'ron-usb-b-old':
				tex = Paths.getSparrowAtlas('updateron/characters/FMronB');
				frames = tex;
				animation.addByPrefix('idle', "FMronB Idle", 24);
				animation.addByPrefix('singUP', 'FMronB Up', 24, false);
				animation.addByPrefix('singDOWN', 'FMronB Down', 24, false);
				animation.addByPrefix('singLEFT', 'FMronB Left', 24, false);
				animation.addByPrefix('singRIGHT', 'FMronB Right', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 138);
				addOffset("singLEFT", 98, -7);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -180);
				playAnim('idle');
			case 'factorytankman':
				tex = Paths.getSparrowAtlas('ron/characters/factorytankman');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'factorytankman-2':
				tex = Paths.getSparrowAtlas('ron/characters/factorytankman-2');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'ronmad-b':
				tex = Paths.getSparrowAtlas('ron/characters/madron-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'tankmantrojan-2':
				tex = Paths.getSparrowAtlas('ron/characters/Tankmantrojan-2');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'ronsip':
				frames = Paths.getSparrowAtlas('ron/characters/kill_yourself', 'shared');
				animation.addByPrefix('idle', 'RON_IDLE', 24, false);
				animation.addByPrefix('singUP', 'RON_UP', 24, false);
				animation.addByPrefix('singDOWN', 'RON_DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'RON_LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'RON_RIGHT', 24, false);

				// addOffset("singDOWN", 160 -180);
				animOffsets['singDOWN'] = [160, -180];
				addOffset('idle');
				addOffset("singUP", -20, -50);
				addOffset("singRIGHT", -30, -50);
				addOffset("singLEFT", 600, 220);

				playAnim('idle');
			case 'phone':
				tex = Paths.getSparrowAtlas('ron/characters/phone');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				playAnim('idle');
			case 'bijuuron':
				frames = Paths.getSparrowAtlas('updateron/cachecharacters/Bijuu/kill_yourself');
				animation.addByPrefix('idle', 'idle', 24, true);
				animation.addByPrefix('singUP', 'up', 36, false);
				animation.addByPrefix('singDOWN', 'down', 36, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle');
				addOffset("singUP", 0, 940);
				addOffset("singRIGHT", 0, -11);
				addOffset("singLEFT", 25, -20);
				addOffset("singDOWN", 0, -79);
				
				playAnim('idle');
			case 'bijuuron-old':
				frames = Paths.getSparrowAtlas('updateron/characters/kill_yourself-old');
				animation.addByPrefix('idle', 'RON_IDLE', 24, false);
				animation.addByPrefix('singUP', 'RON_UP', 24, false);
				animation.addByPrefix('singDOWN', 'RON_DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'RON_LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'RON_RIGHT', 24, false);

				//addOffset("singDOWN", 160 -180);
				animOffsets['singDOWN'] = [160, -180];
				addOffset('idle');
				addOffset("singUP", -20, -50);
				addOffset("singRIGHT", -30, -50);
				addOffset("singLEFT", 600, 220);
				
				playAnim('idle');
			case 'tankman':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Tankman/Tankman');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldron':
				tex = Paths.getSparrowAtlas('ron/characters/Tankman');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldsusron':
				tex = Paths.getSparrowAtlas('ron/characters/susron');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldronb':
				tex = Paths.getSparrowAtlas('ron/characters/Tankman-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldron-mad':
				tex = Paths.getSparrowAtlas('ron/characters/madron');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldhellron':
				tex = Paths.getSparrowAtlas('ron/characters/hellron');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldhellron-b':
				tex = Paths.getSparrowAtlas('ron/characters/Hellron-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldhellron-2':
				tex = Paths.getSparrowAtlas('ron/characters/Hellron-2');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldateloron':
				tex = Paths.getSparrowAtlas('ron/characters/ateloron');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldateloron-b':
				tex = Paths.getSparrowAtlas('ron/characters/ateloron-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldfactorytankman-b':
				tex = Paths.getSparrowAtlas('ron/characters/factorytankman-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldron-usb':
				tex = Paths.getSparrowAtlas('ron/characters/ron-usb');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldron-usb-b':
				tex = Paths.getSparrowAtlas('ron/characters/Tankmantrojan');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldfactorytankman':
				tex = Paths.getSparrowAtlas('ron/characters/factorytankman');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'factorytankman-old':
				tex = Paths.getSparrowAtlas('ron/characters/factorytankman');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldfactorytankman-2':
				tex = Paths.getSparrowAtlas('ron/characters/factorytankman-2');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldronmad-b':
				tex = Paths.getSparrowAtlas('ron/characters/madron-b');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldtankmantrojan-2':
				tex = Paths.getSparrowAtlas('ron/characters/Tankmantrojan-2');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);
				playAnim('idle');
			case 'oldronsip':
				frames = Paths.getSparrowAtlas('ron/characters/kill_yourself', 'shared');
				animation.addByPrefix('idle', 'RON_IDLE', 24, false);
				animation.addByPrefix('singUP', 'RON_UP', 24, false);
				animation.addByPrefix('singDOWN', 'RON_DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'RON_LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'RON_RIGHT', 24, false);

				// addOffset("singDOWN", 160 -180);
				animOffsets['singDOWN'] = [160, -180];
				addOffset('idle');
				addOffset("singUP", -20, -50);
				addOffset("singRIGHT", -30, -50);
				addOffset("singLEFT", 600, 220);

				playAnim('idle');
			case 'oldphone':
				tex = Paths.getSparrowAtlas('ron/characters/phone');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				playAnim('idle');
			case 'cheeky':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Cheeky/Cheeky');
				frames = tex;
				animation.addByPrefix('idle', 'Cheeky Idle Dance', 24);
				animation.addByPrefix('singUP', 'Cheeky NOTE UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Cheeky NOTE RIGHT', 32, false);
				animation.addByPrefix('singDOWN', 'Cheeky NOTE DOWN', 32, false);
				animation.addByPrefix('singLEFT', 'Cheeky NOTE LEFT', 24, false);
				addOffset('idle');
				addOffset("singUP", 0, 23);
				addOffset("singRIGHT", -37, 0);
				addOffset("singLEFT", 54, 0);
				addOffset("singDOWN", 0, -21);

				setGraphicSize(Std.int(width * 2.25));

				playAnim('idle');
				//healthBarColor = FlxColor.fromRGB(110, 179, 204);
			case 'whitty': // whitty reg (lofight,overhead)
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Whitty/WhittySprites');
				frames = tex;
				animation.addByPrefix('idle', 'Idle', 24);
				animation.addByPrefix('singUP', 'Sing Up', 24);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24);
				animation.addByPrefix('singDOWN', 'Sing Down', 24);
				animation.addByPrefix('singLEFT', 'Sing Left', 24);

				addOffset('idle', 0,0 );
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				playAnim('idle');
			case 'bandu':
				frames = Paths.getSparrowAtlas('updateron/cachecharacters/Bandu/bandu');
				
				animation.addByPrefix('idle', 'idle', 24, true);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				
				animation.addByIndices('idle-alt', 'phones fall', [17], '', 24, false);
				animation.addByPrefix('singUP-alt', 'sad up', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'sad right', 24, false);
				animation.addByPrefix('singDOWN-alt', 'sad down', 24, false);
				animation.addByPrefix('singLEFT-alt', 'sad left', 24, false);

				animation.addByIndices('NOOMYPHONES', 'phones fall', [0, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 17], '', 24, false);
				
				addOffset('idle');
				addOffset("singUP", 0, 80);
				addOffset("singRIGHT", 140, -80);
				addOffset("singLEFT", 200);
				addOffset("singDOWN", 0, -30);
				
				addOffset('NOOMYPHONES');

				addOffset('idle-alt');
				addOffset("singUP-alt", 0, 100);
				addOffset("singRIGHT-alt", 30);
				addOffset("singLEFT-alt", -20, -38);
				addOffset("singDOWN-alt");

				setGraphicSize(Std.int(width / 1));
				updateHitbox();

				antialiasing = false;

				playAnim('idle');
			case 'chezburgir':
				tex = Paths.getSparrowAtlas('updateron/characters/chezburgir');
				frames = tex;
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				addOffset('idle');
				addOffset("singUP");
				addOffset("singLEFT");
				addOffset("singRIGHT");
				addOffset("singDOWN");
				playAnim('idle');
			case 'bf_Gray':
				var tex = Paths.getSparrowAtlas('updateron/characters/Gray_BF');
				frames = tex;
	
				trace(tex.frames.length);
	
				animation.addByPrefix('idle', 'Gray BF Idle', 24, false);
				animation.addByPrefix('singUP', 'Gray BF Up', 24, false);
				animation.addByPrefix('singLEFT', 'Gray BF Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Gray BF Right', 24, false);
				animation.addByPrefix('singDOWN', 'Gray BF Down', 24, false);
				animation.addByPrefix('singUPmiss', 'Gray BF Miss', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Gray BF Miss', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Gray BF Miss', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Gray BF Miss', 24, false);
				animation.addByPrefix('firstDeath', "Gray BF Death", 24, false);
				animation.addByPrefix('deathLoop', "Gray BF Death", 24, true);
				animation.addByPrefix('deathConfirm', "Gray BF Death", 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 197);
				addOffset("singRIGHT", 16, 13);
				addOffset("singLEFT", 76, -6);
				addOffset("singDOWN", 80, 20);
				addOffset("singUPmiss", -11, 9);
				addOffset("singRIGHTmiss", -11, 9);
				addOffset("singLEFTmiss", -11, 9);
				addOffset("singDOWNmiss", -11, 9);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 11);
				addOffset('deathConfirm', 37, 11);
	
				playAnim('idle');

				flipX = true;
				flipX = true;
			case 'blue':
				tex = Paths.getSparrowAtlas('updateron/characters/WhittyWatchRed');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Up', 24, false);
				animation.addByPrefix('singDOWN', 'Down', 24, false);
				animation.addByPrefix('singLEFT', 'Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Right', 24, false);
				addOffset('idle');
				addOffset("singUP");
				addOffset("singLEFT");
				addOffset("singRIGHT");
				addOffset("singDOWN");
				playAnim('idle');	
			case 'blueSad':
				tex = Paths.getSparrowAtlas('updateron/characters/vine_boom');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Up', 24, false);
				animation.addByPrefix('singDOWN', 'Down', 24, false);
				animation.addByPrefix('singLEFT', 'Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Right', 24, false);
				addOffset('idle');
				addOffset("singUP");
				addOffset("singLEFT");
				addOffset("singRIGHT");
				addOffset("singDOWN");	
				playAnim('idle');
			case 'bf-g':
				var tex = Paths.getSparrowAtlas('updateron/cachecharacters/Grayfriend/grayfriend', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;
				flipX = true;
			case 'gf-g':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Graygf/graygf');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
			case 'gf-gray':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('updateron/characters/Gray_GF');
				frames = tex;
				animation.addByIndices('danceLeft', 'Gray GF Idle', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 12, false);
				animation.addByIndices('danceRight', 'Gray GF Idle', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 12, false);

				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				playAnim('danceRight');
			case 'gf-gray-real':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('updateron/characters/Gray_GF');
				frames = tex;
				animation.addByPrefix('idle', 'Gray GF Idle', 12, false);

				addOffset('idle', 0, -9);
			case 'armand':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Armand/ArmandRonan');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24, false);
				animation.addByPrefix('altidle', 'altidle', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('cheer', 'lol', 24, false);

				addOffset('idle');
				addOffset('altidle');
				addOffset("singUP", 0, 5);
				addOffset("singRIGHT");
				addOffset("singLEFT", 44, 0);
				addOffset("singDOWN");
				addOffset("cheer");
				playAnim('idle');
			case 'gron':
				tex = Paths.getSparrowAtlas('updateron/characters/Gron');
				frames = tex;
				animation.addByPrefix('idle', "Gron Idle", 24);
				animation.addByPrefix('singUP', 'Gron Up', 24, false);
				animation.addByPrefix('singDOWN', 'Gron Down', 24, false);
				animation.addByPrefix('singLEFT', 'Gron Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Gron Right', 24, false);
				addOffset('idle');
				addOffset("singUP", 0, -10);
				addOffset("singLEFT", 0, -20);
				addOffset("singRIGHT", 0, -20);
				addOffset("singDOWN", 0, -190);
				playAnim('idle');
			case 'napkin':
				tex = Paths.getSparrowAtlas('updateron/characters/Used_Napkin');
				frames = tex;
				animation.addByPrefix('singDOWN', 'Used Napkin Down', 24, false);
				animation.addByPrefix('idle', "Used Napkin Idle", 24);
				animation.addByPrefix('singLEFT', 'Used Napkin Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Used Napkin Right', 24, false);
				animation.addByPrefix('singUP', 'Used Napkin Up', 24, false);
				
				addOffset('singDOWN');
				addOffset("idle");
				addOffset("singLEFT");
				addOffset("singRIGHT");
				addOffset("singUP");
				playAnim('idle');
			case 'weedron':
				tex = Paths.getSparrowAtlas('updateron/characters/weed ron');
				frames = tex;
				animation.addByPrefix('singDOWN', 'weed ron down', 24, false);
				animation.addByPrefix('idle', "weed ron idle", 24);
				animation.addByPrefix('singLEFT', 'weed ron left', 24, false);
				animation.addByPrefix('singRIGHT', 'weed ron right', 24, false);
				animation.addByPrefix('singUP', 'weed ron up', 24, false);
				
				addOffset('singDOWN', -10, -210);
				addOffset("idle", 13, -190);
				addOffset("singLEFT", 8, -193);
				addOffset("singRIGHT", -45, -194);
				addOffset("singUP", 9, -168);
				playAnim('idle');
			case 'rondvd':
				tex = Paths.getSparrowAtlas('updateron/characters/DvdRon');
				frames = tex;
				animation.addByPrefix('singDOWN', 'Down', 24, false);
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singLEFT', 'Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Right', 24, false);
				animation.addByPrefix('singUP', 'Up', 24, false);
				
				addOffset('singDOWN', 10, -40);
				addOffset("idle");
				addOffset("singLEFT", 240, -33);
				addOffset("singRIGHT", 0, -20);
				addOffset("singUP", -36, 109);
				playAnim('idle');
			case 'shaggy':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Shaggy/shaggy');
				frames = tex;
				animation.addByPrefix('singDOWN', 'shaggy_down', 30, false);
				animation.addByPrefix('idle', "shaggy_idle0", 30);
				animation.addByPrefix('singLEFT', 'shaggy_left', 30, false);
				animation.addByPrefix('singRIGHT', 'shaggy_right', 30, false);
				animation.addByPrefix('singUP', 'shaggy_up', 30, false);
				
				addOffset('singDOWN', -10, -160);
				addOffset("idle");
				addOffset("singLEFT", 165, -114);
				addOffset("singRIGHT", -1, -38);
				addOffset("singUP", -16, 27);
				playAnim('idle');
			case 'pshaggy':
				tex = Paths.getSparrowAtlas('updateron/characters/pshaggy');
				frames = tex;
				animation.addByPrefix('singDOWN', 'pshaggy_down', 30, false);
				animation.addByPrefix('idle', "pshaggy_idle0", 30);
				animation.addByPrefix('singLEFT', 'pshaggy_left', 30, false);
				animation.addByPrefix('singRIGHT', 'pshaggy_right', 30, false);
				animation.addByPrefix('singUP', 'pshaggy_up0', 30, false);
				animation.addByPrefix('snap', 'pshaggy_snap', 7, false);
				animation.addByPrefix('snapped', 'pshaggy_did_snap', 28, false);
				animation.addByPrefix('back', 'pshaggy_back', 28, false);
				animation.addByPrefix('smile', 'shaggy_smile', 7, false);
				animation.addByPrefix('stand', 'pshaggy_stand', 7, false);
				
				addOffset('singDOWN', 200, -110);
				addOffset("idle");
				addOffset("singLEFT", 35, 16);
				addOffset("singRIGHT", 119, -8);
				addOffset("singUP", 114, 97);
				addOffset("snap", 10, 92);
				addOffset("snapped", 0, 71);
				addOffset("back");
				addOffset("smile");
				addOffset("stand");
				playAnim('idle');
			case 'tricky':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Tricky/tricky', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Idle', 24);
				animation.addByPrefix('singUP', 'Sing Up', 24);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24);
				animation.addByPrefix('singDOWN', 'Sing Down', 24);
				animation.addByPrefix('singLEFT', 'Sing Left', 24); 
				
				addOffset("idle", 0, -75);
				addOffset("singUP", 93, -76);
				addOffset("singRIGHT", 16, -176);
				addOffset("singLEFT", 103, -72);
				addOffset("singDOWN", 6, -84);

				playAnim('idle');
			case 'himdrip':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Himdrip/himdrip');
				frames = tex;
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('idle', "idle", 24);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				
				addOffset('singDOWN', -20, 0);
				addOffset("idle");
				addOffset("singLEFT", 120, 10);
				addOffset("singRIGHT", 0, 10);
				addOffset("singUP", 180, 70);
				playAnim('idle');
			case 'meri':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Meri/Meri_assets');
				frames = tex;
				animation.addByPrefix('singDOWN', 'Meri Down', 24, false);
				animation.addByPrefix('idle', "Meri Idle", 24);
				animation.addByPrefix('singLEFT', 'Meri Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Meri Right', 24, false);
				animation.addByPrefix('singUP', 'Meri Up', 24, false);
				
				addOffset('singDOWN', 0, -27);
				addOffset("idle");
				addOffset("singLEFT", -6, -6);
				addOffset("singRIGHT", 25, -30);
				addOffset("singUP", -12, 2);
				playAnim('idle');
			case 'neil':
				tex = Paths.getSparrowAtlas('updateron/cachecharacters/Neil/neil');
				frames = tex;
				animation.addByPrefix('idle', "neil", 24);
				
				addOffset("idle");
			case 'shuttleron':
				tex = Paths.getSparrowAtlas('updateron/characters/shuttle ron');
				frames = tex;
				animation.addByPrefix('singDOWN', 'shuttle ron down', 24, false);
				animation.addByPrefix('idle', "shuttle ron idle", 24);
				animation.addByPrefix('singLEFT', 'shuttle ron left', 24, false);
				animation.addByPrefix('singRIGHT', 'shuttle ron right', 24, false);
				animation.addByPrefix('singUP', 'shuttle ron up', 24, false);
				
				addOffset('singDOWN', -20, 0);
				addOffset("idle");
				addOffset("singLEFT");
				addOffset("singRIGHT", -20, -5);
				addOffset("singUP", 0, 20);
				playAnim('idle');
			case 'bfshuttle-man-playable':
				var tex = Paths.getSparrowAtlas('updateron/characters/ou');
				frames = tex;
				animation.addByPrefix('idle', 'shuttle man idle', 24, false);
				animation.addByPrefix('singUP', 'shuttle man up', 24, false);
				animation.addByPrefix('singLEFT', 'shuttle man left', 24, false);
				animation.addByPrefix('singRIGHT', 'shuttle man right', 24, false);
				animation.addByPrefix('singDOWN', 'shuttle man down', 24, false);
				animation.addByPrefix('singUPmiss', 'shuttle man miss up', 24, false);
				animation.addByPrefix('singLEFTmiss', 'shuttle man miss left', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'shuttle man miss right', 24, false);
				animation.addByPrefix('singDOWNmiss', 'shuttle man miss down', 24, false);
				animation.addByPrefix('hey', 'shuttle man hey', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss", -44, 22);
				addOffset("singRIGHTmiss", -44, 22);
				addOffset("singLEFTmiss", -4, 2);
				addOffset("singDOWNmiss", -5, 5);
				addOffset("hey");

				playAnim('idle');

				flipX = true;
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith("bf") && !curCharacter.startsWith("oldbf") && !curCharacter.startsWith("cookbob"))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith("bf") && !curCharacter.startsWith("oldbf") && !curCharacter.startsWith("cookbob"))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf'|'oldgf'|'oldgf-b':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf'|'gf-b'|'gf-d'|'gf-g'|'gf-whitty'|'gf-gray'|'oldgf'|'oldgf-b':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
