import 'package:flutter/material.dart';
import 'user_data.dart';

class CommonNavigationBar extends StatelessWidget {
  final int currentIndex;
  final String username;

  const CommonNavigationBar({
    super.key,
    required this.currentIndex,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': 'assets/Navbar/Home.png', 'label': 'Home', 'route': '/home'},
      {
        'icon': 'assets/Navbar/Lesson.png',
        'label': 'Learn',
        'route': '/story_mode'
      },
      {
        'icon': 'assets/Navbar/Profile.png',
        'label': 'Profile',
        'route': '/profile'
      },
      {
        'icon': 'assets/Navbar/Games.png',
        'label': 'Mini Games',
        'route': '/games'
      },
      {
        'icon': 'assets/Navbar/Settings.png',
        'label': 'Settings',
        'route': '/settings'
      },
    ];

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFFF0F7FF),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = currentIndex == index;
          return GestureDetector(
            onTap: () {
              if (index != currentIndex) {
                Navigator.pushReplacementNamed(
                  context,
                  item['route']!,
                  arguments: {'username': username},
                );
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 3,
                  width: 40,
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFF9C4DFF) : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: 6),
                Image.asset(
                  item['icon']!,
                  width: 24,
                  height: 24,
                  color: isSelected ? Color(0xFF9C4DFF) : Colors.grey,
                ),
                SizedBox(height: 4),
                Text(
                  item['label']!,
                  style: TextStyle(
                    color: isSelected ? Color(0xFF9C4DFF) : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
