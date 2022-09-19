package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import lime.utils.Assets;

class SoundTestState extends FlxState
{
	var red:Bool = false;
	var flashSpr:FlxSprite;
	var blackSpr:FlxSprite;
	var the:Bool = true;
	var the2:Bool = false;
	var the3:Bool = false;
	var elCooldown:Bool = true;
	var dumbassCooldown:Bool = true;
	// たのしさ∞　セガ・エンタープライゼス　まぢん画
	var daValue:Int = 0;
	////////////////////////////////////////////////////////////////////////
	var fm = new FlxText(null, null, 0, 'FM  NO .', 20);
	var fmNum = new FlxText(null, null, 0, '0', 20);
	var fmValue:Int = 0;
	var pcmNum = new FlxText(null, null, 0, '0', 20);
	var pcm = new FlxText(null, null, 0, 'PCM  NO .', 20);
	var pcmValue:Int = 0;
	var daNum = new FlxText(null, null, 0, '0', 20);
	var da = new FlxText(null, null, 0, 'DA  NO .', 20);

	////////////////////////////////////////////////////////////////////////

	override function create()
	{
		var bg:FlxSprite = new FlxSprite(-100).loadGraphic('assets/images/soundTestBG.png');
		bg.scale.x = 2.2;
		bg.scale.y = 2.2;
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0;
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);
		// bg
		fm.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
		fm.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);
		fm.scale.x = 0.7;
		fm.scale.y = 0.7;
		fmNum.y = 155;
		fm.y = 154;
		fm.x = 28;
		fmNum.alignment = "right";

		fmNum.x = 140;
		fmNum.scale.x = 0.7;
		fmNum.scale.y = 0.7;
		add(fm);
		add(fmNum);
		// fm
		pcm.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
		pcm.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);
		pcm.scale.x = 0.7;
		pcm.scale.y = 0.7;
		pcm.y = 154;
		pcm.x = fm.x + 180;
		pcmNum.scale.x = 0.7;
		pcmNum.scale.y = 0.7;
		pcmNum.y = 155;
		pcmNum.x = fmNum.x + 205;
		pcmNum.alignment = "right";

		add(pcm);
		add(pcmNum);
		// pcm
		daNum.y = 155;
		daNum.x = pcmNum.x + 180;
		daNum.alignment = "right";

		da.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
		da.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);
		da.x = pcm.x + 205;
		da.y = 154;
		da.scale.x = 0.7;
		da.scale.y = 0.7;
		daNum.scale.x = 0.7;
		daNum.scale.y = 0.7;
		add(daNum);
		add(da);
		// da
		var soundtesttext = new FlxText(0, 0, 0, 'SOUND TEST', 25);
		soundtesttext.screenCenter();
		soundtesttext.y -= 150;
		soundtesttext.x -= 33;
		soundtesttext.scale.x = 0.7;
		soundtesttext.scale.y = 0.7;
		soundtesttext.setFormat("Sonic CD Menu Font Regular", 25, FlxColor.fromString("#00a3ff"));
		soundtesttext.setBorderStyle(SHADOW, FlxColor.BLACK, 4, 1);
		add(soundtesttext);

		// sound test text
		//
		blackSpr = new FlxSprite();
		blackSpr.makeGraphic(1280, 720, FlxColor.fromString("#a2a2a2"));
		blackSpr.alpha = 0.5;
		// add(blackSpr);
		//
		flashSpr = new FlxSprite();
		flashSpr.makeGraphic(1280, 720, FlxColor.WHITE);
		flashSpr.alpha = 0;
		add(flashSpr);
		// flash
	}

	function flash()
	{
		FlxTween.tween(flashSpr, {alpha: 1}, 0.4);
	}

	function switchNum(selection:Int)
	{
		if (the)
		{
			//
			fmValue += selection;
			if (fmValue < 0)
				fmValue = 99;
			if (fmValue > 99)
				fmValue = 0;
		}
		else if (the2)
		{
			//
			pcmValue += selection;
			if (pcmValue < 0)
				pcmValue = 99;
			if (pcmValue > 99)
				pcmValue = 0;
		}
		else if (the3)
		{
			daValue += selection;
			if (daValue < 0)
				daValue = 99;
			if (daValue > 99)
				daValue = 0;
		}
	}

	function transitionThingy(firstNum:Int, secondNum:Int, thirdNum:Int)
	{
		if (firstNum == 46 && secondNum == 12 && thirdNum == 25 || FlxG.keys.justPressed.Z)
		{
			elCooldown = false;
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			flash();
			FlxG.sound.playMusic(AssetPaths.sound__ogg, 1, false);
			new FlxTimer().start(2, function(the:FlxTimer)
			{
				FlxG.switchState(new Majin());
			});
		}
		else if (firstNum == 1 && secondNum == 99 && thirdNum == 7)
		{
			elCooldown = false;
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			flash();
			FlxG.sound.playMusic(AssetPaths.sound__ogg, 1, false);
			new FlxTimer().start(2, function(the:FlxTimer)
			{
				FlxG.switchState(new Spamton());
			});
		}
		else
		{
			red = true;
			pcmValue = 0;
			daValue = 0;
			fmValue = 0;
			FlxG.sound.playMusic(AssetPaths.denied__ogg, 1, false);

			new FlxTimer().start(0.4, function(aTimer:FlxTimer)
			{
				red = false;
			});
		}
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.RIGHT)
		{
			if (elCooldown)
			{
				if (the)
				{
					the = !the;
					the2 = true;
				}
				else if (the2)
				{
					the2 = !the2;
					the3 = true;
				}
				else if (the3)
				{
					the3 = !the3;
					the = true;
				}
			}
		}
		//
		if (FlxG.keys.justPressed.LEFT)
		{
			if (elCooldown)
			{
				if (the)
				{
					the = !the;
					the3 = true;
				}
				else if (the2)
				{
					the2 = !the2;
					the = true;
				}
				else if (the3)
				{
					the3 = !the3;
					the2 = true;
				}
			}
		}
		if (red)
		{
			fmNum.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#fc0000"));
			fmNum.setBorderStyle(SHADOW, FlxColor.fromString("#900000"), 4, 1);

			daNum.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#fc0000"));
			daNum.setBorderStyle(SHADOW, FlxColor.fromString("#900000"), 4, 1);

			pcmNum.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#fc0000"));
			pcmNum.setBorderStyle(SHADOW, FlxColor.fromString("#900000"), 4, 1);
		}
		else
		{
			fmNum.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
			fmNum.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);

			daNum.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
			daNum.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);

			pcmNum.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
			pcmNum.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);
		}

		if (FlxG.keys.justPressed.ENTER && elCooldown)
			transitionThingy(fmValue, pcmValue, daValue);

		if (fmValue < 10)
			fmNum.text = '0' + Std.string(fmValue);
		else
			fmNum.text = Std.string(fmValue);

		if (pcmValue < 10)
			pcmNum.text = '0' + Std.string(pcmValue);
		else
			pcmNum.text = Std.string(pcmValue);

		if (daValue < 10)
			daNum.text = '0' + Std.string(daValue);
		else
			daNum.text = Std.string(daValue);

		if (FlxG.keys.justPressed.UP)
		{
			if (elCooldown)
			{
				switchNum(1);
			}
		}

		if (FlxG.keys.justPressed.DOWN)
		{
			if (elCooldown)
			{
				switchNum(-1);
			}
		}

		if (the)
		{
			fm.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#feae00"));
			fm.setBorderStyle(SHADOW, FlxColor.fromString("#fd2403"), 4, 1);

			pcm.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
			pcm.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);

			da.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
			da.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);
		}
		else if (the2)
		{
			fm.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
			fm.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);

			pcm.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#feae00"));
			pcm.setBorderStyle(SHADOW, FlxColor.fromString("#fd2403"), 4, 1);

			da.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
			da.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);
		}
		else if (the3)
		{
			fm.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
			fm.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);

			da.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#feae00"));
			da.setBorderStyle(SHADOW, FlxColor.fromString("#fd2403"), 4, 1);

			pcm.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromString("#aeb3fb"));
			pcm.setBorderStyle(SHADOW, FlxColor.fromString("#6a6e9f"), 4, 1);
		}

		super.update(elapsed);
	}
}
