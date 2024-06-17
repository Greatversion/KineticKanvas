import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kinetic_kanvas/main.dart';

import 'package:kinetic_kanvas/utils/search_bar_widget.dart';
import 'package:kinetic_kanvas/views/others/profile_page.dart';
import 'package:kinetic_kanvas/views/others/settings_page.dart';
import 'package:kinetic_kanvas/views/screens/authentication/login_page.dart';
import 'package:kinetic_kanvas/views/screens/courses/search_page.dart';

import 'courses/courses_catalog_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String greeting;
  final int _selectedIndex = 0;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    printGreetings();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData responsive = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: responsive.size.height * 0.18,
        backgroundColor: darkColor.lightPink,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hey, $greeting",
                  style: customFont.primaryheader,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SettingsPage();
                      }));
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchPage();
                  }));
                },
                child: const SearchTab())
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomAppBar(),
              const SizedBox(height: 15),
              Text(
                "Offers",
                style: customFont.secondaryheader,
              ),
              const OfferSection(),
              const SizedBox(height: 5),
              const Divider(
                color: Color.fromARGB(85, 255, 255, 255),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: customFont.secondaryheader,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CourseCategories();
                        }));
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(color: lightColor.thinBlue),
                      ))
                ],
              ),
              const CategoriesSection(),
              const SizedBox(height: 5),
              const Divider(
                color: Color.fromARGB(85, 255, 255, 255),
              ),
              Text(
                "Mentors",
                style: customFont.secondaryheader,
              ),
              const MentorSection(),
              const Divider(
                color: Color.fromARGB(85, 255, 255, 255),
              ),
              Text(
                "Popular Courses ",
                style: customFont.secondaryheader,
              ),
              const PopularCourses(),
            ],
          ),
        ),
      ),
    );
  }
}

class OfferSection extends StatelessWidget {
  const OfferSection({Key? key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData responsive = MediaQuery.of(context);
    return ExpandableCarousel.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index, int pageviewIndex) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            color: const Color.fromARGB(20, 220, 219, 219),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:
                          "https://www.sydneyoperahouse.com/sites/default/files/collaborodam_assets/Etudes-Circle%20Electric-16-9.jpg",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Batch name ",
                                style: TextStyle(color: Colors.white)),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                child: Container(
                                  color: lightColor.thinBlue,
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6.0),
                                    child: Text("New",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text("Tutor name",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("⭐⭐⭐⭐⭐"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "privcce",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("price cut",
                                style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        viewportFraction: 0.5,
        enlargeCenterPage: true,
        showIndicator: false,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData responsive = MediaQuery.of(context);
    return SizedBox(
      height: responsive.size.height * 0.07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: lightColor.lightBlue, width: 2),
                ),
                child: const Text(
                  "Salsa",
                  style: TextStyle(color: Colors.white),
                ),
              ));
        },
      ),
    );
  }
}

class MentorSection extends StatelessWidget {
  const MentorSection({Key? key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData responsive = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int mentorId) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Open a card with detailed information
                  _showMentorDetails(context, mentorId);
                },
                child: CircleAvatar(
                  radius: responsive.size.width * 0.08,
                  backgroundImage: const CachedNetworkImageProvider(
                    "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/12/11/Pictures/_c99c4d44-3ba8-11eb-b07e-614fa469275b.jpg",
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Remo D'Souza",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Hip-Hop",
                style: TextStyle(
                  color: Color.fromARGB(153, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
        itemCount: 3,
        shrinkWrap: true,
      ),
    );
  }

  void _showMentorDetails(BuildContext context, int mentorId) {
    // You can replace this with your logic to show detailed information
    MediaQueryData responsive = MediaQuery.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: responsive.size.height * 0.7,
            width: responsive.size.width * 0.8,
            child: Column(
              children: [
                Hero(
                  tag: "hh",
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/12/11/Pictures/_c99c4d44-3ba8-11eb-b07e-614fa469275b.jpg"),
                ),
                const Text("Remo D' souza"),
                const Text("Hip-Hop"),
                const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PopularCourses extends StatelessWidget {
  const PopularCourses({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData responsive = MediaQuery.of(context);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Color.fromARGB(47, 255, 255, 255),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            leading: Image(
                image: CachedNetworkImageProvider(
                    "https://www.sydneyoperahouse.com/sites/default/files/collaborodam_assets/Etudes-Circle%20Electric-16-9.jpg")),
            title: Text(
              "Course name",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tutor Name",
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("⭐⭐⭐⭐⭐"),
                    Text("privcce"),
                  ],
                )
              ],
            ),
          ),
        );
      },
      shrinkWrap: true,
    );
  }
}
