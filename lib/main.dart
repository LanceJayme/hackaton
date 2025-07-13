import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'user_name_screen.dart';
import 'language_selection_screen.dart';
import 'password_input_screen.dart';
import 'loading_setup_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(CodyGoApp());
}

class CodyGoApp extends StatelessWidget {
  const CodyGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodyGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/username': (context) => UserNameScreen(),
        '/language': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
          final username =
              args != null && args.containsKey('username')
                  ? args['username'] as String
                  : '';
          return LanguageSelectionScreen(username: username);
        },
        '/passwordInput': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
          final username =
              args != null && args.containsKey('username')
                  ? args['username'] as String
                  : '';
          final language =
              args != null && args.containsKey('language')
                  ? args['language'] as String
                  : '';
          return PasswordInputScreen(username: username, language: language);
        },
        '/loadingSetup': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
          final username =
              args != null && args.containsKey('username')
                  ? args['username'] as String
                  : '';
          return LoadingSetupScreen(username: username);
        },
        '/home': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
          final username =
              args != null && args.containsKey('username')
                  ? args['username'] as String
                  : '';
          return HomeScreen(username: username);
        },
      },
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}
