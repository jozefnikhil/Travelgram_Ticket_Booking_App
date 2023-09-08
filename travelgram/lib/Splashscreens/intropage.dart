import 'package:flutter/material.dart';
import 'package:travelgram/Splashscreens/animated.dart';

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({super.key});

  @override
  State<Splashscreen1> createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Animatedsplash(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 194, 255, 245),
        body: Center(
            child: Column(children: [
          Stack(
            children: [
              Image.network(
                "https://t3.ftcdn.net/jpg/04/54/02/88/360_F_454028890_YAM5KPK9MmuSRG9ZrffVLIeuApja5DT2.jpg",
                width: 360,
                height: 640,
              ),
              Positioned(
                bottom: 50,
                left: 70,
                child: Image.asset(
                  "Images/Transition wipe.png",
                  fit: BoxFit.fill,
                ),
              ),
              const Positioned(
                  bottom: 120,
                  left: 105,
                  child: Text("Travelgram",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      )))
            ],
          )
        ])));
  }
}

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://i.pinimg.com/736x/f6/af/e6/f6afe6f23420c8d98e4ec2d9d4c2be8f--travel-by-train-light-rail.jpg",
            width: 360,
            height: 668,
            fit: BoxFit.fill,
          ),
          const Positioned(
            top: 18,
            left: 8,
            child: Text("Start Your",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                )),
          ),
          const Positioned(
              top: 60,
              left: 8,
              child: Text("Journey With Us",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  )))
        ],
      ),
    );
  }
}
