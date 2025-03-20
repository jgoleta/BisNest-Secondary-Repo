import 'package:flutter/material.dart';
import 'widgets/category_item.dart';
import 'widgets/recommended_item.dart';
import 'widgets/bottom_nav_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        // Extra space for bottom navigation
                        const SizedBox(height: 80),
                      ],
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

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          size: 24,
          color: Color(0xFF1A1A1A),
          semanticLabel: 'Menu',
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'JUAN DELA CRUZ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF1A1A1A),
              ),
              semanticsLabel: 'User name',
            ),
            Text(
              'jcruz@gmail.com',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF666666),
              ),
              semanticsLabel: 'User email',
            ),
          ],
        ),
        const Icon(
          Icons.person,
          size: 24,
          color: Color(0xFF1A1A1A),
          semanticLabel: 'Profile',
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return const Text(
      'Hey Juan, Good Day!',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1A1A1A),
      ),
      semanticsLabel: 'Greeting message',
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
          hintStyle: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 16,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF666666),
          ),
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
              semanticsLabel: 'All Categories section',
            ),
            Row(
              children: const [
                Text(
                  'See All',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: Color(0xFF666666),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CategoryItem(
                imageUrl: 'https://placehold.co/600x400/87CEEB/87CEEB',
                name: 'Beach',
              ),
              SizedBox(width: 12),
              CategoryItem(
                imageUrl: 'https://placehold.co/600x400/4B7F52/4B7F52',
                name: 'Mountain',
              ),
              SizedBox(width: 12),
              CategoryItem(
                imageUrl: 'https://placehold.co/600x400/808080/808080',
                name: 'City',
              ),
            ],
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
                color: Color(0xFF1A1A1A),
              ),
              semanticsLabel: 'Recommended section',
            ),
            Row(
              children: const [
                Text(
                  'See All',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: Color(0xFF666666),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const RecommendedItem(
          imageUrl: 'https://placehold.co/600x400/228B22/228B22',
          title: 'Padre Pio',
          location: 'Green Valley Panicuason, Naga City',
          rating: 4.7,
          deliveryType: 'Free',
          duration: '20 min',
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          BottomNavItem(
            icon: Icons.add,
            label: 'Create',
          ),
          BottomNavItem(
            icon: Icons.share,
            label: 'Post',
          ),
          BottomNavItem(
            icon: Icons.home,
            label: 'Home',
          ),
          BottomNavItem(
            icon: Icons.article,
            label: 'Feed',
          ),
          BottomNavItem(
            icon: Icons.photo,
            label: 'Gallery',
          ),
        ],
      ),
    );
  }
}

