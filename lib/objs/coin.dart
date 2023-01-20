import 'package:flame/components.dart';
import 'package:flutterbird/objs/obj.dart';

class Coin extends Obj {
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("0.png");
    size = Vector2(60, 60);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    animation(8, 5, '');
    super.update(dt);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
  }
}
