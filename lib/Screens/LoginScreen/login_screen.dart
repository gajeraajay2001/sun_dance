//https://techtask-282a9.firebaseapp.com/__/auth/handler
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_task/Routes/app_routes.dart';
import 'package:technical_task/Screens/LoginScreen/Controller/login_screen_controller.dart';
import 'package:technical_task/Utils/math_utils.dart';

class LoginScreen extends GetWidget<LoginScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: MyPainter(),
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.055,
                    left: MediaQuery.of(context).size.width * 0.04,
                    child: Image(
                      image: const AssetImage(
                        "assets/logo.png",
                      ),
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.35,
                    right: MediaQuery.of(context).size.width * 0.1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.login,
                          size: MediaQuery.of(context).size.height * 0.04,
                          color: Colors.orange,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.53,
                    //right: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome to ",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sun Dance",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: Colors.orange.withOpacity(0.5),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Continue with",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              color: Colors.orange.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.66,
                    //right: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () async {
                        Map<String, dynamic> dict = {};
                        UserCredential userCredential =
                            await signInWithGoogle();
                        controller.userId.value = userCredential.user!.uid;
                        controller.documentReferencer = controller
                            .mainCollection
                            .doc(controller.userId.value);
                        dict["Name"] =
                            userCredential.user!.displayName.toString();
                        dict["Email Id"] =
                            userCredential.user!.email.toString();
                        await controller.addItem(data: dict);
                        print(controller.documentReferencer.toString());
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString(
                            'UserName', dict["Name"].toString().trim());
                        Get.toNamed(AppRoutes.homeScreen);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.red.withOpacity(0.2),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.google,
                                size: MediaQuery.of(context).size.height * 0.03,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                "Google Account",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.74,
                    //right: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Or ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.78,
                    //right: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.red.withOpacity(0.2),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.facebookF,
                              size: MediaQuery.of(context).size.height * 0.03,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Facebook Account",
                              style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
/*
*   Map<String, dynamic> dict = {};
                  UserCredential userCredential = await signInWithGoogle();
                  controller.userId.value = userCredential.user!.uid;
                  controller.documentReferencer =
                      controller.mainCollection.doc(controller.userId.value);
                  dict["Name"] = userCredential.user!.displayName.toString();
                  dict["Email Id"] = userCredential.user!.email.toString();
                  await controller.addItem(data: dict);
                  print(controller.documentReferencer.toString());
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('UserName', dict["Name"].toString().trim());
                  Get.toNamed(AppRoutes.homeScreen);
                  * */
  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class MyNewPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    var paint = Paint();
    paint.color = Colors.orange;
    var paint1 = Paint();
    paint1.color = Colors.red.withOpacity(0.3);
    path.moveTo(0, size.height * 0.45);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.44,
        size.width * 0.50, size.height * 0.38);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.30, size.width, size.height * 0.20);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
