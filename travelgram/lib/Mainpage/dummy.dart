import 'package:flutter/material.dart';
import 'package:travelgram/Navbars/gnav.dart';

class Duplicate1 extends StatefulWidget {
  const Duplicate1({super.key});

  @override
  State<Duplicate1> createState() => _Duplicate1State();
}

String selectedText = 'Initial Value';
String trainnme = '';

class _Duplicate1State extends State<Duplicate1> {
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
          title: const Text(
            'Travelgram',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 11, 77, 131),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'TCR - Thrissur',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('SRR - Shoranur Junction',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '16604';
                  trainnme = 'Maveli Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 16604',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '12:50 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '1:55 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Maveli Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '16629';
                  trainnme = 'Malabar Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 16629',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '1:35 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '2:35 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Malabar Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '16349';
                  trainnme = 'Nilambur Road Rajya Rani Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 16349',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '2:30 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '3:35 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Nilambur Road Rajya Rani Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '16347';
                  trainnme = 'Mangaluru Central Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 16347',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '2:40 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '4:05 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Mangaluru Central Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '16609';
                  trainnme = 'Coimbatore SF Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 16609',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '6:45 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '7:27 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Coimbatore SF Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '16305';
                  trainnme = 'Kannur Intercity Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 16305',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '7:16 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '8:07 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Kannur Intercity Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '16326';
                  trainnme = 'Nilambur Road Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 16326',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '8:30 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '10:10 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Nilambur Road Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '16606';
                  trainnme = 'Ernad Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 16606',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '9:05 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '10:40 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Ernad Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '20634';
                  trainnme = 'Kasaragod Vande Bharat Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 20634',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '9:32 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '10:02 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Kasaragod Vande Bharat Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '12076';
                  trainnme = 'Kozhikode Jan Shatabdi Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 12076',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '10:35 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '11:25 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Kozhikode Jan Shatabdi Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
            Card(
                child: ListTile(
              onTap: () {
                setState(() {
                  selectedText = '12217';
                  trainnme = 'Venad Express';
                });
                bookticket(context);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                height: 22,
                width: 50,
                color: const Color.fromARGB(255, 11, 77, 131),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    ' 12217',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              title: const Row(children: [
                Text(
                  '11:38 AM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                  child: Icon(Icons.arrow_right_alt_outlined),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '12:50 PM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              subtitle: const Text(
                'Venad Express',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
          ],
        ))));
  }

  bookticket(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(trainnme),
              content: SizedBox(
                height: 100,
                width: 200,
                child: Column(children: [
                  Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Thrissur'),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.arrow_right_alt_outlined,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Shoranur Junction'),
                        ],
                      )),
                  Text('Train No:$selectedText')
                ]),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 100,
                            height: 30,
                            color: Colors.red,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 27, vertical: 7),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Gnav2(),
                            ),
                          );
                        },
                        child: Container(
                            width: 100,
                            height: 30,
                            color: Colors.green,
                            child: const Padding(
                              padding: EdgeInsets.all(7),
                              child: Text(
                                ' Book Tickets',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))),
                  ],
                )
              ],
            ));
  }
}
