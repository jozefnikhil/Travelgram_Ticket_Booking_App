import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:travelgram/Navbars/gnav.dart';

class Razor1 extends StatefulWidget {
  const Razor1({
    super.key,
  });

  @override
  State<Razor1> createState() => _Razor1State();
}

class _Razor1State extends State<Razor1> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: 'Payment Successfully Done');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Gnav2(),
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: 'Payment Failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Summary'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
            )),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.train_outlined),
              title: Text('From: ${arguments?['frmstn']}\n'
                  'To: ${arguments?['tostn']}'),
              minVerticalPadding: 15,
              subtitle: Text('Date: ${arguments?['jrnydte']}'),
              trailing: Column(children: [
                Text('Quota: ${arguments?['qouta']}'),
                const SizedBox(
                  height: 5,
                ),
                Text('Coach: ${arguments?['coach']}'),
              ]),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.white,
                      width: 100,
                      height: 50,
                      child: const Center(
                        child: Text(
                          'To Pay: ₹ 1',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ))),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () {
                        var options = {
                          'key': 'rzp_test_EcwJVmpKI6WHF9',
                          'amount': 100,
                          'name': 'Travelgram',
                          'description': 'Train Ticket',
                          'prefill': {
                            'contact': '9400126457',
                            'email': 'jozefnikhil037@gmail.com'
                          }
                        };
                        _razorpay.open(options);
                      },
                      child: Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                          child: const Center(
                            child: Text(
                              'Continue',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                          ))))
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
