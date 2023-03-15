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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
          child: Column(
            children:[
             AppBar(
                  elevation: 1,
                  backgroundColor: Colours.navy,
                title: const Text('Users List View',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'MyFont',
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
                  leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed:
                      (){
                        Get.off(() => const HomePageView(), binding: HomePageBinding());
                      }
                  ),
    ),
              Card(
                shadowColor: Colors.cyan.shade800,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // définit le rayon de la bordure
                ),
                margin: const EdgeInsets.fromLTRB(
                    20.0, 20.0, 20.0, 0.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.account_circle,
                              color: Colors.grey)),
                      title: Text(
                        controller.role[index].role!,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                          controller.user[index].email!),
                    ),
                    Padding(
                         padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                      child: IntrinsicHeight(
                        child: Column(
                            children: [
                        Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0),
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 2,
                                child: CircleAvatar(
                                    backgroundColor:Colors.blue,
                                    child: Icon(
                                        Icons.call_sharp,
                                        color: Colors.grey))),
                            Expanded(
                                flex: 7,
                                child: Text(
                                  controller.user[index].phone!,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0),
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 2,
                                child: CircleAvatar(
                                    backgroundColor:Colors.blue,
                                    child: Icon(
                                        Icons.email_rounded,
                                        color: Colors.grey))),
                            Expanded(
                                flex: 7,
                                child: Text(
                                  controller.user[index].email!,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    ]
      ),
                      ),
                    ),
                  ],
                ),
              )
            ]
          ),
      ),
    );
  }
}
