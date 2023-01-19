import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(GameWidget(game: MainGame()));
}

class MainGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
