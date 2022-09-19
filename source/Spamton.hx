package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;

class Spamton extends FlxState
{
	var spamtonBG = new FlxSprite(150, 85);

	override public function create()
	{
		var spamton = new FlxBackdrop("assets/images/spamton.png", 1, 1, null, null, 2, 2);

		spamton.scale.x = 2;
		spamton.scale.y = 2;

		spamton.cameras = [FlxG.camera];
		spamton.velocity.set(75, 75);
		add(spamton);

		spamtonBG.loadGraphic("assets/images/bgSpamton.png", false, 150, 67);
		spamtonBG.x = 159;
		spamtonBG.y = 49;

		spamtonBG.scale.x = 2;
		spamtonBG.scale.y = 2;
		spamtonBG.antialiasing = false;
		add(spamtonBG);

		FlxG.sound.playMusic(AssetPaths.spam__ogg, 1, true);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
