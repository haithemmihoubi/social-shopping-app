import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/add_product.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/video.png",
                  width: 300,
                ),
                const Text(
                  "Ajouter une vidéo",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 720, left: 55, right: 10,bottom: 10),
              child: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        animationDuration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.fromLTRB(30, 14, 30, 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => {
                        Get.to(
                          const AddProduct(),
                          arguments: {
                            'title': 'Add Video',
                          },
                          transition: Transition.rightToLeftWithFade,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 500),

                        )
                      },
                      child: const Text("Galerie",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20))),
                  const SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      padding: const EdgeInsets.fromLTRB(30, 14, 30, 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => {
                      Get.to(
                        const AddProduct(),
                        arguments: {
                          'title': 'Add Video',
                        },
                        transition: Transition.rightToLeftWithFade,
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 500),

                      )
                    },
                    clipBehavior: Clip.antiAlias,
                    child: const Text(
                      "caméra",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                ],
              ))
        ],
      ),
    )));
  }
}
