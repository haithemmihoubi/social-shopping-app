
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
          onPressed: () => {
            Get.back(),
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: Get.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(

                    width: Get.width * 0.4,
                    height: Get.height * 0.3,
                    child: Card(
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
                  ),
                ),
                Expanded(
                  child: Container(
                    width: Get.width * 0.5,
                    height: Get.height * 0.33,
                      padding: const EdgeInsets.all(10),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(

                            decoration: const InputDecoration(
                              labelText: 'Legénde',
                              hintText: 'Decrivez votre post',

                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Hashtag',
                              hintText: 'hashtag',
                            ),
                          ),
                          const SizedBox(height: 10),

                        ],
                      ),
                    )
                  ),
                )

              ],
            )
          ),
          SizedBox(height: Get.height * 0.1),
          Container(
            width: Get.width*0.8,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  padding:
                  const EdgeInsets.fromLTRB(60, 14, 14, 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => {
                },
                child: Center(
                  child: Row(children: const [
                    Icon(Icons.add_to_photos),
                    SizedBox(
                      width: 30,
                    ),
                    Text("Ajouter Produit",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                  ]),
                )),
          )
        ],
      ),
    );
  }
}
