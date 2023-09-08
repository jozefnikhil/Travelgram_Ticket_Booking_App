import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:travelgram/Drawerpages/lang.dart';
import 'package:travelgram/Splashscreens/animated.dart';
import 'package:travelgram/Providers/textprovider.dart';
import 'package:travelgram/Providers/thememodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
        ChangeNotifierProvider<TextInputProvider>(
          create: (context) => TextInputProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
          builder: (context, child) {
            final themeProvider = Provider.of<ThemeProvider>(context);

            return GetMaterialApp(
              translations: LocalString(),
              locale: const Locale('en', 'US'),
              home: const Animatedsplash(),
              theme: Themeclass.lighttheme, // Default light theme
              darkTheme: Themeclass.darktheme,
              themeMode: themeProvider.themeMode, // Default dark theme
              debugShowCheckedModeBanner: false,
            );
          },
        )
      ]);
}
