import 'package:flutter/material.dart';
import 'user_data.dart';
import 'common_navigation_bar.dart';

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
    return CommonNavigationBar(
      currentIndex: 4,
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
