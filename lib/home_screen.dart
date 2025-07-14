import 'package:flutter/material.dart';
import 'user_data.dart';
import 'chatbot_overlay.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  HomeScreen({super.key, required this.username});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Widget _buildDayIndicator(
      String day, String dayNumber, Color bgColor, Color textColor) {
    return Container(
      width: 40,
      height: 56,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayNumber,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 4),
          Text(
            day,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedBox(String assetPath, double width) {
    return Container(
      width: width,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          assetPath,
          width: width,
          height: 140,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    final items = [
      {'icon': 'assets/Navbar/Home.png', 'label': 'Home'},
      {'icon': 'assets/Navbar/Lesson.png', 'label': 'Learn'},
      {'icon': 'assets/Navbar/Profile.png', 'label': 'Profile'},
      {'icon': 'assets/Navbar/Games.png', 'label': 'Mini Games'},
      {'icon': 'assets/Navbar/Settings.png', 'label': 'Settings'},
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
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              String route = '';
              switch (index) {
                case 0:
                  route = '/home';
                  break;
                case 1:
                  route = '/story_mode';
                  break;
                case 2:
                  route = '/profile';
                  break;
                case 3:
                  route = '/games';
                  break;
                case 4:
                  route = '/settings';
                  break;
              }
              Navigator.pushReplacementNamed(
                context,
                route,
                arguments: {'username': widget.username},
              );
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

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double recommendedBoxWidth = (screenWidth - 48) / 2;

    return ChatbotOverlay(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(text: 'Welcome, '),
                          TextSpan(
                            text: widget.username,
                            style: TextStyle(color: Color(0xFF9C4DFF)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Let's learn something new today!",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Start Learning',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/story_mode',
                    arguments: {'username': widget.username},
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: AssetImage('assets/Home Screen/story mode.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 56,
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDayIndicator('S', '01', Colors.white, Colors.black54),
                    _buildDayIndicator(
                        'M', '02', Color(0xFFFFB74D), Colors.white),
                    _buildDayIndicator('T', '03', Colors.white, Colors.black54),
                    _buildDayIndicator(
                        'W', '04', Color(0xFF64B5F6), Colors.white),
                    _buildDayIndicator('T', '05', Colors.white, Colors.black54),
                    _buildDayIndicator('F', '06', Colors.white, Colors.black54),
                    _buildDayIndicator('S', '07', Colors.white, Colors.black54),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Recommended',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  _buildRecommendedBox(
                      'assets/Home Screen/game 1.png', recommendedBoxWidth),
                  _buildRecommendedBox(
                      'assets/Home Screen/game 2.png', recommendedBoxWidth),
                ],
              ),
              Row(
                children: [
                  _buildRecommendedBox(
                      'assets/Home Screen/game 3.png', recommendedBoxWidth),
                  _buildRecommendedBox(
                      'assets/Home Screen/game 4.png', recommendedBoxWidth),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
}
