import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelgram/Login/signuppage/signup.dart';
import 'package:travelgram/Navbars/gnav.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

bool _passenable = true;
final _password = TextEditingController();

class _Login1State extends State<Login1> {
  late SystemMouseCursor cursor;
  final _email = TextEditingController();
  bool isHovering = false;
  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void initState() {
    super.initState();
    cursor = SystemMouseCursors.basic;
  }

  void onHoverStateChanged(bool isHovering) {
    setState(() {
      this.isHovering = isHovering;
    });
  }

  void login(
    String email,
    String password,
  ) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text)
          .then((uid) => {Fluttertoast.showToast(msg: 'Login Successful')})
          .catchError((e) {
        Fluttertoast.showToast(msg: '$e');
        return e;
      });
      _password.clear();
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Gnav1(),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const Offset begin = Offset(1.0, 0.0);
            const Offset end = Offset.zero;
            const Curve curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    }
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      Fluttertoast.showToast(msg: 'Login Successful');
      // Successful sign-in, proceed with the application
    } catch (error) {
      // Handle sign-in error
      Fluttertoast.showToast(msg: 'Google Sign-In error: $error');
    }
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            body: SingleChildScrollView(
                child: Form(
                    key: _formkey,
                    autovalidateMode: AutovalidateMode.always,
                    child: SafeArea(
                      top: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "Hello Again",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Row(children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const Gnav1(),
                                        transitionDuration:
                                            const Duration(seconds: 1),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const Offset begin = Offset(1.0, 0.0);
                                          const Offset end = Offset.zero;
                                          const Curve curve = Curves.easeInOut;

                                          var tween = Tween(
                                                  begin: begin, end: end)
                                              .chain(CurveTween(curve: curve));
                                          var offsetAnimation =
                                              animation.drive(tween);

                                          return SlideTransition(
                                              position: offsetAnimation,
                                              child: child);
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text("Login as Guest",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_right,
                                      size: 25, color: Colors.green),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Gnav1()));
                                  },
                                )
                              ])
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  "Images/Transition wipe.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Container(
                                alignment: Alignment.topCenter,
                                child: Image.network(
                                  "https://t3.ftcdn.net/jpg/04/54/02/88/360_F_454028890_YAM5KPK9MmuSRG9ZrffVLIeuApja5DT2.jpg",
                                ),
                              ),
                              const Align(
                                  alignment: Alignment.center,
                                  child: Text("Travelgram",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                      ))),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xffd9d9d9)),
                                child: TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    controller: _email,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) =>
                                        EmailValidator.validate(value!)
                                            ? null
                                            : "Please enter a valid email",
                                    keyboardType: TextInputType.emailAddress,
                                    minLines: 1,
                                    enableSuggestions: true,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 12.0),
                                      alignLabelWithHint: true,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(
                                              255, 126, 125, 125)),
                                    )),
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xffd9d9d9)),
                                  child: Stack(children: [
                                    TextFormField(
                                        style: const TextStyle(
                                            color: Colors.black),
                                        obscureText: _passenable,
                                        textInputAction: TextInputAction.next,
                                        controller: _password,
                                        validator: (value) {
                                          RegExp regex = RegExp(r'^.{6,}$');
                                          if (value!.isEmpty) {
                                            return ("Password is required for login");
                                          }
                                          if (!regex.hasMatch(value)) {
                                            return ("Enter Valid Password(Min. 6 Character)");
                                          }
                                          return null;
                                        },
                                        minLines: 1,
                                        maxLength: 6,
                                        enableSuggestions: true,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          border: InputBorder.none,
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _passenable = !_passenable;
                                              });
                                            },
                                            child: Icon(
                                              _passenable
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: const Color.fromARGB(
                                                  255, 126, 125, 125),
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 12.0),
                                          alignLabelWithHint: true,
                                          hintText: 'Password',
                                          hintStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(
                                                  255, 126, 125, 125)),
                                        )),
                                  ]))),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 45,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        login(_email.text, _password.text);
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color.fromARGB(
                                                      255, 10, 191, 4)),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8)))),
                                      child: const Text(
                                        'Sign In',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )))),
                          // const SizedBox(
                          //   height: 8,
                          // ),
                          // const Text(
                          //   "or continue with",
                          //   style: TextStyle(
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.normal,
                          //   ),
                          // ),
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       Padding(
                          //           padding:
                          //               const EdgeInsets.symmetric(horizontal: 16),
                          //           child: InkWell(
                          //             onTap: () {
                          //               GoogleAuth().signinwithgoogle(context);
                          //               Navigator.push(
                          //                   context,
                          //                   MaterialPageRoute(
                          //                       builder: (context) =>
                          //                           const Gnav1()));
                          //             },
                          //             child: const Icon(FlutterIcons.google_faw),
                          //           )),
                          //       Container(
                          //           width: 50,
                          //           height: 50,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(8)),
                          //           child: InkWell(
                          //             onTap: () {
                          //               // submit(email.text, password.text);
                          //             },
                          //             child: const Icon(FlutterIcons.app_store_ent),
                          //           )),
                          //     ]),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Don't have an account?",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Signup1()));
                                        },
                                        child: Text("Register",
                                            style: TextStyle(
                                              decoration: isHovering
                                                  ? TextDecoration.underline
                                                  : TextDecoration.none,
                                              decorationColor:
                                                  const Color.fromARGB(
                                                      255, 43, 121, 185),
                                              color: isHovering
                                                  ? const Color.fromARGB(
                                                      255, 43, 121, 185)
                                                  : const Color.fromARGB(
                                                      255, 47, 138, 234),
                                              decorationThickness: 2,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ))),
                                    const SizedBox(
                                      height: 15,
                                    )
                                  ])),
                        ],
                      ),
                    )))));
  }
}
