package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import haxe.io.UInt8Array.UInt8ArrayData;

class PlayState extends FlxState
{
	// var bg:FlxBackdrop;
	var bg:FlxSprite;
	var plr:FlxSprite;
	var loops:FlxTypedGroup<FlxSprite> = new FlxTypedGroup<FlxSprite>();
	var hud:HUD;
	var focus:FlxSprite;

	public var clouds:Array<FlxSprite>;

	public var random:Array<Array<Int>> = [
		[23, 669],
		[269, 13],
		[40, 364],
		[1244, 39],
		[974, 382],
		[1126, 622],
		[1169, 335],
		[358, 94],
		[313, 665]
	];

	public var temp:FlxSprite;
	public var sepValue:Float;

	override public function create()
	{
		super.create();
		makeClouds();
		loadClouds();
		focus = new FlxSprite().makeGraphic(1280, 720, FlxColor.WHITE, false);
		focus.alpha = 0;
		// bg = new FlxBackdrop("assets/images/main_bg.jpg", 2, 0, true, false); // Loading an infine blue bg for now
		bg = new FlxSprite().makeGraphic(1280, 720, FlxColor.BLUE, false);
		// bg.velocity.y = 100;
		// focus.velocity.y = 100;
		plr = new Player();
		plr.scrollFactor.set(0, 0);
		hud = new HUD();
		add(bg);
		// loadLoops();
		add(plr);
		add(hud);
		// loadClouds();
		add(focus);
		loadClouds();
		FlxG.camera.target = focus;
	}

	/* function controlCamera() {
		if (FlxG.keys.anyPressed([UP, W])) {
			FlxG.camera.y -= 2;
		}

		if (FlxG.keys.justPressed.P) {
			trace(Std.string(FlxG.camera.y));
		}
	 */
	// function loadLoops()
	// {
	// 	for (i in 0...4)
	// 	{
	// 		temp = new FlxSprite().makeGraphic(32, 32, FlxColor.WHITE, false);
	// 		temp.x = new FlxRandom().int(0, 630);
	// 		temp.y = new FlxRandom().getObject(randomY);
	// 		loops.add(temp);
	// 	}
	// 	for (i in loops)
	// 	{
	// 		add(i);
	// 	}
	// }

	function onTouch(_, loop:FlxSprite)
	{
		loop.kill();
		hud.incr();
	}

	// function loadClouds()
	// {
	// 	var currY:Float;
	// 	var currImg:FlxSprite;
	// 	var randomC:Int = 0;
	// 	for (i in 0...10)
	// 	{
	// 		randomC = new FlxRandom().int(0, 4);
	// 		currImg = new FlxSprite().loadGraphic('assets/images/cloud_$randomC.png');
	// 		currImg.width = 720;
	// 		currY = currImg.height;
	// 		sepValue += currY;
	// 		currImg.y += sepValue;
	// 		add(currImg);
	// 	}
	// }
	// function loadClouds()
	// {
	// 	var randomV:Array<Int>;
	// 	for (i in 0...10)
	// 	{
	// 		var loopCount:Int = 0;
	// 		sepValue += 720;
	// 		while (loopCount != 8)
	// 		{
	// 			var currCloud:Cloud = {
	// 				sprite: new FlxSprite(32, 32);
	// 			}
	// 			randomV = new FlxRandom().getObject(random);
	// 			currCloud.sprite.x = randomV[0];
	// 			currCloud.sprite.y = randomV[1];
	// 			if (currCloud.state == false)
	// 			{
	// 				currCloud.state = true;
	// 				currCloud.sprite.y += sepValue;
	// 				loopCount++;
	// 				add(currCloud.sprite);
	// 			}
	// 			else
	// 			{
	// 				continue;
	// 			}
	// 		}
	// 	}
	// }

	function loadClouds()
	{
		var randomV:Array<Int>;
		for (i in 0...10)
		{
			sepValue += 720;
			for (cloud in clouds)
			{
				randomV = new FlxRandom().getObject(random);
				cloud.x = randomV[0];
				cloud.y = randomV[1] + sepValue;
				add(cloud);
				random.remove(randomV);
			}
		}
	}

	function makeClouds()
	{
		for (i in 0...8)
		{
			var cloud:FlxSprite = new FlxSprite(32, 32);
			clouds.push(cloud);
		}
	}

	override public function update(elapsed:Float)
	{
		// controlCamera();
		if (FlxG.keys.justPressed.P)
		{
			trace(Std.string(FlxG.mouse.getPosition()));
		}
		FlxG.overlap(plr, loops, onTouch);
		super.update(elapsed);
	}
}
