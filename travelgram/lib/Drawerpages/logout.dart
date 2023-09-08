import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:travelgram/Login/signuppage/login.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Signout {
  Future<Login1> signOut1(BuildContext context) async {
    AlertDialog alert =
        AlertDialog(title: const Text('Do you want to Sign Out?'), actions: [
      SizedBox(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 69, 142, 150),
                  disabledForegroundColor:
                      const Color.fromARGB(255, 0, 0, 0).withOpacity(0.38)),
              clipBehavior: Clip.hardEdge,
              child: const Text('Yes'),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login1()));
              },
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 205, 44, 44)),
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]),
      )
    ]);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    return const Login1();
  }
}

Widget? login2(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
        title:
            const Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("You're not Logged In"),
          SizedBox(
            height: 5,
          ),
        ]),
        content: const Text('   Tap on Login Button For Login'),
        actions: [
          const SizedBox(width: 8),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 205, 44, 44)),
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green.shade400),
            child: const Text('Login'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login1()));
            },
          )
        ]),
  );
  return null;
}
