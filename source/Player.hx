package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite {
	// var GRAVITY:Int = 600;
	var SPEED:Int = 100;

	public function new() {
		super(0, 0);
		drag.x = SPEED * 4;
		drag.y = SPEED * 4;
		this.makeGraphic(32, 32, FlxColor.RED, false);
		screenCenter(X);
		// acceleration.y = GRAVITY;
	}

	function movement() {
		if (FlxG.keys.anyPressed([DOWN, S])) {
			this.velocity.y = SPEED;
		} else if (FlxG.keys.anyPressed([RIGHT, D])) {
			this.velocity.x = SPEED;
		} else if (FlxG.keys.anyPressed([LEFT, A])) {
			this.velocity.x = -SPEED;
		}
	}

	override public function update(elapsed:Float) {
		movement();
		super.update(elapsed);
	}
}

