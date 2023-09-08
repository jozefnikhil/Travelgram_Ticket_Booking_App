import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travelgram/Drawerpages/profilepage.dart';
import 'package:travelgram/Login/signuppage/signup.dart';
import 'package:travelgram/Navbars/slidebar.dart';
import 'package:travelgram/Providers/textprovider.dart';
import 'package:travelgram/details&payment/info.dart';

class Booking1 extends StatefulWidget {
  const Booking1({super.key});

  @override
  State<Booking1> createState() => _Booking1State();
}

final _auth = FirebaseAuth.instance;
final _formkey = GlobalKey<FormState>();

late DateTime _selectedDate;
TextEditingController _dateController = TextEditingController();
TextEditingController firstController = TextEditingController();
TextEditingController secondController = TextEditingController();

String _textBetweenFields = '';

class _Booking1State extends State<Booking1> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    }
  }

  String selectedcoach = 'Select Coach'.tr;
  String selectedquota = 'Select Quota'.tr;
  List<String> quota = [
    'Select Quota'.tr,
    'General Quota'.tr,
    'Tatkal Quota'.tr,
    'Ladies Quota'.tr
  ];
  List<String> coach = [
    'Select Coach'.tr,
    'SL - Sleeper'.tr,
    '3A - Third AC'.tr,
    '2A - Second AC'.tr
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Update the TextField controller with the provider's textInput
    String textInput = Provider.of<TextInputProvider>(context).frminput;
    String textInput1 = Provider.of<TextInputProvider>(context).toinput;

    firstController.text = textInput;
    secondController.text = textInput1;
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _dateController = TextEditingController();
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
        body: SingleChildScrollView(
            child: SafeArea(
                child: Form(
                    key: _formkey,
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.secondary),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: TextFormField(
                                  controller: firstController,
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^.{3,}$');
                                    if (value!.isEmpty) {
                                      return ("Station cannot be Empty");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Enter Valid Station Code/Station Name(Min. 3 Character)");
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          _swapTextFields();
                                        },
                                        icon: const Icon(
                                            Icons.swap_vert_outlined),
                                      ),
                                      alignLabelWithHint: true,
                                      hintText: "From Station".tr),
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: TextFormField(
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^.{3,}$');
                                    if (value!.isEmpty) {
                                      return ("Station cannot be Empty");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Enter Valid Station Code/Station Name(Min. 3 Character)");
                                    }
                                    return null;
                                  },
                                  controller: secondController,
                                  decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: "To Station".tr),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                'Journey Date',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 2, 85, 153),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: InkWell(
                                    onTap: () => _selectDate(context),
                                    child: IgnorePointer(
                                        child: TextFormField(
                                      validator: (value) {
                                        RegExp regex = RegExp(
                                            r'^(?:(?:(?:0?[1-9]|1[0-2])\/(?:0?[1-9]|[12][0-9]|3[01])\/(?:19|20)\d\d)|(?:19|20)\d\d-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|[12][0-9]|3[01]))$');
                                        if (value!.isEmpty) {
                                          return ("Date cannot be Empty");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("Enter Valid Date(Min. 10 Character)");
                                        }
                                        return null;
                                      },
                                      controller: _dateController,
                                      decoration: InputDecoration(
                                          labelText: 'Select Journey Date'.tr,
                                          suffixIcon: const Icon(
                                              Icons.calendar_today_outlined),
                                          labelStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )))),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                'Quota',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 2, 85, 153),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: SizedBox(
                                  width: 300,
                                  height: 55,
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    value: selectedquota,
                                    itemHeight: 50,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedquota = newValue!;
                                      });
                                    },
                                    items: quota.map((String quota) {
                                      return DropdownMenuItem(
                                          value: quota, child: Text(quota));
                                    }).toList(),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select a quota'; // Validation error message
                                      }
                                      return null; // Return null if the value is valid
                                    },
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                'Coach',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 2, 85, 153),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: SizedBox(
                                  width: 300,
                                  height: 55,
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    value: selectedcoach,
                                    itemHeight: 50,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedcoach = newValue!;
                                      });
                                    },
                                    items: coach.map((String coach) {
                                      return DropdownMenuItem(
                                          value: coach, child: Text(coach));
                                    }).toList(),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select an option';
                                      }
                                      return null; // Return null if the value is valid
                                    },
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_auth.currentUser != null) {
                                        if (_formkey.currentState!.validate()) {
                                          // The user is logged in, navigate to the next page
                                          Map<String, dynamic> data = {
                                            'frmstn': firstController.text,
                                            'tostn': secondController.text,
                                            'jrnydte': _dateController.text,
                                            'qouta': selectedquota,
                                            'coach': selectedcoach
                                          };
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Info1(),
                                                settings: RouteSettings(
                                                    arguments: data),
                                              ));
                                        } else {
                                          // The user is not logged in, navigate to the signup page
                                          Fluttertoast.showToast(
                                              timeInSecForIosWeb: 5,
                                              msg: 'Kindly Fill Above Fields',
                                              gravity: ToastGravity.BOTTOM);
                                        }
                                      } else {
                                        Fluttertoast.showToast(
                                            timeInSecForIosWeb: 5,
                                            msg:
                                                'Before Booking Ticket\nKindly Signup',
                                            gravity: ToastGravity.BOTTOM);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Signup1()));
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  child: const Text(
                                    'Book Tickets',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ))))));
  }

  void _swapTextFields() {
    setState(() {
      String temp = firstController.text;
      firstController.text = secondController.text;
      secondController.text = temp;
      _updateTextBetweenFields(); // Update the text between the fields after swapping
    });
  }

  void _updateTextBetweenFields() {
    setState(() {
      _textBetweenFields = '${firstController.text} ${secondController.text}';
    });
  }
}
