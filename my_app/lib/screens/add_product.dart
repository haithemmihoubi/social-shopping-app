import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/description_screen.dart';
import 'package:my_app/screens/product_add_form.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String? videoLink = Get.arguments['videoLink'];


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
                  'assets/images/video.png',
                  fit: BoxFit.cover,
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
      //card
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            onPressed: () => {
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
                    const DescriptionScreen(),
                    arguments: {
                      'title': 'product Add Form',
                    },
                    transition: Transition.zoom,
                    curve: Curves.bounceInOut,
                    duration:
                    const Duration(milliseconds: 500),
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

              child: Image.asset(
                'assets/images/makeup.jpg',
                fit: BoxFit.fill,
              ),
            ),
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
                      .map((product) => Container(
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
                    onPressed: () => {
                      Get.to(
                         ProductAddForm(),
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
                        children:  [
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
