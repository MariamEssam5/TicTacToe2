import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohturn = false;
  var myTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontFamily: 'Pacifico',
  );
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  int XScore = 0;
  int OScore = 0;
  int filledBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Player X",
                              style: myTextStyle,
                            ),
                            Text(
                              "$XScore",
                              style: myTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Player O",
                              style: myTextStyle,
                            ),
                            Text(
                              "$OScore",
                              style: myTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            _tapped(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade700),
                            ),
                            child: Center(
                              child: Text(
                                displayXO[index],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      "TIC TAC TOE",
                      style: myTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohturn == true && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBox++;
      } else if (!ohturn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBox++;
      }
      ohturn = !ohturn;
      checkWinner();
    });
  }

  void checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      showWinner(displayXO[0]);
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      showWinner(displayXO[3]);
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      showWinner(displayXO[6]);
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      showWinner(displayXO[1]);
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      showWinner(displayXO[2]);
    }
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      showWinner(displayXO[6]);
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      showWinner(displayXO[0]);
    } else if (filledBox == 9) {
      showDrawDialoge();
    }
  }

  void showWinner(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "WINNER IS : $winner",
            style: TextStyle(fontFamily: 'Pacifico'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              child: Text(
                "Play Again!",
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            )
          ],
        );
      },
    );
    if (winner == 'O') {
      OScore++;
    } else if (winner == 'X') {
      XScore++;
    }
    clearBoard();
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
    filledBox = 0;
  }

  void showDrawDialoge() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "DRAW!",
            style: TextStyle(fontFamily: 'Pacifico'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              child: Text(
                "Play Again!",
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            )
          ],
        );
      },
    );
  }
}
