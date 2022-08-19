import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddForm extends StatelessWidget {
  const ProductAddForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child:  Text(''),
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
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Nom de la marque *',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Nom du produit *',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Prix du produit *',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Lien du Produit *',
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 2,
                                    padding:
                                        const EdgeInsets.fromLTRB(60, 14, 14, 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () => {
                                        Get.to(
                                          const ProductAddForm(),
                                          arguments: {
                                            'title': 'product Add Form',
                                          },
                                          transition: Transition.zoom,
                                          curve: Curves.easeInOut,
                                          duration:
                                              const Duration(milliseconds: 500),
                                        )
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
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
