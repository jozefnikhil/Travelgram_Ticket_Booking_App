import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelgram/Providers/thememodel.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        activeColor: Colors.green,
        value: themeProvider.isDarkMode,
        onChanged: ((value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
        }));
  }
}
