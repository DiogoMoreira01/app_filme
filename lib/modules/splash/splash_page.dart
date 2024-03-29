import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/imageFundo.png'),
              fit: BoxFit.cover),
        ),
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
