import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travelgram/Login/signuppage/login.dart';

class Signup1 extends StatefulWidget {
  const Signup1({super.key});

  @override
  State<Signup1> createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {
  late SystemMouseCursor cursor;
  final InputDecoration inputDecoration = const InputDecoration(
    border: InputBorder.none,
  );
  bool isHovering = false;

  final _confirmpassword = TextEditingController();
  final _confirmpassword1 = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _hide = true;
  final _mnum = TextEditingController();
  final _name = TextEditingController();
  bool _passenable = true;
  final _password = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          const Row(children: [
            SizedBox(
              width: 18,
            ),
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            )
          ]),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffd9d9d9)),
                child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{3,}$');
                      if (value!.isEmpty) {
                        return ("Name cannot be Empty");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid name(Min. 3 Character)");
                      }
                      return null;
                    },
                    minLines: 1,
                    enableSuggestions: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      hintText: 'Enter Full Name',
                      errorMaxLines: 1,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 126, 125, 125)),
                    ))),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffd9d9d9)),
                  child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      textInputAction: TextInputAction.next,
                      controller: _email,
                      validator: (value) => EmailValidator.validate(value!)
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
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 126, 125, 125)),
                      )))),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffd9d9d9)),
                  child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      textInputAction: TextInputAction.next,
                      controller: _mnum,
                      validator: (value) {
                        RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
                        if (value!.isEmpty) {
                          return ("Mobile number cannot be Empty");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Number(Min. 10 Character)");
                        }
                        return null;
                      },
                      minLines: 1,
                      maxLength: 10,
                      enableSuggestions: true,
                      decoration: const InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        alignLabelWithHint: true,
                        hintText: 'Enter Mobile No.',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 126, 125, 125)),
                      )))),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffd9d9d9)),
                child: TextFormField(
                    style: const TextStyle(color: Colors.black),
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
                          _passenable ? Icons.visibility_off : Icons.visibility,
                          color: const Color.fromARGB(255, 126, 125, 125),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      alignLabelWithHint: true,
                      hintText: 'Enter Password',
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 126, 125, 125)),
                    ))),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffd9d9d9)),
                child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    key: _confirmpassword1,
                    obscureText: _hide,
                    textInputAction: TextInputAction.next,
                    controller: _confirmpassword,
                    validator: (value) {
                      if (value != _password.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    minLines: 1,
                    maxLength: 6,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _hide = !_hide;
                          });
                        },
                        child: Icon(
                          _hide ? Icons.visibility_off : Icons.visibility,
                          color: const Color.fromARGB(255, 126, 125, 125),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      alignLabelWithHint: true,
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 126, 125, 125)),
                    ))),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        submit(_email.text, _confirmpassword.text);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 10, 191, 4)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)))),
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )))),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Already have an account?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login1()));
                },
                child: Text("Login",
                    style: TextStyle(
                      decoration: isHovering
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: const Color.fromARGB(255, 43, 121, 185),
                      color: isHovering
                          ? const Color.fromARGB(255, 43, 121, 185)
                          : const Color.fromARGB(255, 43, 121, 185),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )))
          ]),
        ],
      ),
    ))));
  }

  Future submit(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        final User? user = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _email.text, password: _confirmpassword.text))
            .user;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .set({
          'uid': user.uid,
          'Name': _name.text,
          'mobile': _mnum.text,
          'email': _email.text,
          'createdAt': FieldValue.serverTimestamp()
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login1()));
      } catch (e) {
        Fluttertoast.showToast(msg: 'Failed with error code: $e');
        print('$e');
        Fluttertoast.showToast(msg: e.toString());
        return e.toString();
      }
    }
  }
}
