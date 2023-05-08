import 'package:get/get.dart';

import '../controllers/consulter_facture_controller.dart';

class ConsulterFactureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsulterFactureController>(
      () => ConsulterFactureController(),
    );
  }
}
