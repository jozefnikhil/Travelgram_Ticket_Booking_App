import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelgram/Login/signuppage/login.dart';
import 'package:travelgram/Navbars/gnav.dart';
import 'package:video_player/video_player.dart';

class Animatedsplash extends StatefulWidget {
  const Animatedsplash({super.key});

  @override
  State<Animatedsplash> createState() => _AnimatedsplashState();
}

class _AnimatedsplashState extends State<Animatedsplash> {
  late VideoPlayerController _playerController;
  var auth = FirebaseAuth.instance;
  var isLogin = false;

  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    _playerController =
        VideoPlayerController.asset('Images/animation_lkiho78u.mp4')
          ..initialize().then((_) {
            setState(() {});
          })
          ..setVolume(0);

    _playvideo();
    checkIfLogin();
    super.initState();
  }

  void _playvideo() async {
    _playerController.play();

    await Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => isLogin ? const Gnav1() : const Login1(),
          ));
    });
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Start Your Journey With Us",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                _playerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _playerController.value.aspectRatio,
                        child: VideoPlayer(_playerController),
                      )
                    : Container()
              ]),
        ));
  }
}
