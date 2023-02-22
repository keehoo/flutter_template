
import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.centerRight,
        children: [

          Image.asset(
              "assets/images/yellow_background.jpg",
            fit: BoxFit.cover
          ),
          const Positioned(
              right: 25,
              child: Text("hello!", style: TextStyle(color: Colors.white, fontSize: 48),)),
        ],
      ),
    );
  }

}
