import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/home.dart';
import 'package:restruant_pos/utils/constant/texts_strings.dart';
import 'package:restruant_pos/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TpsTexts.appName,
      themeMode: ThemeMode.system,
      theme: TpsTheme.lightTheme,
      darkTheme: TpsTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}