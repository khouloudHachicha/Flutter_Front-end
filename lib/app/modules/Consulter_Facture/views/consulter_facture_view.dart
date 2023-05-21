import 'package:colours/colours.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../homePage/bindings/home_page_binding.dart';
import '../../homePage/views/home_page_view.dart';
import '../controllers/consulter_facture_controller.dart';

class ConsulterFactureView extends GetView<ConsulterFactureController> {
  const ConsulterFactureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Text('Invoice List'),
                backgroundColor: Colours.navy,
                elevation: 1,
                  leading: IconButton(
                    icon:  const Icon(
                    Icons.arrow_back,
                    color: Colours.white,
                    ),
                    onPressed: (){
                    Get.off(()=> const HomePageView(),binding: HomePageBinding());
                    }
          ),),
          body: const SingleChildScrollView()
    );
  }
}
