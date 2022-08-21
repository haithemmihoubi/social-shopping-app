import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/screens/add_product.dart';
import 'package:my_app/screens/video_screen.dart';
import 'package:path_provider/path_provider.dart';

class AddVideoScreen extends StatelessWidget {
  var appDocDir;

  @override
  Widget build(BuildContext context) {
    FilePickerResult? result;
    File? file;
    PlatformFile? pickedFile;

    var storageRef, fileName;
    var videoRef, videFileRef, snapshot, urlDownload;
    String filePath;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            onPressed: () => {
              Get.back(),
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
              onPressed: () => {
                Get.to(
                      ()=>   const AddProduct(),
                  arguments: {
                    'videoLink': urlDownload,
                  },
                  transition: Transition.zoom,
                  curve: Curves.easeInOut,
                  duration:
                  const Duration(milliseconds: 500),
                )
              },
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/video-play.png",
                      width: 250,
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
                      top: 600, left: 15, right: 15, bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 0,
                              animationDuration:
                                  const Duration(milliseconds: 500),
                              padding:
                                  const EdgeInsets.fromLTRB(30, 12, 30, 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () async => {
                                  result =
                                      await FilePicker.platform.pickFiles(),
                                  pickedFile = result?.files.first,
                                  file = File(pickedFile!.path!),
// Create a storage reference from our app
                                  storageRef = FirebaseStorage.instance
                                      .ref()
                                      .child('videos/${pickedFile!.name}'),
                                  videoRef = storageRef.putFile(file),
                                  snapshot = await videoRef.whenComplete(() {}),
                                  urlDownload =
                                      await snapshot.ref.getDownloadURL(),
                                  print("url $urlDownload"),
                                  await GetStorage()
                                      .write("videoLink", urlDownload),
                                  if (result == null)
                                    {
                                      Get.snackbar(
                                        "Erreur",
                                        "Vous n'avez pas sélectionné de vidéo",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red,
                                        borderRadius: 10,
                                        margin: const EdgeInsets.all(10),
                                        borderColor: Colors.red,
                                        borderWidth: 2,
                                        colorText: Colors.white,
                                        animationDuration:
                                            const Duration(milliseconds: 500),
                                        duration:
                                            const Duration(milliseconds: 2000),
                                      )
                                    }
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
                                  ()=> FlutterCamera(
                                  color: Colors.blueAccent,
                                  onVideoRecorded: (f) async {
                                    file = File(f.path);
                                    fileName = f.path.substring(
                                        f.path.lastIndexOf("/") + 1,
                                        f.path.length);
                                    storageRef = FirebaseStorage.instance
                                        .ref()
                                        .child('videos/$fileName');
                                    videoRef = storageRef.putFile(file);
                                    snapshot =
                                        await videoRef.whenComplete(() {});
                                    urlDownload =
                                        await snapshot.ref.getDownloadURL();
                                    print("url $urlDownload");
                                    print("url $fileName");
                                    await GetStorage()
                                        .write("videoLink", urlDownload);
                                  },
                                  onImageCaptured: (f) async {
                                    file = File(f.path);
                                    fileName = f.path.substring(
                                        f.path.lastIndexOf("/") + 1,
                                        f.path.length);
                                    storageRef = FirebaseStorage.instance
                                        .ref()
                                        .child('videos/$fileName');
                                    videoRef = storageRef.putFile(file);
                                    snapshot =
                                        await videoRef.whenComplete(() {});
                                    urlDownload =
                                        await snapshot.ref.getDownloadURL();
                                    print("url $urlDownload");
                                    print("url $fileName");
                                    await GetStorage()
                                        .write("videoLink", urlDownload);
                                  }),
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
