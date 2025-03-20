import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // White Card Background
          Positioned(
            top: 233,
            left: 0,
            right: 0,
            child: Container(
              height: 579,
              decoration: BoxDecoration(
                color: Color(0xFF1F214D),
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
            ),
          ),
          
          // Back Button
          Positioned(
            top: 50,
            left: 24,
            child: CircleAvatar(
              radius: 22.5,
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back, color: Color(0xFF5E616F)),
            ),
          ),
          
          // Logo
          Positioned(
            top: 39,
            left: 133,
            child: Container(
              width: 94,
              height: 94,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/snapvel_2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          // Sign Up Header
          Positioned(
            top: 123,
            left: 124,
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF98B00),
              ),
            ),
          ),
          
          Positioned(
            top: 160,
            left: 75,
            child: Text(
              'Please sign up to get started',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF98B00),
              ),
            ),
          ),
          
          // Input Fields
          Positioned(
            top: 257,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInputField('Name', 'John Doe'),
                SizedBox(height: 10),
                buildInputField('Email', 'example@gmail.com'),
                SizedBox(height: 10),
                buildInputField('Password', '**********', isPassword: true),
                SizedBox(height: 10),
                buildInputField('Re-Type Password', '**********', isPassword: true),
              ],
            ),
          ),
          
          // Sign Up Button
          Positioned(
            top: 720,
            left: 24,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFBD69),
                minimumSize: Size(327, 62),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(String label, String hint, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 327,
          height: 62,
          decoration: BoxDecoration(
            color: Color(0xFFF0F5FA),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color(0xFFA0A5BA),
                      letterSpacing: isPassword ? 4.0 : 0,
                    ),
                  ),
                ),
              ),
              if (isPassword)
                Icon(Icons.visibility_off, color: Color(0xFFA0A5BA)),
            ],
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SignUpScreen(),
  ));
}
