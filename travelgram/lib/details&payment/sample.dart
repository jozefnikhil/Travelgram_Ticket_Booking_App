import 'package:flutter/material.dart';

enum Gender { male, female, transgender }

class FormFieldSet {
  Gender? gender;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String berthPreference = 'No Preference';

  FormFieldSet({this.gender});
}

class PassengerData {
  String name;
  String age;
  Gender gender;
  String berthPreference;

  PassengerData({
    required this.name,
    required this.age,
    required this.gender,
    required this.berthPreference,
  });
}

class MultipleTextFields extends StatefulWidget {
  @override
  _MultipleTextFieldsState createState() => _MultipleTextFieldsState();
}

class _MultipleTextFieldsState extends State<MultipleTextFields> {
  List<FormFieldSet> formFieldSets = [];
  List<PassengerData> passengerDataList = [];
  List<PassengerData> tempPassengerDataList =
      []; // Temporary list to show entered data

  @override
  void initState() {
    super.initState();
    _addFormFieldSet(); // Add the first FormFieldSet when the widget is initialized
  }

  bool showform = true;
  final formkey = GlobalKey<FormState>();

  submit() {
    if (formkey.currentState!.validate()) {
      
      
      return _toggleFormVisibility();
    }
  }

  void _toggleFormVisibility() {
    setState(() {
      showform = !showform;
    });
  }

  void _addFormFieldSet() {
    // Trigger form validation for all form fields
    // if (formkey.currentState!.validate()) {
    //   return;
    // }

    if (formFieldSets.length < 4) {
      setState(() {
        formFieldSets.add(FormFieldSet());
      });
    }
  }

  void _removeFormFieldSet(int index) {
    setState(() {
      // Clear the fields' values if it's the first text field (index == 0)
      if (index == 0) {
        formFieldSets[index].nameController.clear();
        formFieldSets[index].ageController.clear();
        formFieldSets[index].gender = null;
        formFieldSets[index].berthPreference = 'No Preference';
      } else {
        formFieldSets.removeAt(index);
      }
    });
  }

  void _saveData() {
    for (var formFieldSet in formFieldSets) {
      String name = formFieldSet.nameController.text;
      String age = formFieldSet.ageController.text;
      Gender gender = formFieldSet.gender ?? Gender.male;
      String berthPreference = formFieldSet.berthPreference;

      PassengerData passengerData = PassengerData(
        name: name,
        age: age,
        gender: gender,
        berthPreference: berthPreference,
      );

      passengerDataList.add(passengerData);
    }

    // Clear the form fields after saving data
    // for (var formFieldSet in formFieldSets) {
    //   formFieldSet.nameController.clear();
    //   formFieldSet.ageController.clear();
    //   formFieldSet.gender = null;
    //   formFieldSet.berthPreference = 'Upper';
    // }
  }

  @override
  void dispose() {
    for (var formFieldSet in formFieldSets) {
      formFieldSet.nameController.dispose();
      formFieldSet.ageController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple TextFields Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: showform,
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: formkey,
                child: Column(children: [
                  for (int i = 0; i < formFieldSets.length; i++) ...[
                    // ... (three dots) will flatten the list of children into a single list
                    const SizedBox(height: 5),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "#${i + 1}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Male',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Radio<Gender>(
                          value: Gender.male,
                          groupValue: formFieldSets[i].gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              formFieldSets[i].gender = value!;
                            });
                          },
                        ),
                        Text(
                          'Female',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Radio<Gender>(
                          value: Gender.female,
                          groupValue: formFieldSets[i].gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              formFieldSets[i].gender = value!;
                            });
                          },
                        ),
                        Text(
                          'Transgender',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Radio<Gender>(
                          value: Gender.transgender,
                          groupValue: formFieldSets[i].gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              formFieldSets[i].gender = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
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
                        controller: formFieldSets[i].nameController,
                        decoration: InputDecoration(hintText: 'Full Name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
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
                        controller: formFieldSets[i].ageController,
                        decoration:
                            InputDecoration(hintText: 'Age', counterText: ""),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          value: formFieldSets[i].berthPreference,
                          itemHeight: 50,
                          onChanged: (String? newValue) {
                            setState(() {
                              formFieldSets[i].berthPreference = newValue!;
                            });
                          },
                          items: ['No Preference', 'Upper', 'Lower', 'Middle']
                              .map((berth) {
                            return DropdownMenuItem(
                              value: berth,
                              child: Text(berth),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    // ... (remaining UI elements are the same as before)
                    // ... (truncated for brevity)
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 5),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 200, 198, 198),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              _removeFormFieldSet(i);
                            },
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              submit();
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                  ]
                ]),
              ),
            ),
            Visibility(
              visible: !showform,
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: passengerDataList.length,
                    itemBuilder: (context, index) {
                      return _buildCardContent(index);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 200, 198, 198),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      _addFormFieldSet();
                    },
                    child: Text(
                      'Add Child (0-4 Yrs)',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                if (formFieldSets.length < 4) ...[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 200, 198, 198),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        _addFormFieldSet();
                      },
                      child: Text(
                        'Add Adult (5+ Yrs)',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
                SizedBox(width: 5),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: passengerDataList.length,
            //   itemBuilder: (context, index) {
            //     return _buildCardContent(index);
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardContent(int index, {bool isSavedData = false}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '#${index + 1}',
            ),
            SizedBox(
              width: 5,
            ),
            Text('${passengerDataList[index].name},'),
            SizedBox(width: 8),
            Text('${passengerDataList[index].age},'),
            SizedBox(width: 8),
            Text(
                '${passengerDataList[index].gender.toString().split('.').last},'),
            SizedBox(width: 8),
            Text('${passengerDataList[index].berthPreference},'),
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
}
