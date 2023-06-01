import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ocr_projet_pfe/app/modules/Facture_list/bindings/facture_list_binding.dart';
import 'package:ocr_projet_pfe/app/modules/Facture_list/views/facture_list_view.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/views/home_page_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../data/AppUrl.dart';
import '../homePage/bindings/home_page_binding.dart';

class Pdf_Generator extends StatefulWidget {
  const Pdf_Generator({Key? key}) : super(key: key);

  @override
  State<Pdf_Generator> createState() => _Pdf_GeneratorState();
}

class _Pdf_GeneratorState extends State<Pdf_Generator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PDF'),
          backgroundColor: Colours.navy,
          elevation: 1,
          leading: IconButton(
              icon:  const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: (){
                Get.back();
              }
          ),),
        body: Container(
            child: SfPdfViewer.network(
                "${AppUrl.baseUrl}${AppUrl.facture}")));
  }
}
