import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  HomeScreen({required this.username});

  Widget _buildDayIndicator(String day, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        day,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildRecommendedBox(Color color) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F7FF),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 48, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 12, backgroundColor: Color(0xFF7C4DFF)),
                SizedBox(width: 8),
                Text(
                  'Welcome, ',
                  style: TextStyle(color: Color(0xFF7C4DFF), fontSize: 16),
                ),
                Text(
                  username,
                  style: TextStyle(
                    color: Color(0xFF7C4DFF),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Image.asset(
                  'assets/CodyFace3.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDayIndicator('S', Colors.grey.shade300, Colors.black54),
                _buildDayIndicator('M', Color(0xFFFFB74D), Colors.white),
                _buildDayIndicator('T', Colors.grey.shade300, Colors.black54),
                _buildDayIndicator('W', Color(0xFF64B5F6), Colors.white),
                _buildDayIndicator('T', Colors.grey.shade300, Colors.black54),
                _buildDayIndicator('F', Colors.grey.shade300, Colors.black54),
                _buildDayIndicator('S', Colors.grey.shade300, Colors.black54),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Start Learning',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFF7C4DFF),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Recommended',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildRecommendedBox(Color(0xFFF06292)),
                _buildRecommendedBox(Color(0xFFFF8A65)),
                _buildRecommendedBox(Color(0xFF81C784)),
                _buildRecommendedBox(Color(0xFF4FC3F7)),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
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
                      // TODO: Implement navigation to home
                    },
                    child: Image.asset(
                      'assets/Menu1.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Image.asset('assets/Menu2.png', width: 24, height: 24),
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement navigation to current screen
                    },
                    child: Image.asset(
                      'assets/Menu3.png',
                      width: 24,
                      height: 56,
                    ),
                  ),
                  Image.asset('assets/Menu4.png', width: 24, height: 24),
                  Image.asset('assets/Menu5.png', width: 24, height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
