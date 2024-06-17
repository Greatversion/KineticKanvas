import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: -10,
            left: -160,
            child: Row(
              children: [
                ScrollingImages(startingIndex: 0),
                ScrollingImages(startingIndex: 1),
                ScrollingImages(startingIndex: 2),
              ],
            ),
          ),
          const Positioned(
              top: 50,
              child: Text(
                "Fashion-App",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              )),
          Positioned(
              bottom: 0,
              child: SizedBox(
                height: h * 0.6,
                width: w,
                child: Column(
                  children: [
                    const Spacer(),
                    const Text(
                      "Your Appearanceows Your Quality",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Change the Quality of your Appearance with MNIML Fashion now.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white54, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: w * 0.8,
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 118, 8, 0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: const Center(
                            child: Text(
                          "Let's get started",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class ScrollingImages extends StatefulWidget {
  final int startingIndex;

  const ScrollingImages({
    super.key,
    required this.startingIndex,
  });

  @override
  State<ScrollingImages> createState() => _ScrollingImagesState();
}

class _ScrollingImagesState extends State<ScrollingImages> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.minScrollExtent) {
        _autoScrollForward();
      } else if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        _autoScrollbackward();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScrollForward();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _autoScrollForward() {
    final currentPosition = _scrollController.offset;
    final endPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: 20 + widget.startingIndex + 2),
          curve: Curves.linear);
    });
  }

  _autoScrollbackward() {
    final currentPosition = _scrollController.offset;
    final endPosition = _scrollController.position.minScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: 20 + widget.startingIndex + 2),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        height: h * 0.6,
        width: w * 0.6,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 8, left: 8, top: 10),
              height: h * 0.6,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(images[index]), fit: BoxFit.cover)),
            );
          },
        ),
      ),
    );
  }
}

List<String> images = [
  'https://plus.unsplash.com/premium_photo-1663013729768-8fcfe4cda447?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1492707892479-7bc8d5a4ee93?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://plus.unsplash.com/premium_photo-1675186049419-d48f4b28fe7c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1581044777550-4cfa60707c03?q=80&w=1886&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
];
