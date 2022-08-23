import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/screens/description_screen.dart';
import 'package:my_app/screens/product_add_form.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final String? videoLink = Get.arguments[0];

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      videoLink!,
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    List<Widget> listProducts = [
      Card(
          margin: const EdgeInsets.all(8),
          elevation: 20,
          borderOnForeground: true,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Colors.white24,
              width: 4,
              style: BorderStyle.solid,
            ),
          ),
          shadowColor: Colors.white12,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.white,
                elevation: 2,
                borderOnForeground: true,
                child: Image.asset(
                  'assets/images/lipstick.png',
                  fit: BoxFit.cover,
                ),
              ))),
      /*Card(
          margin: const EdgeInsets.all(8),
          elevation: 20,
          borderOnForeground: true,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Colors.white24,
              width: 4,
              style: BorderStyle.solid,
            ),
          ),
          shadowColor: Colors.white12,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.white,
                elevation: 2,
                borderOnForeground: true,
                child: Image.asset(
                  "assets/images/lipstick.png",
                  width: 80,
                  height: 100,
                ),
              ))),
      Card(
          margin: const EdgeInsets.all(8),
          elevation: 20,
          borderOnForeground: true,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Colors.white24,
              width: 4,
              style: BorderStyle.solid,
            ),
          ),
          shadowColor: Colors.white12,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.white,
                elevation: 2,
                borderOnForeground: true,
                child: Image.asset(
                  "assets/images/lipstick.png",
                  width: 80,
                  height: 100,
                ),
              ))),
      Card(
          margin: const EdgeInsets.all(8),
          elevation: 20,
          borderOnForeground: true,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Colors.white24,
              width: 4,
              style: BorderStyle.solid,
            ),
          ),
          shadowColor: Colors.white12,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.white,
                elevation: 2,
                borderOnForeground: true,
                child: Image.asset(
                  "assets/images/lipstick.png",
                  width: 80,
                  height: 100,
                ),
              ))),
      Card(
          margin: const EdgeInsets.all(8),
          elevation: 20,
          borderOnForeground: true,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Colors.white24,
              width: 4,
              style: BorderStyle.solid,
            ),
          ),
          shadowColor: Colors.white12,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.white,
                elevation: 2,
                borderOnForeground: true,
                child: Image.asset(
                  "assets/images/lipstick.png",
                  width: 80,
                  height: 100,
                ),
              ))),*/
      //card
    ];

    @override
    void dispose() {
      super.dispose();
      _controller.dispose();
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            onPressed: () =>
            {
              Get.back(),
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.blue,
                  animationDuration: const Duration(milliseconds: 500),
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Get.to(
                        () => DescriptionScreen(),
                    arguments: {
                      'title': 'product Add Form',
                    },
                    transition: Transition.zoom,
                    curve: Curves.bounceInOut,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                child: const Text('suivant'),
              ),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the video.
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_controller),
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                Center(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        });
                      },
                      icon: _controller.value.isPlaying ? const Icon(
                        Icons.pause_circle_outline_outlined, color: Colors.redAccent,
                        size: 50,) : const Icon(
                          Icons.play_arrow, color: Colors.green,size: 50,),
                      color: Colors.red,
                    )),
                Positioned(
                  top: Get.height * 1 / 1.9,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      children: listProducts
                          .map((product) =>
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: product,
                          ))
                          .toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 650, left: 70, right: 70, bottom: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 6,
                        padding: const EdgeInsets.fromLTRB(25, 15, 0, 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () =>
                      {
                        Get.to(
                              () => ProductAddForm(),
                          arguments: {
                            'title': 'Add Video',
                          },
                          transition: Transition.rightToLeftWithFade,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 500),
                        )
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.add_to_photos, color: Colors.white),
                            SizedBox(width: 10),
                            Text("Ajouter Produit ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20)),
                          ])),
                ),
              ],
            )));
  }
}
