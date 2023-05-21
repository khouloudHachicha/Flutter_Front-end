import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/Models/Facture.dart';
import '../controllers/facture_list_controller.dart';

class FactureListView extends GetView<FactureListController> {
  const FactureListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
          title: Center(
              child: Text(
                  'Invoice List',
                  style: TextStyle(
                      color: Colours.navy))
          )),
      body: SafeArea(
        child: GetX<FactureListController>(
          builder: (controller) {
            if (controller.factures.isEmpty ) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: controller.factures.length,
                itemBuilder: (context, index) {
                  final Facture facture = controller.factures[index];
                  return ListTile(
                    title: Text('Facture ${facture.num}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${facture.date.toString()}'),
                        Text('Client: ${facture.client}'),
                        Text('Vendeur: ${facture.vendeur}'),
                        Text('Montant: ${facture.montant}'),
                      ],
                    ),
                    onTap: () {
                      controller.openPDF(context, facture);
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
