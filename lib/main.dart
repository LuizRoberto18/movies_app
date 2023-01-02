import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/homeScreen.dart';
import 'package:movies_app/screens/movie_detail_screen.dart';
import 'package:movies_app/screens/onboarding_screen.dart';
import 'package:movies_app/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      home: const OnboardingScreen(),
      routes: {
        AppRoutes.logonScreen: (ctx) => const OnboardingScreen(),
        AppRoutes.homeScreen: (ctx) => const HomeScreen(),
        AppRoutes.movieDetailScreen: (ctx) => const MovieDetailScreen(),
      },
    );
  }
}
