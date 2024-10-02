import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart'; // Add avatar_glow package for glowing effect
import 'package:tictactoe/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title "TIC TAC TOE"
            Text(
              'TIC TAC TOE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily:
                    'Pacifico', // Ensure you have added the custom font in pubspec.yaml
              ),
            ),
            const SizedBox(height: 50),

            AvatarGlow(
              endRadius: 120.0,
              glowColor: Colors.white,
              duration: const Duration(seconds: 2),
              repeat: true,
              repeatPauseDuration: const Duration(seconds: 1),
              child: Material(
                elevation: 8.0,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[900],
                  radius: 60.0,
                  child: Icon(
                    Icons.grid_3x3,
                    color: Colors.white,
                    size: 120,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            const SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text(
                'PLAY GAME',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
