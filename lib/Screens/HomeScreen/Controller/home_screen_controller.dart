import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  CountDownController countDownController = CountDownController();
  final selectedIndex = 0.obs;
  final currentTime = DateTime.now().obs;
  final endingTime = TimeOfDay.now().obs;
  final endingDateTime = DateTime.now().obs;
  final buttonStatus = false.obs;
  final differanceIOnSeconds = 0.obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  NotificationDetails platformChannelSpecifics = const NotificationDetails();
  @override
  void onClose() {
    // countDownController.pause();
    super.onClose();
  }

  @override
  void onInit() async {
    await flutterLocalNotificationsPlugin.show(
        12345,
        "Welcome to SUN DANCE",
        "This notification was sent using Flutter Local Notifcations Package",
        platformChannelSpecifics,
        payload: 'data');
    super.onInit();
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      selectedTime.value = pickedTime;
      endingDateTime.value = DateTime(
          currentTime.value.year,
          currentTime.value.month,
          currentTime.value.day,
          selectedTime.value.hour,
          selectedTime.value.minute);
      differanceIOnSeconds.value =
          endingDateTime.value.difference(currentTime.value).inSeconds;
    }
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  toggleButton() {
    buttonStatus.toggle();
  }
}

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }
  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: null);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> selectNotification(String payload) async {
    //Handle notification tapped logic here
  }
  NotificationService._internal();
}
