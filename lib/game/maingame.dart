import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutterbird/objs/bg.dart';
import 'package:flutterbird/objs/bird.dart';
import 'package:flutterbird/objs/coin.dart';
import 'package:flutterbird/objs/ground.dart';
import 'package:flutterbird/objs/pipe.dart';
import 'package:flutterbird/util/util.dart';

class MainGame extends FlameGame with HasCollisionDetection, TapDetector {
  Bg bg = Bg();
  Bg2 bg2 = Bg2();
  Ground ground = Ground();
  Ground2 ground2 = Ground2();
  Bird bird = Bird();
  Pipe pipe = Pipe("pipe2.png");
  Pipe pipe2 = Pipe("pipe1.png");

  Coin coin = Coin();
  @override
  Future<void>? onLoad() async {
    add(bg);
    add(bg2);

    add(pipe);
    pipe.add(RectangleHitbox());
    add(pipe2);
    pipe2.add(RectangleHitbox());

    add(ground);
    ground.add(RectangleHitbox());

    add(ground2);
    ground2.add(RectangleHitbox());

    add(coin);
    coin.add(CircleHitbox());

    add(bird);
    bird.add(RectangleHitbox());

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    pipe2.position.y = pipe.y + pipe.height + 200;
    coin.y = pipe.y + pipe.height + 100 - coin.height / 2;
    coin.x = pipe.x + pipe.width / 2 - (coin.width / 2);
    if (gameOver) {
      pauseEngine();
    }
  }

  @override
  void onTap() {
    if (bird.y > 0) {
      bird.vel -= 15;
    }
    super.onTap();
  }
}
