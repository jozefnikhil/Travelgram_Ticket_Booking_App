import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelgram/Mainpage/booking.dart';
import 'package:travelgram/Mainpage/pnr.dart';
import 'package:travelgram/Mainpage/trainbtwstation.dart';

class Gnav1 extends StatefulWidget {
  const Gnav1({super.key});

  @override
  State<Gnav1> createState() => _Gnav1State();
}

class _Gnav1State extends State<Gnav1> {
  int currentindex = 0;

  final List<Widget> _pages = const [
    TrainBetweenStationsScreen(),
    Pnr1(),
    Booking1()
  ];
  void _onTabTapped(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            body: _pages.elementAt(currentindex),
            bottomNavigationBar: NavigationBarTheme(
                data: NavigationBarThemeData(
                    indicatorColor: Theme.of(context).focusColor,
                    labelTextStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500))),
                child: NavigationBar(
                  animationDuration: const Duration(seconds: 2),
                  height: 75,
                  selectedIndex: currentindex,
                  onDestinationSelected: _onTabTapped,
                  destinations: [
                    NavigationDestination(
                      icon: Icon(
                        Icons.train,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      label: 'Station'.tr,
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Icons.airplane_ticket_sharp,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      label: 'PNR'.tr,
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Icons.receipt_sharp,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      label: 'Tickets'.tr,
                    )
                  ],
                ))));
  }
}

class Gnav2 extends StatefulWidget {
  const Gnav2({super.key});

  @override
  State<Gnav2> createState() => _Gnav2State();
}

class _Gnav2State extends State<Gnav2> {
  int currentindex = 2;

  final List<Widget> _pages = const [
    TrainBetweenStationsScreen(),
    Pnr1(),
    Booking1()
  ];
  void _onTabTapped(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            body: _pages.elementAt(currentindex),
            bottomNavigationBar: NavigationBarTheme(
                data: NavigationBarThemeData(
                    indicatorColor: Theme.of(context).focusColor,
                    labelTextStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500))),
                child: NavigationBar(
                  animationDuration: const Duration(seconds: 2),
                  height: 75,
                  selectedIndex: currentindex,
                  onDestinationSelected: _onTabTapped,
                  destinations: [
                    NavigationDestination(
                      icon: Icon(
                        Icons.train,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      label: 'Station'.tr,
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Icons.airplane_ticket_sharp,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      label: 'PNR'.tr,
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Icons.receipt_sharp,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      label: 'Tickets'.tr,
                    )
                  ],
                ))));
  }
}
