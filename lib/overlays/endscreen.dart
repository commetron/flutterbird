import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutterbird/overlays/startscreen.dart';
import 'package:flutterbird/util/util.dart';

import '../game/maingame.dart';

Widget endScreen(BuildContext context, MainGame game) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.max,
    children: [
      Image.asset("assets/images/gameover.png"),
      GestureDetector(
        onTap: () {
          gameOver = false;
          score = 0;
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const StartScreen();
            },
          ));
        },
        child: Image.asset("assets/images/go.png"),
      )
    ],
  );
}
