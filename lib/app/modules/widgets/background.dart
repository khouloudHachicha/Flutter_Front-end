import 'package:colours/colours.dart';
import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
final String text;

  const MainBackground({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          Image(
            image: const AssetImage("assets/background.png"),
            color: Colours.navy,
            fit: BoxFit.cover,
            height: 390,
          ),
           Positioned(
            top:170,
            left: 10,
            child: Text(text,
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontFamily: 'MyFont',
                color: Colors.white,
              ),
            ),
          ),
        ]
    );
  }
}


class Background extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;

  const Background({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:[
        Image(
          image: const AssetImage("assets/background.png"),
          color: Colours.navy,
          fit: BoxFit.cover,
          height: 390,
        ),
        Positioned(
          top:170,
          left: 10,
          child: Text(text,
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w900,
              fontFamily: 'MyFont',
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top:0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colours.navy,
            elevation: 1,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed:
                onpressed
            ),
          ),)
      ],
    );
  }
}
