import 'dart:io';

import 'package:colours/colours.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../homePage/bindings/home_page_binding.dart';
import '../../homePage/views/home_page_view.dart';
import '../controllers/facture_list_controller.dart';

class FactureListView extends GetView<FactureListController> {
  final String imagePath;
    const FactureListView({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List des factures'),
        backgroundColor: Colours.navy,
        elevation: 1,
    ),
      body: Center(
        child: Image.file(File(imagePath)),
      )
    );
  }
}
