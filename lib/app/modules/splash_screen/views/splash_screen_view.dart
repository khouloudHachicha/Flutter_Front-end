import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:colours/colours.dart';
import '../../../data/UserDataStorage.dart';
import '../../homePage/views/home_page_view.dart';
import '../../login/bindings/login_binding.dart';
import '../../login/views/login_view.dart';

class spalshScreen extends StatefulWidget {

  @override
  State<spalshScreen> createState() => _spalshScreenState();
}
class _spalshScreenState extends State<spalshScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) =>
    {
    Get.off(() => LoginView(), binding: LoginBinding())
    });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.navy,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage("assets/ScanLogo.png"),
              width: 300,color: Colors.white),
            SizedBox(height: 50,),
            SpinKitPianoWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

