import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/add_video_Screen.dart';
import 'package:lottie/lottie.dart';
class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/original.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 700, left: 120, right: 75,bottom: 10),
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
                        const AddVideoScreen(),
                        arguments: {
                          'title': 'Add Video',
                        },
                        transition: Transition.rightToLeftWithFade,
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 500),

                      )
                    },
                child: Row(children: const [
                  Text("créer vidéo",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(Icons.arrow_right_alt_outlined)
                ]))),
      ],
    )));
  }
}
