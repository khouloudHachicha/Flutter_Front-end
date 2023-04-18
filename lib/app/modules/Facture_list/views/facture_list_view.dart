import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/facture_list_controller.dart';

class FactureListView extends GetView<FactureListController> {
  final String imagePath;
    const FactureListView({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Center(child: Text('Facutre List')),),
      body:
        ListView.builder(
        itemCount: imagePath.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.asset(
                imagePath[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      )
    );
  }
}