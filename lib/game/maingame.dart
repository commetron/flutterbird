import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flutterbird/objs/bg.dart';
import 'package:flutterbird/objs/bird.dart';
import 'package:flutterbird/objs/coin.dart';
import 'package:flutterbird/objs/ground.dart';
import 'package:flutterbird/objs/pipe.dart';
import 'package:flutterbird/util/util.dart';

import '../objs/text.dart';

class MainGame extends FlameGame with HasCollisionDetection, TapDetector {
  Bg bg = Bg();
  Bg2 bg2 = Bg2();
  Ground ground = Ground();
  Ground2 ground2 = Ground2();
  Bird bird = Bird();
  Pipe pipe = Pipe("pipe2.png");
  Pipe pipe2 = Pipe("pipe1.png");
  late GameText textScore;
  Coin coin = Coin();

  late AudioPool fly;

  @override
  Future<void>? onLoad() async {
    add(bg);
    add(bg2);

    add(pipe);
    pipe.add(RectangleHitbox());
    add(pipe2);
    pipe2.add(RectangleHitbox());

    textScore = GameText('Score: $score', 10, 10, BasicPalette.black.color, 20);
    add(textScore);
    add(ground);
    ground.add(RectangleHitbox());

    add(ground2);
    ground2.add(RectangleHitbox());

    add(coin);
    coin.add(CircleHitbox());

    add(bird);
    bird.add(RectangleHitbox());

    fly = await AudioPool.create("audio/sfx/wing.ogg", maxPlayers: 1);

    return super.onLoad();
  }

  gameOverPause() {
    if (gameOver) {
      overlays.add("endscreen");
      pauseEngine();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    textScore.text = "Score: $score";
    pipe2.position.y = pipe.y + pipe.height + 200;
    coin.y = pipe.y + pipe.height + 100 - coin.height / 2;
    coin.x = pipe.x + pipe.width / 2 - (coin.width / 2);
    gameOverPause();
  }

  @override
  void onTap() {
    if (bird.y > 0) {
      bird.vel -= 15;
      fly.start();
    } else {
      bird.y = 0;
    }
    super.onTap();
  }
}
