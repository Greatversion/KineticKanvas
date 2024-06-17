import 'package:flutter/material.dart';
import 'package:kinetic_kanvas/assets/colors/color_pallete.dart';
import 'package:kinetic_kanvas/assets/fonts/font_pallate.dart';
import 'package:kinetic_kanvas/home_ui.dart';

import 'package:kinetic_kanvas/views/screens/home_page.dart';

DarkAppColorPallete darkColor = DarkAppColorPallete();
LightAppColorPallete lightColor = LightAppColorPallete();
CustomFont customFont = CustomFont();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeUI(),
    );
  }
}
