import 'package:flutter/material.dart';
import 'user_data.dart';

class SettingsScreen extends StatelessWidget {
  final String username;
  SettingsScreen({super.key, required this.username}) {
    UserData().setUsername(username);
  }

  void _logout(BuildContext context) {
    UserData().setUsername('');
    Navigator.pushNamedAndRemoveUntil(context, '/language', (route) => false);
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF9C4DFF),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF9C4DFF)),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
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
              Navigator.pushReplacementNamed(
                context,
                '/games',
                arguments: {'username': UserData().getUsername()},
              );
            },
            child: Image.asset('assets/Menu4.png', width: 24, height: 24),
          ),
          GestureDetector(
            onTap: () {
              // Already on Settings screen
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/Menu5.png', width: 24, height: 24),
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
              'SETTINGS',
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
      body: ListView(
        children: [
          _buildSectionTitle('Account'),
          _buildSettingItem('Change Username', Icons.person, () {
            // Placeholder for change username action
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Change Username tapped')));
          }),
          _buildSettingItem('Change Password', Icons.lock, () {
            // Placeholder for change password action
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Change Password tapped')));
          }),
          Divider(),
          _buildSectionTitle('Preferences'),
          _buildSettingItem('Notifications', Icons.notifications, () {
            // Placeholder for notifications toggle
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Notifications tapped')));
          }),
          _buildSettingItem('Privacy', Icons.privacy_tip, () {
            // Placeholder for privacy settings
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Privacy tapped')));
          }),
          Divider(),
          _buildSectionTitle('Support'),
          _buildSettingItem('Help & Feedback', Icons.help, () {
            // Placeholder for help and feedback
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Help & Feedback tapped')));
          }),
          _buildSettingItem('Logout', Icons.exit_to_app, () {
            _logout(context);
          }),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}
