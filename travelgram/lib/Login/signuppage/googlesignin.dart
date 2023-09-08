import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelgram/Navbars/gnav.dart';

class GoogleAuth {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signinwithgoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? user = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await user!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      _auth.signInWithCredential(credential);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Gnav1()));
    } catch (error) {
      Fluttertoast.showToast(msg: "Error : $error");
    }
  }
}
