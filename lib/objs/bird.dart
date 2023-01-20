import 'package:flame/components.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flutterbird/objs/coin.dart';
import 'package:flutterbird/objs/ground.dart';
import 'package:flutterbird/objs/pipe.dart';

import '../util/util.dart';
import 'obj.dart';

class Bird extends Obj {
  int grav = 1;
  int vel = 2;

  late AudioPool colide;
  late AudioPool coin;

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("bird1.png");
    size = Vector2(60, 50);

    colide = await AudioPool.create("audio/sfx/hit.ogg", maxPlayers: 1);
    coin = await AudioPool.create("audio/sfx/point.ogg", maxPlayers: 1);
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
      colide.start();
    } else if (other is Pipe) {
      gameOver = true;
      colide.start();
    } else if (other is Coin) {
      // other.removeFromParent();
      if (other.visible) {
        coin.start();
      }
      other.visible = false;
    }
    super.onCollision(intersectionPoints, other);
  }
}
