import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travelgram/Login/signuppage/login.dart';

class Profile1 extends StatelessWidget {
  Profile1({super.key});
  final email = FirebaseAuth.instance.currentUser?.email ?? 'guest@gmail.com';
  final userId = FirebaseAuth.instance.currentUser?.uid;
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitWave(
      color: Theme.of(context).colorScheme.primary,
      size: 30.0,
    );
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).iconTheme.color,
              )),
          centerTitle: true,
          title: Text(
            'Profile'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(userId)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height *
                                  0.4), // Adjust the padding value as needed
                          child: spinkit));
                }

                if (!snapshot.hasData || snapshot.data?.data() == null) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height *
                              0.4), // Adjust the padding value as needed
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You are in Guest Mode,'.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Login1()));
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 18),
                                )),
                            const Text('to view profile',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16)),
                          ]),
                    ),
                  );
                }

                final userData = snapshot.data!.data()! as Map<String, dynamic>;
                final userName = userData['Name'] as String;
                final mnum = userData['mobile'] as String;

                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(157, 0, 0, 0),
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(157, 0, 0, 0),
                        radius: 10,
                        child: ClipOval(
                          child: Image.network(
                            'https://i.redd.it/7j0wpq5rzt391.jpg',
                            fit: BoxFit.scaleDown,
                            height: 180,
                            width: 180,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListTile(
                          leading: const Icon(Icons.person_3_outlined),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name'.tr,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  userName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                          trailing: IconButton(
                            onPressed: () {
                              name.text = userName;
                              edit(context, snapshot, userId);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListTile(
                            leading: const Icon(Icons.email_outlined),
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    email,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ]))),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListTile(
                            leading: const Icon(Icons.phone_android),
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Phone',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    mnum,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ])))
                  ],
                );
              },
            ),
          )),
        ));
  }

  edit(context, snapshot, userId) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      labelText: 'Enter Your Name',
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  TextButton(
                      onPressed: () {
                        updatedata1(userId);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Profile1()),
                        );
                        Fluttertoast.showToast(
                            msg: 'Name Updated', timeInSecForIosWeb: 3);
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    width: 20,
                  )
                ],
              )
            ]));
  }

  updatedata1(userId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'Name': name.text});
  }
}
