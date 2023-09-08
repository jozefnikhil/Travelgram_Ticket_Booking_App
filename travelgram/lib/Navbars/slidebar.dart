import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travelgram/Drawerpages/logout.dart';
import 'package:travelgram/Drawerpages/profilepage.dart';
import 'package:travelgram/Drawerpages/settings.dart';
import 'package:travelgram/Mainpage/trainbtwstation.dart';

class Drawer1 extends StatefulWidget {
  final GoogleSignInAccount? user;

  const Drawer1({super.key, this.user});

  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  var auth = FirebaseAuth.instance;
  bool isdark = true;
  final email = FirebaseAuth.instance.currentUser?.email ?? 'guest@gmail.com';
  Signout si = Signout();
  toggle() {
    setState(() {
      isdark = !isdark;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(''),
            accountEmail: Text(
              email,
              style: const TextStyle(color: Colors.white),
            ),
            currentAccountPicture: const CircleAvatar(
                child: ClipOval(
                    child: Image(
                        image: NetworkImage(
                            'https://img.freepik.com/free-photo/silhouette-young-confident-handsome-businessman-wearing-black-shirt-red-light_158595-4817.jpg'),
                        height: 72,
                        width: 72,
                        fit: BoxFit.cover))),
            decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?auto=compress&cs=tinysrgb&w=600'),
                    fit: BoxFit.cover)),
          ),
          const Text('Travelgram\nfrom Scratch',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile1()));
            },
            leading: const Icon(Icons.person_outlined),
            title: Text(
              'Profile'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Localization1()));
              },
              leading: const Icon(Icons.settings),
              title: Text(
                'Settings'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          Divider(
            thickness: 0.99,
            color: Theme.of(context).colorScheme.primary,
          ),
          ListTile(
              onTap: () {},
              leading: const Icon(Icons.group),
              title: Text(
                'Invite Friends'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          ListTile(
            leading: const Icon(Icons.star_border),
            onTap: (() => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: Alignment.center,
                              child: Text('Rate us')),
                          const SizedBox(
                            height: 18,
                          ),
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              Fluttertoast.showToast(msg: rating.toString());
                            },
                          ),
                        ]),
                    actions: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                          ]),
                    ],
                  ),
                )),
            title: Text(
              'Rate us'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 0.99,
            color: Theme.of(context).colorScheme.primary,
          ),
          ListTile(
              onTap: () {
                if (auth.currentUser != null) {
                  si.signOut1(context);
                } else {
                  login2(context);
                }
              },
              leading: const Icon(Icons.logout_outlined),
              title: Text(
                'Logout'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
