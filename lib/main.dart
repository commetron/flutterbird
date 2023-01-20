import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutterbird/overlays/startscreen.dart';

void main() {
  WidgetsFlutterBinding();
  Flame.device.fullScreen();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    ),
  );
}
