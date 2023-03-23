import 'package:get/get.dart';

import '../controllers/facture_list_controller.dart';

class FactureListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FactureListController>(
      () => FactureListController(),
    );
  }
}
