import 'package:flutter/material.dart';
import 'dart:async';
import 'model/game_level.dart';

class GamePage extends StatefulWidget {
  final GameLevel level;
  const GamePage({super.key, required this.level});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<String> images;
  late List<bool> flipped;
  int? firstIndex;
  bool busy = false;
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _setupGame();
  }

  void _setupGame() {
    List<String> allImages = [
      'assets/images/dino.png',
      'assets/images/dino.png',
      'assets/images/octo.png',
      'assets/images/octo.png',
      'assets/images/peacock.png',
      'assets/images/peacock.png',
      'assets/images/rabbit.png',
      'assets/images/rabbit.png',
      'assets/images/seahorse.png',
      'assets/images/seahorse.png',
      'assets/images/shark.png',
      'assets/images/shark.png',
      'assets/images/wolf.png',
      'assets/images/wolf.png',
      'assets/images/zoo.png',
      'assets/images/zoo.png',
    ];

    int numPairs = (widget.level.rows * widget.level.columns) ~/ 2;
    images = allImages.sublist(0, numPairs * 2);
    images.shuffle();
    flipped = List.filled(images.length, false);
  }

  void flipCard(int index) {
    if (busy || flipped[index]) return;
    setState(() {
      flipped[index] = true;
    });

    if (firstIndex == null) {
      firstIndex = index;
    } else {
      busy = true;
      tries++;
      if (images[firstIndex!] == images[index]) {
        score++;
        firstIndex = null;
        busy = false;
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            flipped[firstIndex!] = false;
            flipped[index] = false;
            firstIndex = null;
            busy = false;
          });
        });
      }
    }

    if (flipped.every((element) => element)) {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Game Completed! 🎉"),
        content: Text("Tries: $tries\nScore: $score"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _setupGame();
                tries = 0;
                score = 0;
                firstIndex = null;
                busy = false;
              });
            },
            child: const Text("Restart"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text("Back to Menu"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memory Game - ${widget.level.name}"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Tries: $tries  |  Score: $score",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.level.columns,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => flipCard(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: flipped[index] ? Colors.white : Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: flipped[index]
                        ? Image.asset(images[index], width: 50, height: 50)
                        : const Icon(Icons.help_outline,
                            size: 40, color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
