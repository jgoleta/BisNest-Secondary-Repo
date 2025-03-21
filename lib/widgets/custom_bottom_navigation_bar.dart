import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle,
                    color:
                        index == currentIndex ? Colors.orange : Colors.white),
                Text(
                  ['Create', 'Post', 'Home', 'Feed', 'Gallery'][index],
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
