import 'package:flutter/material.dart';
import 'user_data.dart';

class GamesScreen extends StatelessWidget {
  final String username;
  GamesScreen({super.key, required this.username}) {
    UserData().setUsername(username);
  }

  void _navigateToPage(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: {'username': UserData().getUsername()},
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF9C4DFF),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildColorBox(
    Color color, {
    double height = 120,
    double width = double.infinity,
  }) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              _navigateToPage(context, '/home');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Image.asset('assets/Menu1.png', width: 24, height: 24),
                ),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _navigateToPage(context, '/story_mode');
            },
            child: Image.asset('assets/Menu2.png', width: 24, height: 24),
          ),
          GestureDetector(
            onTap: () {
              _navigateToPage(context, '/profile');
            },
            child: Image.asset('assets/Menu3.png', width: 24, height: 56),
          ),
          GestureDetector(
            onTap: () {
              // Already on Games screen
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/Menu4.png', width: 24, height: 24),
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
              _navigateToPage(context, '/settings');
            },
            child: Image.asset('assets/Menu5.png', width: 24, height: 24),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F7FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'TRAINING',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Start Learning'),
            _buildColorBox(Color(0xFFBB3EFF)),
            _buildSectionTitle('Test your Knowledge'),
            Row(
              children: [
                Expanded(child: _buildColorBox(Color(0xFFFF3E9A), height: 120)),
                Expanded(child: _buildColorBox(Color(0xFFFF8A3E), height: 120)),
              ],
            ),
            _buildSectionTitle('Test your Coding Skills'),
            Row(
              children: [
                Expanded(child: _buildColorBox(Color(0xFF3EFF7E), height: 120)),
                Expanded(child: _buildColorBox(Color(0xFF3EBAFF), height: 120)),
              ],
            ),
            _buildSectionTitle('Test your Digital Literacy'),
            Row(
              children: [
                Expanded(child: _buildColorBox(Color(0xFF3EFF7E), height: 120)),
                Expanded(child: _buildColorBox(Color(0xFF3EBAFF), height: 120)),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}
