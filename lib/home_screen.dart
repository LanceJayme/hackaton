import 'package:flutter/material.dart';
import 'user_data.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  HomeScreen({super.key, required this.username}) {
    UserData().setUsername(username);
  }

  Widget _buildDayIndicator(
    String day,
    String dayNumber,
    Color bgColor,
    Color textColor,
  ) {
    return Container(
      width: 48,
      height: 64,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
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

  Widget _buildRecommendedBox(Color color, double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F7FF),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 48, 24, 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  CircleAvatar(radius: 12, backgroundColor: Color(0xFF9C4DFF)),
                  SizedBox(width: 8),
                  Text(
                    'Welcome, ',
                    style: TextStyle(color: Color(0xFF9C4DFF), fontSize: 16),
                  ),
                  Text(
                    username,
                    style: TextStyle(
                      color: Color(0xFF9C4DFF),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/ChatbotIcon.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Date indicators container
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFB3D1FF),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildDayIndicator(
                        'S',
                        '01',
                        Colors.white,
                        Colors.black54,
                      ),
                      SizedBox(width: 8),
                      _buildDayIndicator(
                        'M',
                        '02',
                        Color(0xFFFFB74D),
                        Colors.white,
                      ),
                      SizedBox(width: 8),
                      _buildDayIndicator(
                        'T',
                        '02',
                        Colors.white,
                        Colors.black54,
                      ),
                      SizedBox(width: 8),
                      _buildDayIndicator(
                        'W',
                        '02',
                        Color(0xFF64B5F6),
                        Colors.white,
                      ),
                      SizedBox(width: 8),
                      _buildDayIndicator(
                        'T',
                        '02',
                        Colors.white,
                        Colors.black54,
                      ),
                      SizedBox(width: 8),
                      _buildDayIndicator(
                        'F',
                        '02',
                        Colors.white,
                        Colors.black54,
                      ),
                      SizedBox(width: 8),
                      _buildDayIndicator(
                        'S',
                        '02',
                        Colors.white,
                        Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Start Learning section
              Text(
                'Start Learning',
                style: TextStyle(
                  color: Color(0xFF9C4DFF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF9C4DFF),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              SizedBox(height: 24),
              // Recommended section
              Text(
                'Recommended',
                style: TextStyle(
                  color: Color(0xFF9C4DFF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              LayoutBuilder(
                builder: (context, constraints) {
                  double boxSize = (constraints.maxWidth - 12) / 2;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildRecommendedBox(Color(0xFFF06292), boxSize),
                          SizedBox(width: 12),
                          _buildRecommendedBox(Color(0xFFFF8A65), boxSize),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildRecommendedBox(Color(0xFF81C784), boxSize),
                          SizedBox(width: 12),
                          _buildRecommendedBox(Color(0xFF4FC3F7), boxSize),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xFFF0F7FF),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                  arguments: {'username': username},
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/Menu1.png', width: 24, height: 24),
                  SizedBox(height: 4),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Color(0xFF9C4DFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/story_mode',
                  arguments: {'username': UserData().getUsername()},
                );
              },
              child: Image.asset('assets/Menu2.png', width: 24, height: 24),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/profile',
                  arguments: {'username': UserData().getUsername()},
                );
              },
              child: Image.asset('assets/Menu3.png', width: 24, height: 56),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/games');
              },
              child: Image.asset('assets/Menu4.png', width: 24, height: 24),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/settings');
              },
              child: Image.asset('assets/Menu5.png', width: 24, height: 24),
            ),
          ],
        ),
      ),
    );
  }
}
