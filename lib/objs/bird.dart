import 'package:flame/components.dart';

import 'obj.dart';

class Bird extends Obj {
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("bird1.png");
    size = Vector2(60, 50);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    animation(8, 3, 'bird');
    super.update(dt);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    position.y = gameSize.y / 2;
    position.x = 100;
    super.onGameResize(gameSize);
  }
}
