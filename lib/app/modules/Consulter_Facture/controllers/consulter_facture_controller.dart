import 'package:get/get.dart';

import '../../../Services/FactureService.dart';
import '../../../data/Models/Facture.dart';

class ConsulterFactureController extends GetxController {
  final FactureService factureService = FactureService();
  RxList<Facture> factures = <Facture>[].obs;


  final count = 0.obs;
  @override
  void onInit() {
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

  Future getAllFacture() async {
    try {
      factures.value =  await factureService.getFacture();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load invoices',
        duration: Duration(seconds: 3),
      );
    }
    print(factures.value.toString());
  }
  void increment() => count.value++;
}
