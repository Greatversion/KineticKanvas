import 'package:flutter/material.dart';
import 'package:kinetic_kanvas/assets/colors/color_pallete.dart';
import 'package:kinetic_kanvas/main.dart';

class CourseCategories extends StatelessWidget {
  const CourseCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Categories",
            style: customFont.primaryheader,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ))
          ],
          // toolbarHeight: 12,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: darkColor.lightPink,
          bottom:
              TabBar(indicatorColor: lightColor.lightBlue, tabs: const <Widget>[
            Tab(
              child: Text(
                "All courses",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Tab(
              child: Text(
                "Subscribed",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Tab(
              child: Text(
                "Favourites",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
