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

class AddVideoScreen extends StatefulWidget {
  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  var appDocDir;

  FilePickerResult? result;

  File? file;

  PlatformFile? pickedFile;

  var storageRef, fileName;
  bool uploaded = false;
  var videoRef, videFileRef, snapshot, urlDownload;
  late UploadTask? uploadTask = null;

  @override
  Widget build(BuildContext context) {
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
            uploaded
                ? Container(
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
                          () => AddProduct(),
                          arguments: [
                            urlDownload,
                          ],
                          transition: Transition.zoom,
                          curve: Curves.bounceInOut,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: const Text('suivant'),
                    ),
                  )
                : Container(),
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
                    SizedBox(
                      height: 500,
                      width: 300,
                      child: buildProgress(),
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
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0,
                            animationDuration:
                                const Duration(milliseconds: 500),
                            padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async => {
                                result = await FilePicker.platform.pickFiles(),
                                pickedFile = result?.files.first,
                                file = File(pickedFile!.path!),
// Create a storage reference from our app
                                storageRef = FirebaseStorage.instance
                                    .ref()
                                    .child('videos/${pickedFile!.name}'),

                                videoRef = storageRef.putFile(file),
                                setState(() {
                                  uploadTask = storageRef.putFile(file);
                                }),
                                snapshot =
                                    await videoRef.whenComplete((value) {}),

                                urlDownload =
                                    await snapshot.ref.getDownloadURL(),
                                setState(() async {
                                  uploadTask = null;
                                  uploaded = true;
                                }),
                                print("url $urlDownload"),

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
                      const SizedBox(
                        width: 60,
                      ),
                      ElevatedButton(
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
                            () => FlutterCamera(
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
                                  setState(() {
                                    uploadTask = storageRef.putFile(file);
                                  });

                                  snapshot = await videoRef.whenComplete(() {});
                                  urlDownload =
                                      await snapshot.ref.getDownloadURL();
                                  setState(() {
                                    uploadTask = null;
                                    uploaded = true;
                                  });
                                  await GetStorage()
                                      .write("videoLink", urlDownload);
                                  print("url $urlDownload");
                                },
                                onImageCaptured: (f) async {
                                  file = File(f.path);
                                  fileName = f.path.substring(
                                      f.path.lastIndexOf("/") + 1,
                                      f.path.length);
                                  storageRef = FirebaseStorage.instance
                                      .ref()
                                      .child('videos/$fileName');
                                  setState(() {
                                    uploadTask = storageRef.putFile(file);
                                  });
                                  snapshot =
                                      await uploadTask?.whenComplete(() {});
                                  urlDownload =
                                      await snapshot.ref.getDownloadURL();
                                  setState(() async {
                                    uploadTask = null;
                                    uploaded = true;
                                  });
                                  await GetStorage()
                                      .write("videoLink", urlDownload);
                                  print("url $urlDownload");
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
                    ],
                  ))
            ],
          ),
        )));
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = (data.bytesTransferred) / (data.totalBytes);
          return Stack(children: [
            if (data.bytesTransferred != data.totalBytes)
              Padding(
                padding: const EdgeInsets.only(right: 200.0),
                child: Lottie.asset(
                  "assets/7877-uploading-to-cloud.json",
                  width: 500,
                  height: 500,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Center(
                child: Text("${(progress * 100).toStringAsFixed(0)}%",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500)),
              ),
            )
          ]);
        } else {
          return Padding(
            padding: EdgeInsets.only(left: 40.0, top: 190.0),
            child: Column(
              children: [
                const Text(
                  "upload your video",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Lottie.asset(
                  "assets/110596-arrow-down-blue-2.json",
                  width: 200,
                  height: 150,
                ),
              ],
            ),
          );
        }
      });
}
