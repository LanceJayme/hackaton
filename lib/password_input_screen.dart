import 'package:flutter/material.dart';

class PasswordInputScreen extends StatefulWidget {
  final String username;
  final String language;

  const PasswordInputScreen({
    super.key,
    required this.username,
    required this.language,
  });

  @override
  _PasswordInputScreenState createState() => _PasswordInputScreenState();
}

class _PasswordInputScreenState extends State<PasswordInputScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  bool get _isCompleteEnabled {
    return _passwordController.text.isNotEmpty &&
        _passwordController.text == _confirmPasswordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F7FF),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 48, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Input',
              style: TextStyle(color: Colors.black87, fontSize: 18),
            ),
            Text(
              'PASSWORD',
              style: TextStyle(
                color: Color(0xFF7C4DFF),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              obscureText: !_confirmPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _confirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _confirmPasswordVisible = !_confirmPasswordVisible;
                    });
                  },
                ),
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Keep your data secured by having a unique password.',
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ),
                  Icon(Icons.volume_up, color: Colors.black54),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/Cody3Half.png',
                width: 160,
                height: 160,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed:
                  _isCompleteEnabled
                      ? () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/loadingSetup',
                          arguments: {'username': widget.username},
                        );
                      }
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _isCompleteEnabled ? Color(0xFF4CAF50) : Colors.grey,
                minimumSize: Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'COMPLETE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
