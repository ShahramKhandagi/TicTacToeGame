import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe_game/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTurnO = true;

  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];

  int filledBoxes = 0;
  bool gameHasResult = false;

  int scoreO = 0;
  int scoreX = 0;

  String winnerTitle = '';

  int? item0 = null;
  int? item1 = null;
  int? item2 = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainBackground,
        appBar: AppBar(
          title: Text('Tic Tac Toe'),
          centerTitle: true,
          backgroundColor: mainBackground,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                clearGame();
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                getScoreBoard(),
                SizedBox(
                  height: 20,
                ),
                getResultButton(),
                SizedBox(
                  height: 20,
                ),
                getGridView(),
                getTurnText(),
              ],
            ),
          ),
        ));
  }

  Widget getTurnText() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: itemBackground,
      ),
      height: 50,
      width: 100,
      child: Center(
        child: Text(
          isTurnO ? 'Turn O' : 'Turn X',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget getGridView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: itemBackground,
                ),
                height: 100,
                width: 100,
                child: Center(
                  child: Image(
                    width: 70,
                    color: xAndOColor(xOrOList[index]),
                    image: AssetImage(
                      returnImage(index),
                    ),
                  ),
                  // Text(
                  //   xOrOList[index],
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: xOrOList[index] == 'X'
                  //         ? Colors.red[800]
                  //         : Colors.blue[800],
                  //     fontSize: 40,
                  //   ),
                  // ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String returnImage(int index) {
    if (xOrOList[index] == 'X') {
      return 'images/X.png';
    } else if (xOrOList[index] == 'O') {
      return 'images/O.png';
    } else {
      return 'images/em.jpg';
    }
  }

  Color xAndOColor(String index) {
    if (index == 'X') {
      return xColor;
    } else if (index == 'O') {
      return oColor;
    } else {
      return itemBackground;
    }
  }

  void tapped(int index) {
    setState(
      () {
        if (xOrOList[index] == '') {
          if (gameHasResult == true) {
            gameHasResult = false;
            clearGame();
          }
          if (isTurnO) {
            xOrOList[index] = 'O';
          } else {
            xOrOList[index] = 'X';
          }

          isTurnO = !isTurnO;
          filledBoxes++;

          checkWinner();
        }
      },
    );
  }

  void checkWinner() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'winner is ${xOrOList[0]}');
      item0 = 0;
      item1 = 1;
      item2 = 2;
      return;
    }
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      setResult(xOrOList[3], 'winner is ${xOrOList[3]}');
      item0 = 3;
      item1 = 4;
      item2 = 5;
      return;
    }
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      setResult(xOrOList[6], 'winner is ${xOrOList[6]}');
      item0 = 6;
      item1 = 7;
      item2 = 8;
      return;
    }

    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'winner is ${xOrOList[0]}');
      item0 = 0;
      item1 = 3;
      item2 = 6;
      return;
    }

    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      setResult(xOrOList[1], 'winner is ${xOrOList[1]}');
      item0 = 1;
      item1 = 4;
      item2 = 7;
      return;
    }

    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2], 'winner is ${xOrOList[2]}');
      item0 = 2;
      item1 = 5;
      item2 = 8;
      return;
    }

    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2], 'winner is ${xOrOList[2]}');
      item0 = 2;
      item1 = 4;
      item2 = 6;
      return;
    }

    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'winner is ${xOrOList[0]}');
      item0 = 0;
      item1 = 4;
      item2 = 8;
      return;
    }

    if (filledBoxes == 8) {
      setResult('', 'Draw');
    }
  }

  Widget getScoreBoard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: oColor,
          ),
          height: 78,
          width: 120,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player O',
                  style: TextStyle(
                    color: itemBackground,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '$scoreO',
                style: TextStyle(
                  color: itemBackground,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: xColor,
          ),
          height: 78,
          width: 120,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player X',
                  style: TextStyle(
                    color: itemBackground,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '$scoreX',
                style: TextStyle(
                  color: itemBackground,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getResultButton() {
    return Visibility(
      visible: gameHasResult,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: itemBackground,
        ),
        height: 50,
        width: 300,
        child: Center(
          child: TextButton(
            onPressed: () {
              setState(() {
                gameHasResult = false;
                clearGame();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                '$winnerTitle, Play Again!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setResult(String winner, String title) {
    setState(
      () {
        gameHasResult = true;
        winnerTitle = title;
        if (winner == 'X') {
          scoreX++;
        } else if (winner == 'O') {
          scoreO++;
        } else {
          scoreO++;
          scoreX++;
        }
      },
    );
  }

  void clearGame() {
    setState(
      () {
        for (int i = 0; i < xOrOList.length; i++) {
          xOrOList[i] = '';
        }
      },
    );
    item0 = null;
    item1 = null;
    item2 = null;

    filledBoxes = 0;
  }
}
