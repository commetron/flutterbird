import 'package:flame/components.dart';
import 'package:flutterbird/objs/coin.dart';
import 'package:flutterbird/objs/ground.dart';
import 'package:flutterbird/objs/pipe.dart';

import '../util/util.dart';
import 'obj.dart';

class Bird extends Obj {
  int grav = 1;
  int vel = 2;

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("bird1.png");
    size = Vector2(60, 50);
    return super.onLoad();
  }

  gravity() {
    if (vel <= 5) {
      vel += grav;
    }

    y += vel;
  }

  @override
  void update(double dt) {
    animation(8, 3, 'bird');
    gravity();
    super.update(dt);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    position.y = 100;
    position.x = 100;
    super.onGameResize(gameSize);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Ground) {
      gameOver = true;
    } else if (other is Pipe) {
      gameOver = true;
    } else if (other is Coin) {
      // other.removeFromParent();
      other.visible = false;
    }
    super.onCollision(intersectionPoints, other);
  }
}
