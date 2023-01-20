import 'package:flame/game.dart';
import 'package:flutterbird/objs/bg.dart';
import 'package:flutterbird/objs/bird.dart';
import 'package:flutterbird/objs/ground.dart';

class MainGame extends FlameGame with HasCollisionDetection {
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
    add(ground2);
    add(bird);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
