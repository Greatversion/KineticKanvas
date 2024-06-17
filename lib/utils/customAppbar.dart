import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kinetic_kanvas/main.dart';
import 'package:kinetic_kanvas/utils/search_bar_widget.dart';
import 'package:kinetic_kanvas/views/screens/home_page.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late String greeting;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    printGreetings();
  }

  void printGreetings() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour < 12) {
      greeting = "Good Morning";
    } else if (hour < 17) {
      greeting = "Good Afternoon";
    } else {
      greeting = "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData responsive = MediaQuery.of(context);
    return Container(
      height: responsive.size.height * 0.17,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hey, $greeting",
                  style: customFont.primaryheader,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: lightColor.navyBlue,
                    ))
              ],
            ),
          ),
          const SearchBarWidget()
        ],
      ),
    );
  }
}

// class CustomClipPath extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double h = size.height;
//     double w = size.width;
//     final path = Path();

//     path.lineTo(0, h); //coordinates that changes...
//     path.quadraticBezierTo(w * 0.5, h - h * 0.22, w, h);
//     path.lineTo(w, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
