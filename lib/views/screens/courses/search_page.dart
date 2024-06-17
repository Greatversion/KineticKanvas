import 'package:flutter/material.dart';
import 'package:kinetic_kanvas/main.dart';
import 'package:kinetic_kanvas/utils/search_bar_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData responsive = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: darkColor.lightPink,
          toolbarHeight: responsive.size.height * 0.1,
          title: const SearchBarWidget(),
        ),
        body: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return const ListTile(
                title: Text(
                  "Course name",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tutor Name",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            }));
  }
}
