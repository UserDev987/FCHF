package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class HUD extends FlxTypedGroup<FlxSprite> {
	public var score:Int = 0;
	public var scoreT:FlxText;

	public function new() {
		super();
		scoreT = new FlxText(0, 0, 0, "Score: 0", 32);
		scoreT.scrollFactor.set(0, 0);
		add(scoreT);
	}

	public function incr() {
		score++;
		scoreT.text = 'Score: $score';
	}
}

