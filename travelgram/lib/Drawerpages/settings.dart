import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelgram/Drawerpages/darktheme.dart';

class Localization1 extends StatelessWidget {
  Localization1({
    super.key,
  });
  final List locale = [
    {'name': 'English', 'locale': const Locale('en', 'US')},
    {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
    {'name': 'മലയാളം', 'locale': const Locale('ml', 'IN')}
  ];

  builddialoguebox(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Choose Language'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                  msg: locale[index]['name'],
                                  gravity: ToastGravity.BOTTOM);
                              updatelang(locale[index]['locale']);
                            },
                            child: Text(locale[index]['name'])));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  updatelang(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

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
        title: const Text('Settings'),
      ),
      body: Column(children: [
        ListTile(
            leading: const Icon(Icons.language),
            onTap: () {
              builddialoguebox(context);

              // var locale = Locale('');
              // Get.updateLocale(locale);
            },
            title: Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  'changelang'.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18),
                ))),
        ListTile(
            leading: const Icon(Icons.dark_mode),
            title: Text(
              'Dark theme'.tr,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            trailing: const ChangeThemeButtonWidget()),
      ]),
    );
  }
}
