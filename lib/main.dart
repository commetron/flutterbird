import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import 'game/maingame.dart';

void main() {
  runApp(
    GameWidget(
      game: MainGame(),
      overlayBuilderMap: const {"endscreen": endScreen},
    ),
  );
}

Widget endScreen(BuildContext context, MainGame game) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.max,
    children: [
      Image.asset("assets/images/gameover.png"),
      GestureDetector(
        onTap: () {},
        child: Image.asset("assets/images/go.png"),
      )
    ],
  );
}
