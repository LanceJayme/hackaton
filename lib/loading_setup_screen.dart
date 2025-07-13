import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoadingSetupScreen extends StatefulWidget {
  final String username;
  LoadingSetupScreen({required this.username});

  @override
  _LoadingSetupScreenState createState() => _LoadingSetupScreenState();
}

class _LoadingSetupScreenState extends State<LoadingSetupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasError = false;
  bool _errorStep = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          if (_animation.value >= 0.5 && !_hasError) {
            _hasError = true;
          }
          if (_animation.value >= 1.0 && !_errorStep) {
            _errorStep = true;
          }
        });
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFace() {
    if (_hasError && !_errorStep) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              'Oh no! An error occured! My system\'s broken!',
              style: TextStyle(color: Colors.black87, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          Image.asset(
            'assets/CodyError.png',
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
        ],
      );
    } else if (_hasError && _errorStep) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              'Let\'s see what might have went wrong and help me get better!',
              style: TextStyle(color: Colors.black87, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          Image.asset(
            'assets/CodyError.png',
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/CodySetup.png',
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
        ],
      );
    }
  }

  Widget _buildMessage() {
    if (_hasError) {
      return Text(
        _errorStep ? 'TAP TO PROCEED' : 'SYSTEM FAILED.',
        style: TextStyle(
          color: _errorStep ? Colors.white : Color(0xFF7C4DFF),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else {
      return Text(
        'SETTING UP...',
        style: TextStyle(
          color: Color(0xFF7C4DFF),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    }
  }

  void _onTap() {
    if (_hasError && !_errorStep) {
      setState(() {
        _errorStep = true;
      });
    } else if (_hasError && _errorStep) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(username: widget.username),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _hasError && !_errorStep
              ? Color(0xFF2E2540)
              : (_hasError && _errorStep ? Colors.black : Colors.white),
      body: GestureDetector(
        onTap: _onTap,
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(48, 0, 48, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFace(),
                SizedBox(
                  height: 8,
                ), // Adjusted from 0 to 8 to align loading bar level
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: _animation.value,
                    color: _hasError ? Color(0xFF7C4DFF) : Color(0xFF7C4DFF),
                    backgroundColor:
                        _hasError ? Color(0xFF2E2540) : Color(0xFFE0E0E0),
                    minHeight: 8,
                  ),
                ),
                SizedBox(height: 16),
                _buildMessage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SmilePainter extends CustomPainter {
  final bool hasError;
  SmilePainter({this.hasError = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = hasError ? Colors.white : Color(0xFF7C4DFF)
          ..strokeWidth = 3
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 1.2,
      size.width,
      size.height * 0.6,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
