import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/maingame.dart';
import 'endscreen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return GameWidget(
                game: MainGame(),
                overlayBuilderMap: {"endscreen": endScreen},
              );
            },
          ));
        },
        child: Image.asset(
          "assets/images/startscreen.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
