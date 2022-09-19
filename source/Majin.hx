package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;

class Majin extends FlxState
{
	var sprite = new FlxSprite(150, 85);

	override public function create()
	{
		var backdrop = new FlxBackdrop("assets/images/majin.png", -2, -2, null, null, 2, 2);

		backdrop.scale.x = 2;
		backdrop.scale.y = 2;

		backdrop.cameras = [FlxG.camera];
		backdrop.velocity.set(75, 75);
		add(backdrop);

		sprite.loadGraphic("assets/images/bgMajin.png", false, 150, 67);
		sprite.scale.x = 2.3;
		sprite.scale.y = 2.3;
		sprite.antialiasing = false;
		add(sprite);

		FlxG.sound.playMusic(AssetPaths.music__ogg, 1, true);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
