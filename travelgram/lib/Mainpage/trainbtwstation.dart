import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:travelgram/Drawerpages/profilepage.dart';
import 'package:travelgram/Mainpage/dummy.dart';
import 'package:travelgram/Navbars/slidebar.dart';
import 'package:travelgram/Providers/textprovider.dart';

class TrainResponse {
  TrainResponse({this.status, this.message, this.timestamp, this.data});

  TrainResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    timestamp = json['timestamp'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Traindata.fromJson(v));
      });
    }
  }

  List<Traindata>? data;
  String? message;
  bool? status;
  int? timestamp;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['timestamp'] = timestamp;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Traindata {
  Traindata(
      {this.trainNumber,
      this.trainName,
      this.runDays,
      this.trainSrc,
      this.trainDstn,
      this.fromStd,
      this.fromSta,
      this.localTrainFromSta,
      this.toSta,
      this.toStd,
      this.fromDay,
      this.toDay,
      this.dDay,
      this.from,
      this.to,
      this.fromStationName,
      this.toStationName,
      this.duration,
      this.specialTrain,
      this.trainType,
      this.trainDate,
      this.classType});

  Traindata.fromJson(Map<String, dynamic> json) {
    trainNumber = json['train_number'];
    trainName = json['train_name'];
    runDays = json['run_days'].cast<String>();
    trainSrc = json['train_src'];
    trainDstn = json['train_dstn'];
    fromStd = json['from_std'];
    fromSta = json['from_sta'];
    localTrainFromSta = json['local_train_from_sta'];
    toSta = json['to_sta'];
    toStd = json['to_std'];
    fromDay = json['from_day'];
    toDay = json['to_day'];
    dDay = json['d_day'];
    from = json['from'];
    to = json['to'];
    fromStationName = json['from_station_name'];
    toStationName = json['to_station_name'];
    duration = json['duration'];
    specialTrain = json['special_train'];
    trainType = json['train_type'];
    trainDate = json['train_date'];
    classType = json['class_type'].cast<String>();
  }

  List<String>? classType;
  int? dDay;
  String? duration;
  String? from;
  int? fromDay;
  String? fromSta;
  String? fromStationName;
  String? fromStd;
  int? localTrainFromSta;
  List<String>? runDays;
  bool? specialTrain;
  String? to;
  int? toDay;
  String? toSta;
  String? toStationName;
  String? toStd;
  String? trainDate;
  String? trainDstn;
  String? trainName;
  String? trainNumber;
  String? trainSrc;
  String? trainType;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['train_number'] = trainNumber;
    data['train_name'] = trainName;
    data['run_days'] = runDays;
    data['train_src'] = trainSrc;
    data['train_dstn'] = trainDstn;
    data['from_std'] = fromStd;
    data['from_sta'] = fromSta;
    data['local_train_from_sta'] = localTrainFromSta;
    data['to_sta'] = toSta;
    data['to_std'] = toStd;
    data['from_day'] = fromDay;
    data['to_day'] = toDay;
    data['d_day'] = dDay;
    data['from'] = from;
    data['to'] = to;
    data['from_station_name'] = fromStationName;
    data['to_station_name'] = toStationName;
    data['duration'] = duration;
    data['special_train'] = specialTrain;
    data['train_type'] = trainType;
    data['train_date'] = trainDate;
    data['class_type'] = classType;
    return data;
  }
}

final uid = FirebaseAuth.instance.currentUser?.uid;
final user = FirebaseAuth.instance.currentUser;

class TrainBetweenStationsScreen extends StatefulWidget {
  const TrainBetweenStationsScreen({Key? key}) : super(key: key);

  @override
  _TrainBetweenStationsScreenState createState() =>
      _TrainBetweenStationsScreenState();
}

class _TrainBetweenStationsScreenState
    extends State<TrainBetweenStationsScreen> {
  late TextEditingController _dateController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _fromStationController = TextEditingController();
  late DateTime _selectedDate;
  String _textBetweenFields = '';
  late TextEditingController _toStationController = TextEditingController();
  List<Traindata> _trains = [];

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _fromStationController = TextEditingController();
    _selectedDate = DateTime.now(); // Initialize with current date
    _toStationController = TextEditingController();
  }

  Future<void> getTrainBetweenStations() async {
    String apiKey = '2a34009cf6msh5e4b44957edb9b2p16406bjsn02676d1b3756';
    String apiHost = 'irctc1.p.rapidapi.com';

    String fromStationCode = _fromStationController.text;
    String toStationCode = _toStationController.text;
    String dateOfJourney = _dateController.text;

    String url = 'https://irctc1.p.rapidapi.com/api/v3/trainBetweenStations';

    Uri uri = Uri.parse(url);
    uri = uri.replace(queryParameters: {
      'fromStationCode': fromStationCode,
      'toStationCode': toStationCode,
      'dateOfJourney': dateOfJourney,
    });

    try {
      final response = await http.get(
        uri,
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': apiHost,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == true) {
          // final trainsData = responseData['data'];
          var trains = TrainResponse.fromJson(responseData);

          setState(() {
            _trains = trains.data!;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrainResponseScreen(_trains),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content:
                  Text(responseData['message'] ?? 'Unknown error occurred.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Error: $error'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

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

  void _swapTextFields() {
    setState(() {
      String temp = _fromStationController.text;
      _fromStationController.text = _toStationController.text;
      _toStationController.text = temp;
      _updateTextBetweenFields(); // Update the text between the fields after swapping
    });
  }

  void _updateTextBetweenFields() {
    setState(() {
      _textBetweenFields =
          '${_fromStationController.text} ${_toStationController.text}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer1(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                icon: Icon(
                  Icons.grid_view_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: _fromStationController,
                    onChanged: (newText) {
                      Provider.of<TextInputProvider>(context, listen: false)
                          .updateTextInput(newText);
                    },
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
                          icon: const Icon(Icons.swap_vert_outlined),
                        ),
                        alignLabelWithHint: true,
                        hintText: "From Station".tr),
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
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
                      controller: _toStationController,
                      onChanged: (newText) {
                        Provider.of<TextInputProvider>(context, listen: false)
                            .updateTextInput2(newText);
                      },
                      decoration: InputDecoration(
                          alignLabelWithHint: true, hintText: "To Station".tr),
                    )),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
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
                        onChanged: (newText) {
                          Provider.of<TextInputProvider>(context, listen: false)
                              .updateTextInput3(newText);
                        },
                        decoration: InputDecoration(
                          labelText: 'Date of Journey'.tr,
                          suffixIcon: const Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (FirebaseAuth.instance.currentUser?.uid ==
                              'ltERsPMk2mZTB6B7vb8l4hcIHEE2') {
                            await getTrainBetweenStations();
                          } else {
                            if (_formkey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Duplicate1(),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text(
                          'Get Train Schedule',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        )));
  }
}

class TrainResponseScreen extends StatelessWidget {
  const TrainResponseScreen(this.trains, {Key? key}) : super(key: key);

  final List<Traindata> trains;

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Train Schedule'),
      ),
      body: ListView.builder(
        itemCount: trains.length,
        itemBuilder: (context, index) {
          final train = trains[index];

          return Card(
              child: ListTile(
            leading: Container(
              height: 20,
              width: 45,
              color: const Color.fromARGB(255, 59, 93, 120),
              child: Text(
                '${train.trainNumber}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Row(children: [
              Text(
                '${train.fromStd}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
                child: Icon(Icons.arrow_right_alt_outlined),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                '${train.toSta}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
            subtitle: Text(
              '${train.trainName}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: train.specialTrain!
                ? const Text('Special')
                : const Text('Regular'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Train Name:${train.trainName}'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Train Details:'),
                      Text('Train Number: ${train.trainNumber}'),
                      Text('Train Source: ${train.trainSrc}'),
                      Text('Train Destination: ${train.trainDstn}'),
                      const SizedBox(height: 8.0),
                      Row(children: [
                        Text('DA:${train.fromStd}'),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${train.toSta}')
                      ]),
                      Text('Departure Time: ${train.fromStd}'),
                      Text('Arrival Time: ${train.fromSta}'),
                      const SizedBox(height: 8.0),
                      Text('Duration: ${train.duration}'),
                      const SizedBox(height: 8.0),
                      const Text('Class Types:'),
                      Text(train.classType!.join(', ')),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
