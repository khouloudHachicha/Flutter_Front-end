import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/views/home_page_view.dart';
import '../../homePage/bindings/home_page_binding.dart';
import '../controllers/users_list_controller.dart';

class UsersListView extends GetView<UsersListController> {
   const UsersListView({Key? key}) : super(key: key);
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
         Get.off(()=> const HomePageView(),binding: HomePageBinding());
       }
      ),),
      body: SingleChildScrollView(
        child: Obx(() => ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index];
            return Card(
              child: ListTile(
                title: Text(user.username),
                subtitle: Text('CIN: ${user.cin}\nEmail: ${user.email}\nPhone: ${user.phone}'),
              ),
            );
          },
        )),
      ),
    );
  }
}