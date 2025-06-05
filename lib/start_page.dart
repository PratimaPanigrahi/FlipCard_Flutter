import 'package:flutter/material.dart';
import 'game_page.dart';
import 'model/game_level.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            
            // Game Icon
            Image.asset('assets/images/game_icon.png', width: 120),
            
            const SizedBox(height: 20),
            
            // Title
            const Text(
              "Memory Card Game",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(color: Colors.black54, blurRadius: 8, offset: Offset(2, 2)),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Level Buttons
            _buildLevelButton(context, "Easy ", GameLevel.easy, Colors.green),
            _buildLevelButton(context, "Medium", GameLevel.medium, Colors.orange),
            _buildLevelButton(context, "Hard ", GameLevel.hard, Colors.red),
            
            const Spacer(),

            // Footer Text
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Match the cards & have fun!",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelButton(BuildContext context, String text, GameLevel level, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          elevation: 5,
        ),
        onPressed: () => _startGame(context, level),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  void _startGame(BuildContext context, GameLevel level) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GamePage(level: level)),
    );
  }
}
