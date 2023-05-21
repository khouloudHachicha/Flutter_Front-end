import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../Services/FactureService.dart';
import '../../../data/Models/Facture.dart';

class FactureListController extends GetxController with StateMixin {

  final FactureService _factureService = FactureService();
  RxList<Facture> factures = <Facture>[].obs;

  @override
  void onInit() {
    PDF();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> PDF() async {
    try {
      var dio = Dio();
      dio.options.headers = {'Content-Type': 'application/pdf'};
      final loadedFacture = await _factureService.getFacture();
      factures.value = loadedFacture;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load invoices',
        duration: Duration(seconds: 3),
      );
    }
  }
  void openPDF(BuildContext? context, Facture facture) async {
    if (context != null) {
      try {
        final Directory appDir = await getApplicationDocumentsDirectory();
        final String appDocPath = appDir.path;
        final String pdfPath = '$appDocPath/facture_${facture.num}.pdf';

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Scaffold(
                  appBar: AppBar(
                    title: Text('PDF Viewer'),
                  ),
                  body: PDFView(
                    filePath: pdfPath,
                  ),
                ),
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }
}