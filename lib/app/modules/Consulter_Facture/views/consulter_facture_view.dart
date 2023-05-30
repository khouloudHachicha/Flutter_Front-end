import 'package:colours/colours.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/modules/Settings/bindings/settings_binding.dart';
import 'package:ocr_projet_pfe/app/modules/Settings/views/settings_view.dart';

import '../../homePage/bindings/home_page_binding.dart';
import '../../homePage/views/home_page_view.dart';
import '../controllers/consulter_facture_controller.dart';

class ConsulterFactureView extends GetView<ConsulterFactureController> {
   ConsulterFactureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colours.navy,
        elevation: 1,
        leading: IconButton(
            icon:  const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: (){
              Get.off(()=>  SettingsView(),binding: SettingsBinding());
            }
        ),),
      body: Obx(() => ListView.builder(
        itemCount: controller.factures.length,
        itemBuilder: (context, index) {
          final facture = controller.factures[index];
          return Card(
            child: ListTile(
              title: Text('Facture ${facture.num}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: ${DateTime.tryParse(facture.date.toString())}'),
                  Text('Numéro: ${facture.num}'),
                  Text('Client: ${facture.client}'),
                  Text('Montant: ${facture.montant}'),
                ],
              ),
              onTap: () {
                // controller.openPDF(context, facture);
              },
              trailing: IconButton(
                icon: Icon(Icons.picture_as_pdf_outlined),
                onPressed: (){
                },
              ),
            ),
          );
        },
      )),
    );
  }
}

