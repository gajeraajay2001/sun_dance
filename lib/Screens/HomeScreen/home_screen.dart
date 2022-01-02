import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:technical_task/Screens/HomeScreen/Controller/home_screen_controller.dart';
import 'package:technical_task/Utils/math_utils.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.house,
                      size: 30,
                    ),
                    label: 'Home',
                    backgroundColor: Color(0xffFFEBCA)),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                    size: 30,
                  ),
                  label: 'History',
                  backgroundColor: Color(0xffFFEBCA),
                ),
              ],
              // type: BottomNavigationBarType.shifting,
              currentIndex: controller.selectedIndex.value,
              selectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(
                color: Color(0xffFF9F00),
              ),
              unselectedIconTheme:
                  const IconThemeData(color: Color(0xff440000)),
              unselectedItemColor: const Color(0xff440000),
              unselectedLabelStyle: const TextStyle(color: Colors.black26),
              iconSize: 40,
              onTap: controller.onItemTapped,
              elevation: 5),
        ),
        body: Obx(
          () => Center(
            child: (controller.selectedIndex.value == 0)
                ? Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: CustomPaint(
                          painter: HomePainter(),
                        ),
                      ),
                      Positioned(
                        top: getSize(40, context),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Image(
                            height: getSize(140, context),
                            image: const AssetImage("assets/homeLogo.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: getSize(150, context),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: CircularCountDownTimer(
                            textFormat: CountdownTextFormat.HH_MM_SS,
                            textStyle: TextStyle(
                                color: const Color(0xff440000),
                                fontSize: getFontSize(30, context),
                                fontWeight: FontWeight.bold),
                            duration: controller.differanceIOnSeconds.value,
                            initialDuration: 0,
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2,
                            ringColor: const Color(0xffFFEBCA),
                            fillColor: const Color(0xffFF9F00),
                            backgroundColor: const Color(0xffFFFCF7),
                            strokeCap: StrokeCap.round,
                            strokeWidth: getSize(12, context),
                            isReverse: true,
                            controller: controller.countDownController,
                          ),
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.65,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getSize(25, context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "${DateFormat("dd/MM/yyyy").format(controller.currentTime.value)}, ${DateFormat("h:mm a").format(controller.currentTime.value)}",
                                      style: TextStyle(
                                          fontSize: getFontSize(16, context),
                                          color: const Color(0xff440000),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: getSize(3, context),
                                    ),
                                    Text(
                                      "Starting Fasting",
                                      style: TextStyle(
                                          color: const Color(0xffFF9F00),
                                          fontSize: getFontSize(15, context),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                (!controller.buttonStatus.value)
                                    ? InkWell(
                                        onTap: () async {
                                          await controller.selectTime(context);
                                          print(controller.selectedTime);
                                          controller.endingTime.value =
                                              controller.selectedTime.value;
                                          controller.buttonStatus.value = true;
                                        },
                                        child: Container(
                                          height: getSize(45, context),
                                          width: getSize(160, context),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffFFEBCA),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Center(
                                            child: Text(
                                              "Ending Time",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:
                                                      getFontSize(18, context),
                                                  color:
                                                      const Color(0xff480606)),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Text(
                                            "${DateFormat("dd/MM/yyyy").format(controller.currentTime.value.add(const Duration(days: 1)))}, ${DateFormat("h:mm a").format(DateTime(controller.currentTime.value.year, controller.currentTime.value.month, controller.currentTime.value.day, controller.selectedTime.value.hour, controller.selectedTime.value.minute))}",
                                            style: TextStyle(
                                                fontSize:
                                                    getFontSize(16, context),
                                                color: const Color(0xff440000),
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: getSize(3, context),
                                          ),
                                          Text(
                                            "Fast Ending",
                                            style: TextStyle(
                                                color: const Color(0xffFF9F00),
                                                fontSize:
                                                    getFontSize(15, context),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          )),
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        top: MediaQuery.of(context).size.height * 0.8,
                        child: InkWell(
                          onTap: () {
                            controller.countDownController.start();
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: getSize(120, context)),
                            alignment: Alignment.center,
                            height: getSize(45, context),
                            width: getSize(200, context),
                            decoration: BoxDecoration(
                                color: const Color(0xffFF9F00),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Start Fast",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: getFontSize(20, context)),
                                ),
                                SizedBox(
                                  width: getSize(5, context),
                                ),
                                const Icon(
                                  Icons.av_timer,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getSize(10, context)),
                        height: getSize(70, context),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Color(0xffFF9F00),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.selectedIndex.value = 0;
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: getSize(5, context),
                            ),
                            Text(
                              "Fast History",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getFontSize(25, context)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getSize(30, context),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getSize(10, context)),
                        child: Row(
                          children: [
                            Container(
                              height: getSize(90, context),
                              width: getSize(50, context),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xff440000),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontSize: getFontSize(40, context),
                                    color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: getSize(90, context),
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFEED1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: getSize(10, context),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "24",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:
                                                      getFontSize(40, context),
                                                  color:
                                                      const Color(0xff440000)),
                                            ),
                                            Text(
                                              "Hover",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:
                                                      getFontSize(14, context),
                                                  color:
                                                      const Color(0xff440000)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: getSize(10, context),
                                        ),
                                        Row(
                                          children: [
                                            FittedBox(
                                              child: Text(
                                                "${DateFormat("dd/MM/yyyy").format(controller.currentTime.value.add(const Duration(days: 1)))}, ${DateFormat("h:mm a").format(DateTime(controller.currentTime.value.year, controller.currentTime.value.month, controller.currentTime.value.day, controller.selectedTime.value.hour, controller.selectedTime.value.minute))}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:
                                                      getFontSize(16, context),
                                                  color:
                                                      const Color(0xff440000),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: getSize(15, context),
                                            ),
                                            Text(
                                              "To",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize:
                                                    getFontSize(16, context),
                                                color: Color(0xff440000)
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                            SizedBox(
                                              width: getSize(15, context),
                                            ),
                                            FittedBox(
                                              child: Text(
                                                "${DateFormat("dd/MM/yyyy").format(controller.currentTime.value)}, ${DateFormat("h:mm a").format(controller.currentTime.value)}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:
                                                      getFontSize(16, context),
                                                  color:
                                                      const Color(0xff440000),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    var paint = Paint();
    paint.color = Colors.orange.withOpacity(0.2);
    var paint1 = Paint();
    paint1.color = Colors.red.withOpacity(0.3);
    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.27,
        size.width * 0.50, size.height * 0.27);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.27, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
