import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  const ProfileScreen({super.key, required this.username});

  Widget _buildStatItem(String value, String label, String assetPath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 6),
            Image.asset(assetPath, width: 20, height: 20),
          ],
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 14)),
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
                arguments: {'username': username},
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
              Navigator.pushReplacementNamed(
                context,
                '/story_mode',
                arguments: {'username': username},
              );
            },
            child: Image.asset('assets/Menu2.png', width: 24, height: 24),
          ),
          GestureDetector(
            onTap: () {
              // Already on Profile screen
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Image.asset('assets/Menu3.png', width: 28, height: 28),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Color(0xFF9C4DFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
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
    final bottomNavBarHeight = 56.0;
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Color(0xFFCCE0FF), // Unified background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'PROFILE',
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Header
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF9C4DFF), Color(0xFF7A2EFF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/profile_bg_pattern.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.purple.withOpacity(0.1),
                            BlendMode.dstATop,
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                      padding: EdgeInsets.only(top: 24, bottom: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: 45,
                                color: Color(0xFF9C4DFF),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          // Added username display below profile picture
                          Text(
                            username,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  offset: Offset(0, 1),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildStatItem(
                                  '01',
                                  'Fire Streak',
                                  'assets/Streak.png',
                                ),
                                _buildStatItem(
                                  '1.2K',
                                  'Stars',
                                  'assets/Star.png',
                                ),
                                _buildStatItem(
                                  '001',
                                  'Trophies',
                                  'assets/Medal.png',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    // Achievements Section
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Achievements',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9C4DFF),
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/Medal.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Champion',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/Star.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Star Player',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/Streak.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Fire Streak',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    // Recent Activity Section
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      padding: EdgeInsets.all(16),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recent Activity',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9C4DFF),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'No recent activity available.',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }
}
