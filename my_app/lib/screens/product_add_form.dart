import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/screens/add_product.dart';

class ProductAddForm extends StatelessWidget {
  TextEditingController? marqueController = TextEditingController();
  TextEditingController? nomController = TextEditingController();
  TextEditingController? prixController = TextEditingController();
  TextEditingController? linkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var result;



  @override
  Widget build(BuildContext context) {
    FilePickerResult? result;
    File? file;
    PlatformFile? pickedFile;
    var storageRef, fileName;
    var videoRef;
    var videFileRef, snapshot, urlDownload;
    String filePath;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Add Product'),
        ),
        extendBodyBehindAppBar: true,
        body: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: Get.height * 0.25,
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.pink,
                          Colors.pinkAccent,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Text(''),
                  ),
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: marqueController,
                                decoration: const InputDecoration(
                                  labelText: 'Nom de la marque *',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: nomController,
                                decoration: const InputDecoration(
                                  labelText: 'Nom du produit *',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: linkController,
                                decoration: const InputDecoration(
                                  labelText: 'Lien du Produit *',
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 2,
                                    padding: const EdgeInsets.fromLTRB(
                                        60, 14, 14, 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () => {
                                        if (_formKey.currentState!.validate())
                                          {
                                            GetStorage().write(
                                                "mark", marqueController?.text),
                                            GetStorage().write(
                                                "name", nomController?.text),
                                            GetStorage().write(
                                                "link", linkController?.text),
                                            print(
                                              GetStorage().getValues(),
                                            ),
                                             Get.to(()=>  AddProduct())
                                          }
                                        /*Get.to(
                                           ProductAddForm(),
                                          arguments: {
                                            'title': 'product Add Form',
                                          },
                                          transition: Transition.zoom,
                                          curve: Curves.easeInOut,
                                          duration:
                                              const Duration(milliseconds: 500),
                                        )*/
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
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () async => {
                  result =
                  await FilePicker.platform.pickFiles(),
                  pickedFile = result?.files.first,
                  file = File(pickedFile!.path!),
// Create a storage reference from our app
                  storageRef = FirebaseStorage.instance
                      .ref()
                      .child('images/${pickedFile!.name}'),
                  videoRef = storageRef.putFile(file),
                  snapshot = await videoRef.whenComplete(() {}),
                  urlDownload =
                  await snapshot.ref.getDownloadURL(),
                  print("url $urlDownload"),
                  await GetStorage()
                      .write("imageLink", urlDownload),

                },
                child: Container(
                  width: Get.width * 0.55,
                  height: Get.height * 0.33,
                  margin: const EdgeInsets.only(top: 100),
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
                      child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                            color: Colors.white,
                            shadowColor: Colors.white,
                            elevation: 2,
                            borderOnForeground: true,
                            child: Center(
                              child: Text('No image selected.'),
                            ),
                            /*logoBase64==null? Image.asset(
                              "assets/images/lipstick.png",
                              width: 80,
                              height: 100,
                            ):Image.memory(logoBase64!)*/
                          ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
