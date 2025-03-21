import 'package:flutter/material.dart';
import 'widgets/category_item.dart';
import 'widgets/recommended_item.dart';
import 'widgets/bottom_nav_item.dart';

/* Authored by: Justin B. Goleta
Company: Dabesteam
Project: Snapvel
Feature: [FEATURECODE-001] Feature title
Description: This will be the home screen of the Snapvel app. 
It has the buttons to access the application’s main features 
such as sharing/posting pictures. As well as image editing and 
creating albums to share or post.
 */
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // Default selected index (Home)

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 600),
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                          bottom: 80), // Space for bottom nav
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(),
                          const SizedBox(height: 20),
                          _buildGreeting(),
                          const SizedBox(height: 20),
                          _buildSearchBar(),
                          const SizedBox(height: 24),
                          _buildCategoriesSection(),
                          const SizedBox(height: 24),
                          _buildRecommendedSection(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _buildBottomNavigation(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.deepPurple, // Dark Purple Background
      ),
      padding:
          const EdgeInsets.symmetric(vertical: 6), // Reduced height slightly
      constraints: const BoxConstraints(maxWidth: 600),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.add, 'Create', 0),
          _navItem(Icons.share, 'Post', 1),
          _navItem(Icons.home, 'Home', 2),
          _navItem(Icons.article, 'Feed', 3),
          _navItem(Icons.photo, 'Gallery', 4),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onNavItemTapped(index),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none, // Allows the circle to overflow the navbar
        children: [
          if (isSelected)
            Positioned(
              top: -20, // Move the circle upwards to overlap the navigation bar
              child: Container(
                width: 90, // Increased circle size
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
              ),
            ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.white70,
                size: 30, // Slightly larger for better visibility
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu, size: 24, color: Color(0xFF1A1A1A)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'JUAN DELA CRUZ',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF1A1A1A)),
            ),
            Text(
              'jcruz@gmail.com',
              style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
          ],
        ),
        const Icon(Icons.person, size: 24, color: Color(0xFF1A1A1A)),
      ],
    );
  }

  Widget _buildGreeting() {
    return const Text(
      'Hey Juan, Good Day!',
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A)),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search places',
          hintStyle: const TextStyle(color: Color(0xFF666666), fontSize: 16),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF666666)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'All Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            Row(
              children: const [
                Text(
                  'See All',
                  style: TextStyle(color: Color(0xFF666666), fontSize: 14),
                ),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, size: 16, color: Color(0xFF666666)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Wrap in SingleChildScrollView to ensure horizontal scrolling works
        SizedBox(
          height: 160,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enables sideways scrolling
            child: Row(
              children: const [
                CategoryItem(
                  imageUrl:
                      'https://media.istockphoto.com/id/1442179368/photo/maldives-island.jpg?s=612x612&w=0&k=20&c=t38FJQ6YhyyZGN91A8tpn3nz9Aqcy_aXolImsOXOZ34=',
                  name: 'Beach',
                ),
                SizedBox(width: 12),
                CategoryItem(
                  imageUrl:
                      'https://images.stockcake.com/public/b/c/4/bc47d6bb-9ad3-4e30-8232-933b8255cdf5_large/mountain-reflection-view-stockcake.jpg',
                  name: 'Mountain',
                ),
                SizedBox(width: 12),
                CategoryItem(
                  imageUrl:
                      'https://images.unsplash.com/photo-1425913397330-cf8af2ff40a1?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Zm9ycmVzdHxlbnwwfHwwfHx8MA%3D%3D',
                  name: 'Forrest',
                ),
                SizedBox(width: 12),
                CategoryItem(
                  imageUrl:
                      'https://i2.pickpik.com/photos/664/823/655/architecture-buildings-business-city-preview.jpg',
                  name: 'City',
                ),
                SizedBox(width: 12),
                CategoryItem(
                  imageUrl: 'https://placehold.co/600x400/4682B4/4682B4',
                  name: 'Lake',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recommended',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A)),
            ),
            Row(
              children: const [
                Text('See All',
                    style: TextStyle(color: Color(0xFF666666), fontSize: 14)),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, size: 16, color: Color(0xFF666666)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const RecommendedItem(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgNgh9wEuxP21KK_JEDLHeep9q9Q6w5HsxjA&s',
          title: 'Padre Pio',
          location: 'Green Valley Panicuason, Naga City',
          rating: 4.7,
          deliveryType: 'Free',
          duration: '20 min',
        ),
      ],
    );
  }
}
