import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'screens/home.dart';
import 'screens/settings.dart';

void main() => runApp(IslamicWisdomApp());

class IslamicWisdomApp extends StatefulWidget {
  @override
  _IslamicWisdomAppState createState() => _IslamicWisdomAppState();
}

class _IslamicWisdomAppState extends State<IslamicWisdomApp> {
  ThemeMode _themeMode = ThemeMode.light;
  double _fontSize = 16;
  Locale _locale = Locale('ur');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic Wisdom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF0B4F88),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.black87)),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: HomeScreen(onOpenSettings: () async {
        final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen(themeMode: _themeMode, fontSize: _fontSize, locale: _locale)));
        if (result != null && result is Map) {
          setState(() {
            _themeMode = result['themeMode'] ?? _themeMode;
            _fontSize = result['fontSize'] ?? _fontSize;
            _locale = result['locale'] ?? _locale;
          });
        }
      }),
    );
  }
}
