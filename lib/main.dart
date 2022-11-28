import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/game_starting.dart';
import 'package:tic_tac_toe_game/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameStarting(),
    );
  }
}
