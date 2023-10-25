import 'package:flutter/material.dart';
import 'package:yuzuncu_yil/screens/videoPlayer.dart';

void main() {
  runApp(TrApp());
}

bool isDarkMode = false;

class TrApp extends StatefulWidget {
  @override
  State<TrApp> createState() => _TrAppState();
}

class _TrAppState extends State<TrApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode
          ? ThemeData.dark().copyWith(backgroundColor: Colors.black)
          : ThemeData.light(),
      home: VideoPlayerScreen(),
    );
  }
}
