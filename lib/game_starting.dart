import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/animation/custom_page_route.dart';
import 'package:tic_tac_toe_game/home_screen.dart';

class GameStarting extends StatelessWidget {
  const GameStarting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE5DDC8),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 135,
                width: 135,
                child: Image.asset("assets/images/tic-tac-toe (2).png"),
              ),
              // Container(
              //   height: 60,
              //   width: MediaQuery.of(context).size.width * 0.85,
              //   child: ElevatedButton(
              //       onPressed: () {
              //         Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => const HomeScreen(),
              //         ));
              //       },
              //       style: ElevatedButton.styleFrom(
              //           primary: const Color(0xFF000000)),
              //       child: Text(
              //         "Start Gaming",
              //         style: GoogleFonts.poppins(
              //             fontSize: 25, fontWeight: FontWeight.w500),
              //       )),
              // ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(CustomPageRoute(child: const HomeScreen()));
              },
              style: ElevatedButton.styleFrom(primary: const Color(0xFF004369)),
              child: Text(
                "Start Gaming",
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w500),
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
