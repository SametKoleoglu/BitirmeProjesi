import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yuzuncu_yil/screens/home_screen.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/giris.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.addListener(() {
            if (_controller.value.isPlaying) {
              // Video oynatılıyor
            } else if (_controller.value.isCompleted) {
              // Video oynatma tamamlandı
              _navigateToHomeScreen(); // Video tamamlandığında HomeScreen'e git
            }
          });
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  void _navigateToHomeScreen() {
    _controller.pause(); // Videoyu durdur
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
