import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:travelgram/Drawerpages/profilepage.dart';
import 'package:travelgram/Navbars/slidebar.dart';
import 'package:url_launcher/url_launcher.dart';

class Pnr1 extends StatefulWidget {
  final GoogleSignInAccount? user;

  const Pnr1({super.key, this.user});

  @override
  State<Pnr1> createState() => _Pnr1State();
}

Future<void> pnr_search() async {
  final url = Uri.parse(
      'https://www.indianrail.gov.in/enquiry/PNR/PnrEnquiry.html?locale=en');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "Couldn't Launch Url";
  }
}

class _Pnr1State extends State<Pnr1> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer1(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                icon: Icon(Icons.grid_view_outlined,
                    color: Theme.of(context).iconTheme.color),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          }),
          title: const Text('Travelgram',
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile1()));
                },
                child: const CircleAvatar(
                    child: ClipOval(
                        child: Image(
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/silhouette-young-confident-handsome-businessman-wearing-black-shirt-red-light_158595-4817.jpg'),
                            height: 37,
                            width: 37,
                            fit: BoxFit.cover))),
              ),
            )
          ],
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://lottie.host/3846309a-e39a-41c3-9e3e-9e243bbd7972/76GD0MpqE8.json',
                  repeat: true,
                  controller: _controller, onLoaded: (compos) {
                _controller
                  ..duration = compos.duration
                  ..repeat();
              }),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      pnr_search();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text(
                    'Check PNR Status',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        )));
  }
}
