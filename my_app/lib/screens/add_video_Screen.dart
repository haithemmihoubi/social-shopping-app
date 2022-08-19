import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/add_product.dart';
import 'package:lottie/lottie.dart';

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
                Lottie.asset(
                  "assets/videolottie.json",
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
              padding: const EdgeInsets.only(
                  top: 670, left: 15, right: 15, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0,
                          animationDuration: const Duration(milliseconds: 500),
                          padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
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
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.black))),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 6,
                        padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    )));
  }
}
