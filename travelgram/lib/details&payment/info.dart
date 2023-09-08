import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelgram/details&payment/razorpay.dart';
import 'package:travelgram/details&payment/sample.dart';

class Info1 extends StatefulWidget {
  const Info1({super.key});

  @override
  State<Info1> createState() => _Info1State();
}

enum Gender { male, female, transgender }

TextEditingController name = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController mnum = TextEditingController();
String berth_preference = 'No Preference'.tr;

int widgetcounter = 1;
final formkey = GlobalKey<FormState>();
final form = GlobalKey<FormState>();
// int text = 1;
List<FormFieldSet> formFieldSets = [];
List<PassengerData> passengerDataList = [];

List<String> berth = [
  'No Preference'.tr,
  'Lower Berth'.tr,
  'Middle Berth'.tr,
  'Upper Berth'.tr,
  'Side Lower'.tr,
  'Side Upper'.tr
];

class _Info1State extends State<Info1> {
  Gender? _check = Gender.male;
  bool showform = true;
  bool nxtform = true;

  // void dispose() {
  //   name.dispose();
  //   age.dispose();
  //   berth.clear();
  //   super.dispose();
  // }

  void resetform() {
    setState(() {
      name.clear();
      age.clear();
      berth_preference = 'No Preference'.tr;
    });
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.green;
  }

  // payment() {
  //   if (formkey.currentState!.validate()) {
  //     return Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => const Razor1(),
  //           settings: RouteSettings(arguments: arguments)),
  //     );
  //   }
  // }

  submit() {
    if (form.currentState!.validate()) {
      return _toggleFormVisibility();
    }
  }

  void _toggleFormVisibility() {
    setState(() {
      showform = !showform;
    });
  }

  Widget _buildCardContent() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              '#1',
            ),
            const SizedBox(
              width: 5,
            ),
            Text('${name.text},'),
            const SizedBox(width: 8),
            Text('${age.text},'),
            const SizedBox(width: 8),
            Text('${_check.toString().split('.').last},'),
            const SizedBox(width: 8),
            Text('$berth_preference,'),
            GestureDetector(
              child: const Text(
                'Edit',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.green),
              ),
              onTap: () {
                _toggleFormVisibility();
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
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
          title: const Text('Travelgram'),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(10),
                            color: Theme.of(context).colorScheme.secondary,
                            child: Text(
                              'Passenger Details'.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              softWrap: true,
                            ),
                          ),
                          Visibility(
                            visible: showform,
                            child: Form(
                                key: form,
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          '#1',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Radio<Gender>(
                                              fillColor: MaterialStateProperty
                                                  .resolveWith(getColor),
                                              value: Gender.male,
                                              groupValue: _check,
                                              onChanged: (Gender? value) {
                                                setState(() {
                                                  _check = value!;
                                                });
                                              }),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              'Male'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Radio<Gender>(
                                              fillColor: MaterialStateProperty
                                                  .resolveWith(getColor),
                                              value: Gender.female,
                                              groupValue: _check,
                                              onChanged: (Gender? value) {
                                                setState(() {
                                                  _check = value!;
                                                });
                                              }),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              'Female'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Radio<Gender>(
                                              fillColor: MaterialStateProperty
                                                  .resolveWith(getColor),
                                              value: Gender.transgender,
                                              groupValue: _check,
                                              onChanged: (Gender? value) {
                                                setState(() {
                                                  _check = value!;
                                                });
                                              }),
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              'Transgender'.tr,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
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
                                            enableInteractiveSelection: true,
                                            enableSuggestions: true,
                                            controller: name,
                                            decoration: InputDecoration(
                                                hintText: 'Full Name'.tr),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            maxLength: 3,
                                            validator: (value) {
                                              RegExp regex = RegExp(r'[0-9]');
                                              if (value!.isEmpty) {
                                                return ("Age cannot be Empty");
                                              }
                                              if (!regex.hasMatch(value)) {
                                                return ("Enter Valid Number");
                                              }
                                              return null;
                                            },
                                            enableInteractiveSelection: true,
                                            enableSuggestions: true,
                                            controller: age,
                                            decoration: InputDecoration(
                                                hintText: 'Age'.tr,
                                                counterText: ""),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 55,
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              underline: Container(
                                                height: 1,
                                                color: Colors.black,
                                              ),
                                              value: berth_preference,
                                              itemHeight: 50,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  berth_preference = newValue!;
                                                });
                                              },
                                              items: berth.map((String berth) {
                                                return DropdownMenuItem(
                                                    value: berth,
                                                    child: Text(berth));
                                              }).toList(),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              200,
                                                              198,
                                                              198),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8))),
                                                  onPressed: () {
                                                    resetform();
                                                  },
                                                  child: const Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  ))),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.green,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                  ),
                                                  onPressed: () {
                                                    submit();
                                                  },
                                                  child: const Text(
                                                    'Save',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            255)),
                                                  ))),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    ])),
                          ),
                          Visibility(
                              visible: !showform,
                              child: Column(
                                children: [
                                  _buildCardContent(),
                                ],
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          // Row(children: [
                          //   const SizedBox(
                          //     width: 5,
                          //   ),
                          //   Expanded(
                          //       child: ElevatedButton(
                          //           style: ElevatedButton.styleFrom(
                          //               backgroundColor: const Color.fromARGB(
                          //                   255, 200, 198, 198),
                          //               shape: RoundedRectangleBorder(
                          //                   borderRadius:
                          //                       BorderRadius.circular(8))),
                          //           onPressed: () {},
                          //           child: const Text(
                          //             'Add Child (0-4 Yrs)',
                          //             style: TextStyle(color: Colors.green),
                          //           ))),
                          //   const SizedBox(
                          //     width: 8,
                          //   ),
                          //   Expanded(
                          //       child: ElevatedButton(
                          //           style: ElevatedButton.styleFrom(
                          //             backgroundColor: const Color.fromARGB(
                          //                 255, 200, 198, 198),
                          //             shape: RoundedRectangleBorder(
                          //                 borderRadius:
                          //                     BorderRadius.circular(8)),
                          //           ),
                          //           onPressed: () {
                          //             setState(() {
                          //               addformfield();
                          //             });
                          //           },
                          //           child: const Text(
                          //             'Add Adult (5+ Yrs)',
                          //             style: TextStyle(color: Colors.green),
                          //           ))),
                          //   const SizedBox(
                          //     width: 5,
                          //   )
                          // ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(10),
                            color: Theme.of(context).colorScheme.secondary,
                            child: const Text(
                              'Contact Information',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              softWrap: true,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Your tickets will be send to the below details',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                maxLength: 10,
                                validator: (value) {
                                  RegExp regex =
                                      RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
                                  if (value!.isEmpty) {
                                    return ("Mobile number cannot be Empty");
                                  }
                                  if (!regex.hasMatch(value)) {
                                    return ("Enter Valid Number");
                                  }
                                  return null;
                                },
                                enableInteractiveSelection: true,
                                enableSuggestions: true,
                                controller: mnum,
                                decoration: InputDecoration(
                                    hintText: 'Enter Mobile Number'.tr,
                                    counterText: ""),
                              )),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                validator: (value) =>
                                    EmailValidator.validate(value!)
                                        ? null
                                        : "Please enter a valid email",
                                keyboardType: TextInputType.emailAddress,
                                enableInteractiveSelection: true,
                                enableSuggestions: true,
                                controller: _email,
                                decoration: InputDecoration(
                                    hintText: 'Enter Email'.tr,
                                    counterText: ""),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          SafeArea(
                            minimum: const EdgeInsets.all(8),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Razor1(),
                                              settings: RouteSettings(
                                                  arguments: arguments)),
                                        );
                                      }
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 61, 161, 57)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)))),
                                    child: const Text(
                                      'Proceed',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ])))));
  }

  addformfield() {
    SingleChildScrollView(
        child: SafeArea(
            child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 231, 231, 231),
                        child: const Text(
                          'Passenger Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          softWrap: true,
                        ),
                      ),
                      Visibility(
                        visible: showform,
                        child: Form(
                            key: form,
                            autovalidateMode: AutovalidateMode.always,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      '#1',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Text(
                                          'Male',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Radio<Gender>(
                                          value: Gender.male,
                                          groupValue: _check,
                                          onChanged: (Gender? value) {
                                            setState(() {
                                              _check = value!;
                                            });
                                          }),
                                      const Text(
                                        'Female',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Radio<Gender>(
                                          value: Gender.female,
                                          groupValue: _check,
                                          onChanged: (Gender? value) {
                                            setState(() {
                                              _check = value!;
                                            });
                                          }),
                                      const Text(
                                        'Transgender',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Radio<Gender>(
                                          value: Gender.transgender,
                                          groupValue: _check,
                                          onChanged: (Gender? value) {
                                            setState(() {
                                              _check = value!;
                                            });
                                          }),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: TextFormField(
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
                                        enableInteractiveSelection: true,
                                        enableSuggestions: true,
                                        controller: name,
                                        decoration: const InputDecoration(
                                            hintText: 'Full Name'),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        maxLength: 3,
                                        validator: (value) {
                                          RegExp regex = RegExp(r'[0-9]');
                                          if (value!.isEmpty) {
                                            return ("Age cannot be Empty");
                                          }
                                          if (!regex.hasMatch(value)) {
                                            return ("Enter Valid Number");
                                          }
                                          return null;
                                        },
                                        enableInteractiveSelection: true,
                                        enableSuggestions: true,
                                        controller: age,
                                        decoration: const InputDecoration(
                                            hintText: 'Age', counterText: ""),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 55,
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          underline: Container(
                                            height: 1,
                                            color: Colors.black,
                                          ),
                                          value: berth_preference,
                                          itemHeight: 50,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              berth_preference = newValue!;
                                            });
                                          },
                                          items: berth.map((String berth) {
                                            return DropdownMenuItem(
                                                value: berth,
                                                child: Text(berth));
                                          }).toList(),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 200, 198, 198),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8))),
                                              onPressed: () {
                                                resetform();
                                              },
                                              child: const Text(
                                                'Delete',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ))),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                              onPressed: () {
                                                submit();
                                              },
                                              child: const Text(
                                                'Save',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255)),
                                              ))),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ])),
                      ),
                      Visibility(
                          visible: !showform,
                          child: Column(
                            children: [
                              _buildCardContent(),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 200, 198, 198),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () {},
                                child: const Text(
                                  'Add Child (0-4 Yrs)',
                                  style: TextStyle(color: Colors.green),
                                ))),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 200, 198, 198),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Add Adult (5+ Yrs)',
                                  style: TextStyle(color: Colors.green),
                                ))),
                      ])
                    ]))));
  }
}
