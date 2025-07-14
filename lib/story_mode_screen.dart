import 'package:flutter/material.dart';
import 'user_data.dart';

import 'package:flutter/material.dart';
import 'user_data.dart';

class StoryModeScreen extends StatelessWidget {
  final String username;
  StoryModeScreen({super.key, required this.username}) {
    UserData().setUsername(username);
  }

  Widget _buildMemoryFile({
    required Color color,
    required String title,
    required int lessons,
    required int miniGames,
    required bool locked,
  }) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.computer, color: Colors.white, size: 32),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.menu_book, size: 16, color: Colors.white70),
                        SizedBox(width: 4),
                        Text(
                          '$lessons lessons',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.videogame_asset,
                          size: 16,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '$miniGames mini games',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: locked ? 0.0 : 0.6,
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.greenAccent,
                      ),
                      minHeight: 6,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Icon(
                locked ? Icons.lock : Icons.play_circle_fill,
                color: Colors.white,
                size: 32,
              ),
            ],
          ),
        ),
        if (locked)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Text(
                'Unlock this by completing the previous file',
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
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
              Navigator.pushReplacementNamed(
                context,
                '/home',
                arguments: {'username': UserData().getUsername()},
              );
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
              // Already on Story Mode screen
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/Menu2.png', width: 24, height: 24),
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
                '/profile',
                arguments: {'username': username},
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F7FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'STORY MODE',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Image.asset(
              'assets/ChatbotIcon.png',
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Codey’s Memory Files',
                style: TextStyle(
                  color: Color(0xFF9C4DFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Help Codey recover his memory by unlocking each corrupted file',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              SizedBox(height: 16),
              _buildMemoryFile(
                color: Color(0xFFB39DDB),
                title: 'Know Your Computer',
                lessons: 6,
                miniGames: 3,
                locked: false,
              ),
              _buildMemoryFile(
                color: Color(0xFFCE93D8),
                title: 'Codey’s Language',
                lessons: 8,
                miniGames: 3,
                locked: true,
              ),
              _buildMemoryFile(
                color: Color(0xFF90CAF9),
                title: 'Coding Fundamentals',
                lessons: 8,
                miniGames: 3,
                locked: true,
              ),
              _buildMemoryFile(
                color: Color(0xFFA5D6A7),
                title: 'Programming Language',
                lessons: 8,
                miniGames: 3,
                locked: true,
              ),
              _buildMemoryFile(
                color: Color(0xFFCE93D8),
                title: 'Using Python',
                lessons: 8,
                miniGames: 3,
                locked: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }
}
