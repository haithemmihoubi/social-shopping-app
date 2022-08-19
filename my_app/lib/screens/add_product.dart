import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_video_Screen.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.blue,),
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
                    padding: const EdgeInsets.fromLTRB(30,0, 30, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),

                  ),
                  onPressed: () {},
                  child: Text('suivant')),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/makeup.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 700, left: 95, right: 70, bottom: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      padding: const EdgeInsets.fromLTRB(30, 14, 30, 14),
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
                      Icon(Icons.add),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Ajouter Produit",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20)),
                    ]))),
          ],
        )));
  }
}
