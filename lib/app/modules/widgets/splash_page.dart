import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class spalshScreen extends StatefulWidget {
  const spalshScreen({Key? key}) : super(key: key);

  @override
  State<spalshScreen> createState() => _spalshScreenState();
}

class _spalshScreenState extends State<spalshScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage("assets/scanUp.png"),
              width: 300,),
            SizedBox(height: 50,),
            SpinKitWanderingCubes(
            color: Colors.blueAccent,
            size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

