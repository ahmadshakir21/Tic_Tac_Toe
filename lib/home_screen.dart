import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool OTurn = true; // the first player is O
  var myStyleText = GoogleFonts.poppins(
      color: const Color(0xFF004369),
      fontSize: 25,
      fontWeight: FontWeight.w500);
  int OScore = 0;
  int XScore = 0;
  int filledBoxes = 0;
  List<String> displayEandO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void tapped(int index) {
    setState(() {
      if (OTurn && displayEandO[index] == '') {
        displayEandO[index] = 'O';
        filledBoxes++;
      } else if (!OTurn && displayEandO[index] == '') {
        displayEandO[index] = 'X';
        filledBoxes++;
      }

      OTurn = !OTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    // check 1st row
    if (displayEandO[0] == displayEandO[1] &&
        displayEandO[0] == displayEandO[2] &&
        displayEandO[0] != '') {
      showWinDialog(displayEandO[0]);
    }
    // check 2nd row
    if (displayEandO[3] == displayEandO[4] &&
        displayEandO[3] == displayEandO[5] &&
        displayEandO[3] != '') {
      showWinDialog(displayEandO[3]);
    }
    // check 3rd row
    if (displayEandO[6] == displayEandO[7] &&
        displayEandO[6] == displayEandO[8] &&
        displayEandO[6] != '') {
      showWinDialog(displayEandO[6]);
    }
    // check 1st column
    if (displayEandO[0] == displayEandO[3] &&
        displayEandO[0] == displayEandO[6] &&
        displayEandO[0] != '') {
      showWinDialog(displayEandO[0]);
    }
    // check 2nd column
    if (displayEandO[1] == displayEandO[4] &&
        displayEandO[1] == displayEandO[7] &&
        displayEandO[1] != '') {
      showWinDialog(displayEandO[1]);
    }
    // check 3rd column
    if (displayEandO[2] == displayEandO[5] &&
        displayEandO[2] == displayEandO[8] &&
        displayEandO[2] != '') {
      showWinDialog(displayEandO[2]);
    }
    // check diagonal
    if (displayEandO[6] == displayEandO[4] &&
        displayEandO[6] == displayEandO[2] &&
        displayEandO[6] != '') {
      showWinDialog(displayEandO[6]);
    }
    // check diagonal
    if (displayEandO[0] == displayEandO[4] &&
        displayEandO[0] == displayEandO[8] &&
        displayEandO[0] != '') {
      showWinDialog(displayEandO[0]);
    } else if (filledBoxes == 9) {
      showDrawDialog();
    }
  }

  void showWinDialog(String winner) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          "Winner is : $winner",
          style: const TextStyle(color: Color(0xFF004369)),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(primary: const Color(0xFFDB1F48)),
              child: const Text(
                "Play Again!",
              ))
        ],
      ),
    );

    if (winner == 'O') {
      OScore++;
    } else if (winner == 'X') {
      XScore++;
    }
  }

  void showDrawDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          "Draw",
          style: TextStyle(color: Color(0xFF004369)),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(primary: const Color(0xFFDB1F48)),
              child: const Text(
                "Play Again!",
              ))
        ],
      ),
    );
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayEandO[i] = '';
      }
    });
    filledBoxes = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE5DDC8),
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player X",
                          style: myStyleText,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          XScore.toString(),
                          style: myStyleText,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player O",
                          style: myStyleText,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          OScore.toString(),
                          style: myStyleText,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () => tapped(index),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFF004369), width: 2),
                        ),
                        child: Center(
                            child: Text(
                          displayEandO[index],
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF004369), fontSize: 40),
                        ))),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      "Do you Want to reset this game ? ",
                      style: TextStyle(color: Color(0xFF004369)),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF004369)),
                                child: const Text("No")),
                          ),
                          Container(
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {
                                  OScore = 0;
                                  XScore = 0;
                                  clearBoard();
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFFDB1F48)),
                                child: const Text("Yes")),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(primary: const Color(0xFFDB1F48)),
              child: Text(
                "Reset",
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w500),
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
