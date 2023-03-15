
import 'package:colours/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login/bindings/login_binding.dart';
import '../login/views/login_view.dart';
import '../profile/bindings/profile_binding.dart';
import '../profile/views/profile_view.dart';
import '../users_list/bindings/users_list_binding.dart';
import '../users_list/views/users_list_view.dart';

class DrawerCustom extends StatefulWidget{
  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
            ),
            child: Text('Username',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontFamily: 'MyFont',
                color: Colours.navy,
              ),
              ),
          ),
          ListTile(
            title:  Text('Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: 'MyFont',
                color: Colours.navy,
              ),
            ),
            onTap: () {
              Get.off(() => ProfileView(), binding: ProfileBinding());
            },
          ),
          Visibility(
            //visible: false,
            child: ListTile(
              title: Text('Users Lists',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: 'MyFont',
                color: Colours.navy,
              ),
              ),
              onTap: () {
                Get.off(() => UsersListView(), binding: UsersListBinding());
              },
            ),
          ),
          ListTile(
            title: Text('Log out ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: 'MyFont',
                color: Colours.navy,
              ),
            ),
            onTap: () {
              Get.off(() => LoginView(), binding: LoginBinding());
            },
          ),
        ],
      ),
    );
  }
}
