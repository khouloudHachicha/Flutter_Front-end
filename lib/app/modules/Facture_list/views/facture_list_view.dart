import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/Models/Facture.dart';
import '../controllers/facture_list_controller.dart';

class FactureListView extends GetView<FactureListController> {
  FactureListView({super.key});

  final FactureListController controller = Get.put(FactureListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child:
                  Text('Invoice List', style: TextStyle(color: Colours.navy)))),
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
                    controller.openPDF(context, facture);
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.picture_as_pdf_outlined,color: Colours.navy,),
                    onPressed: (){
                      controller.openPDF(context, facture);
                    },
                  ),
                ),
              );
            },
          )),
    );
  }
}
