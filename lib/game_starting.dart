import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/home_screen.dart';

class GameStarting extends StatelessWidget {
  const GameStarting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFB6E2D3),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset("assets/images/tic-tac-toe (1).png"),
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF000000)),
                    child: Text(
                      "Start Gaming",
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
