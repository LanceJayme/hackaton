import 'package:flutter/material.dart';
import 'user_data.dart';
import 'common_navigation_bar.dart';

class GamesScreenRedesign extends StatelessWidget {
  final String username;
  GamesScreenRedesign({super.key, required this.username}) {
    UserData().setUsername(username);
  }

  void _navigateToPage(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: {'username': UserData().getUsername()},
    );
  }

  Widget _buildGameCard({
    required String title,
    required String description,
    required Color color,
    required IconData icon,
    required String imagePath,
    required VoidCallback onTap,
    bool isLocked = false,
    String lockedMessage = 'Complete previous games',
  }) {
    return GestureDetector(
      onTap: isLocked ? null : onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(icon, color: Colors.white, size: 28),
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
                            Text(
                              description,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '4.8',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          isLocked ? 'Locked' : 'Play',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isLocked)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock, color: Colors.white, size: 32),
                        SizedBox(height: 8),
                        Text(
                          lockedMessage ?? 'Complete previous games',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF9C4DFF),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
            'Your Progress',
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
              _buildProgressItem('Games Played', '12', Icons.games),
              _buildProgressItem('High Score', '1,250', Icons.emoji_events),
              _buildProgressItem(
                  'Streak', '3 days', Icons.local_fire_department),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFF9C4DFF), size: 24),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return CommonNavigationBar(
      currentIndex: 3,
      username: UserData().getUsername() ?? '',
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
          'MINI GAMES',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressIndicator(),
            _buildSectionTitle('Start Learning'),
            _buildGameCard(
              title: 'Code Adventure',
              description: 'Learn coding basics through fun challenges',
              color: Color(0xFFBB3EFF),
              icon: Icons.code,
              imagePath: 'assets/Home Screen/game 1.png',
              onTap: () {
                // Navigate to Code Adventure
              },
            ),
            _buildSectionTitle('Test Your Knowledge'),
            _buildGameCard(
              title: 'Quiz Master',
              description: 'Test your programming knowledge',
              color: Color(0xFFFF3E9A),
              icon: Icons.quiz,
              imagePath: 'assets/Home Screen/game 2.png',
              onTap: () {
                // Navigate to Quiz Master
              },
            ),
            _buildGameCard(
              title: 'Bug Hunter',
              description: 'Find and fix bugs in code',
              color: Color(0xFFFF8A3E),
              icon: Icons.bug_report,
              imagePath: 'assets/Home Screen/game 3.png',
              onTap: () {
                // Navigate to Bug Hunter
              },
            ),
            _buildSectionTitle('Test Your Coding Skills'),
            _buildGameCard(
              title: 'Algorithm Challenge',
              description: 'Solve complex algorithm problems',
              color: Color(0xFF3EFF7E),
              icon: Icons.functions,
              imagePath: 'assets/Home Screen/game 4.png',
              onTap: () {
                // Navigate to Algorithm Challenge
              },
            ),
            _buildGameCard(
              title: 'Code Sprint',
              description: 'Speed coding challenges',
              color: Color(0xFF3EBAFF),
              icon: Icons.speed,
              imagePath: 'assets/Home Screen/story mode.png',
              onTap: () {
                // Navigate to Code Sprint
              },
            ),
            _buildSectionTitle('Test Your Digital Literacy'),
            _buildGameCard(
              title: 'Cyber Security',
              description: 'Learn about online safety',
              color: Color(0xFF3EFF7E),
              icon: Icons.security,
              imagePath: 'assets/Home Screen/streak.png',
              onTap: () {
                // Navigate to Cyber Security
              },
            ),
            _buildGameCard(
              title: 'Digital Detective',
              description: 'Spot fake news and scams',
              color: Color(0xFF3EBAFF),
              icon: Icons.search,
              imagePath: 'assets/Home Screen/game 1.png',
              onTap: () {
                // Navigate to Digital Detective
              },
              isLocked: true,
              lockedMessage: 'Complete 5 games to unlock',
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}
