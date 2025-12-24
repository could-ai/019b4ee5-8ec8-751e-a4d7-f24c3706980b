import 'package:flutter/material.dart';
import 'package:couldai_user_app/features/home/home_screen.dart';
import 'package:couldai_user_app/features/auth/auth_screen.dart';

void main() {
  runApp(const SynthesisApp());
}

class SynthesisApp extends StatelessWidget {
  const SynthesisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Синтез',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6200EE), // Deep Purple/Blue vibe
          brightness: Brightness.dark, // Music apps often look better in dark mode
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
      },
    );
  }
}
