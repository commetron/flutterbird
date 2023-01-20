import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutterbird/objs/bg.dart';
import 'package:flutterbird/objs/bird.dart';
import 'package:flutterbird/objs/ground.dart';
import 'package:flutterbird/util/util.dart';

class MainGame extends FlameGame with HasCollisionDetection, TapDetector {
  Bg bg = Bg();
  Bg2 bg2 = Bg2();
  Ground ground = Ground();
  Ground2 ground2 = Ground2();
  Bird bird = Bird();
  @override
  Future<void>? onLoad() async {
    add(bg);
    add(bg2);
    add(ground);
    ground.add(RectangleHitbox());
    add(ground2);
    ground2.add(RectangleHitbox());
    add(bird);
    bird.add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

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
