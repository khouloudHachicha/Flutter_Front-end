import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/modules/homePage/views/home_page_view.dart';
import '../../Settings/bindings/settings_binding.dart';
import '../../Settings/views/settings_view.dart';
import '../../homePage/bindings/home_page_binding.dart';
import '../controllers/users_list_controller.dart';

class UsersListView extends GetView<UsersListController> {
  const UsersListView({Key? key}) : super(key: key);

  Future<void> _refresh() {
    return controller.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colours.navy,
        elevation: 1,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            }
        ),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (username) => controller.searchUser(username),
                    decoration: InputDecoration(
                      hintText: 'Search users...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(
                    () =>
                    RefreshIndicator(
                      onRefresh: () => _refresh(),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        itemCount: controller.users.length,
                        itemBuilder: (context, index) {
                          final user = controller.users[index];
                          return Card(
                            child: ListTile(
                              title: Text(user.username),
                              subtitle: Text(
                                'CIN: ${user.cin}\nEmail: ${user
                                    .email}\nPhone: ${user.phone}',
                              ),
                              leading: Icon(
                                  Icons.co_present, color: Colours.navy),
                              onTap: () {
                                if (controller.users[index].role.toString() ==
                                    "admin") {
                                  controller.verifDialog(user.id);
                                } else {
                                  controller.openDialog(user.id);
                                }
                              },
                              trailing: PopupMenuButton<String>(
                                itemBuilder: (BuildContext context) =>
                                [
                                  PopupMenuItem<String>(
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(color: Colours.navy),
                                    ),
                                    onTap: () {
                                      controller.delete(
                                          controller.users[index].id
                                              .toString());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





