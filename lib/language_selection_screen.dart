import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  final String username;
  const LanguageSelectionScreen({super.key, required this.username});

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;

  final Map<String, String> languageMessages = {
    'ENGLISH': 'Are you sure? We\'ll use English from now on.',
    'TAGALOG': 'Sigurado ka na ba? Tagalog ang gagamitin natin simula ngayon.',
    'CEBUANO': 'Sigurado na ka? Magamit ta og Bisaya sugod karon.',
  };

  @override
  Widget build(BuildContext context) {
    String welcomeMessage =
        selectedLanguage != null
            ? languageMessages[selectedLanguage!]!.replaceAll(
              '{User}',
              widget.username.isNotEmpty ? widget.username : 'User',
            )
            : '';

    return Scaffold(
      backgroundColor: Color(0xFFF0F7FF),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 48, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose a',
              style: TextStyle(color: Colors.black87, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              'LANGUAGE',
              style: TextStyle(
                color: Color(0xFF7C4DFF),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Column(
              children:
                  ['ENGLISH', 'TAGALOG', 'CEBUANO'].map((lang) {
                    final isSelected = selectedLanguage == lang;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedLanguage = lang;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isSelected ? Color(0xFF7C4DFF) : Colors.white,
                          foregroundColor:
                              isSelected ? Colors.white : Colors.black87,
                          minimumSize: Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: isSelected ? 4 : 0,
                        ),
                        child: Text(
                          lang,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 16),
            if (selectedLanguage != null)
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
                        welcomeMessage,
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
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      selectedLanguage == null
                          ? [Colors.grey, Colors.grey]
                          : [Color(0xFF7C4DFF), Color(0xFF6A3EFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed:
                    selectedLanguage == null
                        ? null
                        : () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/username',
                            arguments: {
                              'username': widget.username,
                              'language': selectedLanguage,
                            },
                          );
                        },
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    color:
                        selectedLanguage == null
                            ? Colors.black38
                            : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
