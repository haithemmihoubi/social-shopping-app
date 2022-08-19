import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            image:  DecorationImage(
              image:  ExactAssetImage('assets/images/original.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child:  BackdropFilter(
            filter:  ImageFilter.blur(sigmaX: 0, sigmaY:0),
            child:  Container(
              decoration:  BoxDecoration(color: Colors.black.withOpacity(0.3)),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 650, left: 120, right: 75),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 6,
                padding: const EdgeInsets.fromLTRB(30, 18, 0, 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),

                ),
              ),
                onPressed: () => {},
                child: Row(children: [
                  Text("create video", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(Icons.arrow_right_alt_outlined)
                ]))),
      ],
    )));
  }
}
