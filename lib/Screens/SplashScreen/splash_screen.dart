import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:technical_task/Constants/imageConstant.dart';
import 'package:technical_task/Screens/SplashScreen/Controller/splash_screen_controller.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            image: const AssetImage(splashScreenImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
