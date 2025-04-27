import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostScreen(),
    );
  }
}

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  // Action when the POST button is pressed
  void onPostPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Post"),
          content: const Text("Are you sure you want to post this?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Implement the post action, like saving the post or sending data
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Post Created Successfully!')),
                );
              },
              child: const Text("YES"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("NO"),
            ),
          ],
        );
      },
    );
  }

  // Action when the CANCEL button is pressed
  void onCancelPressed(BuildContext context) {
    // For example, clear form fields or navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Action Cancelled')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: 375,
          height: 812,
          child: Stack(
            children: [
              // Navigation Bar Background
              Positioned(
                left: -6,
                top: 749,
                child: Container(
                  width: 385,
                  height: 62,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F214D),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              // Yellow Circle Button
              Positioned(
                left: 85,
                top: 745,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFBD69),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Top User Info
              Positioned(
                left: 24,
                top: 54,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFFECF0F4),
                      radius: 22.5,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Juan Dela Cruz',
                          style: TextStyle(
                            color: Color(0xFF1F214D),
                            fontFamily: 'Sen',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'jcruz@gmail.com',
                          style: TextStyle(
                            color: Color(0xFF676767),
                            fontFamily: 'Sen',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Home Button (now for Account)
              Positioned(
                left: 306,
                top: 54,
                child: CircleAvatar(
                  radius: 22.5,
                  backgroundColor: Color(0xFF1F214D),
                  child: Icon(Icons.account_circle, color: Colors.white),
                ),
              ),
              // Rectangle for add photo
              Positioned(
                left: 14,
                top: 141,
                child: Container(
                  width: 337,
                  height: 152,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              // Add photo icon and label
              Positioned(
                left: 168,
                top: 189,
                child: Opacity(
                  opacity: 0.7,
                  child: Icon(Icons.add_a_photo, size: 28),
                ),
              ),
              Positioned(
                left: 149,
                top: 217,
                child: Text(
                  'Add Photo',
                  style: TextStyle(
                    fontFamily: 'Sofia Sans',
                    fontSize: 16,
                    color: Color.fromRGBO(30, 29, 29, 0.53),
                  ),
                ),
              ),
              // Second rectangle for post input
              Positioned(
                left: 289,
                top: 782,
                child: Text(
                  'Gallery',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 782,
                child: Text(
                  'Create',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 103,
                top: 782,
                child: Text(
                  'Post',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF181C2E),
                  ),
                ),
              ),
              Positioned(
                left: 243,
                top: 782,
                child: Text(
                  'Feed',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 168,
                top: 782,
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              // Example "Location" Input Rectangle
              Positioned(
                left: 20,
                top: 325,
                child: Container(
                  width: 328,
                  height: 48.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Location',
                        style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Yellow Box below Location
              Positioned(
                left: 20,
                top: 385,
                child: GestureDetector(
                  onTap: () => onPostPressed(
                      context), // Action when Post button is pressed
                  child: Container(
                    width: 328,
                    height: 48.5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFBD69), // Yellow Color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Align(
                        alignment: Alignment.center, // Changed to center
                        child: Text(
                          'POST',
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 445,
                child: GestureDetector(
                  onTap: () => onCancelPressed(
                      context), // Action when Cancel button is pressed
                  child: Container(
                    width: 328,
                    height: 48.5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6), // Gray Color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Align(
                        alignment: Alignment.center, // Center the text
                        child: Text(
                          'CANCEL',
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 16,
                            color: Color(0xFF1F214D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
