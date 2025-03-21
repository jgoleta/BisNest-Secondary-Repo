import 'package:flutter/material.dart';
import 'package:snapvel/screens/onboarding_screen1.dart';

class SnapvelIntroScreen extends StatelessWidget {
  const SnapvelIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned(
            top: -10,
            right: 10,
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image(image: AssetImage('images/splash_top_right.png')),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: -30,
            child: SizedBox(
              width: 200,
              height: 100,
              child: Image(image: AssetImage('images/splash_bottom_left.png')),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 249,
                    height: 249,
                    padding: const EdgeInsets.all(10),
                    child: const Center(
                      child: Image(
                        image: AssetImage('images/snapvel_logo.png'),
                        width: 230,
                        height: 230,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Snapvel',
                    style: TextStyle(
                      color: Color(0xFF1F214D),
                      fontFamily: 'Sen',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnboardingScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F214D),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Let's Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
