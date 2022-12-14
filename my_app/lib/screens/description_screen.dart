import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';

class DescriptionScreen extends StatelessWidget {
  Dio dio = Dio();

  Future postData() async {
    final response = await dio.post(
        'https://shop-production-3194.up.railway.app/video/upload',
        data: {
          'videoLink': GetStorage().read('videoLink'),
          'products': [
            {
              "image": 'https://ae01.alicdn.com/kf/HTB1cmY2QNTpK1RjSZFKq6y2wXXaz/Hot-2-In-1-Liquid-Lip-Gloss-Matte-Lipsick-Waterproof-Long-Lasting-Makeup-Cosmetics-Nude-Color.jpg',
              "productName": GetStorage().read('name'),
              "productLink": GetStorage().read('link'),
              "mark": GetStorage().read('mark'),
              "hashtag": GetStorage().read('hashtag'),
              "label": GetStorage().read('legend'),
            },
          ]
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
          },
        ));
    print(response.data);
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController? legendxController = TextEditingController();
    TextEditingController? hashtagController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    var data;
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFormField(
                                  controller: legendxController,
                                  decoration: const InputDecoration(
                                    labelText: 'Leg??nde',
                                    hintText: 'Decrivez votre post',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: hashtagController,
                                  decoration: const InputDecoration(
                                    labelText: 'Hashtag',
                                    hintText: 'hashtag',
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          )),
                    )
                  ],
                )),
            SizedBox(height: Get.height * 0.1),
            Container(
              width: Get.width * 0.8,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    padding: const EdgeInsets.fromLTRB(60, 14, 14, 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async => {
                        if (_formKey.currentState!.validate())
                          {
                            GetStorage()
                                .write("legend", legendxController.text),
                            GetStorage()
                                .write("hashtag", hashtagController.text),
                          },
                        print(GetStorage().getValues()),
                        print("posting data .................."),
                        data = await postData(),
                        await Share.share(
                            "https://social-shopping-app.vercel.app/post/${data['video']}"),
                      },
                  child: Center(
                    child: Row(children: const [
                      Icon(Icons.share),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Publier",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ]),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
