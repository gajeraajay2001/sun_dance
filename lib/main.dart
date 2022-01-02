import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:technical_task/Screens/HomeScreen/Controller/home_screen_controller.dart';

import 'Routes/app_routes.dart';
import 'Utils/initial_bindings.dart';

initFireBaseApp() async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xffFFD48C),
        accentColor: const Color(0xffFF9F00),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        canvasColor: const Color(0xffFFFCF7),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
