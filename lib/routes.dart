import 'package:flutter/material.dart';
import 'package:lerionote/models/note.dart';
import 'package:lerionote/screens/edit_add_note_screen/edit_add_note_screen.dart';
import 'package:lerionote/screens/homepage/homepage_screen.dart';
import 'package:lerionote/screens/splash_screen/splash_screen.dart';

class RouteManager {
  static const String homePage = '/';
  static const String editAddNoteScreen = '/editAddNote';
  static const String splashScreen = '/splashScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arg;
    if (settings.arguments != null) {
      arg = settings.arguments as Map<String, dynamic>;
    }

    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => const HomePageScreen());

      case editAddNoteScreen:
        if (arg != null && arg['note'] != null) {
          return MaterialPageRoute(
              builder: (context) => EditAddNoteScreen(note: arg['note']));
        } else {
          return MaterialPageRoute(
              builder: (context) => const EditAddNoteScreen());
        }

      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      default:
        throw const FormatException("Route non trovato");
    }
  }
}
